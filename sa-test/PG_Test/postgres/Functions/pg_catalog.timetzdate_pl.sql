CREATE FUNCTION "pg_catalog"."timetzdate_pl"( in time with time zone, in date)
  RETURNS timestamp with time zone AS
$$select ($2 + $1)$$
LANGUAGE SQL;