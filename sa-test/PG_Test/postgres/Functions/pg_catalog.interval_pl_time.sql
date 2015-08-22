CREATE FUNCTION "pg_catalog"."interval_pl_time"( in interval, in time without time zone)
  RETURNS time without time zone AS
$$select $2 + $1$$
LANGUAGE SQL;