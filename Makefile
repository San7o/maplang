PROJECT_DIR= $(shell pwd)
BUILD_DIR= $(PROJECT_DIR)/build
OBJS = $(BUILD_DIR)/parser.o $(BUILD_DIR)/lex.o
CC = gcc
CFLAGS = -g -Wall -ansi -pedantic -Werror \
        -Wextra -Ibuild -Wno-unused-function \
        -Wno-implicit-function-declaration

.PHONY: clean

build/parser: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(BUILD_DIR)/parser -lfl

$(BUILD_DIR)/lex.o: $(BUILD_DIR)/lex.yy.c
	$(CC) $(CFLAGS) -c $(BUILD_DIR)/lex.yy.c -o $(BUILD_DIR)/lex.o 

$(BUILD_DIR)/lex.yy.c: lexer/lexer.lex
	pushd $(BUILD_DIR) && flex ../lexer/lexer.lex && popd

$(BUILD_DIR)/parser.o: $(BUILD_DIR)/parser.tab.c
	$(CC) $(CFLAGS) -c $(BUILD_DIR)/parser.tab.c -o $(BUILD_DIR)/parser.o

$(BUILD_DIR)/parser.tab.c: parser/parser.y
	pushd $(BUILD_DIR) && bison -d -v ../parser/parser.y && popd

clean:
	rm -rf $(BUILD_DIR)
