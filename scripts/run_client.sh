#!/usr/bin/env sh
docker run -i \
  --rm \
  --link clickhouse-workshop-server:clickhouse-server \
  yandex/clickhouse-client \
  --host clickhouse-server "$@"