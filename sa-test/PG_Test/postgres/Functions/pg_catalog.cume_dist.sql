CREATE AGGREGATE "pg_catalog"."cume_dist"( in any)
(
  SFUNC = ordered_set_transition_multi,
  STYPE = double precision,
  FINALFUNC = cume_dist_final
)