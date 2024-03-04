#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include "common_insert.h"
#include "common_cleanup.h"
#include <stdlib.h>
#include "record.h"

// Tree 1:
// (root 1, three dots) -- solved by inheritence
// |--- (record 1, one dot) -- solved by inheritence
//       |--- (record 2, one dot) -- solved with (Solution 1)
//       |--- (record 3, one dot) -- solved with (Solution 2)
//
// Tree 2:
// (root 2, two dot) -- solved by inheritence
// |--- (record 4, two dots) -- solved by inheritence
//      |--- (record 5, one dot) -- solved with (Solution 3)
//      |--- (record 6, one dot) -- solved with (Solution 4)
//
// Expectation:
// Ranks should be the same (because depth is the same, number of nodes is the same, and number of dots is the same)

int setup_all_solved_tree_record_ids_rank_case_five(void) {
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
    if (!userId) { return -1; }

    // Insert a record type
    char* rtValues[] = {userId, "Test Record Type", "TRUE", "NOW()", "NOW()", NULL};
    char* recordTypeId = common_insert("record_types", rtColumns, rtValues);
    if (!recordTypeId) { return -1; }

    // Insert a root record 1
    char* rootRecordValues1[] = {userId, "Root Record 1", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    char* rootRecordId1 = common_insert("records", recordColumns, rootRecordValues1);
    if (!rootRecordId1) { return -1; }

    // Insert three dots for Root Record 1
    // Dot 1
    char* dotValues1[] = {userId, rootRecordId1, rootRecordId1, "60", "Root Record 1 dot", "NOW()", "NOW()", NULL};
    char* dotId1 = common_insert("dots", dotColumns, dotValues1);
    if (!dotId1) { return -1; }
    // Dot 2
    char* dotValues2[] = {userId, rootRecordId1, rootRecordId1, "60", "Root Record 1 dot", "NOW()", "NOW()", NULL};
    char* dotId2 = common_insert("dots", dotColumns, dotValues2);
    if (!dotId2) { return -1; }
    // Dot 3
    char* dotValues3[] = {userId, rootRecordId1, rootRecordId1, "60", "Root Record 1 dot", "NOW()", "NOW()", NULL};
    char* dotId3 = common_insert("dots", dotColumns, dotValues3);
    if (!dotId3) { return -1; }

    // Insert a root record 2
    char* rootRecordValues2[] = {userId, "Root Record 2", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    char* rootRecordId2 = common_insert("records", recordColumns, rootRecordValues2);
    if (!rootRecordId2) { return -1; }

    // Insert two dots for Root Record 2
    // Dot 1
    char* dotValues4[] = {userId, rootRecordId2, rootRecordId2, "60", "Root Record 2 dot 1", "NOW()", "NOW()", NULL};
    char* dotId4 = common_insert("dots", dotColumns, dotValues4);
    if (!dotId4) { return -1; }
    // Dot 2
    char* dotValues5[] = {userId, rootRecordId2, rootRecordId2, "60", "Root Record 2 dot 2", "NOW()", "NOW()", NULL};
    char* dotId5 = common_insert("dots", dotColumns, dotValues5);
    if (!dotId5) { return -1; }

    // Insert a record 1
    char* recordValues1[] = {userId, "Record 1", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    char* recordId1 = common_insert("records", recordColumns, recordValues1);
    if (!recordId1) { return -1; }

    // Insert one dot for Record 1
    char* dotValues6[] = {userId, recordId1, recordId1, "60", "Record 1 dot", "NOW()", "NOW()", NULL};
    char* dotId6 = common_insert("dots", dotColumns, dotValues6);
    if (!dotId6) { return -1; }

    // Insert a record 2
    char* recordValues2[] = {userId, "Record 2", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    char* recordId2 = common_insert("records", recordColumns, recordValues2);
    if (!recordId2) { return -1; }

    // Insert one dot for Record 2
    char* dotValues7[] = {userId, recordId2, recordId2, "60", "Record 2 dot 1", "NOW()", "NOW()", NULL};
    char* dotId7 = common_insert("dots", dotColumns, dotValues7);
    if (!dotId7) { return -1; }

    // Insert a record 3
    char* recordValues3[] = {userId, "Record 3", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    char* recordId3 = common_insert("records", recordColumns, recordValues3);
    if (!recordId3) { return -1; }

    // Insert one dot for Record 3
    char* dotValues8[] = {userId, recordId3, recordId3, "60", "Record 3 dot 1", "NOW()", "NOW()", NULL};
    char* dotId8 = common_insert("dots", dotColumns, dotValues8);
    if (!dotId8) { return -1; }

    // Insert a record 4
    char* recordValues4[] = {userId, "Record 4", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    char* recordId4 = common_insert("records", recordColumns, recordValues4);
    if (!recordId4) { return -1; }

    // Insert two dots for Record 4
    // Dot 1
    char* dotValues9[] = {userId, recordId4, recordId4, "60", "Record 4 dot 1", "NOW()", "NOW()", NULL};
    char* dotId9 = common_insert("dots", dotColumns, dotValues9);
    if (!dotId9) { return -1; }
    // Dot 2
    char* dotValues10[] = {userId, recordId4, recordId4, "60", "Record 4 dot 2", "NOW()", "NOW()", NULL};
    char* dotId10 = common_insert("dots", dotColumns, dotValues10);
    if (!dotId10) { return -1; }

    // Insert a record 5
    char* recordValues5[] = {userId, "Record 5", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    char* recordId5 = common_insert("records", recordColumns, recordValues5);
    if (!recordId5) { return -1; }

    // Insert one dot for Record 5
    char* dotValues11[] = {userId, recordId5, recordId5, "60", "Record 5 dot 1", "NOW()", "NOW()", NULL};
    char* dotId11 = common_insert("dots", dotColumns, dotValues11);
    if (!dotId11) { return -1; }

    // Insert a record 6
    char* recordValues6[] = {userId, "Record 6", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    char* recordId6 = common_insert("records", recordColumns, recordValues6);
    if (!recordId6) { return -1; }

    // Insert one dot for Record 6
    char* dotValues12[] = {userId, recordId6, recordId6, "60", "Record 6 dot 1", "NOW()", "NOW()", NULL};
    char* dotId12 = common_insert("dots", dotColumns, dotValues12);
    if (!dotId12) { return -1; }

    // Insert a solution1
    char* solutionValues1[] = {userId, "Solution 1", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    char* solutionId1 = common_insert("records", recordColumns, solutionValues1);
    if (!solutionId1) { return -1; }

    // Insert a solution2
    char* solutionValues2[] = {userId, "Solution 2", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    char* solutionId2 = common_insert("records", recordColumns, solutionValues2);
    if (!solutionId2) { return -1; }

    // Insert a solution3
    char* solutionValues3[] = {userId, "Solution 3", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    char* solutionId3 = common_insert("records", recordColumns, solutionValues3);
    if (!solutionId3) { return -1; }

    // Insert a solution4
    char* solutionValues4[] = {userId, "Solution 4", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    char* solutionId4 = common_insert("records", recordColumns, solutionValues4);
    if (!solutionId4) { return -1; }

    // Insert a solution connection type
    char* connectionTypeValues[] = {"Is Solved By...", userId, "TRUE", "TRUE", "TRUE", "record", recordTypeId, recordTypeId, "NULL", recordTypeId, "TRUE", "NOW()", "NOW()", NULL};
    char* connectionTypeId = common_insert("connection_types", connectionTypeColumns, connectionTypeValues);
    if (!connectionTypeId) { return -1; }

    // insert a regular connection type
    char* connectionTypeValues2[] = {"Is Related To...", userId, "TRUE", "FALSE", "TRUE", "record", recordTypeId, recordTypeId, "NULL", recordTypeId, "TRUE", "NOW()", "NOW()", NULL};
    char* connectionTypeId2 = common_insert("connection_types", connectionTypeColumns, connectionTypeValues2);
    if (!connectionTypeId2) { return -1; }

    // Insert a regular connection between root record 1 and record 1
    char* connectionValues[] = {"Test Connection betw. root1 and record1", userId, "TRUE", rootRecordId1, recordId1, connectionTypeId2, "NOW()", "NOW()", NULL};
    char* connectionId = common_insert("connections", connectionColumns, connectionValues);
    if (!connectionId) { return -1; }

    // Insert a regular connection between record 1 and record 2
    char* connectionValues2[] = {"Test Connection betw. record1 and record2", userId, "TRUE", recordId1, recordId2, connectionTypeId2, "NOW()", "NOW()", NULL};
    char* connectionId2 = common_insert("connections", connectionColumns, connectionValues2);
    if (!connectionId2) { return -1; }

    // Insert a regular connection between record 1 and record 3
    char* connectionValues3[] = {"Test Connection betw. record1 and record3", userId, "TRUE", recordId1, recordId3, connectionTypeId2, "NOW()", "NOW()", NULL};
    char* connectionId3 = common_insert("connections", connectionColumns, connectionValues3);
    if (!connectionId3) { return -1; }

    // Insert a connection between record 2 and solution1
    char* connectionValues4[] = {"Test Connection betw. record2 and solution1", userId, "TRUE", recordId2, solutionId1, connectionTypeId, "NOW()", "NOW()", NULL};
    char* connectionId4 = common_insert("connections", connectionColumns, connectionValues4);
    if (!connectionId) { return -1; }

    // Insert a connection between record 3 and solution2
    char* connectionValues5[] = {"Test Connection betw. record3 and solution2", userId, "TRUE", recordId3, solutionId2, connectionTypeId, "NOW()", "NOW()", NULL};
    char* connectionId5 = common_insert("connections", connectionColumns, connectionValues5);
    if (!connectionId5) { return -1; }

    // Insert a connection between root record 2 and record 4
    char* connectionValues6[] = {"Test Connection betw. root2 and record4", userId, "TRUE", rootRecordId2, recordId4, connectionTypeId2, "NOW()", "NOW()", NULL};
    char* connectionId6 = common_insert("connections", connectionColumns, connectionValues6);
    if (!connectionId6) { return -1; }

    // Insert a connection between record 4 and record 5
    char* connectionValues7[] = {"Test Connection betw. record4 and record5", userId, "TRUE", recordId4, recordId5, connectionTypeId2, "NOW()", "NOW()", NULL};
    char* connectionId7 = common_insert("connections", connectionColumns, connectionValues7);
    if (!connectionId7) { return -1; }

    // Insert a connection between record 4 and record 6
    char* connectionValues8[] = {"Test Connection betw. record4 and record6", userId, "TRUE", recordId4, recordId6, connectionTypeId2, "NOW()", "NOW()", NULL};
    char* connectionId8 = common_insert("connections", connectionColumns, connectionValues8);
    if (!connectionId8) { return -1; }

    // Insert a connection between record 5 and solution3
    char* connectionValues9[] = {"Test Connection betw. record5 and solution3", userId, "TRUE", recordId5, solutionId3, connectionTypeId, "NOW()", "NOW()", NULL};
    char* connectionId9 = common_insert("connections", connectionColumns, connectionValues9);
    if (!connectionId9) { return -1; }

    // Insert a connection between record 6 and solution4
    char* connectionValues10[] = {"Test Connection betw. record6 and solution4", userId, "TRUE", recordId6, solutionId4, connectionTypeId, "NOW()", "NOW()", NULL};
    char* connectionId10 = common_insert("connections", connectionColumns, connectionValues10);
    if (!connectionId10) { return -1; }

    // Cleanup
    free(userId);
    free(recordTypeId);
    free(recordId1);
    free(recordId2);
    free(recordId3);
    free(recordId4);
    free(recordId5);
    free(recordId6);
    free(solutionId1);
    free(solutionId2);
    free(solutionId3);
    free(solutionId4);
    free(connectionTypeId);
    free(connectionTypeId2);
    free(connectionId);
    free(connectionId2);
    free(connectionId3);
    free(connectionId4);
    free(connectionId5);
    free(connectionId6);
    free(connectionId7);
    free(connectionId8);
    free(connectionId9);
    free(connectionId10);
    free(rootRecordId1);
    free(rootRecordId2);
    free(dotId1);
    free(dotId2);
    free(dotId3);
    free(dotId4);
    free(dotId5);
    free(dotId6);
    free(dotId7);
    free(dotId8);
    free(dotId9);
    free(dotId10);
    free(dotId11);
    free(dotId12);

    return 0;
}

void test_all_solved_tree_record_ids_rank_case_five(void) {
    setup_all_solved_tree_record_ids_rank_case_five();

    int num_records = 0;
    Record* records = fetch_records(&num_records);

    // find a record with a name "Root Record"
    Record* rootRecord1 = NULL;
    Record* rootRecord2 = NULL;
    Record* record1 = NULL;
    Record* record2 = NULL;
    Record* record3 = NULL;
    Record* record4 = NULL;
    Record* record5 = NULL;
    Record* record6 = NULL;
    Record* solution1 = NULL;
    Record* solution2 = NULL;
    Record* solution3 = NULL;
    Record* solution4 = NULL;
    for (int i = 0; i < num_records; i++) {
        if (strcmp(records[i].name, "Root Record 1") == 0) {
            rootRecord1 = &records[i];
        } else if (strcmp(records[i].name, "Root Record 2") == 0) {
            rootRecord2 = &records[i];
        } else if (strcmp(records[i].name, "Record 1") == 0) {
            record1 = &records[i];
        } else if (strcmp(records[i].name, "Record 2") == 0) {
            record2 = &records[i];
        } else if (strcmp(records[i].name, "Record 3") == 0) {
            record3 = &records[i];
        } else if (strcmp(records[i].name, "Record 4") == 0) {
            record4 = &records[i];
        } else if (strcmp(records[i].name, "Record 5") == 0) {
            record5 = &records[i];
        } else if (strcmp(records[i].name, "Record 6") == 0) {
            record6 = &records[i];
        } else if (strcmp(records[i].name, "Solution 1") == 0) {
            solution1 = &records[i];
        } else if (strcmp(records[i].name, "Solution 2") == 0) {
            solution2 = &records[i];
        } else if (strcmp(records[i].name, "Solution 3") == 0) {
            solution3 = &records[i];
        } else if (strcmp(records[i].name, "Solution 4") == 0) {
            solution4 = &records[i];
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
    char recordId2[100];
    char recordId3[100];
    char recordId4[100];
    char recordId5[100];
    char recordId6[100];
    char solutionId1[100];
    char solutionId2[100];
    char solutionId3[100];
    char solutionId4[100];

    sprintf(rootRecordId1, "%d", rootRecord1->id);
    sprintf(rootRecordId2, "%d", rootRecord2->id);
    sprintf(recordId1, "%d", record1->id);
    sprintf(recordId2, "%d", record2->id);
    sprintf(recordId3, "%d", record3->id);
    sprintf(recordId4, "%d", record4->id);
    sprintf(recordId5, "%d", record5->id);
    sprintf(recordId6, "%d", record6->id);
    sprintf(solutionId1, "%d", solution1->id);
    sprintf(solutionId2, "%d", solution2->id);
    sprintf(solutionId3, "%d", solution3->id);
    sprintf(solutionId4, "%d", solution4->id);

    char expectedOutput1[1000], expectedOutput2[1000], expectedOutput3[1000], expectedOutput4[1000], expectedOutput5[1000], expectedOutput6[1000], expectedOutput7[1000], expectedOutput8[1000], expectedOutput9[1000], expectedOutput10[1000], expectedOutput11[1000], expectedOutput12[1000];

    // Format the expected output strings using the actual record IDs
    sprintf(expectedOutput1, "%s: 1 : 26.400000 : 100.000000", rootRecordId1);
    sprintf(expectedOutput2, "%s: 1 : 26.400000 : 100.000000", rootRecordId2);
    sprintf(expectedOutput3, "%s: 1 : 26.400000 : 100.000000", recordId1);
    sprintf(expectedOutput4, "%s: 1 : 26.400000 : 100.000000", recordId2);
    sprintf(expectedOutput5, "%s: 1 : 26.400000 : 100.000000", recordId3);
    sprintf(expectedOutput6, "%s: 1 : 26.400000 : 100.000000", recordId4);
    sprintf(expectedOutput7, "%s: 1 : 26.400000 : 100.000000", recordId5);
    sprintf(expectedOutput8, "%s: 1 : 26.400000 : 100.000000", recordId6);
    sprintf(expectedOutput9, "%s: 0 : 26.400000 : 0.000000", solutionId1);
    sprintf(expectedOutput10, "%s: 0 : 26.400000 : 0.000000", solutionId2);
    sprintf(expectedOutput11, "%s: 0 : 26.400000 : 0.000000", solutionId3);
    sprintf(expectedOutput12, "%s: 0 : 26.400000 : 0.000000", solutionId4);

    // Replace the static initialization with dynamically generated strings
    char* expectedOutput[] = {expectedOutput1, expectedOutput2, expectedOutput3, expectedOutput4, expectedOutput5, expectedOutput6, expectedOutput7, expectedOutput8, expectedOutput9, expectedOutput10, expectedOutput11, expectedOutput12};
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
