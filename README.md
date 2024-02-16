# Spark-Rapids Docker

## Build image

### Prepare files
* Download Spark from [here](https://spark.apache.org/downloads.html)
* Download spark-rapids from [here](https://nvidia.github.io/spark-rapids/docs/download.html)
* Base image: nvidia/cuda:12.2.2-base-ubuntu22.04

### Build

```shell
docker build -t <name>:<version> .
```

## Run

```shell
docker run --gpus all --rm -it  --shm-size=1g --ulimit memlock=-1 --ulimit stack=67108864  <name>:<version>
```

## Run spark in docker container

Run with [Local Mode](https://docs.nvidia.com/spark-rapids/user-guide/latest/getting-started/on-premise.html#local-mode)

```shell
$SPARK_HOME/bin/spark-shell \
       --master local \
       --num-executors 1 \
       --conf spark.executor.cores=1 \
       --conf spark.rapids.sql.concurrentGpuTasks=1 \
       --driver-memory 10g \
       --conf spark.rapids.memory.pinnedPool.size=2G \
       --conf spark.sql.files.maxPartitionBytes=512m \
       --conf spark.plugins=com.nvidia.spark.SQLPlugin \
       --jars ${SPARK_RAPIDS_PLUGIN_JAR}
```

