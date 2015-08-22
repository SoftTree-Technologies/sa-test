CREATE AGGREGATE "pg_catalog"."regr_avgy"( in double precision, in double precision)
(
  SFUNC = float8_regr_accum,
  STYPE = double precision,
  FINALFUNC = float8_regr_avgy,
  INITCOND = {0,0,0,0,0,0}
)