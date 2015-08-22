CREATE FUNCTION "pg_catalog"."pg_sleep_until"( in timestamp with time zone)
  RETURNS void AS
$$select pg_catalog.pg_sleep(extract(epoch from $1) operator(pg_catalog.-) extract(epoch from pg_catalog.clock_timestamp()))$$
LANGUAGE SQL;