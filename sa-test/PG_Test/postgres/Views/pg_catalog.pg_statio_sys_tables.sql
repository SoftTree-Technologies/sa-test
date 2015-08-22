SET SCHEMA "pg_catalog";

CREATE VIEW pg_statio_sys_tables AS
 SELECT pg_statio_all_tables.relid,
    pg_statio_all_tables.schemaname,
    pg_statio_all_tables.relname,
    pg_statio_all_tables.heap_blks_read,
    pg_statio_all_tables.heap_blks_hit,
    pg_statio_all_tables.idx_blks_read,
    pg_statio_all_tables.idx_blks_hit,
    pg_statio_all_tables.toast_blks_read,
    pg_statio_all_tables.toast_blks_hit,
    pg_statio_all_tables.tidx_blks_read,
    pg_statio_all_tables.tidx_blks_hit
   FROM pg_statio_all_tables
  WHERE ((pg_statio_all_tables.schemaname = ANY (ARRAY['pg_catalog'::name, 'information_schema'::name])) OR (pg_statio_all_tables.schemaname ~ '^pg_toast'::text));


ALTER TABLE pg_statio_sys_tables OWNER TO postgres;

--
-- Name: pg_statio_sys_tables; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_statio_sys_tables FROM PUBLIC;
REVOKE ALL ON TABLE pg_statio_sys_tables FROM postgres;
GRANT SELECT ON TABLE pg_statio_sys_tables TO PUBLIC;

