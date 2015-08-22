SET SCHEMA "pg_catalog";

CREATE VIEW pg_statio_user_sequences AS
 SELECT pg_statio_all_sequences.relid,
    pg_statio_all_sequences.schemaname,
    pg_statio_all_sequences.relname,
    pg_statio_all_sequences.blks_read,
    pg_statio_all_sequences.blks_hit
   FROM pg_statio_all_sequences
  WHERE ((pg_statio_all_sequences.schemaname <> ALL (ARRAY['pg_catalog'::name, 'information_schema'::name])) AND (pg_statio_all_sequences.schemaname !~ '^pg_toast'::text));


ALTER TABLE pg_statio_user_sequences OWNER TO postgres;

--
-- Name: pg_statio_user_sequences; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_statio_user_sequences FROM PUBLIC;
REVOKE ALL ON TABLE pg_statio_user_sequences FROM postgres;
GRANT SELECT ON TABLE pg_statio_user_sequences TO PUBLIC;

