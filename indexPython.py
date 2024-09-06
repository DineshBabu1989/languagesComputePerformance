import time

def sieve_of_eratosthenes(N):
    is_prime = [True] * (N + 1)
    is_prime[0] = is_prime[1] = False

    for i in range(2, int(N**0.5) + 1):
        if is_prime[i]:
            for j in range(i*i, N+1, i):
                is_prime[j] = False

    return [i for i in range(2, N+1) if is_prime[i]]

if __name__ == "__main__":
    N = 100_000_000

    start_time = time.time()
    primes = sieve_of_eratosthenes(N)
    end_time = time.time()

    execution_time = end_time - start_time
    print(f"Python Execution Time: {execution_time:.6f} seconds")
    print(f"Number of primes: {len(primes)}")