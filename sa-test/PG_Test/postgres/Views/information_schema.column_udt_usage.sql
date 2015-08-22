SET SCHEMA "information_schema";

CREATE VIEW column_udt_usage AS
 SELECT (current_database())::sql_identifier AS udt_catalog,
    (COALESCE(nbt.nspname, nt.nspname))::sql_identifier AS udt_schema,
    (COALESCE(bt.typname, t.typname))::sql_identifier AS udt_name,
    (current_database())::sql_identifier AS table_catalog,
    (nc.nspname)::sql_identifier AS table_schema,
    (c.relname)::sql_identifier AS table_name,
    (a.attname)::sql_identifier AS column_name
   FROM pg_attribute a,
    pg_class c,
    pg_namespace nc,
    ((pg_type t
     JOIN pg_namespace nt ON ((t.typnamespace = nt.oid)))
     LEFT JOIN (pg_type bt
     JOIN pg_namespace nbt ON ((bt.typnamespace = nbt.oid))) ON (((t.typtype = 'd'::"char") AND (t.typbasetype = bt.oid))))
  WHERE (((((((a.attrelid = c.oid) AND (a.atttypid = t.oid)) AND (nc.oid = c.relnamespace)) AND (a.attnum > 0)) AND (NOT a.attisdropped)) AND (c.relkind = ANY (ARRAY['r'::"char", 'v'::"char", 'f'::"char"]))) AND pg_has_role(COALESCE(bt.typowner, t.typowner), 'USAGE'::text));


ALTER TABLE column_udt_usage OWNER TO postgres;

--
-- Name: column_udt_usage; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE column_udt_usage FROM PUBLIC;
REVOKE ALL ON TABLE column_udt_usage FROM postgres;
GRANT ALL ON TABLE column_udt_usage TO postgres;
GRANT SELECT ON TABLE column_udt_usage TO PUBLIC;

