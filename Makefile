CC=gcc

OBJECTS_MAN=build/compiler.o build/cprocess.o build/helpers/buffer.o build/helpers/vector.o build/lex_process.o build/lexer.o build/token.o build/parser.o build/node.o
INCLUDES=-I./src
CFLAGS=#-Wall -Wextra

SOURCES := $(shell find src -name '*.c')
OBJECTS := $(addprefix build/,$(SOURCES:%.c=%.o))

all: compiler

compiler: $(OBJECTS)
	@echo "================= Linking ================="
	@echo "$(OBJECTS)"
	@$(CC) $(CFLAGS) $(INCLUDES) $(OBJECTS) -g -o ./build/main

build/src/%.o: src/%.c
	@echo "$^"
	@$(CC) $^ $(CFLAGS) $(INCLUDES) -o $@ -g -c

clean:
	rm -f ./build/main
	rm -rf $(OBJECTS)

run: all
	@echo "================ Executing ================"
	@./build/main
