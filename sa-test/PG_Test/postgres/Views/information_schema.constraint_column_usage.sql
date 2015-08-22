SET SCHEMA "information_schema";

CREATE VIEW constraint_column_usage AS
 SELECT (current_database())::sql_identifier AS table_catalog,
    (x.tblschema)::sql_identifier AS table_schema,
    (x.tblname)::sql_identifier AS table_name,
    (x.colname)::sql_identifier AS column_name,
    (current_database())::sql_identifier AS constraint_catalog,
    (x.cstrschema)::sql_identifier AS constraint_schema,
    (x.cstrname)::sql_identifier AS constraint_name
   FROM ( SELECT DISTINCT nr.nspname,
            r.relname,
            r.relowner,
            a.attname,
            nc.nspname,
            c.conname
           FROM pg_namespace nr,
            pg_class r,
            pg_attribute a,
            pg_depend d,
            pg_namespace nc,
            pg_constraint c
          WHERE (((((((((((nr.oid = r.relnamespace) AND (r.oid = a.attrelid)) AND (d.refclassid = ('pg_class'::regclass)::oid)) AND (d.refobjid = r.oid)) AND (d.refobjsubid = a.attnum)) AND (d.classid = ('pg_constraint'::regclass)::oid)) AND (d.objid = c.oid)) AND (c.connamespace = nc.oid)) AND (c.contype = 'c'::"char")) AND (r.relkind = 'r'::"char")) AND (NOT a.attisdropped))
        UNION ALL
         SELECT nr.nspname,
            r.relname,
            r.relowner,
            a.attname,
            nc.nspname,
            c.conname
           FROM pg_namespace nr,
            pg_class r,
            pg_attribute a,
            pg_namespace nc,
            pg_constraint c
          WHERE (((((((nr.oid = r.relnamespace) AND (r.oid = a.attrelid)) AND (nc.oid = c.connamespace)) AND
                CASE
                    WHEN (c.contype = 'f'::"char") THEN ((r.oid = c.confrelid) AND (a.attnum = ANY (c.confkey)))
                    ELSE ((r.oid = c.conrelid) AND (a.attnum = ANY (c.conkey)))
                END) AND (NOT a.attisdropped)) AND (c.contype = ANY (ARRAY['p'::"char", 'u'::"char", 'f'::"char"]))) AND (r.relkind = 'r'::"char"))) x(tblschema, tblname, tblowner, colname, cstrschema, cstrname)
  WHERE pg_has_role(x.tblowner, 'USAGE'::text);


ALTER TABLE constraint_column_usage OWNER TO postgres;

--
-- Name: constraint_column_usage; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE constraint_column_usage FROM PUBLIC;
REVOKE ALL ON TABLE constraint_column_usage FROM postgres;
GRANT ALL ON TABLE constraint_column_usage TO postgres;
GRANT SELECT ON TABLE constraint_column_usage TO PUBLIC;

