CREATE FUNCTION "pg_catalog"."time"( in abstime)
  RETURNS time without time zone AS
$$select cast(cast($1 as timestamp without time zone) as pg_catalog.time)$$
LANGUAGE SQL;