CREATE FUNCTION "pg_catalog"."date_part"( in text, in abstime)
  RETURNS double precision AS
$$select pg_catalog.date_part($1, cast($2 as timestamp with time zone))$$
LANGUAGE SQL;