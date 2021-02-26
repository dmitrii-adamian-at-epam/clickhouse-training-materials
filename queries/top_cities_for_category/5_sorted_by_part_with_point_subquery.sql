SELECT C_CITY, sum(LO_ORDTOTALPRICE) AS total_sales
FROM
    lineorder_sorted_by_part
    JOIN customer ON LO_CUSTKEY = C_CUSTKEY
WHERE LO_PARTKEY IN (402146, 408446)
GROUP BY C_CITY
ORDER BY total_sales DESC
LIMIT 10