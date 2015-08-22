CREATE FUNCTION "information_schema"."_pg_interval_type"(typid in oid,mod in integer)
  RETURNS text AS
$$SELECT
  CASE WHEN $1 IN (1186) /* interval */
           THEN upper(substring(format_type($1, $2) from 'interval[()0-9]* #"%#"' for '#'))
       ELSE null
  END$$
LANGUAGE SQL;