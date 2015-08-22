CREATE FUNCTION "information_schema"."_pg_char_max_length"(typid in oid,typmod in integer)
  RETURNS integer AS
$$SELECT
  CASE WHEN $2 = -1 /* default typmod */
       THEN null
       WHEN $1 IN (1042, 1043) /* char, varchar */
       THEN $2 - 4
       WHEN $1 IN (1560, 1562) /* bit, varbit */
       THEN $2
       ELSE null
  END$$
LANGUAGE SQL;