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

typedef struct {
    int parentId;
    bool isDestructive;
} ParentEntry;

typedef struct TreeInfo {
    int depth;
    int nodesCount;
    int dotsCount;
} TreeInfo;

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

// typedef struct {
//     int nodeId;
//     int depth;
// } QueueNode;
//
// // Queue implementation is assumed
// typedef struct Queue {
//     QueueNode* nodes;
//     int front, rear, size;
//     unsigned capacity;
// } Queue;
//
// Queue* createQueue(unsigned capacity) {
//     Queue* queue = (Queue*) malloc(sizeof(Queue));
//     queue->capacity = capacity;
//     queue->front = queue->size = 0;
//     queue->rear = capacity - 1;
//     queue->nodes = (QueueNode*) malloc(queue->capacity * sizeof(QueueNode));
//     return queue;
// }
//
// bool isQueueFull(Queue* queue) { return (queue->size == queue->capacity); }
// bool isQueueEmpty(Queue* queue) { return (queue->size == 0); }
//
// void enqueue(Queue* queue, QueueNode item) {
//     if (isQueueFull(queue)) return;
//     queue->rear = (queue->rear + 1) % queue->capacity;
//     queue->nodes[queue->rear] = item;
//     queue->size = queue->size + 1;
// }
//
// QueueNode dequeue(Queue* queue) {
//     QueueNode item = {.nodeId = -1, .depth = 0};
//     if (isQueueEmpty(queue)) return item;
//     item = queue->nodes[queue->front];
//     queue->front = (queue->front + 1) % queue->capacity;
//     queue->size = queue->size - 1;
//     return item;
// }
//
// // A function to free the queue memory
// void freeQueue(Queue* queue) {
//     free(queue->nodes);
//     free(queue);
// }
//
// // Function prototypes for BFS rank calculation
// void bfsRank();
//
// // Main BFS Rank Calculation Function
// void bfsRank() {
//     bool* visited = calloc(numRecords, sizeof(bool));
//     for (int i = 0; i < numRecords; i++) {
//         if (!visited[i]) {
//             Queue* queue = createQueue(100); // Arbitrary size; adjust based on expected tree sizes
//             enqueue(queue, (QueueNode){.nodeId = i, .depth = 1});
//             visited[i] = true;
//
//             int depth = 0;
//             int nodeCount = 0;
//             int dotCount = 0;
//
//             while (!isQueueEmpty(queue)) {
//                 QueueNode current = dequeue(queue);
//                 nodeCount++;
//                 dotCount += dotsPerRecord[current.nodeId];
//                 depth = current.depth;
//
//                 // Enqueue children
//                 for (int j = 0; j < childCounts[current.nodeId]; j++) {
//                     int childId = childAdjLists[current.nodeId][j].childId;
//                     if (!visited[childId]) {
//                         enqueue(queue, (QueueNode){.nodeId = childId, .depth = current.depth + 1});
//                         visited[childId] = true;
//                     }
//                 }
//
//                 // Enqueue parents if needed, similar to children but using parentAdjLists
//             }
//
//             // After BFS, calculate and assign rank
//             double rank = depth * (nodeCount + 0.1 * dotCount);
//             printf("Tree rooted at %d has rank: %f\n", i, rank);
//
//             freeQueue(queue);
//         }
//     }
//     free(visited);
// }


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
    int* parentCounts;
    ParentEntry** parentAdjLists = buildParentAdjacencyLists(connections, numConnections, records, numRecords, connectionTypes, numConnectionTypes, solutionConnectionTypeId, &parentCounts);

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

    // bfsRank();

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
