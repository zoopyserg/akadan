#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

// Assuming Record, Connection, ConnectionType structs and fetch functions are defined elsewhere

typedef struct {
    int childId;
    bool isDestructive;
} ChildEntry;

// Utility function to find a record's index by its ID
int findRecordIndexById(int id, Record* records, int numRecords) {
    for (int i = 0; i < numRecords; i++) {
        if (records[i].id == id) return i;
    }
    return -1; // Not found
}

// Function to build child adjacency lists
ChildEntry** buildChildAdjacencyLists(Connection* connections, int numConnections, Record* records, int numRecords, ConnectionType* connectionTypes, int numConnectionTypes) {
    ChildEntry** childAdjLists = calloc(numRecords, sizeof(ChildEntry*));
    int* childCounts = calloc(numRecords, sizeof(int)); // Track number of children for each record

    for (int i = 0; i < numConnections; i++) {
        int parentIndex = findRecordIndexById(connections[i].recordAId, records, numRecords);
        int childIndex = findRecordIndexById(connections[i].recordBId, records, numRecords);
        if (parentIndex == -1 || childIndex == -1) continue; // Skip if indices not found

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
        childCounts[parentIndex]++;
    }

    free(childCounts); // Cleanup
    return childAdjLists;
}

// Recursive function to determine if a record is solved
void dfsSolve(int currentIndex, bool* solvedStatus, bool* visited, ChildEntry** childAdjLists, int* childCounts, int numRecords) {
    visited[currentIndex] = true;

    bool allChildrenSolved = true;
    for (int i = 0; i < childCounts[currentIndex]; i++) {
        int childIndex = childAdjLists[currentIndex][i].childId;
        bool isDestructive = childAdjLists[currentIndex][i].isDestructive;

        if (!visited[childIndex]) {
            dfsSolve(childIndex, solvedStatus, visited, childAdjLists, childCounts, numRecords);
        }

        // If connection is destructive and any child is unsolved, the current record is not solved
        if (isDestructive && !solvedStatus[childIndex]) {
            allChildrenSolved = false;
            break; // No need to check further children
        }
    }

    // Mark as solved if all children are solved or there are no destructive children
    solvedStatus[currentIndex] = allChildrenSolved;
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

    ChildEntry** childAdjLists = buildChildAdjacencyLists(connections, numConnections, records, numRecords, connectionTypes, numConnectionTypes);

    bool* solvedStatus = calloc(numRecords, sizeof(bool)); // Initialize all to unsolved
    bool* visited = calloc(numRecords, sizeof(bool)); // Track visited records to prevent cycles

    // Solve for each record
    for (int i = 0; i < numRecords; i++) {
        if (!visited[i]) {
            dfsSolve(i, solvedStatus, visited, childAdjLists, childCounts, numRecords);
        }
    }

    // Output solved status for each record
    for (int i = 0; i < numRecords; i++) {
        printf("%d: %d\n", records[i].id, solvedStatus[i] ? 1 : 0);
    }

    // Cleanup
    for (int i = 0; i < numRecords; i++) {
        free(childAdjLists[i]);
    }
    free(childAdjLists);
    free(solvedStatus);
    free(visited);
    free(records);
    free(connections);
    free(connectionTypes);

    return 0;
}
