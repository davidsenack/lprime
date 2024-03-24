#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>
#include <string.h>

void generateMersennePrime(int n, mpz_t *result) {
    mpz_init(*result);
    mpz_ui_pow_ui(*result, 2, n); // 2^n
    mpz_sub_ui(*result, *result, 1); // 2^n - 1
}

void printHelpMenu() {
    printf("Usage: lprime [OPTIONS]\n");
    printf("Options:\n");
    printf("  -n, --number <value>    Specify the exponent n for 2^n - 1 Mersenne number\n");
    printf("  -k, --rounds <value>    Specify the number of rounds for primality testing (default: 1)\n");
    printf("  -h, --help              Display this help menu\n");
}

int main(int argc, char *argv[]) {
    int n = 0, k = 1; // Default values
    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "-n") == 0 || strcmp(argv[i], "--number") == 0) {
            if (i + 1 < argc) {
                n = atoi(argv[++i]);
            } else {
                fprintf(stderr, "Option -n/--number requires an argument.\n");
                return 1;
            }
        } else if (strcmp(argv[i], "-k") == 0 || strcmp(argv[i], "--rounds") == 0) {
            if (i + 1 < argc) {
                k = atoi(argv[++i]);
            } else {
                fprintf(stderr, "Option -k/--rounds requires an argument.\n");
                return 1;
            }
        } else if (strcmp(argv[i], "-h") == 0 || strcmp(argv[i], "--help") == 0) {
            printHelpMenu();
            return 0;
        }
    }

    if (n == 0) {
        fprintf(stderr, "The value of n was not provided.\n");
        printHelpMenu();
        return 1;
    }

    mpz_t mersennePrime;
    generateMersennePrime(n, &mersennePrime);

    int result = mpz_probab_prime_p(mersennePrime, k);
    if (result == 2 || result == 1) {
        printf("The Mersenne number is probably prime.\n");
    } else {
        printf("The Mersenne number is composite.\n");
    }

    mpz_clear(mersennePrime);
    return 0;
}
