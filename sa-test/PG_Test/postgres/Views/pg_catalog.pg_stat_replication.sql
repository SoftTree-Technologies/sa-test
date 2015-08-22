SET SCHEMA "pg_catalog";

CREATE VIEW pg_stat_replication AS
 SELECT s.pid,
    s.usesysid,
    u.rolname AS usename,
    s.application_name,
    s.client_addr,
    s.client_hostname,
    s.client_port,
    s.backend_start,
    s.backend_xmin,
    w.state,
    w.sent_location,
    w.write_location,
    w.flush_location,
    w.replay_location,
    w.sync_priority,
    w.sync_state
   FROM pg_stat_get_activity(NULL::integer) s(datid, pid, usesysid, application_name, state, query, waiting, xact_start, query_start, backend_start, state_change, client_addr, client_hostname, client_port, backend_xid, backend_xmin),
    pg_authid u,
    pg_stat_get_wal_senders() w(pid, state, sent_location, write_location, flush_location, replay_location, sync_priority, sync_state)
  WHERE ((s.usesysid = u.oid) AND (s.pid = w.pid));


ALTER TABLE pg_stat_replication OWNER TO postgres;

--
-- Name: pg_stat_replication; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_stat_replication FROM PUBLIC;
REVOKE ALL ON TABLE pg_stat_replication FROM postgres;
GRANT SELECT ON TABLE pg_stat_replication TO PUBLIC;

