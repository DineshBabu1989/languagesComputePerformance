function sieveOfEratosthenes(N) {
  let isPrime = Array(N + 1).fill(true);
  isPrime[0] = isPrime[1] = false;

  for (let i = 2; i * i <= N; i++) {
    if (isPrime[i]) {
      for (let j = i * i; j <= N; j += i) {
        isPrime[j] = false;
      }
    }
  }

  let primes = [];
  for (let i = 2; i <= N; i++) {
    if (isPrime[i]) primes.push(i);
  }
  return primes;
}

console.time("Node.js Execution Time");
let N = 100000000;
let primes = sieveOfEratosthenes(N);
console.timeEnd("Node.js Execution Time");
console.log("Number of primes:", primes.length);
