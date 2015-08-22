SET SCHEMA "information_schema";

CREATE VIEW domain_constraints AS
 SELECT (current_database())::sql_identifier AS constraint_catalog,
    (rs.nspname)::sql_identifier AS constraint_schema,
    (con.conname)::sql_identifier AS constraint_name,
    (current_database())::sql_identifier AS domain_catalog,
    (n.nspname)::sql_identifier AS domain_schema,
    (t.typname)::sql_identifier AS domain_name,
    (
        CASE
            WHEN con.condeferrable THEN 'YES'::text
            ELSE 'NO'::text
        END)::yes_or_no AS is_deferrable,
    (
        CASE
            WHEN con.condeferred THEN 'YES'::text
            ELSE 'NO'::text
        END)::yes_or_no AS initially_deferred
   FROM pg_namespace rs,
    pg_namespace n,
    pg_constraint con,
    pg_type t
  WHERE ((((rs.oid = con.connamespace) AND (n.oid = t.typnamespace)) AND (t.oid = con.contypid)) AND (pg_has_role(t.typowner, 'USAGE'::text) OR has_type_privilege(t.oid, 'USAGE'::text)));


ALTER TABLE domain_constraints OWNER TO postgres;

--
-- Name: domain_constraints; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE domain_constraints FROM PUBLIC;
REVOKE ALL ON TABLE domain_constraints FROM postgres;
GRANT ALL ON TABLE domain_constraints TO postgres;
GRANT SELECT ON TABLE domain_constraints TO PUBLIC;

