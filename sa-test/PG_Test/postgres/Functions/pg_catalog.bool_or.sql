CREATE AGGREGATE "pg_catalog"."bool_or"( in boolean)
(
  SFUNC = boolor_statefunc,
  STYPE = boolean,
  SORTOP = >
)