CREATE AGGREGATE "pg_catalog"."regr_intercept"( in double precision, in double precision)
(
  SFUNC = float8_regr_accum,
  STYPE = double precision,
  FINALFUNC = float8_regr_intercept,
  INITCOND = {0,0,0,0,0,0}
)