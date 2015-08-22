SET SCHEMA "pg_catalog";

CREATE VIEW pg_timezone_abbrevs AS
 SELECT pg_timezone_abbrevs.abbrev,
    pg_timezone_abbrevs.utc_offset,
    pg_timezone_abbrevs.is_dst
   FROM pg_timezone_abbrevs() pg_timezone_abbrevs(abbrev, utc_offset, is_dst);


ALTER TABLE pg_timezone_abbrevs OWNER TO postgres;

--
-- Name: pg_timezone_abbrevs; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_timezone_abbrevs FROM PUBLIC;
REVOKE ALL ON TABLE pg_timezone_abbrevs FROM postgres;
GRANT SELECT ON TABLE pg_timezone_abbrevs TO PUBLIC;

