CREATE FUNCTION "pg_catalog"."textanycat"( in text, in anynonarray)
  RETURNS text AS
$$select $1 || $2::pg_catalog.text$$
LANGUAGE SQL;