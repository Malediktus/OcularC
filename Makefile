CC=gcc

OBJECTS=build/compiler.o build/cprocess.o build/helpers/buffer.o build/helpers/vector.o build/lex_process.o build/lexer.o build/token.o build/parser.o build/node.o
INCLUDES=-I./src

all: compiler

compiler: $(OBJECTS)
	$(CC) src/main.c $(INCLUDES) $(OBJECTS) -g -o ./build/main

build/%.o: src/%.c
	$(CC) $^ $(INCLUDES) -o $@ -g -c

clean:
	rm -f ./build/main
	rm -rf $(OBJECTS)

run: compiler
	./build/main
