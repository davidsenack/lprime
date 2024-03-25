#!/usr/bin/env python3

# This script is used to generate a list of k-candidates
# between 100 and 105 million digits in length
# This script is memory intensive using around 32GB of RAM

import math


def get_n_len(n):
    return int(n * math.log10(2)) + 1


def sieve_of_eratosthenes(n):
    primes = [True] * (n + 1)
    primes[0] = primes[1] = False
    for i in range(2, int(n ** 0.5) + 1):
        if primes[i]:
            for j in range(i * i, n + 1, i):
                primes[j] = False
    return [i for i, p in enumerate(primes) if p]


def main():
    n = 1000000000  # 1 billion
    primes = sieve_of_eratosthenes(n)
    selected_primes = []
    for prime in primes:
        prime_len = get_n_len(prime)
        # Get primes between 100 and 105 million digits in length
        if 100000000 <= prime_len <= 105000000:
            selected_primes.append(prime)
    with open('kcandidates.csv', 'w') as file:
        for prime in selected_primes:
            file.write(f"{prime}\n")


if __name__ == "__main__":
    main()
