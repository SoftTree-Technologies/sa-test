SET SCHEMA "information_schema";

CREATE VIEW view_routine_usage AS
 SELECT DISTINCT (current_database())::sql_identifier AS table_catalog,
    (nv.nspname)::sql_identifier AS table_schema,
    (v.relname)::sql_identifier AS table_name,
    (current_database())::sql_identifier AS specific_catalog,
    (np.nspname)::sql_identifier AS specific_schema,
    ((((p.proname)::text || '_'::text) || (p.oid)::text))::sql_identifier AS specific_name
   FROM pg_namespace nv,
    pg_class v,
    pg_depend dv,
    pg_depend dp,
    pg_proc p,
    pg_namespace np
  WHERE ((((((((((((nv.oid = v.relnamespace) AND (v.relkind = 'v'::"char")) AND (v.oid = dv.refobjid)) AND (dv.refclassid = ('pg_class'::regclass)::oid)) AND (dv.classid = ('pg_rewrite'::regclass)::oid)) AND (dv.deptype = 'i'::"char")) AND (dv.objid = dp.objid)) AND (dp.classid = ('pg_rewrite'::regclass)::oid)) AND (dp.refclassid = ('pg_proc'::regclass)::oid)) AND (dp.refobjid = p.oid)) AND (p.pronamespace = np.oid)) AND pg_has_role(p.proowner, 'USAGE'::text));


ALTER TABLE view_routine_usage OWNER TO postgres;

--
-- Name: view_routine_usage; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE view_routine_usage FROM PUBLIC;
REVOKE ALL ON TABLE view_routine_usage FROM postgres;
GRANT ALL ON TABLE view_routine_usage TO postgres;
GRANT SELECT ON TABLE view_routine_usage TO PUBLIC;

