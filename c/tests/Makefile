# Define compiler and flags
CC=gcc
CFLAGS=-Wall $(shell pkg-config --cflags cunit) -I. -I../program -I/usr/include/postgresql
LDFLAGS=$(shell pkg-config --libs cunit) -lpq

# Path to your program's source files (relative to the tests directory)
PROGRAM_DIR=../program

# Common cleanup file
COMMON_CLEANUP=./common_cleanup.c

# Common insert file
COMMON_INSERT=./common_insert.c

# Source files from your program that are required for the tests
PROGRAM_SRCS=$(PROGRAM_DIR)/record_type.c $(PROGRAM_DIR)/common.c $(PROGRAM_DIR)/connection_type.c $(PROGRAM_DIR)/connection.c $(PROGRAM_DIR)/record.c

# Test runner and test source files
TEST_RUNNER=all_tests_runner.c
TEST_SRCS=$(wildcard *_test.c)

# Define the executable for the test runner
TEST_EXEC=$(TEST_RUNNER:.c=)

# Default target to compile the test runner executable
all: $(TEST_EXEC)

# Rule for compiling the test runner executable
$(TEST_EXEC): $(TEST_RUNNER) $(TEST_SRCS) $(PROGRAM_SRCS) $(COMMON_CLEANUP) $(COMMON_INSERT)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

# Target to compile and then run the unified test suite
test: $(TEST_EXEC)
	./$(TEST_EXEC)

clean:
	rm -f $(TEST_EXEC)
