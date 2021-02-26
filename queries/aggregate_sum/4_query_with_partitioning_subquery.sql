SELECT C_NATION, P_CATEGORY, sum(LO_ORDTOTALPRICE)
FROM
        customer
        JOIN (SELECT * FROM lineorder_partition_by_year WHERE D_YEAR = 1997) AS lineorder_year ON LO_CUSTKEY = C_CUSTKEY
        JOIN part ON LO_PARTKEY = P_PARTKEY
        JOIN supplier ON LO_SUPPKEY = S_SUPPKEY
GROUP BY C_NATION, P_CATEGORY;