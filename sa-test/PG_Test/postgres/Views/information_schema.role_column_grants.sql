SET SCHEMA "information_schema";

CREATE VIEW role_column_grants AS
 SELECT column_privileges.grantor,
    column_privileges.grantee,
    column_privileges.table_catalog,
    column_privileges.table_schema,
    column_privileges.table_name,
    column_privileges.column_name,
    column_privileges.privilege_type,
    column_privileges.is_grantable
   FROM column_privileges
  WHERE (((column_privileges.grantor)::text IN ( SELECT enabled_roles.role_name
           FROM enabled_roles)) OR ((column_privileges.grantee)::text IN ( SELECT enabled_roles.role_name
           FROM enabled_roles)));


ALTER TABLE role_column_grants OWNER TO postgres;

--
-- Name: role_column_grants; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE role_column_grants FROM PUBLIC;
REVOKE ALL ON TABLE role_column_grants FROM postgres;
GRANT ALL ON TABLE role_column_grants TO postgres;
GRANT SELECT ON TABLE role_column_grants TO PUBLIC;

