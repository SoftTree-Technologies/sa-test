CREATE FUNCTION "pg_catalog"."quote_literal"( in anyelement)
  RETURNS text AS
$$select pg_catalog.quote_literal($1::pg_catalog.text)$$
LANGUAGE SQL;