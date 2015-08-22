SET SCHEMA "pg_catalog";

CREATE VIEW pg_stat_all_indexes AS
 SELECT c.oid AS relid,
    i.oid AS indexrelid,
    n.nspname AS schemaname,
    c.relname,
    i.relname AS indexrelname,
    pg_stat_get_numscans(i.oid) AS idx_scan,
    pg_stat_get_tuples_returned(i.oid) AS idx_tup_read,
    pg_stat_get_tuples_fetched(i.oid) AS idx_tup_fetch
   FROM (((pg_class c
     JOIN pg_index x ON ((c.oid = x.indrelid)))
     JOIN pg_class i ON ((i.oid = x.indexrelid)))
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
  WHERE (c.relkind = ANY (ARRAY['r'::"char", 't'::"char", 'm'::"char"]));


ALTER TABLE pg_stat_all_indexes OWNER TO postgres;

--
-- Name: pg_stat_all_indexes; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_stat_all_indexes FROM PUBLIC;
REVOKE ALL ON TABLE pg_stat_all_indexes FROM postgres;
GRANT SELECT ON TABLE pg_stat_all_indexes TO PUBLIC;

