CREATE FUNCTION "pg_catalog"."xpath"( in text, in xml)
  RETURNS ARRAY AS
$$select pg_catalog.xpath($1, $2, '{}'::pg_catalog.text[])$$
LANGUAGE SQL;