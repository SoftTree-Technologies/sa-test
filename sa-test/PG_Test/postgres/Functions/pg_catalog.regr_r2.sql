CREATE AGGREGATE "pg_catalog"."regr_r2"( in double precision, in double precision)
(
  SFUNC = float8_regr_accum,
  STYPE = double precision,
  FINALFUNC = float8_regr_r2,
  INITCOND = {0,0,0,0,0,0}
)