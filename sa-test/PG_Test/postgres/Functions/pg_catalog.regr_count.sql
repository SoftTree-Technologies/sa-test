CREATE AGGREGATE "pg_catalog"."regr_count"( in double precision, in double precision)
(
  SFUNC = int8inc_float8_float8,
  STYPE = bigint,
  INITCOND = 0
)