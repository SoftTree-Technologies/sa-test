SET SCHEMA "pg_catalog";

CREATE VIEW pg_rules AS
 SELECT n.nspname AS schemaname,
    c.relname AS tablename,
    r.rulename,
    pg_get_ruledef(r.oid) AS definition
   FROM ((pg_rewrite r
     JOIN pg_class c ON ((c.oid = r.ev_class)))
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
  WHERE (r.rulename <> '_RETURN'::name);


ALTER TABLE pg_rules OWNER TO postgres;

--
-- Name: pg_rules; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_rules FROM PUBLIC;
REVOKE ALL ON TABLE pg_rules FROM postgres;
GRANT SELECT ON TABLE pg_rules TO PUBLIC;

