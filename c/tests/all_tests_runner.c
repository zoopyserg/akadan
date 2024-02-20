#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include "record_type_test.h"
#include "connection_type_test.h"
#include "record_test.h"
#include "connection_test.h"
#include "all_solved_tree_record_ids_test.h"
#include "all_solved_tree_record_ids_single_unsolved_test.h"
#include "all_solved_tree_record_ids_single_solved_test.h"
#include "all_solved_tree_record_ids_two_destructive_subrecords_one_solved_test.h"
#include "all_solved_tree_record_ids_two_destructive_subrecords_both_solved_test.h"
#include "common_insert.h"
#include "common_cleanup.h"

int main() {
    CU_pSuite pSuite = NULL;

    if (CUE_SUCCESS != CU_initialize_registry())
        return CU_get_error();

    pSuite = CU_add_suite("Unified Test Suite", NULL, NULL);
    if (NULL == pSuite) {
        CU_cleanup_registry();
        return CU_get_error();
    }

    // Register tests from each test file
    if (
        (NULL == CU_add_test(pSuite, "Test fetch_record_types", test_fetch_record_types)) ||
        (NULL == CU_add_test(pSuite, "Test fetch_connection_types", test_fetch_connection_types)) ||
        (NULL == CU_add_test(pSuite, "Test fetch_records", test_fetch_records)) ||
        (NULL == CU_add_test(pSuite, "Test fetch_connections", test_fetch_connections)) ||
        (NULL == CU_add_test(pSuite, "Test All Solved Tree Record IDs", test_all_solved_tree_record_ids)) ||
        (NULL == CU_add_test(pSuite, "Test All Solved Tree Record IDs Single Unsolved", test_all_solved_tree_record_ids_single_unsolved)) ||
        (NULL == CU_add_test(pSuite, "Test All Solved Tree Record IDs Single Solved", test_all_solved_tree_record_ids_single_solved)) ||
        (NULL == CU_add_test(pSuite, "Test All Solved Tree Record IDs Two Destructive Subrecords One Solved", test_all_solved_tree_record_ids_two_destructive_subrecords_one_solved)) ||
        (NULL == CU_add_test(pSuite, "Test All Solved Tree Record IDs Two Destructive Subrecords Both Solved", test_all_solved_tree_record_ids_two_destructive_subrecords_both_solved))
       ) {
        CU_cleanup_registry();
        return CU_get_error();
    }

    CU_basic_set_mode(CU_BRM_VERBOSE);
    CU_basic_run_tests();
    CU_cleanup_registry();
    return CU_get_error();
}
