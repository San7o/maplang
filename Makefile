OBJS = build/parser.o
CC = gcc
CFLAGS = -g -Wall -ansi -pedantic -Werror -Wextra -Ibuild

build/parser: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o build/parser -lfl

build/parser.o: build/parser.tab.c
	$(CC) $(CFLAGS) -c build/parser.tab.c -o build/parser.o

build/parser.tab.c: parser/parser.y
	pushd ./build && bison -d -v ../parser/parser.y && popd
