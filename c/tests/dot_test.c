#include "dot.h"
#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include "common_insert.h"
#include "common_cleanup.h"

// This function will initialize the database environment for the tests.
int setup_dot_test(void) {
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

    // Insert a record
    char* recordColumns[] = {"user_id", "name", "is_public", "record_type_id", "created_at", "updated_at", NULL};
    char* recordValues[] = {userId, "Test Record", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    char* recordId = common_insert("records", recordColumns, recordValues);
    if (!recordId) {
        fprintf(stderr, "Setup failed: Unable to insert record.\n");
        free(userId); // Clean up the userId string
        free(recordTypeId);
        return -1; // Abort setup
    }

    // Insert a project
    char* projectColumns[] = {"user_id", "name", "is_public", "record_type_id", "created_at", "updated_at", NULL};
    char* projectValues[] = {userId, "Test Project", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    char* projectId = common_insert("records", projectColumns, projectValues);
    if (!projectId) {
        fprintf(stderr, "Setup failed: Unable to insert project.\n");
        free(userId); // Clean up the userId string
        free(recordTypeId); // Clean up the recordTypeId string
        free(recordId); // Clean up the recordId string
        return -1; // Abort setup
    }

    // Insert a dot
    char* dotColumns[] = {"user_id", "record_id", "project_id", "duration", "description", "created_at", "updated_at", NULL};
    char* dotValues[] = {userId, recordId, projectId, "60", "Test Dot", "NOW()", "NOW()", NULL};
    char* dotId = common_insert("dots", dotColumns, dotValues);
    if (!dotId) {
        fprintf(stderr, "Setup failed: Unable to insert dot.\n");
        free(userId); // Clean up the userId string
        free(recordTypeId); // Clean up the recordTypeId string
        free(recordId); // Clean up the recordId string
        free(projectId); // Clean up the projectId string
        return -1; // Abort setup
    }

    free(userId); // Clean up the userId string
    free(recordTypeId); // Clean up the recordTypeId string
    free(recordId); // Clean up the recordId string if it's used
    free(projectId); // Clean up the projectId string if it's used
    free(dotId); // Clean up the dotId string if it's used

    return 0; // Indicates successful setup
}

// The actual test for fetch_dots
void test_fetch_dots(void) {
    setup_dot_test();
    int num_dots = 0;
    Dot* dots = fetch_dots(&num_dots);

    CU_ASSERT_EQUAL(num_dots, 1);
    if (num_dots > 0) {
        CU_ASSERT_STRING_EQUAL(dots[0].description, "Test Dot");
    }

    free(dots);
}
