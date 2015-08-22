SET SCHEMA "information_schema";

CREATE VIEW enabled_roles AS
 SELECT (a.rolname)::sql_identifier AS role_name
   FROM pg_authid a
  WHERE pg_has_role(a.oid, 'USAGE'::text);


ALTER TABLE enabled_roles OWNER TO postgres;

--
-- Name: enabled_roles; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE enabled_roles FROM PUBLIC;
REVOKE ALL ON TABLE enabled_roles FROM postgres;
GRANT ALL ON TABLE enabled_roles TO postgres;
GRANT SELECT ON TABLE enabled_roles TO PUBLIC;

