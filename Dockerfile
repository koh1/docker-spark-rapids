FROM nvidia/cuda:12.2.2-base-ubuntu22.04

ARG SPARK_VER=3.5.0
ARG SPARK_RAPIDS_VER=2.12-23.12.2

ENV SPARK_RAPIDS_DIR=/opt/sparkRapidsPlugin
ENV SPARK_RAPIDS_PLUGIN_JAR=${SPARK_RAPIDS_DIR}/rapids-4-spark_${SPARK_RAPIDS_VER}.jar
ENV SPARK_HOME=/opt/spark-${SPARK_VER}-bin-hadoop3

RUN apt-get update && apt-get install -y openjdk-8-jdk tmux vim

COPY ./spark-${SPARK_VER}-bin-hadoop3.tgz /
WORKDIR /opt
RUN tar zxvf ../spark-${SPARK_VER}-bin-hadoop3.tgz
WORKDIR /opt/sparkRapidsPlugin
COPY ./rapids-4-spark_${SPARK_RAPIDS_VER}.jar /opt/sparkRapidsPlugin/

ENTRYPOINT [ "/bin/bash" ]




