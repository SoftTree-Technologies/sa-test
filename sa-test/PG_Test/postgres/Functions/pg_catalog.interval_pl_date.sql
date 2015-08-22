CREATE FUNCTION "pg_catalog"."interval_pl_date"( in interval, in date)
  RETURNS timestamp without time zone AS
$$select $2 + $1$$
LANGUAGE SQL;