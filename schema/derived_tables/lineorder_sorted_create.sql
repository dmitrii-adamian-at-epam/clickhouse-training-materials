CREATE TABLE IF NOT EXISTS lineorder_sorted_by_part
ENGINE = MergeTree() ORDER BY tuple(LO_PARTKEY)
AS
SELECT * FROM lineorder LIMIT 0