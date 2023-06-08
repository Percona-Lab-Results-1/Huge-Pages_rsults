#!/bin/bash

# Set the PostgreSQL connection parameters
DB_HOST="localhost"
DB_PORT="5432"
DB_NAME="benchmarkdb"
DB_USER="postgres"
DB_PASSWORD="your_password"

# Set the benchmark configurations
CONFIGURATIONS=(
  "hugepages_enabled_thp_enabled"
  "hugepages_enabled_thp_disabled"
  "hugepages_disabled_thp_enabled"
  "hugepages_disabled_thp_disabled"
)

# Set the number of clients and transactions for the benchmark
CLIENTS=10
TRANSACTIONS=1000

# Run the benchmark for each configuration
for CONFIG in "${CONFIGURATIONS[@]}"; do
  echo "Running benchmark for configuration: $CONFIG"

  # Set the PostgreSQL configuration parameters based on the configuration
  case $CONFIG in
    "hugepages_enabled_thp_enabled")
      sudo sysctl -w vm.nr_hugepages=128
      sudo sysctl -w kernel.shm_use_hugepages=1
      ;;
    "hugepages_enabled_thp_disabled")
      sudo sysctl -w vm.nr_hugepages=128
      sudo sysctl -w kernel.shm_use_hugepages=0
      ;;
    "hugepages_disabled_thp_enabled")
      sudo sysctl -w vm.nr_hugepages=0
      sudo sysctl -w kernel.shm_use_hugepages=1
      ;;
    "hugepages_disabled_thp_disabled")
      sudo sysctl -w vm.nr_hugepages=0
      sudo sysctl -w kernel.shm_use_hugepages=0
      ;;
  esac

  # Restart PostgreSQL to apply the configuration changes
  sudo systemctl restart postgresql

  # Run the pgbench benchmark
  pgbench -h $DB_HOST -p $DB_PORT -U $DB_USER -W -c $CLIENTS -T $TRANSACTIONS $DB_NAME

  echo "Benchmark for configuration $CONFIG completed"
done

