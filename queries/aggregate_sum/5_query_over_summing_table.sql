SELECT
    customer.C_NATION,
    part.P_CATEGORY,
    sum(lineorder.LO_ORDTOTALPRICE)
FROM sales_by_country_and_category
WHERE date_.D_YEAR = 1997
GROUP BY
    customer.C_NATION,
    part.P_CATEGORY;