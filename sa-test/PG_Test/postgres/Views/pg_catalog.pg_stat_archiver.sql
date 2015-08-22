SET SCHEMA "pg_catalog";

CREATE VIEW pg_stat_archiver AS
 SELECT s.archived_count,
    s.last_archived_wal,
    s.last_archived_time,
    s.failed_count,
    s.last_failed_wal,
    s.last_failed_time,
    s.stats_reset
   FROM pg_stat_get_archiver() s(archived_count, last_archived_wal, last_archived_time, failed_count, last_failed_wal, last_failed_time, stats_reset);


ALTER TABLE pg_stat_archiver OWNER TO postgres;

--
-- Name: pg_stat_archiver; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_stat_archiver FROM PUBLIC;
REVOKE ALL ON TABLE pg_stat_archiver FROM postgres;
GRANT SELECT ON TABLE pg_stat_archiver TO PUBLIC;

