CREATE FUNCTION "pg_catalog"."pg_file_rename"( in text, in text)
  RETURNS boolean AS
$$SELECT pg_catalog.pg_file_rename($1, $2, NULL::pg_catalog.text);$$
LANGUAGE SQL;