SET SCHEMA "information_schema";

CREATE VIEW role_udt_grants AS
 SELECT udt_privileges.grantor,
    udt_privileges.grantee,
    udt_privileges.udt_catalog,
    udt_privileges.udt_schema,
    udt_privileges.udt_name,
    udt_privileges.privilege_type,
    udt_privileges.is_grantable
   FROM udt_privileges
  WHERE (((udt_privileges.grantor)::text IN ( SELECT enabled_roles.role_name
           FROM enabled_roles)) OR ((udt_privileges.grantee)::text IN ( SELECT enabled_roles.role_name
           FROM enabled_roles)));


ALTER TABLE role_udt_grants OWNER TO postgres;

--
-- Name: role_udt_grants; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE role_udt_grants FROM PUBLIC;
REVOKE ALL ON TABLE role_udt_grants FROM postgres;
GRANT ALL ON TABLE role_udt_grants TO postgres;
GRANT SELECT ON TABLE role_udt_grants TO PUBLIC;

