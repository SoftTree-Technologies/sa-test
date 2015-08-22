CREATE AGGREGATE "pg_catalog"."bool_and"( in boolean)
(
  SFUNC = booland_statefunc,
  STYPE = boolean,
  SORTOP = <
)