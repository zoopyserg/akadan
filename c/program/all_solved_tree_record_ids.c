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

float dfsSolveAndProgress(int currentIndex, bool* visited, ChildEntry** childAdjLists, int* childCounts, Record* records, int numRecords) {
    if (visited[currentIndex]) return records[currentIndex].progress; // Return existing progress if already visited

    visited[currentIndex] = true;

    // Check direct solution from the adjacency list or the isSolved flag
    bool directlySolved = records[currentIndex].isSolved;
    for (int i = 0; !directlySolved && i < childCounts[currentIndex]; i++) {
        if (childAdjLists[currentIndex][i].isSolution) {
            directlySolved = true;
            break; // If any direct solution is found, no need to check further
        }
    }

    if (directlySolved) {
        records[currentIndex].isSolved = true; // Mark as solved if not already
        records[currentIndex].progress = 100.0f;
        return 100.0f; // Direct solution contributes 100% progress
    }

    int numberOfChildren = childCounts[currentIndex];
    float totalProgress = 0.0f;

    // Initialize counters for children that are considered in progress calculation
    int consideredChildrenCount = 0;

    for (int i = 0; i < numberOfChildren; i++) {
        int childIndex = childAdjLists[currentIndex][i].childId;

        // Only consider children connected through destructive relationships
        if (childAdjLists[currentIndex][i].isDestructive) {
            totalProgress += dfsSolveAndProgress(childIndex, visited, childAdjLists, childCounts, records, numRecords); // Aggregate progress from considered children
            consideredChildrenCount++;
        }
    }

    // If no considered children, the record is unsolved with 0 progress
    if (consideredChildrenCount == 0) {
        records[currentIndex].isSolved = false;
        records[currentIndex].progress = 0.0f;
        return 0.0f;
    }

    float averageProgress = totalProgress / (float)consideredChildrenCount; // Average progress from considered children
    records[currentIndex].progress = averageProgress; // Update record's progress
    records[currentIndex].isSolved = averageProgress >= 100.0f; // Mark as solved if average progress is 100% or more

    return averageProgress;
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

// Set shouldSolve flags for each record
void setShouldSolveFlags(Record* records, int numRecords, ChildEntry** childAdjLists, int* childCounts) {
    for (int i = 0; i < numRecords; i++) {
        // Default to false
        records[i].shouldSolve = false;

        // If record is already solved, skip
        if (records[i].isSolved) {
            continue;
        }

        bool hasDestructiveChildren = false;
        // Check if the record has any destructive children
        for (int j = 0; j < childCounts[i]; j++) {
            if (childAdjLists[i][j].isDestructive) {
                hasDestructiveChildren = true;
                break; // No need to check further if any destructive child is found
            }
        }

        // If the record is not solved and has no children or no destructive children, it should be solved
        if (!hasDestructiveChildren || childCounts[i] == 0) {
            records[i].shouldSolve = true;
        }
    }
}

// Exclude records as possible record B's for each record
void addExcludedIdToRecord(Record* record, int id) {
    if (record->excludedCount % 10 == 0) { // Increase capacity in chunks of 10
        int newCapacity = (record->excludedCount + 10);
        record->excludedRecordBs = realloc(record->excludedRecordBs, newCapacity * sizeof(int));
    }
    record->excludedRecordBs[record->excludedCount++] = id;
}

void addUniqueParentIds(Record* record, int currentIndex, ParentEntry** parentAdjLists, int* parentCounts, bool* visited) {
    for (int i = 0; i < parentCounts[currentIndex]; i++) {
        int parentId = parentAdjLists[currentIndex][i].parentId;
        if (!visited[parentId]) {
            visited[parentId] = true; // Mark this parent as visited
            addExcludedIdToRecord(record, parentId); // Add this parent ID to the excluded list
            addUniqueParentIds(record, parentId, parentAdjLists, parentCounts, visited); // Recursively add this parent's parents
        }
    }
}

void populateExcludedIdsForRecords(Record* records, int numRecords, ChildEntry** childAdjLists, int* childCounts, ParentEntry** parentAdjLists, int* parentCounts) {
    for (int i = 0; i < numRecords; i++) {
        records[i].excludedRecordBs = NULL;
        records[i].excludedCount = 0;
        bool* visitedParents = calloc(numRecords, sizeof(bool)); // To track visited parents for each record

        // Ensure memory allocation succeeded
        if (!visitedParents) {
            fprintf(stderr, "Memory allocation failed for visitedParents.\n");
            // Handle memory allocation failure (cleanup and exit)
            continue; // Or return, based on your error handling strategy
        }

        // Populate direct children (to prevent duplication)
        for (int j = 0; j < childCounts[i]; j++) {
            int childId = childAdjLists[i][j].childId;
            // Ensure not to add duplicate child ID
            if (!visitedParents[childId]) {
                visitedParents[childId] = true;
                addExcludedIdToRecord(&records[i], childId);
            }
        }

        // Populate parents and their ancestors (to prevent circular dependencies)
        addUniqueParentIds(&records[i], i, parentAdjLists, parentCounts, visitedParents);

        free(visitedParents); // Cleanup the visitedParents array for the current record
    }
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
    bool* visited = calloc(numRecords, sizeof(bool));
    if (!visited) {
        fprintf(stderr, "Memory allocation failed for visited array.\n");
        // Handle memory allocation failure (cleanup and exit)
        return 1;
    }

    // Solve for each record and calculate progress
    for (int i = 0; i < numRecords; i++) {
        if (!visited[i]) {
            dfsSolveAndProgress(i, visited, childAdjLists, childCounts, records, numRecords);
            // float progress =
            // printf("Record %d progress: %.2f%%\n", records[i].id, progress);
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

    // Set shouldSolve flags
    setShouldSolveFlags(records, numRecords, childAdjLists, childCounts);

    // Populate excluded Record B's
    populateExcludedIdsForRecords(records, numRecords, childAdjLists, childCounts, parentAdjLists, parentCounts);

    // Save the records data into the db:
    save_records(records, numRecords);

    // Output solved status for each record (for testing, disabled for production)
    // #define EXCLUDED_IDS_BUFFER_SIZE 1024
    // for (int i = 0; i < numRecords; i++) {
    //     char excludedIds[EXCLUDED_IDS_BUFFER_SIZE] = {0}; // Buffer for holding comma-separated IDs
    //     for (int j = 0; j < records[i].excludedCount; j++) {
    //         int recordDbId = records[records[i].excludedRecordBs[j]].id; // Look up the database ID using the index
    //         char idBuffer[20]; // Assuming an ID won't exceed this length
    //         snprintf(idBuffer, sizeof(idBuffer), "%d", recordDbId);
    //         strcat(excludedIds, idBuffer);
    //         if (j < records[i].excludedCount - 1) {
    //             strcat(excludedIds, ","); // Add comma after all but the last ID
    //         }
    //     }
    //     printf("%d: %d : %d : %f : %f : %s\n", records[i].id, records[i].isSolved, records[i].shouldSolve, records[i].rank, records[i].progress, excludedIds);
    // }

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
