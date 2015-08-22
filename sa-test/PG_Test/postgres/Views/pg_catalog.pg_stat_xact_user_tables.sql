SET SCHEMA "pg_catalog";

CREATE VIEW pg_stat_xact_user_tables AS
 SELECT pg_stat_xact_all_tables.relid,
    pg_stat_xact_all_tables.schemaname,
    pg_stat_xact_all_tables.relname,
    pg_stat_xact_all_tables.seq_scan,
    pg_stat_xact_all_tables.seq_tup_read,
    pg_stat_xact_all_tables.idx_scan,
    pg_stat_xact_all_tables.idx_tup_fetch,
    pg_stat_xact_all_tables.n_tup_ins,
    pg_stat_xact_all_tables.n_tup_upd,
    pg_stat_xact_all_tables.n_tup_del,
    pg_stat_xact_all_tables.n_tup_hot_upd
   FROM pg_stat_xact_all_tables
  WHERE ((pg_stat_xact_all_tables.schemaname <> ALL (ARRAY['pg_catalog'::name, 'information_schema'::name])) AND (pg_stat_xact_all_tables.schemaname !~ '^pg_toast'::text));


ALTER TABLE pg_stat_xact_user_tables OWNER TO postgres;

--
-- Name: pg_stat_xact_user_tables; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_stat_xact_user_tables FROM PUBLIC;
REVOKE ALL ON TABLE pg_stat_xact_user_tables FROM postgres;
GRANT SELECT ON TABLE pg_stat_xact_user_tables TO PUBLIC;

