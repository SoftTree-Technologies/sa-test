CREATE FUNCTION "pg_catalog"."pg_file_length"( in text)
  RETURNS bigint AS
$$SELECT size FROM pg_catalog.pg_stat_file($1)$$
LANGUAGE SQL;