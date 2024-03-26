CC=gcc
CFLAGS=-Wall -Ofast -mavx512f -lgmp
SOURCE_DIR=./src
DEST_DIR=/usr/local/bin

all: lprime

test-build: 
	mkdir -p build-output
	$(CC) ./src/lprime.c -o build-output/lprime $(CFLAGS)

lprime: lprime.c
	$(CC) $(CFLAGS) lprime.c -o lprime

clean:
	rm -f lprime
	rm -f $(DEST_DIR)/lprime

install:
	$(CC) $(SOURCE_DIR)/lprime.c -o $(DEST_DIR)/lprime $(CFLAGS)
