CREATE FUNCTION "pg_catalog"."shobj_description"( in oid, in name)
  RETURNS text AS
$$select description from pg_catalog.pg_shdescription where objoid = $1 and classoid = (select oid from pg_catalog.pg_class where relname = $2 and relnamespace = 11)$$
LANGUAGE SQL;