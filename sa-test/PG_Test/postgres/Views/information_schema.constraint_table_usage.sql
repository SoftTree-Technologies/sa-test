SET SCHEMA "information_schema";

CREATE VIEW constraint_table_usage AS
 SELECT (current_database())::sql_identifier AS table_catalog,
    (nr.nspname)::sql_identifier AS table_schema,
    (r.relname)::sql_identifier AS table_name,
    (current_database())::sql_identifier AS constraint_catalog,
    (nc.nspname)::sql_identifier AS constraint_schema,
    (c.conname)::sql_identifier AS constraint_name
   FROM pg_constraint c,
    pg_namespace nc,
    pg_class r,
    pg_namespace nr
  WHERE (((((c.connamespace = nc.oid) AND (r.relnamespace = nr.oid)) AND (((c.contype = 'f'::"char") AND (c.confrelid = r.oid)) OR ((c.contype = ANY (ARRAY['p'::"char", 'u'::"char"])) AND (c.conrelid = r.oid)))) AND (r.relkind = 'r'::"char")) AND pg_has_role(r.relowner, 'USAGE'::text));


ALTER TABLE constraint_table_usage OWNER TO postgres;

--
-- Name: constraint_table_usage; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE constraint_table_usage FROM PUBLIC;
REVOKE ALL ON TABLE constraint_table_usage FROM postgres;
GRANT ALL ON TABLE constraint_table_usage TO postgres;
GRANT SELECT ON TABLE constraint_table_usage TO PUBLIC;

