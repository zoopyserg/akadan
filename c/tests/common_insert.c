#include "common_insert.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* common_insert(char* table, char* columns[], char* values[]) {
    PGconn *conn = PQconnectdb("dbname=journal_development user=diamondserge password=112223 host=localhost");
    if (PQstatus(conn) != CONNECTION_OK) {
        fprintf(stderr, "Connection to database failed: %s\n", PQerrorMessage(conn));
        PQfinish(conn);
        return NULL;
    }

    // Construct the SQL command string
    char command[1024] = "INSERT INTO ";
    strcat(command, table);
    strcat(command, " (");

    // Add columns to the command
    for (int i = 0; columns[i]; ++i) {
        strcat(command, columns[i]);
        if (columns[i + 1] != NULL) strcat(command, ", ");
    }

    strcat(command, ") VALUES (");

    // Add values to the command
    for (int i = 0; values[i]; ++i) {
        strcat(command, "'");
        strcat(command, values[i]);
        strcat(command, "'");
        if (values[i + 1] != NULL) strcat(command, ", ");
    }

    strcat(command, ") RETURNING id;");

    // Execute the SQL command
    PGresult *res = PQexec(conn, command);

    if (PQresultStatus(res) != PGRES_TUPLES_OK) {
        fprintf(stderr, "Insert command failed: %s\n", PQerrorMessage(conn));
        PQclear(res);
        PQfinish(conn);
        return NULL;
    }

    // Get the ID of the inserted row
    char *id = strdup(PQgetvalue(res, 0, 0));

    // Cleanup
    PQclear(res);
    PQfinish(conn);

    return id;
}
