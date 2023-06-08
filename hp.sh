#!/bin/bash

# Set the number of clients, threads, and duration for the benchmark
CLIENTS=10
THREADS=2
DURATION=300

# Start PostgreSQL with Hugepages enabled
sudo sysctl vm.nr_hugepages=256
sudo service postgresql restart

# Create the benchmark database
pgbench -i -s 100 benchmarkdb

# Run the benchmark with Hugepages enabled
pgbench -c $CLIENTS -j $THREADS -T $DURATION -f /path/to/benchmark.sql benchmarkdb

# Stop PostgreSQL
sudo service postgresql stop

# Disable Hugepages
sudo sysctl vm.nr_hugepages=0

# Print benchmark results or save them to a file
pgbench -c $CLIENTS -j $THREADS -t 1000 -f /path/to/benchmark.sql benchmarkdb >> benchmark_results.txt

