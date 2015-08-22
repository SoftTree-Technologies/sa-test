SET SCHEMA "pg_catalog";

CREATE VIEW pg_indexes AS
 SELECT n.nspname AS schemaname,
    c.relname AS tablename,
    i.relname AS indexname,
    t.spcname AS tablespace,
    pg_get_indexdef(i.oid) AS indexdef
   FROM ((((pg_index x
     JOIN pg_class c ON ((c.oid = x.indrelid)))
     JOIN pg_class i ON ((i.oid = x.indexrelid)))
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
     LEFT JOIN pg_tablespace t ON ((t.oid = i.reltablespace)))
  WHERE ((c.relkind = ANY (ARRAY['r'::"char", 'm'::"char"])) AND (i.relkind = 'i'::"char"));


ALTER TABLE pg_indexes OWNER TO postgres;

--
-- Name: pg_indexes; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_indexes FROM PUBLIC;
REVOKE ALL ON TABLE pg_indexes FROM postgres;
GRANT SELECT ON TABLE pg_indexes TO PUBLIC;

