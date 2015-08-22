CREATE FUNCTION "pg_catalog"."col_description"( in oid, in integer)
  RETURNS text AS
$$select description from pg_catalog.pg_description where objoid = $1 and classoid = 'pg_catalog.pg_class'::pg_catalog.regclass and objsubid = $2$$
LANGUAGE SQL;