CC=gcc
CFLAGS=-Wall -Ofast -mavx512f -lgmp
DIR=build-output

all: lprime

test-build: ./src/lprime.c
	mkdir -p build-output
	$(CC) ./src/lprime.c -o build-output/lprime $(CFLAGS)

lprime: lprime.c
	$(CC) $(CFLAGS) lprime.c -o lprime

clean:
	rm -f lprime

install:
	$(CC) ./src/lprime.c -o /usr/local/bin/lprime $(CFLAGS)
