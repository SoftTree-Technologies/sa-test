CREATE AGGREGATE "pg_catalog"."regr_slope"( in double precision, in double precision)
(
  SFUNC = float8_regr_accum,
  STYPE = double precision,
  FINALFUNC = float8_regr_slope,
  INITCOND = {0,0,0,0,0,0}
)