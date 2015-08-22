CREATE FUNCTION "pg_catalog"."to_timestamp"( in double precision)
  RETURNS timestamp with time zone AS
$$select ('epoch'::pg_catalog.timestamptz + $1 * '1 second'::pg_catalog.interval)$$
LANGUAGE SQL;