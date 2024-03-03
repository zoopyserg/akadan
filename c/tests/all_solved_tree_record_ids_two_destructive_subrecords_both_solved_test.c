#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include "common_insert.h"
#include "common_cleanup.h"
#include <stdlib.h>
#include "record.h"

// Global variables for record IDs
extern char* rootRecordId;
extern char* recordId1;
extern char* recordId2;
extern char* solutionId1;
extern char* solutionId2;

// (root)
// |---(1) -- solved with (Solution 1)
// |---(2) -- solved with (Solution 2)

int setup_all_solved_tree_record_ids_two_destructive_subrecords_both_solved(void) {
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


    // Insert a record1
    char* recordColumns1[] = {"user_id", "name", "is_public", "record_type_id", "created_at", "updated_at", NULL};
    char* recordValues1[] = {userId, "Record 1", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    recordId1 = common_insert("records", recordColumns1, recordValues1);
    if (!recordId1) {
        fprintf(stderr, "Setup failed: Unable to insert record 1.\n");
        free(userId); // Clean up the userId string
        free(recordTypeId);
        free(rootRecordId);
        return -1; // Abort setup
    }

    // Insert a record2
    char* recordColumns2[] = {"user_id", "name", "is_public", "record_type_id", "created_at", "updated_at", NULL};
    char* recordValues2[] = {userId, "Record 2", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    recordId2 = common_insert("records", recordColumns2, recordValues2);
    if (!recordId2) {
        fprintf(stderr, "Setup failed: Unable to insert record.\n");
        free(userId); // Clean up the userId string
        free(recordTypeId);
        free(recordId1);
        free(rootRecordId);
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
        free(recordId1);
        free(recordId2);
        free(rootRecordId);
        return -1; // Abort setup
    }

    // Insert a solution2
    char* solutionColumns2[] = {"user_id", "name", "is_public", "record_type_id", "created_at", "updated_at", NULL};
    char* solutionValues2[] = {userId, "Solution 2", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    solutionId2 = common_insert("records", solutionColumns2, solutionValues2);
    if (!solutionId2) {
        fprintf(stderr, "Setup failed: Unable to insert solution.\n");
        free(userId); // Clean up the userId string
        free(recordTypeId);
        free(recordId1);
        free(recordId2);
        free(solutionId1);
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
        free(recordId1);
        free(recordId2);
        free(solutionId1);
        free(solutionId2);
        free(rootRecordId);
        return -1; // Abort setup
    }

    // insert a regular connection type
    char* connectionTypeColumns2[] = {"name", "user_id", "is_public", "directional", "destructive", "target_type", "target_record_type_id", "target_record_subtype_id", "target_hierarchy", "closest_parent_type_id", "one_to_many", "created_at", "updated_at", NULL};
    char* connectionTypeValues2[] = {"Is Related To...", userId, "TRUE", "FALSE", "TRUE", "record", recordTypeId, recordTypeId, "NULL", recordTypeId, "TRUE", "NOW()", "NOW()", NULL};
    char* connectionTypeId2 = common_insert("connection_types", connectionTypeColumns2, connectionTypeValues2);
    if (!connectionTypeId2) {
        fprintf(stderr, "Setup failed: Unable to insert connection type.\n");
        free(userId); // Clean up the userId string
        free(recordTypeId);
        free(recordId1);
        free(recordId2);
        free(solutionId1);
        free(solutionId2);
        free(connectionTypeId);
        free(rootRecordId);
        return -1; // Abort setup
    }

    // Insert a connection between record1 and solution1
    char* connectionColumns[] = {"name", "user_id", "is_public", "record_a_id", "record_b_id", "connection_type_id", "created_at", "updated_at", NULL};
    char* connectionValues[] = {"Test Connection", userId, "TRUE", recordId1, solutionId1, connectionTypeId, "NOW()", "NOW()", NULL};
    char* connectionId = common_insert("connections", connectionColumns, connectionValues);
    if (!connectionId) {
        fprintf(stderr, "Setup failed: Unable to insert connection.\n");
        free(userId); // Clean up the userId string
        free(recordTypeId);
        free(recordId1);
        free(recordId2);
        free(solutionId1);
        free(solutionId2);
        free(connectionTypeId);
        free(connectionTypeId2);
        free(rootRecordId);
        return -1; // Abort setup
    }

    // Insert a connection between record2 and solution2
    char* connectionColumns2[] = {"name", "user_id", "is_public", "record_a_id", "record_b_id", "connection_type_id", "created_at", "updated_at", NULL};
    char* connectionValues2[] = {"Test Connection 2", userId, "TRUE", recordId2, solutionId2, connectionTypeId, "NOW()", "NOW()", NULL};
    char* connectionId2 = common_insert("connections", connectionColumns2, connectionValues2);
    if (!connectionId2) {
        fprintf(stderr, "Setup failed: Unable to insert connection.\n");
        free(userId); // Clean up the userId string
        free(recordTypeId);
        free(recordId1);
        free(recordId2);
        free(solutionId1);
        free(solutionId2);
        free(connectionTypeId);
        free(connectionTypeId2);
        free(connectionId);
        free(rootRecordId);
        return -1; // Abort setup
    }

    // Insert a connection between rootRecord and record1
    char* connectionColumns3[] = {"name", "user_id", "is_public", "record_a_id", "record_b_id", "connection_type_id", "created_at", "updated_at", NULL};
    char* connectionValues3[] = {"Test Connection 3", userId, "TRUE", rootRecordId, recordId1, connectionTypeId2, "NOW()", "NOW()", NULL};
    char* connectionId3 = common_insert("connections", connectionColumns3, connectionValues3);
    if (!connectionId3) {
        fprintf(stderr, "Setup failed: Unable to insert connection.\n");
        free(userId); // Clean up the userId string
        free(recordTypeId);
        free(recordId1);
        free(recordId2);
        free(solutionId1);
        free(solutionId2);
        free(connectionTypeId);
        free(connectionTypeId2);
        free(connectionId);
        free(connectionId2);
        free(rootRecordId);
        return -1; // Abort setup
    }

    // Insert a connection between rootRecord and record2
    char* connectionColumns4[] = {"name", "user_id", "is_public", "record_a_id", "record_b_id", "connection_type_id", "created_at", "updated_at", NULL};
    char* connectionValues4[] = {"Test Connection 4", userId, "TRUE", rootRecordId, recordId2, connectionTypeId2, "NOW()", "NOW()", NULL};
    char* connectionId4 = common_insert("connections", connectionColumns4, connectionValues4);
    if (!connectionId4) {
        fprintf(stderr, "Setup failed: Unable to insert connection.\n");
        free(userId); // Clean up the userId string
        free(recordTypeId);
        free(recordId1);
        free(recordId2);
        free(solutionId1);
        free(solutionId2);
        free(connectionTypeId);
        free(connectionTypeId2);
        free(connectionId);
        free(connectionId2);
        free(connectionId3);
        free(rootRecordId);
        return -1; // Abort setup
    }

    // Cleanup
    free(userId);
    free(recordTypeId);
    free(recordId1);
    free(recordId2);
    free(solutionId1);
    free(solutionId2);
    free(connectionTypeId);
    free(connectionTypeId2);
    free(connectionId);
    free(connectionId2);
    free(connectionId3);
    free(connectionId4);
    free(rootRecordId);

    return 0;
}

void test_all_solved_tree_record_ids_two_destructive_subrecords_both_solved() {
    setup_all_solved_tree_record_ids_two_destructive_subrecords_both_solved();

    int num_records = 0;
    Record* records = fetch_records(&num_records);

    // find a record with a name "Root Record"
    Record* rootRecord = NULL;
    Record* record1 = NULL;
    Record* record2 = NULL;
    Record* solution1 = NULL;
    Record* solution2 = NULL;
    for (int i = 0; i < num_records; i++) {
        if (strcmp(records[i].name, "Root Record") == 0) {
            rootRecord = &records[i];
        } else if (strcmp(records[i].name, "Record 1") == 0) {
            record1 = &records[i];
        } else if (strcmp(records[i].name, "Record 2") == 0) {
            record2 = &records[i];
        } else if (strcmp(records[i].name, "Solution 1") == 0) {
            solution1 = &records[i];
        } else if (strcmp(records[i].name, "Solution 2") == 0) {
            solution2 = &records[i];
        }
    }

    if (!rootRecord) {
        fprintf(stderr, "Test failed: Unable to find root record.\n");
        free(records);
        return;
    }

    // output root record id
    char rootRecordId[100];
    char recordId1[100];
    char recordId2[100];
    char solutionId1[100];
    char solutionId2[100];

    sprintf(rootRecordId, "%d", rootRecord->id);
    sprintf(recordId1, "%d", record1->id);
    sprintf(recordId2, "%d", record2->id);
    sprintf(solutionId1, "%d", solution1->id);
    sprintf(solutionId2, "%d", solution2->id);

    char expectedOutput1[1000], expectedOutput2[1000], expectedOutput3[1000], expectedOutput4[1000], expectedOutput5[1000];

    // Format the expected output strings using the actual record IDs
    sprintf(expectedOutput1, "%s: 1 : 15.000000", rootRecordId);
    sprintf(expectedOutput2, "%s: 1 : 15.000000", recordId1);
    sprintf(expectedOutput3, "%s: 1 : 15.000000", recordId2);
    sprintf(expectedOutput4, "%s: 0 : 15.000000", solutionId1);
    sprintf(expectedOutput5, "%s: 0 : 15.000000", solutionId2);

    // Replace the static initialization with dynamically generated strings
    char* expectedOutput[] = {expectedOutput1, expectedOutput2, expectedOutput3, expectedOutput4, expectedOutput5};
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
