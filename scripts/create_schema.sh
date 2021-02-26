#!/usr/bin/env bash
./run_client.sh --query "$(cat ../schema/date.sql)"
./run_client.sh --query "$(cat ../schema/part.sql)"
./run_client.sh --query "$(cat ../schema/customer.sql)"
./run_client.sh --query "$(cat ../schema/supplier.sql)"
./run_client.sh --query "$(cat ../schema/lineorder.sql)"
./run_client.sh --query "$(cat ../schema/derived_tables/summing_view.sql)"