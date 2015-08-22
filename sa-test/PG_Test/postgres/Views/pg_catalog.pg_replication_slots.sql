SET SCHEMA "pg_catalog";

CREATE VIEW pg_replication_slots AS
 SELECT l.slot_name,
    l.plugin,
    l.slot_type,
    l.datoid,
    d.datname AS database,
    l.active,
    l.xmin,
    l.catalog_xmin,
    l.restart_lsn
   FROM (pg_get_replication_slots() l(slot_name, plugin, slot_type, datoid, active, xmin, catalog_xmin, restart_lsn)
     LEFT JOIN pg_database d ON ((l.datoid = d.oid)));


ALTER TABLE pg_replication_slots OWNER TO postgres;

--
-- Name: pg_replication_slots; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_replication_slots FROM PUBLIC;
REVOKE ALL ON TABLE pg_replication_slots FROM postgres;
GRANT SELECT ON TABLE pg_replication_slots TO PUBLIC;

