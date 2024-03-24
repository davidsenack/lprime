#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>

void generateMersennePrime(int n, mpz_t *result) {
    mpz_init(*result);
    mpz_ui_pow_ui(*result, 2, n); // 2^n
    mpz_sub_ui(*result, *result, 1); // 2^n - 1
}

int main(void) {
    int n;
    printf("Enter the value of n: ");
    if (scanf("%d", &n) != 1) {
        fprintf(stderr, "Failed to read the value of n.\n");
        return 1;
    }

    mpz_t mersennePrime;
    generateMersennePrime(n, &mersennePrime);

    int k = 1; // Limit iterations to one for speed
    int result = mpz_probab_prime_p(mersennePrime, k);
    if (result == 2 || result == 1) {
        printf("The Mersenne number is probably prime.\n");
    } else {
        printf("The Mersenne number is composite.\n");
    }

    mpz_clear(mersennePrime);
    return 0;
}
