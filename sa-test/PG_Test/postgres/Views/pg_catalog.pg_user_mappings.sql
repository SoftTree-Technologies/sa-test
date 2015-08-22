SET SCHEMA "pg_catalog";

CREATE VIEW pg_user_mappings AS
 SELECT u.oid AS umid,
    s.oid AS srvid,
    s.srvname,
    u.umuser,
        CASE
            WHEN (u.umuser = (0)::oid) THEN 'public'::name
            ELSE a.rolname
        END AS usename,
        CASE
            WHEN (pg_has_role(s.srvowner, 'USAGE'::text) OR has_server_privilege(s.oid, 'USAGE'::text)) THEN u.umoptions
            ELSE NULL::text[]
        END AS umoptions
   FROM ((pg_user_mapping u
     LEFT JOIN pg_authid a ON ((a.oid = u.umuser)))
     JOIN pg_foreign_server s ON ((u.umserver = s.oid)));


ALTER TABLE pg_user_mappings OWNER TO postgres;

--
-- Name: pg_user_mappings; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_user_mappings FROM PUBLIC;
REVOKE ALL ON TABLE pg_user_mappings FROM postgres;
GRANT SELECT ON TABLE pg_user_mappings TO PUBLIC;

