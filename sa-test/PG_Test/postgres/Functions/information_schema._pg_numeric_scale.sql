CREATE FUNCTION "information_schema"."_pg_numeric_scale"(typid in oid,typmod in integer)
  RETURNS integer AS
$$SELECT
  CASE WHEN $1 IN (21, 23, 20) THEN 0
       WHEN $1 IN (1700) THEN
            CASE WHEN $2 = -1
                 THEN null
                 ELSE ($2 - 4) & 65535
                 END
       ELSE null
  END$$
LANGUAGE SQL;