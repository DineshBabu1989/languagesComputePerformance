# Performance comparsion between languages

## Rules
- no libraries
- we measure computational time taken and memory


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

(base) dineshbabu@Dineshs-MacBook-Pro-2 MyCSharpProject %  /usr/bin/time -l dotnet run
Number of primes: 5761455
Execution Time: 106106.419 ms
      106.85 real       106.05 user         0.69 sys
           189399040  maximum resident set size
                   0  average shared memory size
                   0  average unshared data size
                   0  average unshared stack size
               20029  page reclaims
                   0  page faults
                   0  swaps
                   0  block input operations
                   0  block output operations
                  35  messages sent
                  60  messages received
                  10  signals received
                 259  voluntary context switches
               37238  involuntary context switches
          8020939564  instructions retired
          3330049067  cycles elapsed
           147408832  peak memory footprint

Total CPU time = user + sys = 106.85 + 0.69 = 107 seconds
CPU Utilization = (Total CPU Time / Real Time) * 100 
                = (107  / 106.85) * 100 = 100%

RAM used - 189 MB
```