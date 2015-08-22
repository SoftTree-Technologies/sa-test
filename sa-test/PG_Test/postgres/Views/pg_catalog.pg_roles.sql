SET SCHEMA "pg_catalog";

CREATE VIEW pg_roles AS
 SELECT pg_authid.rolname,
    pg_authid.rolsuper,
    pg_authid.rolinherit,
    pg_authid.rolcreaterole,
    pg_authid.rolcreatedb,
    pg_authid.rolcatupdate,
    pg_authid.rolcanlogin,
    pg_authid.rolreplication,
    pg_authid.rolconnlimit,
    '********'::text AS rolpassword,
    pg_authid.rolvaliduntil,
    s.setconfig AS rolconfig,
    pg_authid.oid
   FROM (pg_authid
     LEFT JOIN pg_db_role_setting s ON (((pg_authid.oid = s.setrole) AND (s.setdatabase = (0)::oid))));


ALTER TABLE pg_roles OWNER TO postgres;

--
-- Name: pg_roles; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_roles FROM PUBLIC;
REVOKE ALL ON TABLE pg_roles FROM postgres;
GRANT SELECT ON TABLE pg_roles TO PUBLIC;

