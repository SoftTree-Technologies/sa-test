CREATE AGGREGATE "pg_catalog"."percent_rank"( in any)
(
  SFUNC = ordered_set_transition_multi,
  STYPE = double precision,
  FINALFUNC = percent_rank_final
)