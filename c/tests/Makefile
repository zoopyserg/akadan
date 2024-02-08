# Define compiler and flags
CC=gcc
CFLAGS=-Wall $(shell pkg-config --cflags cunit)
LDFLAGS=$(shell pkg-config --libs cunit)

# Define your test executable and source files
TEST_EXEC=sample_test
TEST_SRC=sample_test.c

# Default target builds the test executable
all: $(TEST_EXEC)

# Compile the test executable
$(TEST_EXEC): $(TEST_SRC)
	$(CC) $(CFLAGS) -o $(TEST_EXEC) $(TEST_SRC) $(LDFLAGS)

# Target to compile and then run tests
test: $(TEST_EXEC)
	./$(TEST_EXEC)

clean:
	rm -f
