SELECT C_NATION, P_CATEGORY, sum(LO_ORDTOTALPRICE)
FROM
        lineorder_partition_by_year
        JOIN customer ON LO_CUSTKEY = C_CUSTKEY
        JOIN part ON LO_PARTKEY = P_PARTKEY
        JOIN supplier ON LO_SUPPKEY = S_SUPPKEY
WHERE D_YEAR = 1997
GROUP BY C_NATION, P_CATEGORY;
