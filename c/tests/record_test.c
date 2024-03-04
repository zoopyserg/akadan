#include "record.h"
#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include "common_insert.h"
#include "common_cleanup.h"

// This function will initialize the database environment for the tests.
int setup_record_test(void) {
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

    free(userId); // Clean up the userId string
    free(recordTypeId); // Clean up the recordTypeId string
    free(recordId); // Clean up the recordId string if it's used

    return 0; // Indicates successful setup
}

// The actual test for fetch_records
void test_fetch_records(void) {
    setup_record_test();
    int num_records = 0;
    Record* records = fetch_records(&num_records);

    CU_ASSERT_EQUAL(num_records, 1);
    if (num_records > 0) {
        CU_ASSERT_STRING_EQUAL(records[0].name, "Test Record");
        CU_ASSERT_EQUAL(records[0].isPublic, true);
    }

    free(records);
}

void test_save_records(void) {
    // Setup test environment
    setup_record_test();

    // Assuming setup_record_test inserts at least one test record and returns its ID
    int num_records = 0;
    Record* records = fetch_records(&num_records);

    // Simulate updates
    if (num_records > 0) {
        records[0].isSolved = true;
        records[0].rank = 5.0f;
    }

    // Save updates
    save_records(records, num_records);

    // Fetch again to verify updates
    Record* updated_records = fetch_records(&num_records);

    // Assertions to verify the record was updated correctly
    if (num_records > 0) {
        CU_ASSERT_TRUE(updated_records[0].isSolved);
        CU_ASSERT_DOUBLE_EQUAL(updated_records[0].rank, 5.0, 0.001); // Assuming a tolerance of 0.001
    }

    // Cleanup
    free(records);
    free(updated_records);
}
