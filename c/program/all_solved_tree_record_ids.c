#include "record.h"
#include "connection.h"
#include "connection_type.h"
#include "record_type.h"

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

// Assuming Record, Connection, ConnectionType structs and fetch functions are defined elsewhere
typedef struct {
    int childId;
    bool isDestructive;
    bool isSolution;
} ChildEntry;

// Utility function to find a record's index by its ID
int findRecordIndexById(int id, Record* records, int numRecords) {
    for (int i = 0; i < numRecords; i++) {
        if (records[i].id == id) return i;
    }
    return -1; // Not found
}

// Function to build child adjacency lists
ChildEntry** buildChildAdjacencyLists(Connection* connections, int numConnections, Record* records, int numRecords, ConnectionType* connectionTypes, int numConnectionTypes, int solutionConnectionTypeId, int** outChildCounts) {
    ChildEntry** childAdjLists = calloc(numRecords, sizeof(ChildEntry*));
    int* childCounts = calloc(numRecords, sizeof(int)); // Track number of children for each record

    for (int i = 0; i < numConnections; i++) {
        int parentIndex = findRecordIndexById(connections[i].recordAId, records, numRecords);
        int childIndex = findRecordIndexById(connections[i].recordBId, records, numRecords);
        if (parentIndex == -1 || childIndex == -1) continue; // Skip if indices not found

        // Determine if the connection is a solution
        bool isSolution = connections[i].connectionTypeId == solutionConnectionTypeId;

        // Determine if the connection is destructive
        bool isDestructive = false;
        for (int j = 0; j < numConnectionTypes; j++) {
            if (connectionTypes[j].id == connections[i].connectionTypeId) {
                isDestructive = connectionTypes[j].isDestructive;
                break;
            }
        }

        // Allocate or expand the child list for the parent record
        if (childCounts[parentIndex] % 10 == 0) {
            childAdjLists[parentIndex] = realloc(childAdjLists[parentIndex], (childCounts[parentIndex] + 10) * sizeof(ChildEntry));
        }

        childAdjLists[parentIndex][childCounts[parentIndex]].childId = childIndex;
        childAdjLists[parentIndex][childCounts[parentIndex]].isDestructive = isDestructive;
        childAdjLists[parentIndex][childCounts[parentIndex]].isSolution = isSolution;
        childCounts[parentIndex]++;
    }

    *outChildCounts = childCounts;

    return childAdjLists;
}

// Recursive function to determine if a record is solved
// Updated dfsSolve function signature to include numConnections
void dfsSolve(int currentIndex, bool* solvedStatus, bool* visited, ChildEntry** childAdjLists, int* childCounts, Record* records, int numRecords) {
    if (currentIndex < 0 || currentIndex >= numRecords) {
        return; // Guard against invalid indices.
    }

    visited[currentIndex] = true;

    // // if it has 0 children then it should not be solved
    if (childCounts[currentIndex] == 0) {
        solvedStatus[currentIndex] = false;
        return;
    }

    // // if it has 1 child or more - then:
    // // - check if that child is a solution (and if so - mark current as solved and return early)
    for (int i = 0; i < childCounts[currentIndex]; i++) {
        // printf("currentIndex: %d, i: %d\n", currentIndex, i);
        int childIndex = childAdjLists[currentIndex][i].childId;

        if (childIndex < 0 || childIndex >= numRecords) continue;
        // todo: it used to Skip already visited or invalid indices:  || visited[childIndex]
        // but I'm not sure if I need it here because they may be visited from another branch
        // one solution may solve many problems.

        if (childAdjLists[currentIndex][i].isSolution) {
          solvedStatus[currentIndex] = true;
          return;
        }
    }

    // - check if all children are solved recursively (and if so - mark current as solved)
    for (int i = 0; i < childCounts[currentIndex]; i++) {
        int childIndex = childAdjLists[currentIndex][i].childId;

        if (childIndex < 0 || childIndex >= numRecords) continue; // Skip already visited or invalid indices.

        // check all children
        dfsSolve(childIndex, solvedStatus, visited, childAdjLists, childCounts, records, numRecords);
    }

    // if all children are solved then current is solved too:
    bool allChuldrenSolved = true;
    for (int i = 0; i < childCounts[currentIndex]; i++) {
        int childIndex = childAdjLists[currentIndex][i].childId;
        if (solvedStatus[childIndex] == false) {
            allChuldrenSolved = false;
            break;
        }
    }

    if (allChuldrenSolved) {
        solvedStatus[currentIndex] = true;
    }

}

int main(int argc, char* argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <recordId>\n", argv[0]);
        return 1;
    }

    int numRecords, numConnections, numConnectionTypes;
    Record* records = fetch_records(&numRecords);
    Connection* connections = fetch_connections(&numConnections);
    ConnectionType* connectionTypes = fetch_connection_types(&numConnectionTypes);

    // Find a connection type ID for the solution connection type (where name == "Is Solved By...")
    int solutionConnectionTypeId;
    for (int i = 0; i < numConnectionTypes; i++) {
        if (strcmp(connectionTypes[i].name, "Is Solved By...") == 0) {
            solutionConnectionTypeId = connectionTypes[i].id;
            break;
        }
    }

    int* childCounts;
    ChildEntry** childAdjLists = buildChildAdjacencyLists(connections, numConnections, records, numRecords, connectionTypes, numConnectionTypes, solutionConnectionTypeId, &childCounts);

    // Output childAjdLists for debugging, like pp in ruby:
    // for (int i = 0; i < numRecords; i++) {
    //     printf("Record %d: ", records[i].id);
    //     for (int j = 0; j < childCounts[i]; j++) {
    //         printf("%d ", childAdjLists[i][j].childId);
    //     }
    //     printf("\n");
    // }

    // output adjacency lists
    bool* solvedStatus = calloc(numRecords, sizeof(bool)); // Initialize all to unsolved
    bool* visited = calloc(numRecords, sizeof(bool)); // Track visited records to prevent cycles

    // Solve for each record
    for (int i = 0; i < numRecords; i++) {
        if (!visited[i]) {
            // printf("triggering dfsSolve with i: %d\n", i);
            dfsSolve(i, solvedStatus, visited, childAdjLists, childCounts, records, numRecords);
        }
    }

    // Output solved status for each record
    for (int i = 0; i < numRecords; i++) {
        printf("%d: %d\n", records[i].id, solvedStatus[i]);
    }

    // Cleanup
    for (int i = 0; i < numRecords; i++) {
        if (childAdjLists[i]) {
            free(childAdjLists[i]);
            childAdjLists[i] = NULL; // Prevent use-after-free
        }
    }
    if (childAdjLists) {
        free(childAdjLists);
        childAdjLists = NULL; // Prevent use-after-free
    }

    if (solvedStatus != NULL) {
        free(solvedStatus);
    }
    if (visited != NULL) {
        free(visited);
    }
    // Assuming records, connections, connectionTypes are dynamically allocated
    // and it's safe to free them here
    if (records != NULL) {
        free(records);
    }
    if (connections != NULL) {
        free(connections);
    }
    if (connectionTypes != NULL) {
        free(connectionTypes);
    }


    return 0;
}
