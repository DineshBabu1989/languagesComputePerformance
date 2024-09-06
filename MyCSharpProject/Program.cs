using System;

class Program
{
  static void Main(string[] args)
  {
    int N = 100000000; // Limit

    var startTime = DateTime.Now;

    var primes = SieveOfEratosthenes(N);

    var endTime = DateTime.Now;
    var executionTime = endTime - startTime;

    Console.WriteLine($"Number of primes: {primes.Length}");
    Console.WriteLine($"Execution Time: {executionTime.TotalMilliseconds} ms");
  }

  static int[] SieveOfEratosthenes(int N)
  {
    bool[] isPrime = new bool[N + 1];

    for (int i = 2; i <= N; i++)
    {
      isPrime[i] = true;
    }

    for (int i = 2; i * i <= N; i++)
    {
      if (isPrime[i])
      {
        for (int j = i * i; j <= N; j += i)
        {
          isPrime[j] = false;
        }
      }
    }

    int count = 0;
    for (int i = 2; i <= N; i++)
    {
      if (isPrime[i])
      {
        count++;
      }
    }

    int[] primes = new int[count];
    int index = 0;
    for (int i = 2; i <= N; i++)
    {
      if (isPrime[i])
      {
        primes[index++] = i;
      }
    }

    return primes;
  }
}
