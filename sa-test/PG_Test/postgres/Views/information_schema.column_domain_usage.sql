SET SCHEMA "information_schema";

CREATE VIEW column_domain_usage AS
 SELECT (current_database())::sql_identifier AS domain_catalog,
    (nt.nspname)::sql_identifier AS domain_schema,
    (t.typname)::sql_identifier AS domain_name,
    (current_database())::sql_identifier AS table_catalog,
    (nc.nspname)::sql_identifier AS table_schema,
    (c.relname)::sql_identifier AS table_name,
    (a.attname)::sql_identifier AS column_name
   FROM pg_type t,
    pg_namespace nt,
    pg_class c,
    pg_namespace nc,
    pg_attribute a
  WHERE (((((((((t.typnamespace = nt.oid) AND (c.relnamespace = nc.oid)) AND (a.attrelid = c.oid)) AND (a.atttypid = t.oid)) AND (t.typtype = 'd'::"char")) AND (c.relkind = ANY (ARRAY['r'::"char", 'v'::"char", 'f'::"char"]))) AND (a.attnum > 0)) AND (NOT a.attisdropped)) AND pg_has_role(t.typowner, 'USAGE'::text));


ALTER TABLE column_domain_usage OWNER TO postgres;

--
-- Name: column_domain_usage; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE column_domain_usage FROM PUBLIC;
REVOKE ALL ON TABLE column_domain_usage FROM postgres;
GRANT ALL ON TABLE column_domain_usage TO postgres;
GRANT SELECT ON TABLE column_domain_usage TO PUBLIC;

