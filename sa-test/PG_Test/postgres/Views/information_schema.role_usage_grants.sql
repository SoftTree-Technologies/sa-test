SET SCHEMA "information_schema";

CREATE VIEW role_usage_grants AS
 SELECT usage_privileges.grantor,
    usage_privileges.grantee,
    usage_privileges.object_catalog,
    usage_privileges.object_schema,
    usage_privileges.object_name,
    usage_privileges.object_type,
    usage_privileges.privilege_type,
    usage_privileges.is_grantable
   FROM usage_privileges
  WHERE (((usage_privileges.grantor)::text IN ( SELECT enabled_roles.role_name
           FROM enabled_roles)) OR ((usage_privileges.grantee)::text IN ( SELECT enabled_roles.role_name
           FROM enabled_roles)));


ALTER TABLE role_usage_grants OWNER TO postgres;

--
-- Name: role_usage_grants; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE role_usage_grants FROM PUBLIC;
REVOKE ALL ON TABLE role_usage_grants FROM postgres;
GRANT ALL ON TABLE role_usage_grants TO postgres;
GRANT SELECT ON TABLE role_usage_grants TO PUBLIC;

