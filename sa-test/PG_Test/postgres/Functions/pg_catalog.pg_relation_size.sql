CREATE FUNCTION "pg_catalog"."pg_relation_size"( in regclass)
  RETURNS bigint AS
$$select pg_catalog.pg_relation_size($1, 'main')$$
LANGUAGE SQL;