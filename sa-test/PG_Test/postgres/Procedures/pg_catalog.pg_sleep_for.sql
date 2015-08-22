CREATE FUNCTION "pg_catalog"."pg_sleep_for"( in interval)
  RETURNS void AS
$$select pg_catalog.pg_sleep(extract(epoch from pg_catalog.clock_timestamp() operator(pg_catalog.+) $1) operator(pg_catalog.-) extract(epoch from pg_catalog.clock_timestamp()))$$
LANGUAGE SQL;