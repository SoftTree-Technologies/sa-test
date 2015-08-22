SET SCHEMA "pg_catalog";

CREATE VIEW pg_matviews AS
 SELECT n.nspname AS schemaname,
    c.relname AS matviewname,
    pg_get_userbyid(c.relowner) AS matviewowner,
    t.spcname AS tablespace,
    c.relhasindex AS hasindexes,
    c.relispopulated AS ispopulated,
    pg_get_viewdef(c.oid) AS definition
   FROM ((pg_class c
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
     LEFT JOIN pg_tablespace t ON ((t.oid = c.reltablespace)))
  WHERE (c.relkind = 'm'::"char");


ALTER TABLE pg_matviews OWNER TO postgres;

--
-- Name: pg_matviews; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_matviews FROM PUBLIC;
REVOKE ALL ON TABLE pg_matviews FROM postgres;
GRANT SELECT ON TABLE pg_matviews TO PUBLIC;

