SET SCHEMA "pg_catalog";

CREATE VIEW pg_group AS
 SELECT pg_authid.rolname AS groname,
    pg_authid.oid AS grosysid,
    ARRAY( SELECT pg_auth_members.member
           FROM pg_auth_members
          WHERE (pg_auth_members.roleid = pg_authid.oid)) AS grolist
   FROM pg_authid
  WHERE (NOT pg_authid.rolcanlogin);


ALTER TABLE pg_group OWNER TO postgres;

--
-- Name: pg_group; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_group FROM PUBLIC;
REVOKE ALL ON TABLE pg_group FROM postgres;
GRANT SELECT ON TABLE pg_group TO PUBLIC;

