CREATE AGGREGATE "pg_catalog"."regr_sxy"( in double precision, in double precision)
(
  SFUNC = float8_regr_accum,
  STYPE = double precision,
  FINALFUNC = float8_regr_sxy,
  INITCOND = {0,0,0,0,0,0}
)