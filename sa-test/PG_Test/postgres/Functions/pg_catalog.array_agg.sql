CREATE AGGREGATE "pg_catalog"."array_agg"( in anyelement)
(
  SFUNC = array_agg_transfn,
  STYPE = anyarray,
  FINALFUNC = array_agg_finalfn
)