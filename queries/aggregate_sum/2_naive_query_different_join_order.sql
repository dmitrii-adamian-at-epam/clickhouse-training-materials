SELECT C_NATION, P_CATEGORY, sum(LO_ORDTOTALPRICE)
FROM
        date_
        JOIN lineorder ON LO_ORDERDATEKEY = D_DATEKEY
        JOIN customer ON LO_CUSTKEY = C_CUSTKEY
        JOIN part ON LO_PARTKEY = P_PARTKEY
        JOIN supplier ON LO_SUPPKEY = S_SUPPKEY
WHERE D_YEAR = 1997
GROUP BY C_NATION, P_CATEGORY;
