CREATE FUNCTION "pg_catalog"."anytextcat"( in anynonarray, in text)
  RETURNS text AS
$$select $1::pg_catalog.text || $2$$
LANGUAGE SQL;