#include "connection.h"
#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include "common_insert.h"
#include "common_cleanup.h"

// This function will initialize the database environment for the tests.
int setup_connection_test(void) {
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

    char* recordColumns2[] = {"user_id", "name", "is_public", "record_type_id", "created_at", "updated_at", NULL};
    char* recordValues2[] = {userId, "Test Record 2", "TRUE", recordTypeId, "NOW()", "NOW()", NULL};
    char* recordId2 = common_insert("records", recordColumns2, recordValues2);
    if (!recordId2) {
        fprintf(stderr, "Setup failed: Unable to insert record.\n");
        free(userId); // Clean up the userId string
        free(recordTypeId);
        free(recordId);
        return -1; // Abort setup
    }

    char* connectionTypeColumns[] = {"name", "user_id", "is_public", "directional", "destructive", "target_type", "target_record_type_id", "target_record_subtype_id", "target_hierarchy", "closest_parent_type_id", "one_to_many", "created_at", "updated_at", NULL};
    char* connectionTypeValues[] = {"Test Connection Type", userId, "TRUE", "TRUE", "TRUE", "record", recordTypeId, recordTypeId, "NULL", recordTypeId, "TRUE", "NOW()", "NOW()", NULL};
    char* connectionTypeId = common_insert("connection_types", connectionTypeColumns, connectionTypeValues);
    if (!connectionTypeId) {
        fprintf(stderr, "Setup failed: Unable to insert connection type.\n");
        free(userId); // Clean up the userId string
        free(recordTypeId);
        free(recordId);
        free(recordId2);
        return -1; // Abort setup
    }

    char* connectionColumns[] = {"name", "user_id", "is_public", "record_a_id", "record_b_id", "connection_type_id", "created_at", "updated_at", NULL};
    char* connectionValues[] = {"Test Connection", userId, "TRUE", recordId, recordId2, connectionTypeId, "NOW()", "NOW()", NULL};
    char* connectionId = common_insert("connections", connectionColumns, connectionValues);
    if (!connectionId) {
        fprintf(stderr, "Setup failed: Unable to insert connection.\n");
        free(userId); // Clean up the userId string
        free(recordTypeId);
        free(recordId);
        free(recordId2);
        free(connectionTypeId);
        return -1; // Abort setup
    }

    free(userId); // Clean up the userId string
    free(recordTypeId); // Clean up the recordTypeId string
    free(recordId); // Clean up the recordId string if it's used
    free(recordId2); // Clean up the recordId2 string if it's used
    free(connectionTypeId); // Clean up the connectionTypeId string
    free(connectionId); // Clean up the connectionId string

    return 0;
}

// The actual test for fetch_connection_types
void test_fetch_connections(void) {
    setup_connection_test();
    int num_connection_types = 0;
    Connection* types = fetch_connections(&num_connection_types);
    // Assuming you inserted 1 connection in init_suite
    CU_ASSERT_EQUAL(num_connection_types, 1);
    if (num_connection_types > 0) {
        CU_ASSERT_STRING_EQUAL(types[0].name, "Test Connection");
        CU_ASSERT_EQUAL(types[0].isPublic, true);
    }

    // Free the memory allocated by fetch_connection_types
    free(types);
}
