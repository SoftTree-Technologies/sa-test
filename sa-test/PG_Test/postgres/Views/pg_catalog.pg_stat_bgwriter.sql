SET SCHEMA "pg_catalog";

CREATE VIEW pg_stat_bgwriter AS
 SELECT pg_stat_get_bgwriter_timed_checkpoints() AS checkpoints_timed,
    pg_stat_get_bgwriter_requested_checkpoints() AS checkpoints_req,
    pg_stat_get_checkpoint_write_time() AS checkpoint_write_time,
    pg_stat_get_checkpoint_sync_time() AS checkpoint_sync_time,
    pg_stat_get_bgwriter_buf_written_checkpoints() AS buffers_checkpoint,
    pg_stat_get_bgwriter_buf_written_clean() AS buffers_clean,
    pg_stat_get_bgwriter_maxwritten_clean() AS maxwritten_clean,
    pg_stat_get_buf_written_backend() AS buffers_backend,
    pg_stat_get_buf_fsync_backend() AS buffers_backend_fsync,
    pg_stat_get_buf_alloc() AS buffers_alloc,
    pg_stat_get_bgwriter_stat_reset_time() AS stats_reset;


ALTER TABLE pg_stat_bgwriter OWNER TO postgres;

--
-- Name: pg_stat_bgwriter; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_stat_bgwriter FROM PUBLIC;
REVOKE ALL ON TABLE pg_stat_bgwriter FROM postgres;
GRANT SELECT ON TABLE pg_stat_bgwriter TO PUBLIC;

