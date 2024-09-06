package main

import (
	"fmt"
	"time"
)

func sieveOfEratosthenes(N int) []int {
	isPrime := make([]bool, N+1)
	for i := 2; i <= N; i++ {
		isPrime[i] = true
	}

	for i := 2; i*i <= N; i++ {
		if isPrime[i] {
			for j := i * i; j <= N; j += i {
				isPrime[j] = false
			}
		}
	}

	primes := []int{}
	for i := 2; i <= N; i++ {
		if isPrime[i] {
			primes = append(primes, i)
		}
	}
	return primes
}

func main() {
	N := 100000000

	start := time.Now()
	primes := sieveOfEratosthenes(N)
	duration := time.Since(start)

	fmt.Println("Go Execution Time:", duration)
	fmt.Println("Number of primes:", len(primes))
}
