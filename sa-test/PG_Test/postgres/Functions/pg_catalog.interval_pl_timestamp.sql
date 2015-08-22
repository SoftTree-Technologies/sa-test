CREATE FUNCTION "pg_catalog"."interval_pl_timestamp"( in interval, in timestamp without time zone)
  RETURNS timestamp without time zone AS
$$select $2 + $1$$
LANGUAGE SQL;