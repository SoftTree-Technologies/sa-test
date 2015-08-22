CREATE FUNCTION "pg_catalog"."overlaps"( in timestamp with time zone, in interval, in timestamp with time zone, in interval)
  RETURNS boolean AS
$$select ($1, ($1 + $2)) overlaps ($3, ($3 + $4))$$
LANGUAGE SQL;