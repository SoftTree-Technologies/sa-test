SET SCHEMA "information_schema";

CREATE VIEW view_table_usage AS
 SELECT DISTINCT (current_database())::sql_identifier AS view_catalog,
    (nv.nspname)::sql_identifier AS view_schema,
    (v.relname)::sql_identifier AS view_name,
    (current_database())::sql_identifier AS table_catalog,
    (nt.nspname)::sql_identifier AS table_schema,
    (t.relname)::sql_identifier AS table_name
   FROM pg_namespace nv,
    pg_class v,
    pg_depend dv,
    pg_depend dt,
    pg_class t,
    pg_namespace nt
  WHERE ((((((((((((((nv.oid = v.relnamespace) AND (v.relkind = 'v'::"char")) AND (v.oid = dv.refobjid)) AND (dv.refclassid = ('pg_class'::regclass)::oid)) AND (dv.classid = ('pg_rewrite'::regclass)::oid)) AND (dv.deptype = 'i'::"char")) AND (dv.objid = dt.objid)) AND (dv.refobjid <> dt.refobjid)) AND (dt.classid = ('pg_rewrite'::regclass)::oid)) AND (dt.refclassid = ('pg_class'::regclass)::oid)) AND (dt.refobjid = t.oid)) AND (t.relnamespace = nt.oid)) AND (t.relkind = ANY (ARRAY['r'::"char", 'v'::"char", 'f'::"char"]))) AND pg_has_role(t.relowner, 'USAGE'::text));


ALTER TABLE view_table_usage OWNER TO postgres;

--
-- Name: view_table_usage; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE view_table_usage FROM PUBLIC;
REVOKE ALL ON TABLE view_table_usage FROM postgres;
GRANT ALL ON TABLE view_table_usage TO postgres;
GRANT SELECT ON TABLE view_table_usage TO PUBLIC;

