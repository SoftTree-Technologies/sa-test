CREATE FUNCTION "pg_catalog"."timedate_pl"( in time without time zone, in date)
  RETURNS timestamp without time zone AS
$$select ($2 + $1)$$
LANGUAGE SQL;