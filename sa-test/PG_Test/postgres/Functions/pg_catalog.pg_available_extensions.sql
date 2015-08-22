SET SCHEMA "pg_catalog";

CREATE VIEW pg_available_extensions AS
 SELECT e.name,
    e.default_version,
    x.extversion AS installed_version,
    e.comment
   FROM (pg_available_extensions() e(name, default_version, comment)
     LEFT JOIN pg_extension x ON ((e.name = x.extname)));


ALTER TABLE pg_available_extensions OWNER TO postgres;

--
-- Name: pg_available_extensions; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_available_extensions FROM PUBLIC;
REVOKE ALL ON TABLE pg_available_extensions FROM postgres;
GRANT SELECT ON TABLE pg_available_extensions TO PUBLIC;

