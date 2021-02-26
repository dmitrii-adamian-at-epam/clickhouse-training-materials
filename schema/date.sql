CREATE TABLE IF NOT EXISTS date_
(
        D_DATEKEY           UInt32,
        D_DATE              String,
        D_DAYOFWEEK         LowCardinality(String),
        D_MONTH             LowCardinality(String),
        D_YEAR              UInt32,
        D_YEARMONTHNUM      UInt32,
        D_YEARMONTH         LowCardinality(String),
        D_DAYNUMINWEEK      UInt32,
        D_DAYNUMINMONTH     UInt32,
        D_DAYNUMINYEAR      UInt32,
        D_MONTHNUMINYEAR    UInt32,
        D_WEEKNUMINYEAR     UInt32,
        D_SELLINGSEASON     LowCardinality(String),
        D_LASTDAYINWEEKFL   UInt8,
        D_LASTDAYINMONTHFL  UInt8,
        D_HOLIDAYFL         UInt8,
        D_WEEKDAYFL         UInt8
)
ENGINE = MergeTree ORDER BY D_DATEKEY;