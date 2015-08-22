CREATE AGGREGATE "pg_catalog"."mode"( in anyelement)
(
  SFUNC = ordered_set_transition,
  STYPE = anyelement,
  FINALFUNC = mode_final
)