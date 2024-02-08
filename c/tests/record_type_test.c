#include "record_type.h"
#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include "common_insert.h"
#include "common_cleanup.h"

// This function will initialize the database environment for the tests.
int setup_record_type_test(void) {
    common_cleanup();

    char* userColumns[] = {"email", "username", "encrypted_password", "first_name", "last_name", "accept_terms", "is_public", "created_at", "updated_at", NULL};
    char* userValues[] = {"test@example.com", "testuser", "password", "Test", "User", "TRUE", "TRUE", "NOW()", "NOW()", NULL};
    char* userId = common_insert("users", userColumns, userValues);

    if (!userId) {
        fprintf(stderr, "Failed to insert user into users table.\n");
        return -1;
    }

    char* rtColumns[] = {"user_id", "name", "is_public", "created_at", "updated_at", NULL};
    char* rtValues[] = {userId, "Test Record Type", "TRUE", "NOW()", "NOW()", NULL};
    char* recordTypeId = common_insert("record_types", rtColumns, rtValues);

    free(userId); // Clean up the userId string

    if (!recordTypeId) {
        fprintf(stderr, "Failed to insert record type into record_types table.\n");
        free(recordTypeId); // Clean up if needed
        return -1;
    }

    free(recordTypeId); // Clean up the recordTypeId string

    return 0; // Indicates successful setup
}

// The actual test for fetch_record_types
void test_fetch_record_types(void) {
    setup_record_type_test();
    int num_record_types = 0;
    RecordType* types = fetch_record_types(&num_record_types);
    // Assuming you inserted 1 record in init_suite
    CU_ASSERT_EQUAL(num_record_types, 1);
    if (num_record_types > 0) {
        CU_ASSERT_STRING_EQUAL(types[0].name, "Test Record Type");
        CU_ASSERT_EQUAL(types[0].isPublic, true);
    }

    // Free the memory allocated by fetch_record_types
    free(types);
}
