# Materials for ClickHouse training
## Prerequisites
The following should be installed before running scripts:
* Docker
* Git
* C compiler and build tools (e.g. XCode) capable of compiling input data generator https://github.com/greenlion/ssb-dbgen

## Preparing benchmark data 
Create directory for the benchmark, cd there:
```shell script
mkdir clickhouse_benchmark
cd clickhouse_benchmark
```

### Building input data generator

Clone repository https://github.com/greenlion/ssb-dbgen.git

Run inside benchmark directory 
```shell script
git clone https://github.com/greenlion/ssb-dbgen.git
```

Build input data generator with Make.
Run in the same directory as previous command:
```shell script
cd ssb-dbgen
make
```

### Generating input data
Generate tables.
Scale factor (size) is set by `-s <factor> ` option. 
Use factor 10 for reasonable output size, 1 for quick iteration

Run inside _ssd-dbgen_ directory
```shell script
./dbgen -s 1 -T a
```

Create directory for input data and copy input data there. 
Run inside _ssd-dbgen_ directory:
```shell script
mkdir ../input-data
mv *.tbl ../input-data
```

### Creating tables and loading data
Move to benchmark directory:
```shell script
cd ..
```
Create directory for ClickHouse data files:
```shell script
mkdir clickhouse_data
```

Set environment variable for workshop repository path (use absolute path without `~`, do not add trailing `/`):
```shell script
export WORKSHOP_REPO_PATH=<insert_directory_here>
```

Run ClickHouse server in Docker container. Execute from benchmark directory:
```shell script
bash ${WORKSHOP_REPO_PATH}/scripts/run_server.sh
```
This command will start a detached Docker container 
_clickhouse-workshop-server_ that can be later stopped with `docker stop`

Create tables in ClickHouse. Execute from benchmark directory:
```shell script
pushd "${WORKSHOP_REPO_PATH}/scripts/"
./create_schema.sh
popd
``` 

Load data and create additional derived tables. Execute from benchmark directory:
```shell script
pushd input-data
bash ${WORKSHOP_REPO_PATH}/scripts/load_data.sh
popd
```

## Running queries
Run Docker container with ClickHouse client in interactive mode.
Execute from any directory:
```shell script
bash ${WORKSHOP_REPO_PATH}/scripts/run_interactive_client.sh
``` 