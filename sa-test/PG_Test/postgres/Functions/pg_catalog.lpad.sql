CREATE FUNCTION "pg_catalog"."lpad"( in text, in integer)
  RETURNS text AS
$$select pg_catalog.lpad($1, $2, ' ')$$
LANGUAGE SQL;