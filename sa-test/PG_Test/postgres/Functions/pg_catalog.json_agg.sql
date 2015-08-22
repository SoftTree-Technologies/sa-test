CREATE AGGREGATE "pg_catalog"."json_agg"( in anyelement)
(
  SFUNC = json_agg_transfn,
  STYPE = json,
  FINALFUNC = json_agg_finalfn
)