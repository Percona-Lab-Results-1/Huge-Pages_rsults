 Percona-Lab-Results


3 / 3

PostgreSQL Benchmarking with Huge Pages and Transparent Huge Pages
This repository contains the benchmarking scripts and dummy results for PostgreSQL with different configurations of Huge Pages and Transparent Huge Pages (THP). The goal is to measure the performance impact of using different memory settings in PostgreSQL.

Contents
benchmark_script.sh: Shell script to run the pgbench benchmark with various configurations.
results.csv: Dummy benchmark results for PostgreSQL with different Huge Pages and THP configurations.
Configuration Details
The following configurations were used for the benchmark:

Huge Pages	Transparent Huge Pages (THP)
Configuration	CPU Cores	RAM (GB)	
Config A	4	8	Enabled	Enabled
Config B	8	16	Enabled	Enabled
Config C	16	32	Enabled	Enabled
Config D	8	64	Enabled	Enabled
Config E	12	128	Enabled	Enabled
Config F	4	32	Disabled	Enabled
Config G	8	64	Disabled	Enabled
Config H	16	128	Disabled	Enabled
Config I	12	32	Disabled	Enabled
Config J	8	16	Disabled	Disabled
Benchmark Results
The results.csv file contains 100 dummy benchmark results for each configuration. The results include the following metrics:

Transactions per Second (TPS): The number of transactions executed per second.
Latency (ms): The average latency of the transactions in milliseconds.
The benchmark results can be used for reference and comparison purposes. Please note that these results are purely fictional and do not reflect the actual performance of PostgreSQL with different Huge Pages and THP configurations.

How to Run the Benchmark
To run the benchmarking script, follow these steps:

Make the benchmark_script.sh file executable: chmod +x benchmark_script.sh
Run the benchmark script: ./benchmark_script.sh
The script will execute the pgbench benchmark for each configuration and generate the benchmark results in the results.csv file.
Feel free to modify the benchmark script or experiment with different configurations to further analyze the impact of Huge Pages and THP on PostgreSQL performance.

License
This repository is licensed under the MIT License.

Note: Remember to always review and adapt the scripts and configurations to match your specific environment and requirements before using them in a production setting.

If you have any questions or suggestions, please feel free to open an issue or contribute to this repository. Happy benchmarking!
