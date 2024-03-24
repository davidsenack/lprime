CC=gcc
CFLAGS=-Wall -Ofast -lgmp
DIR=build-output

all: lprime

test-build: lprime.c
	$(CC) lprime.c -o build-output/lprime $(CFLAGS)

lprime: lprime.c
	$(CC) $(CFLAGS) lprime.c -o lprime

clean:
	rm -f lprime
