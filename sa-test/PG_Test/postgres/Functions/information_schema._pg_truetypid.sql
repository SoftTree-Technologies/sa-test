CREATE FUNCTION "information_schema"."_pg_truetypid"( in pg_attribute, in pg_type)
  RETURNS oid AS
$$SELECT CASE WHEN $2.typtype = 'd' THEN $2.typbasetype ELSE $1.atttypid END$$
LANGUAGE SQL;