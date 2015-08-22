CREATE FUNCTION "pg_catalog"."integer_pl_date"( in integer, in date)
  RETURNS date AS
$$select $2 + $1$$
LANGUAGE SQL;