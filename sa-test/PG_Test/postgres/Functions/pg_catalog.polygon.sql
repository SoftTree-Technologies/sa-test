CREATE FUNCTION "pg_catalog"."polygon"( in circle)
  RETURNS polygon AS
$$select pg_catalog.polygon(12, $1)$$
LANGUAGE SQL;