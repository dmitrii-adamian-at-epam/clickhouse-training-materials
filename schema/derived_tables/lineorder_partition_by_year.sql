CREATE TABLE lineorder_partition_by_year ENGINE = MergeTree()
ORDER BY tuple() PARTITION BY D_YEAR
AS SELECT * FROM lineorder JOIN date_ ON lineorder.LO_ORDERDATEKEY = date_.D_DATEKEY
