CREATE FUNCTION "pg_catalog"."path_contain_pt"( in path, in point)
  RETURNS boolean AS
$$select pg_catalog.on_ppath($2, $1)$$
LANGUAGE SQL;