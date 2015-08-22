CREATE AGGREGATE "pg_catalog"."json_object_agg"( in any, in any)
(
  SFUNC = json_object_agg_transfn,
  STYPE = json,
  FINALFUNC = json_object_agg_finalfn
)