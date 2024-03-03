// #include "all_solved_tree_record_ids.h"
#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include "common_insert.h"
#include "common_cleanup.h"
#include <stdlib.h>
#include "record.h"

// Global variables for record IDs
extern char* rootRecordId;
extern char* solutionId1;

// (root) - solved with (Solution 1)

int setup_all_solved_tree_record_ids_single_solved(void) {
    common_cleanup();

    // Insert a user
    char* userColumns[] = {"email", "username", "encrypted_password", "first_name", "last_name", "accept_terms", "is_public", "created_at", "updated_at", NULL};
    char* userValues[] = {"test_record@example.com", "testrecorduser", "password", "TestRecord", "User", "TRUE", "TRUE", "NOW()", "NOW()", NULL};
    char* userId = common_insert("users", userColumns, userValues);
    if (!userId) {
        fprintf(stderr, "Setup failed: Unable to insert user.\n");
        return -1; // Abort setup
    }

    // Insert a record type
    char* rtColumns[] = {"user_id", "name", "is_public", "created_at", "updated_at", NULL};
    char* rtValues[] = {userId, "Test Record Type", "TRUE", "NOW()", "NOW()", NULL};
    char* recordTypeId = common_insert("record_types", rtColumns, rtValues);
    if (!recordTypeId) {
        fprintf(stderr, "Setup failed: Unable to insert record type.\n");
        free(userId); // Clean up allocated userId
        return -1; // Abort setup
    }

    // Insert a root record
    char* rootRecordColumns[] = {"user_id", "name", "is_public", "record_type_id", "created_at", "updated_at", NULL};
    char* rootRecordValues[] = {userId, "Root Record", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    rootRecordId = common_insert("records", rootRecordColumns, rootRecordValues);
    if (!rootRecordId) {
        fprintf(stderr, "Setup failed: Unable to insert root record.\n");
        free(userId); // Clean up the userId string
        free(recordTypeId);
        return -1; // Abort setup
    }

    // Insert a solution1
    char* solutionColumns1[] = {"user_id", "name", "is_public", "record_type_id", "created_at", "updated_at", NULL};
    char* solutionValues1[] = {userId, "Solution 1", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    solutionId1 = common_insert("records", solutionColumns1, solutionValues1);
    if (!solutionId1) {
        fprintf(stderr, "Setup failed: Unable to insert solution.\n");
        free(userId); // Clean up the userId string
        free(recordTypeId);
        free(rootRecordId);
        return -1; // Abort setup
    }

    // Insert a solution connection type
    char* connectionTypeColumns[] = {"name", "user_id", "is_public", "directional", "destructive", "target_type", "target_record_type_id", "target_record_subtype_id", "target_hierarchy", "closest_parent_type_id", "one_to_many", "created_at", "updated_at", NULL};
    char* connectionTypeValues[] = {"Is Solved By...", userId, "TRUE", "TRUE", "TRUE", "record", recordTypeId, recordTypeId, "NULL", recordTypeId, "TRUE", "NOW()", "NOW()", NULL};
    char* connectionTypeId = common_insert("connection_types", connectionTypeColumns, connectionTypeValues);
    if (!connectionTypeId) {
        fprintf(stderr, "Setup failed: Unable to insert connection type.\n");
        free(userId); // Clean up the userId string
        free(recordTypeId);
        free(rootRecordId);
        free(solutionId1);
        return -1; // Abort setup
    }

    // Insert a connection between root and solution1
    char* connectionColumns[] = {"name", "user_id", "is_public", "record_a_id", "record_b_id", "connection_type_id", "created_at", "updated_at", NULL};
    char* connectionValues[] = {"Test Connection", userId, "TRUE", rootRecordId, solutionId1, connectionTypeId, "NOW()", "NOW()", NULL};
    char* connectionId = common_insert("connections", connectionColumns, connectionValues);
    if (!connectionId) {
        fprintf(stderr, "Setup failed: Unable to insert connection.\n");
        free(userId); // Clean up the userId string
        free(recordTypeId);
        free(rootRecordId);
        free(solutionId1);
        free(connectionTypeId);
        return -1; // Abort setup
    }

    // Cleanup
    free(userId);
    free(recordTypeId);
    free(rootRecordId);
    free(solutionId1);
    free(connectionTypeId);
    free(connectionId);

    return 0;
}

void test_all_solved_tree_record_ids_single_solved(void) {
    setup_all_solved_tree_record_ids_single_solved();

    int num_records = 0;
    Record* records = fetch_records(&num_records);

    // find a record with a name "Root Record"
    Record* rootRecord = NULL;
    Record* solution1 = NULL;
    for (int i = 0; i < num_records; i++) {
        if (strcmp(records[i].name, "Root Record") == 0) {
            rootRecord = &records[i];
        } else if (strcmp(records[i].name, "Solution 1") == 0) {
            solution1 = &records[i];
        }
    }

    if (!rootRecord) {
        fprintf(stderr, "Test failed: Unable to find root record.\n");
        free(records);
        return;
    }

    // output root record id
    char rootRecordId[100];
    char solutionId1[100];

    sprintf(rootRecordId, "%d", rootRecord->id);
    sprintf(solutionId1, "%d", solution1->id);

    char expectedOutput1[1000], expectedOutput2[1000];

    // Format the expected output strings using the actual record IDs
    sprintf(expectedOutput1, "%s: 1 : 4.000000", rootRecordId);
    sprintf(expectedOutput2, "%s: 0 : 4.000000", solutionId1);

    // Replace the static initialization with dynamically generated strings
    char* expectedOutput[] = {expectedOutput1, expectedOutput2};
    int expectedLines = sizeof(expectedOutput) / sizeof(expectedOutput[0]);

    // Logic to run the test and compare output as you previously mentioned
    // Execute your program and redirect output to a file, then read and compare each line
    // For example, if your program is compiled to `all_solved_tree_record_ids`
    char command[256];
    sprintf(command, "../program/all_solved_tree_record_ids > output.txt");
    system(command);

    FILE* file = fopen("output.txt", "r");
    char line[1024];
    int lineNum = 0;

    while(fgets(line, sizeof(line), file) != NULL) {
        // Remove trailing newline
        line[strcspn(line, "\n")] = 0;

        // Validate against expected output
        if (lineNum < expectedLines) {
            CU_ASSERT_STRING_EQUAL(line, expectedOutput[lineNum]);
        }
        lineNum++;
    }

    // Ensure we've seen the expected number of lines
    CU_ASSERT_EQUAL(lineNum, expectedLines);

    fclose(file);
    remove("output.txt"); // Clean up
    free(records);
}
