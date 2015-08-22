SET SCHEMA "information_schema";

CREATE VIEW administrable_role_authorizations AS
 SELECT applicable_roles.grantee,
    applicable_roles.role_name,
    applicable_roles.is_grantable
   FROM applicable_roles
  WHERE ((applicable_roles.is_grantable)::text = 'YES'::text);


ALTER TABLE administrable_role_authorizations OWNER TO postgres;

--
-- Name: administrable_role_authorizations; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE administrable_role_authorizations FROM PUBLIC;
REVOKE ALL ON TABLE administrable_role_authorizations FROM postgres;
GRANT ALL ON TABLE administrable_role_authorizations TO postgres;
GRANT SELECT ON TABLE administrable_role_authorizations TO PUBLIC;

