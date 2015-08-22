CREATE AGGREGATE "pg_catalog"."rank"( in any)
(
  SFUNC = ordered_set_transition_multi,
  STYPE = bigint,
  FINALFUNC = rank_final
)