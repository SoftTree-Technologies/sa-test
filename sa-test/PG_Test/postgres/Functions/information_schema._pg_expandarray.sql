CREATE FUNCTION "information_schema"."_pg_expandarray"( in anyarray,x out anyelement,n out integer)
  RETURNS record AS
$$select $1[s], s - pg_catalog.array_lower($1,1) + 1
        from pg_catalog.generate_series(pg_catalog.array_lower($1,1),
                                        pg_catalog.array_upper($1,1),
                                        1) as g(s)$$
LANGUAGE SQL;