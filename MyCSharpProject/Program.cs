using System;

class Program
{
  static void Main(string[] args)
  {
    int limit = 100000000; // Change this to your desired limit
    int count = 0;

    var startTime = DateTime.Now;

    for (int num = 2; num <= limit; num++)
    {
      if (IsPrime(num))
      {
        count++;
      }
    }

    var endTime = DateTime.Now;
    var executionTime = endTime - startTime;

    Console.WriteLine($"Number of primes: {count}");
    Console.WriteLine($"Execution Time: {executionTime.TotalMilliseconds} ms");
  }

  static bool IsPrime(int number)
  {
    if (number < 2) return false;
    for (int i = 2; i <= Math.Sqrt(number); i++)
    {
      if (number % i == 0) return false;
    }
    return true;
  }
}
