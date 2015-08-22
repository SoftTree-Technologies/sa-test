SET SCHEMA "information_schema";

CREATE VIEW role_table_grants AS
 SELECT table_privileges.grantor,
    table_privileges.grantee,
    table_privileges.table_catalog,
    table_privileges.table_schema,
    table_privileges.table_name,
    table_privileges.privilege_type,
    table_privileges.is_grantable,
    table_privileges.with_hierarchy
   FROM table_privileges
  WHERE (((table_privileges.grantor)::text IN ( SELECT enabled_roles.role_name
           FROM enabled_roles)) OR ((table_privileges.grantee)::text IN ( SELECT enabled_roles.role_name
           FROM enabled_roles)));


ALTER TABLE role_table_grants OWNER TO postgres;

--
-- Name: role_table_grants; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE role_table_grants FROM PUBLIC;
REVOKE ALL ON TABLE role_table_grants FROM postgres;
GRANT ALL ON TABLE role_table_grants TO postgres;
GRANT SELECT ON TABLE role_table_grants TO PUBLIC;

