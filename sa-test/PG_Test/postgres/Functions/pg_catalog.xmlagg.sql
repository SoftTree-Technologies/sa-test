CREATE AGGREGATE "pg_catalog"."xmlagg"( in xml)
(
  SFUNC = xmlconcat2,
  STYPE = xml
)