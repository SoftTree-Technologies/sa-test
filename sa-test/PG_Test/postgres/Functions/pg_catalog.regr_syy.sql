CREATE AGGREGATE "pg_catalog"."regr_syy"( in double precision, in double precision)
(
  SFUNC = float8_regr_accum,
  STYPE = double precision,
  FINALFUNC = float8_regr_syy,
  INITCOND = {0,0,0,0,0,0}
)