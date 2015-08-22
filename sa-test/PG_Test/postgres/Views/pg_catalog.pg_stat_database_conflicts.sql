SET SCHEMA "pg_catalog";

CREATE VIEW pg_stat_database_conflicts AS
 SELECT d.oid AS datid,
    d.datname,
    pg_stat_get_db_conflict_tablespace(d.oid) AS confl_tablespace,
    pg_stat_get_db_conflict_lock(d.oid) AS confl_lock,
    pg_stat_get_db_conflict_snapshot(d.oid) AS confl_snapshot,
    pg_stat_get_db_conflict_bufferpin(d.oid) AS confl_bufferpin,
    pg_stat_get_db_conflict_startup_deadlock(d.oid) AS confl_deadlock
   FROM pg_database d;


ALTER TABLE pg_stat_database_conflicts OWNER TO postgres;

--
-- Name: pg_stat_database_conflicts; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_stat_database_conflicts FROM PUBLIC;
REVOKE ALL ON TABLE pg_stat_database_conflicts FROM postgres;
GRANT SELECT ON TABLE pg_stat_database_conflicts TO PUBLIC;

