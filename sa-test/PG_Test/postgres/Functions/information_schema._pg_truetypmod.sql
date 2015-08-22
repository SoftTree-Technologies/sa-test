CREATE FUNCTION "information_schema"."_pg_truetypmod"( in pg_attribute, in pg_type)
  RETURNS integer AS
$$SELECT CASE WHEN $2.typtype = 'd' THEN $2.typtypmod ELSE $1.atttypmod END$$
LANGUAGE SQL;