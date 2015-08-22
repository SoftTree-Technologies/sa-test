CREATE FUNCTION "pg_catalog"."interval_pl_timetz"( in interval, in time with time zone)
  RETURNS time with time zone AS
$$select $2 + $1$$
LANGUAGE SQL;