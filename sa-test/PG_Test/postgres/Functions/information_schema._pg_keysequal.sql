CREATE FUNCTION "information_schema"."_pg_keysequal"( in ARRAY, in ARRAY)
  RETURNS boolean AS
$$select $1 operator(pg_catalog.<@) $2 and $2 operator(pg_catalog.<@) $1$$
LANGUAGE SQL;