SET SCHEMA "information_schema";

CREATE VIEW usage_privileges AS
 SELECT (u.rolname)::sql_identifier AS grantor,
    ('PUBLIC'::character varying)::sql_identifier AS grantee,
    (current_database())::sql_identifier AS object_catalog,
    (n.nspname)::sql_identifier AS object_schema,
    (c.collname)::sql_identifier AS object_name,
    ('COLLATION'::character varying)::character_data AS object_type,
    ('USAGE'::character varying)::character_data AS privilege_type,
    ('NO'::character varying)::yes_or_no AS is_grantable
   FROM pg_authid u,
    pg_namespace n,
    pg_collation c
  WHERE (((u.oid = c.collowner) AND (c.collnamespace = n.oid)) AND (c.collencoding = ANY (ARRAY[(-1), ( SELECT pg_database.encoding
           FROM pg_database
          WHERE (pg_database.datname = current_database()))])))
UNION ALL
 SELECT (u_grantor.rolname)::sql_identifier AS grantor,
    (grantee.rolname)::sql_identifier AS grantee,
    (current_database())::sql_identifier AS object_catalog,
    (n.nspname)::sql_identifier AS object_schema,
    (t.typname)::sql_identifier AS object_name,
    ('DOMAIN'::character varying)::character_data AS object_type,
    ('USAGE'::character varying)::character_data AS privilege_type,
    (
        CASE
            WHEN (pg_has_role(grantee.oid, t.typowner, 'USAGE'::text) OR t.grantable) THEN 'YES'::text
            ELSE 'NO'::text
        END)::yes_or_no AS is_grantable
   FROM ( SELECT pg_type.oid,
            pg_type.typname,
            pg_type.typnamespace,
            pg_type.typtype,
            pg_type.typowner,
            (aclexplode(COALESCE(pg_type.typacl, acldefault('T'::"char", pg_type.typowner)))).grantor AS grantor,
            (aclexplode(COALESCE(pg_type.typacl, acldefault('T'::"char", pg_type.typowner)))).grantee AS grantee,
            (aclexplode(COALESCE(pg_type.typacl, acldefault('T'::"char", pg_type.typowner)))).privilege_type AS privilege_type,
            (aclexplode(COALESCE(pg_type.typacl, acldefault('T'::"char", pg_type.typowner)))).is_grantable AS is_grantable
           FROM pg_type) t(oid, typname, typnamespace, typtype, typowner, grantor, grantee, prtype, grantable),
    pg_namespace n,
    pg_authid u_grantor,
    ( SELECT pg_authid.oid,
            pg_authid.rolname
           FROM pg_authid
        UNION ALL
         SELECT (0)::oid AS oid,
            'PUBLIC'::name) grantee(oid, rolname)
  WHERE ((((((t.typnamespace = n.oid) AND (t.typtype = 'd'::"char")) AND (t.grantee = grantee.oid)) AND (t.grantor = u_grantor.oid)) AND (t.prtype = 'USAGE'::text)) AND ((pg_has_role(u_grantor.oid, 'USAGE'::text) OR pg_has_role(grantee.oid, 'USAGE'::text)) OR (grantee.rolname = 'PUBLIC'::name)))
UNION ALL
 SELECT (u_grantor.rolname)::sql_identifier AS grantor,
    (grantee.rolname)::sql_identifier AS grantee,
    (current_database())::sql_identifier AS object_catalog,
    (''::character varying)::sql_identifier AS object_schema,
    (fdw.fdwname)::sql_identifier AS object_name,
    ('FOREIGN DATA WRAPPER'::character varying)::character_data AS object_type,
    ('USAGE'::character varying)::character_data AS privilege_type,
    (
        CASE
            WHEN (pg_has_role(grantee.oid, fdw.fdwowner, 'USAGE'::text) OR fdw.grantable) THEN 'YES'::text
            ELSE 'NO'::text
        END)::yes_or_no AS is_grantable
   FROM ( SELECT pg_foreign_data_wrapper.fdwname,
            pg_foreign_data_wrapper.fdwowner,
            (aclexplode(COALESCE(pg_foreign_data_wrapper.fdwacl, acldefault('F'::"char", pg_foreign_data_wrapper.fdwowner)))).grantor AS grantor,
            (aclexplode(COALESCE(pg_foreign_data_wrapper.fdwacl, acldefault('F'::"char", pg_foreign_data_wrapper.fdwowner)))).grantee AS grantee,
            (aclexplode(COALESCE(pg_foreign_data_wrapper.fdwacl, acldefault('F'::"char", pg_foreign_data_wrapper.fdwowner)))).privilege_type AS privilege_type,
            (aclexplode(COALESCE(pg_foreign_data_wrapper.fdwacl, acldefault('F'::"char", pg_foreign_data_wrapper.fdwowner)))).is_grantable AS is_grantable
           FROM pg_foreign_data_wrapper) fdw(fdwname, fdwowner, grantor, grantee, prtype, grantable),
    pg_authid u_grantor,
    ( SELECT pg_authid.oid,
            pg_authid.rolname
           FROM pg_authid
        UNION ALL
         SELECT (0)::oid AS oid,
            'PUBLIC'::name) grantee(oid, rolname)
  WHERE ((((u_grantor.oid = fdw.grantor) AND (grantee.oid = fdw.grantee)) AND (fdw.prtype = 'USAGE'::text)) AND ((pg_has_role(u_grantor.oid, 'USAGE'::text) OR pg_has_role(grantee.oid, 'USAGE'::text)) OR (grantee.rolname = 'PUBLIC'::name)))
UNION ALL
 SELECT (u_grantor.rolname)::sql_identifier AS grantor,
    (grantee.rolname)::sql_identifier AS grantee,
    (current_database())::sql_identifier AS object_catalog,
    (''::character varying)::sql_identifier AS object_schema,
    (srv.srvname)::sql_identifier AS object_name,
    ('FOREIGN SERVER'::character varying)::character_data AS object_type,
    ('USAGE'::character varying)::character_data AS privilege_type,
    (
        CASE
            WHEN (pg_has_role(grantee.oid, srv.srvowner, 'USAGE'::text) OR srv.grantable) THEN 'YES'::text
            ELSE 'NO'::text
        END)::yes_or_no AS is_grantable
   FROM ( SELECT pg_foreign_server.srvname,
            pg_foreign_server.srvowner,
            (aclexplode(COALESCE(pg_foreign_server.srvacl, acldefault('S'::"char", pg_foreign_server.srvowner)))).grantor AS grantor,
            (aclexplode(COALESCE(pg_foreign_server.srvacl, acldefault('S'::"char", pg_foreign_server.srvowner)))).grantee AS grantee,
            (aclexplode(COALESCE(pg_foreign_server.srvacl, acldefault('S'::"char", pg_foreign_server.srvowner)))).privilege_type AS privilege_type,
            (aclexplode(COALESCE(pg_foreign_server.srvacl, acldefault('S'::"char", pg_foreign_server.srvowner)))).is_grantable AS is_grantable
           FROM pg_foreign_server) srv(srvname, srvowner, grantor, grantee, prtype, grantable),
    pg_authid u_grantor,
    ( SELECT pg_authid.oid,
            pg_authid.rolname
           FROM pg_authid
        UNION ALL
         SELECT (0)::oid AS oid,
            'PUBLIC'::name) grantee(oid, rolname)
  WHERE ((((u_grantor.oid = srv.grantor) AND (grantee.oid = srv.grantee)) AND (srv.prtype = 'USAGE'::text)) AND ((pg_has_role(u_grantor.oid, 'USAGE'::text) OR pg_has_role(grantee.oid, 'USAGE'::text)) OR (grantee.rolname = 'PUBLIC'::name)))
UNION ALL
 SELECT (u_grantor.rolname)::sql_identifier AS grantor,
    (grantee.rolname)::sql_identifier AS grantee,
    (current_database())::sql_identifier AS object_catalog,
    (n.nspname)::sql_identifier AS object_schema,
    (c.relname)::sql_identifier AS object_name,
    ('SEQUENCE'::character varying)::character_data AS object_type,
    ('USAGE'::character varying)::character_data AS privilege_type,
    (
        CASE
            WHEN (pg_has_role(grantee.oid, c.relowner, 'USAGE'::text) OR c.grantable) THEN 'YES'::text
            ELSE 'NO'::text
        END)::yes_or_no AS is_grantable
   FROM ( SELECT pg_class.oid,
            pg_class.relname,
            pg_class.relnamespace,
            pg_class.relkind,
            pg_class.relowner,
            (aclexplode(COALESCE(pg_class.relacl, acldefault('r'::"char", pg_class.relowner)))).grantor AS grantor,
            (aclexplode(COALESCE(pg_class.relacl, acldefault('r'::"char", pg_class.relowner)))).grantee AS grantee,
            (aclexplode(COALESCE(pg_class.relacl, acldefault('r'::"char", pg_class.relowner)))).privilege_type AS privilege_type,
            (aclexplode(COALESCE(pg_class.relacl, acldefault('r'::"char", pg_class.relowner)))).is_grantable AS is_grantable
           FROM pg_class) c(oid, relname, relnamespace, relkind, relowner, grantor, grantee, prtype, grantable),
    pg_namespace n,
    pg_authid u_grantor,
    ( SELECT pg_authid.oid,
            pg_authid.rolname
           FROM pg_authid
        UNION ALL
         SELECT (0)::oid AS oid,
            'PUBLIC'::name) grantee(oid, rolname)
  WHERE ((((((c.relnamespace = n.oid) AND (c.relkind = 'S'::"char")) AND (c.grantee = grantee.oid)) AND (c.grantor = u_grantor.oid)) AND (c.prtype = 'USAGE'::text)) AND ((pg_has_role(u_grantor.oid, 'USAGE'::text) OR pg_has_role(grantee.oid, 'USAGE'::text)) OR (grantee.rolname = 'PUBLIC'::name)));


ALTER TABLE usage_privileges OWNER TO postgres;

--
-- Name: usage_privileges; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE usage_privileges FROM PUBLIC;
REVOKE ALL ON TABLE usage_privileges FROM postgres;
GRANT ALL ON TABLE usage_privileges TO postgres;
GRANT SELECT ON TABLE usage_privileges TO PUBLIC;

