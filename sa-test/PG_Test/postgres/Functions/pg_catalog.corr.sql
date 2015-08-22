CREATE AGGREGATE "pg_catalog"."corr"( in double precision, in double precision)
(
  SFUNC = float8_regr_accum,
  STYPE = double precision,
  FINALFUNC = float8_corr,
  INITCOND = {0,0,0,0,0,0}
)