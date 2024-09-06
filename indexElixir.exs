defmodule Sieve do
  def sieve_of_eratosthenes(n) when n >= 2 do
    # Step 1: Create a list of booleans representing prime status
    is_prime = List.duplicate(true, n + 1)
    is_prime = List.replace_at(is_prime, 0, false)
    is_prime = List.replace_at(is_prime, 1, false)

    # Step 2: Call the recursive sieve function
    sieve_helper(is_prime, 2, n)
  end

  defp sieve_helper(is_prime, i, n) when i * i <= n do
    if is_prime[i] do
      is_prime = mark_multiples(is_prime, i, i * i, n)
    end
    sieve_helper(is_prime, i + 1, n)
  end

  defp sieve_helper(is_prime, _i, _n), do: is_prime

  defp mark_multiples(is_prime, _prime, j, n) when j > n, do: is_prime

  defp mark_multiples(is_prime, prime, j, n) do
    if j <= n do
      is_prime = List.replace_at(is_prime, j, false)
      mark_multiples(is_prime, prime, j + prime, n)
    else
      is_prime
    end
  end

  def primes_up_to(n) when n >= 2 do
    is_prime = sieve_of_eratosthenes(n)

    # Step 4: Extract the prime numbers
    for i <- 2..n, is_prime[i], do: i
  end
end

# Measure execution time
N = 100_000_000

start_time = :os.system_time(:millisecond)
primes = Sieve.primes_up_to(N)
end_time = :os.system_time(:millisecond)

IO.puts("Execution Time: #{end_time - start_time} ms")
IO.puts("Number of primes: #{length(primes)}")
