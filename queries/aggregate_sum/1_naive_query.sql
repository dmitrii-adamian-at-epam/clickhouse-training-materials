SELECT C_NATION, P_CATEGORY, sum(LO_ORDTOTALPRICE)
FROM
        lineorder
        JOIN customer ON LO_CUSTKEY = C_CUSTKEY
        JOIN date_ ON LO_ORDERDATEKEY = D_DATEKEY
        JOIN part ON LO_PARTKEY = P_PARTKEY
        JOIN supplier ON LO_SUPPKEY = S_SUPPKEY
WHERE D_YEAR = 1997
GROUP BY C_NATION, P_CATEGORY;
