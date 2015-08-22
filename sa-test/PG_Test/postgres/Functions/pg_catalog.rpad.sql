CREATE FUNCTION "pg_catalog"."rpad"( in text, in integer)
  RETURNS text AS
$$select pg_catalog.rpad($1, $2, ' ')$$
LANGUAGE SQL;