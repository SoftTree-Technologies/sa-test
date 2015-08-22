SET SCHEMA "information_schema";

CREATE VIEW applicable_roles AS
 SELECT (a.rolname)::sql_identifier AS grantee,
    (b.rolname)::sql_identifier AS role_name,
    (
        CASE
            WHEN m.admin_option THEN 'YES'::text
            ELSE 'NO'::text
        END)::yes_or_no AS is_grantable
   FROM ((pg_auth_members m
     JOIN pg_authid a ON ((m.member = a.oid)))
     JOIN pg_authid b ON ((m.roleid = b.oid)))
  WHERE pg_has_role(a.oid, 'USAGE'::text);


ALTER TABLE applicable_roles OWNER TO postgres;

--
-- Name: applicable_roles; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE applicable_roles FROM PUBLIC;
REVOKE ALL ON TABLE applicable_roles FROM postgres;
GRANT ALL ON TABLE applicable_roles TO postgres;
GRANT SELECT ON TABLE applicable_roles TO PUBLIC;

