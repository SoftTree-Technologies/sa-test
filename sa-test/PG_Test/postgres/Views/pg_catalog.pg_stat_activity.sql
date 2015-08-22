SET SCHEMA "pg_catalog";

CREATE VIEW pg_stat_activity AS
 SELECT s.datid,
    d.datname,
    s.pid,
    s.usesysid,
    u.rolname AS usename,
    s.application_name,
    s.client_addr,
    s.client_hostname,
    s.client_port,
    s.backend_start,
    s.xact_start,
    s.query_start,
    s.state_change,
    s.waiting,
    s.state,
    s.backend_xid,
    s.backend_xmin,
    s.query
   FROM pg_database d,
    pg_stat_get_activity(NULL::integer) s(datid, pid, usesysid, application_name, state, query, waiting, xact_start, query_start, backend_start, state_change, client_addr, client_hostname, client_port, backend_xid, backend_xmin),
    pg_authid u
  WHERE ((s.datid = d.oid) AND (s.usesysid = u.oid));


ALTER TABLE pg_stat_activity OWNER TO postgres;

--
-- Name: pg_stat_activity; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_stat_activity FROM PUBLIC;
REVOKE ALL ON TABLE pg_stat_activity FROM postgres;
GRANT SELECT ON TABLE pg_stat_activity TO PUBLIC;

