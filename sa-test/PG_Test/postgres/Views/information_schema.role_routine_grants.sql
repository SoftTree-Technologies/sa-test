SET SCHEMA "information_schema";

CREATE VIEW role_routine_grants AS
 SELECT routine_privileges.grantor,
    routine_privileges.grantee,
    routine_privileges.specific_catalog,
    routine_privileges.specific_schema,
    routine_privileges.specific_name,
    routine_privileges.routine_catalog,
    routine_privileges.routine_schema,
    routine_privileges.routine_name,
    routine_privileges.privilege_type,
    routine_privileges.is_grantable
   FROM routine_privileges
  WHERE (((routine_privileges.grantor)::text IN ( SELECT enabled_roles.role_name
           FROM enabled_roles)) OR ((routine_privileges.grantee)::text IN ( SELECT enabled_roles.role_name
           FROM enabled_roles)));


ALTER TABLE role_routine_grants OWNER TO postgres;

--
-- Name: role_routine_grants; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE role_routine_grants FROM PUBLIC;
REVOKE ALL ON TABLE role_routine_grants FROM postgres;
GRANT ALL ON TABLE role_routine_grants TO postgres;
GRANT SELECT ON TABLE role_routine_grants TO PUBLIC;

