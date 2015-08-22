SET SCHEMA "information_schema";

CREATE VIEW check_constraint_routine_usage AS
 SELECT (current_database())::sql_identifier AS constraint_catalog,
    (nc.nspname)::sql_identifier AS constraint_schema,
    (c.conname)::sql_identifier AS constraint_name,
    (current_database())::sql_identifier AS specific_catalog,
    (np.nspname)::sql_identifier AS specific_schema,
    ((((p.proname)::text || '_'::text) || (p.oid)::text))::sql_identifier AS specific_name
   FROM pg_namespace nc,
    pg_constraint c,
    pg_depend d,
    pg_proc p,
    pg_namespace np
  WHERE ((((((((nc.oid = c.connamespace) AND (c.contype = 'c'::"char")) AND (c.oid = d.objid)) AND (d.classid = ('pg_constraint'::regclass)::oid)) AND (d.refobjid = p.oid)) AND (d.refclassid = ('pg_proc'::regclass)::oid)) AND (p.pronamespace = np.oid)) AND pg_has_role(p.proowner, 'USAGE'::text));


ALTER TABLE check_constraint_routine_usage OWNER TO postgres;

--
-- Name: check_constraint_routine_usage; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE check_constraint_routine_usage FROM PUBLIC;
REVOKE ALL ON TABLE check_constraint_routine_usage FROM postgres;
GRANT ALL ON TABLE check_constraint_routine_usage TO postgres;
GRANT SELECT ON TABLE check_constraint_routine_usage TO PUBLIC;

