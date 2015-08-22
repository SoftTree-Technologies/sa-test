SET SCHEMA "pg_catalog";

CREATE VIEW pg_timezone_names AS
 SELECT pg_timezone_names.name,
    pg_timezone_names.abbrev,
    pg_timezone_names.utc_offset,
    pg_timezone_names.is_dst
   FROM pg_timezone_names() pg_timezone_names(name, abbrev, utc_offset, is_dst);


ALTER TABLE pg_timezone_names OWNER TO postgres;

--
-- Name: pg_timezone_names; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_timezone_names FROM PUBLIC;
REVOKE ALL ON TABLE pg_timezone_names FROM postgres;
GRANT SELECT ON TABLE pg_timezone_names TO PUBLIC;

