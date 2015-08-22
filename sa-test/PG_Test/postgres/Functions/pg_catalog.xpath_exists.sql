CREATE FUNCTION "pg_catalog"."xpath_exists"( in text, in xml)
  RETURNS boolean AS
$$select pg_catalog.xpath_exists($1, $2, '{}'::pg_catalog.text[])$$
LANGUAGE SQL;