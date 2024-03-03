#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include "common_insert.h"
#include "common_cleanup.h"
#include <stdlib.h>
#include "record.h"

// Tree 1:
// (root 1, one dot) -- solved with (Solution 1)
//
// Tree 2:
// (root 2, one dot) -- solved by inheritence
// |--- (record 1, one dot) -- solved with (Solution 2)
//
// Expectation:
// Tree 2 ranks higher than Tree 1

int setup_all_solved_tree_record_ids_rank_case_two(void) {
    common_cleanup();

    char* userColumns[] = {"email", "username", "encrypted_password", "first_name", "last_name", "accept_terms", "is_public", "created_at", "updated_at", NULL};
    char* rtColumns[] = {"user_id", "name", "is_public", "created_at", "updated_at", NULL};
    char* recordColumns[] = {"user_id", "name", "is_public", "record_type_id", "created_at", "updated_at", NULL};
    char* dotColumns[] = {"user_id", "record_id", "project_id", "duration", "description", "created_at", "updated_at", NULL};
    char* connectionTypeColumns[] = {"name", "user_id", "is_public", "directional", "destructive", "target_type", "target_record_type_id", "target_record_subtype_id", "target_hierarchy", "closest_parent_type_id", "one_to_many", "created_at", "updated_at", NULL};
    char* connectionColumns[] = {"name", "user_id", "is_public", "record_a_id", "record_b_id", "connection_type_id", "created_at", "updated_at", NULL};

    // Insert a user
    char* userValues[] = {"test_record@example.com", "testrecorduser", "password", "TestRecord", "User", "TRUE", "TRUE", "NOW()", "NOW()", NULL};
    char* userId = common_insert("users", userColumns, userValues);
    if (!userId) { return 1; }

    // Insert a record type
    char* rtValues[] = {userId, "Test Record Type", "TRUE", "NOW()", "NOW()", NULL};
    char* recordTypeId = common_insert("record_types", rtColumns, rtValues);
    if (!recordTypeId) { return 1; }

    // Insert a root record 1
    char* rootRecordValues1[] = {userId, "Root Record 1", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    char* rootRecordId1 = common_insert("records", recordColumns, rootRecordValues1);
    if (!rootRecordId1) { return 1; }

    // Insert one dot for Root Record 1
    char* dotValues1[] = {userId, rootRecordId1, rootRecordId1, "60", "Root Record 1 dot", "NOW()", "NOW()", NULL};
    char* dotId1 = common_insert("dots", dotColumns, dotValues1);
    if (!dotId1) { return 1; }

    // Insert a root record 2
    char* rootRecordValues2[] = {userId, "Root Record 2", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    char* rootRecordId2 = common_insert("records", recordColumns, rootRecordValues2);
    if (!rootRecordId2) { return 1; }

    // Insert one dot for Root Record 2
    char* dotValues2[] = {userId, rootRecordId2, rootRecordId2, "60", "Root Record 2 dot 1", "NOW()", "NOW()", NULL};
    char* dotId2 = common_insert("dots", dotColumns, dotValues2);
    if (!dotId2) { return 1; }

    // Insert a record 1
    char* recordValues1[] = {userId, "Record 1", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    char* recordId1 = common_insert("records", recordColumns, recordValues1);
    if (!recordId1) { return 1; }

    // Insert one dot for Record 1
    char* dotValues3[] = {userId, recordId1, recordId1, "60", "Record 1 dot", "NOW()", "NOW()", NULL};
    char* dotId3 = common_insert("dots", dotColumns, dotValues3);
    if (!dotId3) { return 1; }

    // Insert a solution1
    char* solutionValues1[] = {userId, "Solution 1", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    char* solutionId1 = common_insert("records", recordColumns, solutionValues1);
    if (!solutionId1) { return 1; }

    // Insert a solution2
    char* solutionValues2[] = {userId, "Solution 2", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    char* solutionId2 = common_insert("records", recordColumns, solutionValues2);
    if (!solutionId2) { return 1; }

    // Insert a solution connection type
    char* connectionTypeValues[] = {"Is Solved By...", userId, "TRUE", "TRUE", "TRUE", "record", recordTypeId, recordTypeId, "NULL", recordTypeId, "TRUE", "NOW()", "NOW()", NULL};
    char* connectionTypeId = common_insert("connection_types", connectionTypeColumns, connectionTypeValues);
    if (!connectionTypeId) { return 1; }

    // insert a regular connection type
    char* connectionTypeValues2[] = {"Is Related To...", userId, "TRUE", "FALSE", "TRUE", "record", recordTypeId, recordTypeId, "NULL", recordTypeId, "TRUE", "NOW()", "NOW()", NULL};
    char* connectionTypeId2 = common_insert("connection_types", connectionTypeColumns, connectionTypeValues2);
    if (!connectionTypeId2) { return 1; }

    // Insert a regular connection between root record 1 and solution 1
    char* connectionValues[] = {"Test Connection", userId, "TRUE", rootRecordId1, solutionId1, connectionTypeId, "NOW()", "NOW()", NULL};
    char* connectionId = common_insert("connections", connectionColumns, connectionValues);
    if (!connectionId) { return 1; }

    // Insert a connection between root record 2 and record 1
    char* connectionValues2[] = {"Test Connection", userId, "TRUE", rootRecordId2, recordId1, connectionTypeId2, "NOW()", "NOW()", NULL};
    char* connectionId2 = common_insert("connections", connectionColumns, connectionValues2);
    if (!connectionId2) { return 1; }

    // Insert a connection between record 1 and solution2
    char* connectionValues3[] = {"Test Connection", userId, "TRUE", recordId1, solutionId2, connectionTypeId, "NOW()", "NOW()", NULL};
    char* connectionId3 = common_insert("connections", connectionColumns, connectionValues3);

    // Cleanup
    free(userId);
    free(recordTypeId);
    free(recordId1);
    free(solutionId1);
    free(solutionId2);
    free(connectionTypeId);
    free(connectionTypeId2);
    free(connectionId);
    free(connectionId2);
    free(connectionId3);
    free(rootRecordId1);
    free(rootRecordId2);
    free(dotId1);
    free(dotId2);
    free(dotId3);

    return 0;
}

void test_all_solved_tree_record_ids_rank_case_two(void) {
    setup_all_solved_tree_record_ids_rank_case_two();

    int num_records = 0;
    Record* records = fetch_records(&num_records);

    // find a record with a name "Root Record"
    Record* rootRecord1 = NULL;
    Record* rootRecord2 = NULL;
    Record* record1 = NULL;
    Record* solution1 = NULL;
    Record* solution2 = NULL;
    for (int i = 0; i < num_records; i++) {
        if (strcmp(records[i].name, "Root Record 1") == 0) {
            rootRecord1 = &records[i];
        } else if (strcmp(records[i].name, "Root Record 2") == 0) {
            rootRecord2 = &records[i];
        } else if (strcmp(records[i].name, "Record 1") == 0) {
            record1 = &records[i];
        } else if (strcmp(records[i].name, "Solution 1") == 0) {
            solution1 = &records[i];
        } else if (strcmp(records[i].name, "Solution 2") == 0) {
            solution2 = &records[i];
        }
    }

    if (!rootRecord1) {
        fprintf(stderr, "Test failed: Unable to find root record.\n");
        free(records);
        return;
    }

    // output root record id
    char rootRecordId1[100];
    char rootRecordId2[100];
    char recordId1[100];
    char solutionId1[100];
    char solutionId2[100];

    sprintf(rootRecordId1, "%d", rootRecord1->id);
    sprintf(rootRecordId2, "%d", rootRecord2->id);
    sprintf(recordId1, "%d", record1->id);
    sprintf(solutionId1, "%d", solution1->id);
    sprintf(solutionId2, "%d", solution2->id);

    char expectedOutput1[1000], expectedOutput2[1000], expectedOutput3[1000], expectedOutput4[1000], expectedOutput5[1000];

    // Format the expected output strings using the actual record IDs
    sprintf(expectedOutput1, "%s: 1 : 4.200000", rootRecordId1);
    sprintf(expectedOutput2, "%s: 1 : 9.600000", rootRecordId2);
    sprintf(expectedOutput3, "%s: 1 : 9.600000", recordId1);
    sprintf(expectedOutput4, "%s: 0 : 4.200000", solutionId1);
    sprintf(expectedOutput5, "%s: 0 : 9.600000", solutionId2);

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
}
