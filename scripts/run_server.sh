#!/bin/sh
docker run -d \
  --name clickhouse-workshop-server \
  --ulimit nofile=262144:262144 \
  --volume=$(pwd)/clickhouse_data/:/var/lib/clickhouse \
  yandex/clickhouse-server