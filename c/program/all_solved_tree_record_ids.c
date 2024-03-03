#include "record.h"
#include "dot.h"
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

typedef struct {
    int parentId;
    bool isDestructive;
} ParentEntry;

typedef struct {
    int recordIndex;
    int depth;
} QueueItem;

typedef struct {
    int* recordIds;
    int numRecords;
    int depth;
    float rank;
    int dotsCount;
} Tree;

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

ParentEntry** buildParentAdjacencyLists(Connection* connections, int numConnections, Record* records, int numRecords, ConnectionType* connectionTypes, int numConnectionTypes, int solutionConnectionTypeId, int** outParentCounts) {
    ParentEntry** parentAdjLists = calloc(numRecords, sizeof(ParentEntry*));
    int* parentCounts = calloc(numRecords, sizeof(int));

    for (int i = 0; i < numConnections; i++) {
        int childIndex = findRecordIndexById(connections[i].recordBId, records, numRecords);
        int parentIndex = findRecordIndexById(connections[i].recordAId, records, numRecords);

        if (childIndex == -1 || parentIndex == -1) continue; // Skip if indices not found

        bool isDestructive = false;
        // Determine if the connection is destructive by checking connectionTypes
        for (int j = 0; j < numConnectionTypes; j++) {
            if (connectionTypes[j].id == connections[i].connectionTypeId) {
                isDestructive = connectionTypes[j].isDestructive;
                break;
            }
        }

        // Allocate or expand the parent list for the child record
        if (parentCounts[childIndex] % 10 == 0) { // For example, expand in chunks of 10
            parentAdjLists[childIndex] = realloc(parentAdjLists[childIndex], (parentCounts[childIndex] + 10) * sizeof(ParentEntry));
        }

        // Add the new parent entry
        parentAdjLists[childIndex][parentCounts[childIndex]].parentId = parentIndex;
        parentAdjLists[childIndex][parentCounts[childIndex]].isDestructive = isDestructive;
        parentCounts[childIndex]++;
    }

    *outParentCounts = parentCounts;

    return parentAdjLists;
}

void buildDotAdjacencyList(Dot* dots, int numDots, Record* records, int numRecords, int** outDotCounts) {
    *outDotCounts = calloc(numRecords, sizeof(int));
    if (*outDotCounts == NULL) {
        fprintf(stderr, "Memory allocation failed for dotCounts.\n");
        return;
    }

    // Initialize all counts to 0
    for (int i = 0; i < numRecords; i++) {
        (*outDotCounts)[i] = 0;
    }

    // Iterate over all dots to count them per record
    for (int i = 0; i < numDots; i++) {
        for (int j = 0; j < numRecords; j++) {
            if (dots[i].recordId == records[j].id) {
                (*outDotCounts)[j]++;
                break; // Break the inner loop as soon as the record is found and counted
            }
        }
    }

    // No need to return anything as the counts are stored in the passed pointer
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

        if (childAdjLists[currentIndex][i].isSolution) {
          solvedStatus[currentIndex] = true;
          return;
        }
    }

    // - check if all children are solved recursively (and if so - mark current as solved)
    for (int i = 0; i < childCounts[currentIndex]; i++) {
        int childIndex = childAdjLists[currentIndex][i].childId;

        if (childIndex < 0 || childIndex >= numRecords) continue; // Skip already visited or invalid indices.
        // todo: it used to Skip already visited or invalid indices:  || visited[childIndex]
        // but I'm not sure if I need it here because they may be visited from another branch
        // one solution may solve many problems.

        // check all children
        if (childAdjLists[currentIndex][i].isDestructive && !visited[childIndex]) {
            dfsSolve(childIndex, solvedStatus, visited, childAdjLists, childCounts, records, numRecords);
        }
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

void bfsRank(int start, bool* bfsRankVisited, Record* records, int numRecords, ChildEntry** childAdjLists, int* childCounts, ParentEntry** parentAdjLists, int* parentCounts, int* dotCounts) {
    if (bfsRankVisited[start]) return;

    QueueItem queue[numRecords];
    int front = 0, rear = 0;

    queue[rear++] = (QueueItem){start, 1};
    bfsRankVisited[start] = true;

    Tree currentTree;
    currentTree.recordIds = malloc(numRecords * sizeof(int));
    currentTree.numRecords = 0;
    currentTree.depth = 0;
    currentTree.dotsCount = 0;

    while (front < rear) {
        QueueItem currentQueueItem = queue[front++];
        int current = currentQueueItem.recordIndex;

        currentTree.recordIds[currentTree.numRecords++] = current;
        currentTree.dotsCount += dotCounts[current];

        if (currentQueueItem.depth > currentTree.depth) {
            currentTree.depth = currentQueueItem.depth;
        }

        // Process children
        for (int j = 0; j < childCounts[current]; j++) {
            int child = childAdjLists[current][j].childId;
            if (!bfsRankVisited[child]) {
                queue[rear++] = (QueueItem){child, currentQueueItem.depth + 1};
                bfsRankVisited[child] = true;
            }
        }

        // Process parents
        for (int j = 0; j < parentCounts[current]; j++) {
            int parent = parentAdjLists[current][j].parentId;
            if (!bfsRankVisited[parent]) {
                queue[rear++] = (QueueItem){parent, currentQueueItem.depth + 1};
                bfsRankVisited[parent] = true;
            }
        }
    }

    currentTree.rank = currentTree.depth * (currentTree.numRecords + 0.1 * currentTree.dotsCount);
    for (int i = 0; i < currentTree.numRecords; i++) {
        records[currentTree.recordIds[i]].rank = currentTree.rank; // Update records' rank
    }

    // Cleanup and debug output...
    free(currentTree.recordIds);
}

int main(int argc, char* argv[]) {
    int numRecords, numConnections, numConnectionTypes, numDots;
    Record* records = fetch_records(&numRecords);
    Dot* dots = fetch_dots(&numDots);
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
    int* parentCounts;
    ParentEntry** parentAdjLists = buildParentAdjacencyLists(connections, numConnections, records, numRecords, connectionTypes, numConnectionTypes, solutionConnectionTypeId, &parentCounts);
    int* dotCounts = NULL;
    buildDotAdjacencyList(dots, numDots, records, numRecords, &dotCounts);

    // Output childAjdLists for debugging, like pp in ruby:
    // for (int i = 0; i < numRecords; i++) {
    //     printf("Record with index %d and DB ID %d children: ", i, records[i].id);
    //     for (int j = 0; j < childCounts[i]; j++) {
    //         printf("Child Index: %d ", childAdjLists[i][j].childId);
    //     }
    //     printf("\n");

    //     printf("Record with index %d and DB ID %d parents: ", i, records[i].id);
    //     for (int j = 0; j < parentCounts[i]; j++) {
    //         printf("Parent Index: %d ", parentAdjLists[i][j].parentId);
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

    // calculate rank
    bool bfsRankVisited[numRecords];
    memset(bfsRankVisited, false, sizeof(bfsRankVisited));
    for (int i = 0; i < numRecords; i++) {
        if (!bfsRankVisited[i]) {
            bfsRank(i, bfsRankVisited, records, numRecords, childAdjLists, childCounts, parentAdjLists, parentCounts, dotCounts);
        }
    }

    // Output solved status for each record
    for (int i = 0; i < numRecords; i++) {
        printf("%d: %d : %f\n", records[i].id, solvedStatus[i], records[i].rank);
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

    if (dotCounts != NULL) {
        free(dotCounts);
    }

    return 0;
}
