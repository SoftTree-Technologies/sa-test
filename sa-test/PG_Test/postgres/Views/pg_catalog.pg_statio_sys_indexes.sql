SET SCHEMA "pg_catalog";

CREATE VIEW pg_statio_sys_indexes AS
 SELECT pg_statio_all_indexes.relid,
    pg_statio_all_indexes.indexrelid,
    pg_statio_all_indexes.schemaname,
    pg_statio_all_indexes.relname,
    pg_statio_all_indexes.indexrelname,
    pg_statio_all_indexes.idx_blks_read,
    pg_statio_all_indexes.idx_blks_hit
   FROM pg_statio_all_indexes
  WHERE ((pg_statio_all_indexes.schemaname = ANY (ARRAY['pg_catalog'::name, 'information_schema'::name])) OR (pg_statio_all_indexes.schemaname ~ '^pg_toast'::text));


ALTER TABLE pg_statio_sys_indexes OWNER TO postgres;

--
-- Name: pg_statio_sys_indexes; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_statio_sys_indexes FROM PUBLIC;
REVOKE ALL ON TABLE pg_statio_sys_indexes FROM postgres;
GRANT SELECT ON TABLE pg_statio_sys_indexes TO PUBLIC;

