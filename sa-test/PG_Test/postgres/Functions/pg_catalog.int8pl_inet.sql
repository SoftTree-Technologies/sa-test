CREATE FUNCTION "pg_catalog"."int8pl_inet"( in bigint, in inet)
  RETURNS inet AS
$$select $2 + $1$$
LANGUAGE SQL;