CREATE FUNCTION "pg_catalog"."bit_length"( in bytea)
  RETURNS integer AS
$$select pg_catalog.octet_length($1) * 8$$
LANGUAGE SQL;