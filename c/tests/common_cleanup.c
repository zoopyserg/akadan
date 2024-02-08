#include "common_cleanup.h"
#include <libpq-fe.h>

int common_cleanup(void) {
    PGconn *conn = PQconnectdb("dbname=journal_development user=diamondserge password=112223 host=localhost");
    if (PQstatus(conn) != CONNECTION_OK) {
        fprintf(stderr, "Connection to database failed: %s\n", PQerrorMessage(conn));
        PQfinish(conn);
        return -1; // Indicates failure to clean up
    }

    // Set client_min_messages to suppress notice messages
    PQexec(conn, "SET client_min_messages TO WARNING;");

    // Truncate tables. Specify additional tables as needed.
    // CASCADE ensures that any dependent entities are also truncated.
    PGresult *res = PQexec(conn, "TRUNCATE TABLE connection_types, users, records, record_types, connections CASCADE");
    if (PQresultStatus(res) != PGRES_COMMAND_OK) {
        fprintf(stderr, "Failed to truncate tables: %s\n", PQerrorMessage(conn));
        PQclear(res);
        PQfinish(conn);
        return -1;
    }

    PQclear(res);
    PQfinish(conn);
    return 0; // Indicates successful cleanup
}
