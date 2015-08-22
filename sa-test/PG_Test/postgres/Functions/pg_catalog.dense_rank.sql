CREATE AGGREGATE "pg_catalog"."dense_rank"( in any)
(
  SFUNC = ordered_set_transition_multi,
  STYPE = bigint,
  FINALFUNC = dense_rank_final
)