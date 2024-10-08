# Performance comparsion between languages

## Rules
- no libraries
- we measure computational time taken and memory

## Algorithemic complexity

```
 time complexity: O(NloglogN)

```

### Task
The goal was to compare the performance and memory usage between Node.js and Go when running a CPU-intensive task: finding prime numbers up to 
N=100,000,000 using the Sieve of Eratosthenes algorithm. This task was repeated 10 times to simulate a heavy load, 
allowing us to assess both execution time and memory consumption.


```
# Node
(base) dineshbabu@Dineshs-MacBook-Pro-2 goVsnode % /usr/bin/time -l  node indexNode.js
Node.js Execution Time: 23.555s
Number of primes: 5761455
       23.76 real        26.11 user         6.92 sys
          6400622592  maximum resident set size
                   0  average shared memory size
                   0  average unshared data size
                   0  average unshared stack size
             1909450  page reclaims
                   0  page faults
                   0  swaps
                   0  block input operations
                   0  block output operations
                   0  messages sent
                   0  messages received
                   0  signals received
                   8  voluntary context switches
              257325  involuntary context switches
        303033094221  instructions retired
         98782367068  cycles elapsed
          8307242944  peak memory footprint

Total CPU Time = User Time + Sys Time = 26.11 + 6.92 = 33.03 seconds
CPU Utilization = (Total CPU Time / Real Time) * 100
                = (33.03 / 23.76) * 100 ≈ 138.5%


RAM used -  6.4 GB

```

```
# Go
(base) dineshbabu@Dineshs-MacBook-Pro-2 goVsnode % /usr/bin/time -l  ./indexGo
Go Execution Time: 866.694917ms
Number of primes: 5761455
        0.89 real         0.82 user         0.20 sys
           299446272  maximum resident set size
                   0  average shared memory size
                   0  average unshared data size
                   0  average unshared stack size
               73457  page reclaims
                   0  page faults
                   0  swaps
                   0  block input operations
                   0  block output operations
                   0  messages sent
                   0  messages received
               19251  signals received
                   5  voluntary context switches
               58988  involuntary context switches
          5520500299  instructions retired
          3019150855  cycles elapsed
           297888896  peak memory footprint

Total CPU time = user + sys = 0.76 + 0.17 = 0.93 seconds

Total CPU Time = User Time + Sys Time = 0.82 + 0.20 = 1.02 seconds
CPU Utilization = (Total CPU Time / Real Time) * 100
                = (1.02 / 0.89) * 100 ≈ 114.6%

RAM used - 299.45 MB
```


```
# C sharp

(base) dineshbabu@Dineshs-MacBook-Pro-2 MyCSharpProject % /usr/bin/time -l dotnet run
Number of primes: 5761455
Execution Time: 1030.12 ms
        1.70 real         1.85 user         0.21 sys
           192069632  maximum resident set size
                   0  average shared memory size
                   0  average unshared data size
                   0  average unshared stack size
               27551  page reclaims
                   0  page faults
                   0  swaps
                   0  block input operations
                   0  block output operations
                  40  messages sent
                 145  messages received
                   1  signals received
                  42  voluntary context switches
                5347  involuntary context switches
          7506600092  instructions retired
          3088621977  cycles elapsed
           152029184  peak memory footprint

Total CPU Time = User Time + Sys Time = 1.85 + 0.21 = 2.06 seconds
Real Time (wall-clock time) = 1.70 seconds
CPU Utilization = (Total CPU Time / Real Time) * 100 = (2.06 / 1.70) * 100 ≈ 121.2%
```

```

(base) dineshbabu@Dineshs-MacBook-Pro-2 languagePerformance % /usr/bin/time -l elixir indexElixir.exs
Elixir Execution Time: 220.093398 seconds
Number of primes: 5761455
      220.55 real       177.19 user        41.83 sys
          8540995584  maximum resident set size
                   0  average shared memory size
                   0  average unshared data size
                   0  average unshared stack size
            44169111  page reclaims
                  41  page faults
                   0  swaps
                   0  block input operations
                   0  block output operations
                   2  messages sent
                   0  messages received
                   0  signals received
                4659  voluntary context switches
               40706  involuntary context switches
       2835775345729  instructions retired
        687998340694  cycles elapsed
         10754061952  peak memory footprint

Total CPU Time = User Time + Sys Time = 177.19 + 41.83 = 219.02 seconds
CPU Utilization = (Total CPU Time / Real Time) * 100 = (219.02 / 220.55) * 100 ≈ 99.31%
RAM used: 8,540,995,584 bytes ≈ 8.14 GB
```

```
Python

(base) dineshbabu@Dineshs-MacBook-Pro-2 languagePerformance % /usr/bin/time -l python indexPython.py
Python Execution Time: 12.171764 seconds
Number of primes: 5761455
       12.26 real        12.06 user         0.19 sys
          1008582656  maximum resident set size
                   0  average shared memory size
                   0  average unshared data size
                   0  average unshared stack size
               66060  page reclaims
                   2  page faults
                   0  swaps
                   0  block input operations
                   0  block output operations
                   0  messages sent
                   0  messages received
                   0  signals received
                   0  voluntary context switches
                 402  involuntary context switches
        106413328676  instructions retired
         38979734138  cycles elapsed
          1005947712  peak memory footprint

Total CPU Time = User Time + Sys Time = 12.06 + 0.19 = 12.25 seconds
CPU Utilization = (Total CPU Time / Real Time) * 100 = (12.25 / 12.26) * 100 ≈ 99.92%
RAM used: 1,008,582,656 bytes ≈ 962.0 MB
```

## Summary
| Language | Execution Time (s) | CPU Utilization (%) | RAM Used (MB) | Number of Primes |
|----------|-------------------:|--------------------:|--------------:|------------------|
| Go       |              0.867 |              114.6% |         299.5 | 5,761,455        |
| C#       |              1.70  |              121.2% |         192.1 | 5,761,455        |
| Python   |             12.172 |               99.9% |         962.0 | 5,761,455        |
| Node.js  |             23.555 |              138.5% |       6,400.0 | 5,761,455        |
| Elixir   |            220.093 |               99.3% |       8,140.0 | 5,761,455        |
