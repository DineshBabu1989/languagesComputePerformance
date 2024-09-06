defmodule SieveOfEratosthenes do
  def sieve(n) do
    is_prime = :array.new(n + 1, default: true)
    is_prime = :array.set(0, false, :array.set(1, false, is_prime))

    do_sieve(is_prime, 2, n)
  end

  defp do_sieve(is_prime, i, n) when i * i > n do
    collect_primes(is_prime, 2, n, [])
  end

  defp do_sieve(is_prime, i, n) do
    if :array.get(i, is_prime) do
      is_prime = mark_multiples(is_prime, i * i, n, i)
      do_sieve(is_prime, i + 1, n)
    else
      do_sieve(is_prime, i + 1, n)
    end
  end

  defp mark_multiples(is_prime, j, n, _i) when j > n do
    is_prime
  end

  defp mark_multiples(is_prime, j, n, i) do
    mark_multiples(:array.set(j, false, is_prime), j + i, n, i)
  end

  defp collect_primes(_is_prime, i, n, primes) when i > n do
    Enum.reverse(primes)
  end

  defp collect_primes(is_prime, i, n, primes) do
    if :array.get(i, is_prime) do
      collect_primes(is_prime, i + 1, n, [i | primes])
    else
      collect_primes(is_prime, i + 1, n, primes)
    end
  end
end

n = 100000000

{time, primes} = :timer.tc(fn -> SieveOfEratosthenes.sieve(n) end)

IO.puts("Elixir Execution Time: #{time / 1_000_000} seconds")
IO.puts("Number of primes: #{length(primes)}")
