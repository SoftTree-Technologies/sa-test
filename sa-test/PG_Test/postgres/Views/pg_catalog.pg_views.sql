SET SCHEMA "pg_catalog";

CREATE VIEW pg_views AS
 SELECT n.nspname AS schemaname,
    c.relname AS viewname,
    pg_get_userbyid(c.relowner) AS viewowner,
    pg_get_viewdef(c.oid) AS definition
   FROM (pg_class c
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
  WHERE (c.relkind = 'v'::"char");


ALTER TABLE pg_views OWNER TO postgres;

--
-- Name: pg_views; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_views FROM PUBLIC;
REVOKE ALL ON TABLE pg_views FROM postgres;
GRANT SELECT ON TABLE pg_views TO PUBLIC;

