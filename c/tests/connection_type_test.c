#include "connection_type.h"
#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include "common_insert.h"
#include "common_cleanup.h"

// This function will initialize the database environment for the tests.
int setup_connection_type_test(void) {
    common_cleanup();

    // Insert a user
    char* userColumns[] = {"email", "username", "encrypted_password", "first_name", "last_name", "accept_terms", "is_public", "created_at", "updated_at", NULL};
    char* userValues[] = {"test_ct@example.com", "testctuser", "password", "TestCT", "UserCT", "TRUE", "TRUE", "NOW()", "NOW()", NULL};
    char* userId = common_insert("users", userColumns, userValues);

    if (!userId) {
        fprintf(stderr, "Failed to insert user into users table.\n");
        return -1;
    }

    // Insert a connection type
    char* ctColumns[] = {"user_id", "name", "is_public", "created_at", "updated_at", NULL};
    char* ctValues[] = {userId, "Test Connection Type", "TRUE", "NOW()", "NOW()", NULL};
    char* connectionTypeId = common_insert("connection_types", ctColumns, ctValues);

    free(userId); // Clean up the userId string

    if (!connectionTypeId) {
        fprintf(stderr, "Failed to insert connection type into connection_types table.\n");
        free(connectionTypeId); // Clean up if needed
        return -1;
    }

    free(connectionTypeId); // Clean up the connectionTypeId string

    return 0; // Indicates successful setup
}

// The actual test for fetch_connection_types
void test_fetch_connection_types(void) {
    setup_connection_type_test();
    int num_connection_types = 0;
    ConnectionType* types = fetch_connection_types(&num_connection_types);

    CU_ASSERT_EQUAL(num_connection_types, 1);
    if (num_connection_types > 0) {
        CU_ASSERT_STRING_EQUAL(types[0].name, "Test Connection Type");
        CU_ASSERT_EQUAL(types[0].isPublic, true);
    }

    // Free the memory allocated by fetch_connection_types
    free(types);
}
