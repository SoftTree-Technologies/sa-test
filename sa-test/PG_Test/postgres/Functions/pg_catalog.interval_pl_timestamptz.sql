CREATE FUNCTION "pg_catalog"."interval_pl_timestamptz"( in interval, in timestamp with time zone)
  RETURNS timestamp with time zone AS
$$select $2 + $1$$
LANGUAGE SQL;