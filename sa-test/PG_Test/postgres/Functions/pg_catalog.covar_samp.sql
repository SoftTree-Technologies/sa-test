CREATE AGGREGATE "pg_catalog"."covar_samp"( in double precision, in double precision)
(
  SFUNC = float8_regr_accum,
  STYPE = double precision,
  FINALFUNC = float8_covar_samp,
  INITCOND = {0,0,0,0,0,0}
)