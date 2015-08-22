CREATE AGGREGATE "pg_catalog"."every"( in boolean)
(
  SFUNC = booland_statefunc,
  STYPE = boolean,
  SORTOP = <
)