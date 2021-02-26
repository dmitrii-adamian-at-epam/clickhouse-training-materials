CREATE MATERIALIZED VIEW sales_by_country_and_category
ENGINE = SummingMergeTree() PARTITION BY date_.D_YEAR ORDER BY customer.C_NATION
AS SELECT customer.C_NATION, part.P_CATEGORY, date_.D_YEAR, lineorder.LO_ORDTOTALPRICE
   FROM
           lineorder
           JOIN customer ON lineorder.LO_CUSTKEY = customer.C_CUSTKEY
           JOIN date_ ON lineorder.LO_ORDERDATEKEY = date_.D_DATEKEY
           JOIN part ON lineorder.LO_PARTKEY = part.P_PARTKEY
           JOIN supplier ON lineorder.LO_SUPPKEY = supplier.S_SUPPKEY;