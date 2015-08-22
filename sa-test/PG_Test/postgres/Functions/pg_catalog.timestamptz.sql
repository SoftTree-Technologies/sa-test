CREATE FUNCTION "pg_catalog"."timestamptz"( in date, in time without time zone)
  RETURNS timestamp with time zone AS
$$select cast(($1 + $2) as timestamp with time zone)$$
LANGUAGE SQL;