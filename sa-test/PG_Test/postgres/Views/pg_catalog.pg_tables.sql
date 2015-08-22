SET SCHEMA "pg_catalog";

CREATE VIEW pg_tables AS
 SELECT n.nspname AS schemaname,
    c.relname AS tablename,
    pg_get_userbyid(c.relowner) AS tableowner,
    t.spcname AS tablespace,
    c.relhasindex AS hasindexes,
    c.relhasrules AS hasrules,
    c.relhastriggers AS hastriggers
   FROM ((pg_class c
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
     LEFT JOIN pg_tablespace t ON ((t.oid = c.reltablespace)))
  WHERE (c.relkind = 'r'::"char");


ALTER TABLE pg_tables OWNER TO postgres;

--
-- Name: pg_tables; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_tables FROM PUBLIC;
REVOKE ALL ON TABLE pg_tables FROM postgres;
GRANT SELECT ON TABLE pg_tables TO PUBLIC;

