SET SCHEMA "pg_catalog";

CREATE VIEW pg_statio_all_sequences AS
 SELECT c.oid AS relid,
    n.nspname AS schemaname,
    c.relname,
    (pg_stat_get_blocks_fetched(c.oid) - pg_stat_get_blocks_hit(c.oid)) AS blks_read,
    pg_stat_get_blocks_hit(c.oid) AS blks_hit
   FROM (pg_class c
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
  WHERE (c.relkind = 'S'::"char");


ALTER TABLE pg_statio_all_sequences OWNER TO postgres;

--
-- Name: pg_statio_all_sequences; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_statio_all_sequences FROM PUBLIC;
REVOKE ALL ON TABLE pg_statio_all_sequences FROM postgres;
GRANT SELECT ON TABLE pg_statio_all_sequences TO PUBLIC;

