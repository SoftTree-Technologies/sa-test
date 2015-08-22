CREATE FUNCTION "pg_catalog"."quote_nullable"( in anyelement)
  RETURNS text AS
$$select pg_catalog.quote_nullable($1::pg_catalog.text)$$
LANGUAGE SQL;