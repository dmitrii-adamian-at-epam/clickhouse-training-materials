#!/usr/bin/env sh
docker run -it \
  --rm \
  --link clickhouse-workshop-server:clickhouse-server \
  yandex/clickhouse-client \
  --host clickhouse-server "$@"