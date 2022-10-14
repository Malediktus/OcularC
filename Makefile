CC=gcc

INCLUDES=-I./src
CFLAGS=#-Wall -Wextra

SOURCES := $(shell find src -name '*.c')
OBJECTS := $(addprefix build/,$(SOURCES:%.c=%.o))

all: compiler

compiler: $(OBJECTS)
	@echo "Linking $(OBJECTS)"
	@$(CC) $(CFLAGS) $(INCLUDES) $(OBJECTS) -g -o ./build/main

build/src/%.o: src/%.c
	@echo "$^"
	@$(CC) $^ $(CFLAGS) $(INCLUDES) -o $@ -g -c

clean:
	rm -f ./build/main
	rm -rf $(OBJECTS)

run: all
	@./build/main

install: all
	cp build/main ./ocularc
	mv ./ocularc /usr/bin/