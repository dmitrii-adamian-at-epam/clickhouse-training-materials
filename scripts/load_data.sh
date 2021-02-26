#!/usr/bin/env sh

if [[ -z "${WORKSHOP_REPO_PATH}" ]]; then
  echo "Please set WORKSHOP_REPO_PATH variable"
  exit 1
fi

SCRIPTS_PATH="${WORKSHOP_REPO_PATH}/scripts"
echo "Loading date_ table"
time "${SCRIPTS_PATH}/run_client.sh" --format_csv_delimiter '|' --query "INSERT INTO date_ FORMAT CSV" < date.tbl

echo "Loading customer table"
time "${SCRIPTS_PATH}/run_client.sh" --format_csv_delimiter '|' --query "INSERT INTO customer FORMAT CSV" < customer.tbl

echo "Loading supplier table"
time "${SCRIPTS_PATH}/run_client.sh" --format_csv_delimiter '|' --query "INSERT INTO supplier FORMAT CSV" < supplier.tbl

echo "Loading part table"
time "${SCRIPTS_PATH}/run_client.sh" --format_csv_delimiter '|' --query "INSERT INTO part FORMAT CSV" < part.tbl

echo "Loading lineorder table"
time "${SCRIPTS_PATH}/run_client.sh" --format_csv_delimiter '|' --query "INSERT INTO lineorder FORMAT CSV" < lineorder.tbl

echo "Creating lineorder_partition_by_year table"
time "${SCRIPTS_PATH}/run_client.sh" --query "$(cat ${WORKSHOP_REPO_PATH}/schema/derived_tables/lineorder_partition_by_year.sql)"

echo "Creating lineorder_sorted_by_part table"
time "${SCRIPTS_PATH}/run_client.sh" --query "$(cat ${WORKSHOP_REPO_PATH}/schema/derived_tables/lineorder_sorted_create.sql)"

echo "Filling lineorder_sorted_by_part table"
time "${SCRIPTS_PATH}/run_client.sh" --query "$(cat ${WORKSHOP_REPO_PATH}/schema/derived_tables/lineorder_sorted_copy_data.sql)"

echo "Adding index to lineorder_sorted_by_part table"
time "${SCRIPTS_PATH}/run_client.sh" --query "$(cat ${WORKSHOP_REPO_PATH}/schema/derived_tables/lineorder_sorted_add_index.sql)"