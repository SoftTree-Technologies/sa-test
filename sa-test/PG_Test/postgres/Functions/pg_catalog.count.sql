CREATE AGGREGATE "pg_catalog"."count"( in any)
(
  SFUNC = int8inc_any,
  STYPE = bigint,
  INITCOND = 0
)