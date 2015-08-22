SET SCHEMA "information_schema";

CREATE VIEW table_constraints AS
 SELECT (current_database())::sql_identifier AS constraint_catalog,
    (nc.nspname)::sql_identifier AS constraint_schema,
    (c.conname)::sql_identifier AS constraint_name,
    (current_database())::sql_identifier AS table_catalog,
    (nr.nspname)::sql_identifier AS table_schema,
    (r.relname)::sql_identifier AS table_name,
    (
        CASE c.contype
            WHEN 'c'::"char" THEN 'CHECK'::text
            WHEN 'f'::"char" THEN 'FOREIGN KEY'::text
            WHEN 'p'::"char" THEN 'PRIMARY KEY'::text
            WHEN 'u'::"char" THEN 'UNIQUE'::text
            ELSE NULL::text
        END)::character_data AS constraint_type,
    (
        CASE
            WHEN c.condeferrable THEN 'YES'::text
            ELSE 'NO'::text
        END)::yes_or_no AS is_deferrable,
    (
        CASE
            WHEN c.condeferred THEN 'YES'::text
            ELSE 'NO'::text
        END)::yes_or_no AS initially_deferred
   FROM pg_namespace nc,
    pg_namespace nr,
    pg_constraint c,
    pg_class r
  WHERE (((((((nc.oid = c.connamespace) AND (nr.oid = r.relnamespace)) AND (c.conrelid = r.oid)) AND (c.contype <> ALL (ARRAY['t'::"char", 'x'::"char"]))) AND (r.relkind = 'r'::"char")) AND (NOT pg_is_other_temp_schema(nr.oid))) AND ((pg_has_role(r.relowner, 'USAGE'::text) OR has_table_privilege(r.oid, 'INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER'::text)) OR has_any_column_privilege(r.oid, 'INSERT, UPDATE, REFERENCES'::text)))
UNION ALL
 SELECT (current_database())::sql_identifier AS constraint_catalog,
    (nr.nspname)::sql_identifier AS constraint_schema,
    (((((((nr.oid)::text || '_'::text) || (r.oid)::text) || '_'::text) || (a.attnum)::text) || '_not_null'::text))::sql_identifier AS constraint_name,
    (current_database())::sql_identifier AS table_catalog,
    (nr.nspname)::sql_identifier AS table_schema,
    (r.relname)::sql_identifier AS table_name,
    ('CHECK'::character varying)::character_data AS constraint_type,
    ('NO'::character varying)::yes_or_no AS is_deferrable,
    ('NO'::character varying)::yes_or_no AS initially_deferred
   FROM pg_namespace nr,
    pg_class r,
    pg_attribute a
  WHERE ((((((((nr.oid = r.relnamespace) AND (r.oid = a.attrelid)) AND a.attnotnull) AND (a.attnum > 0)) AND (NOT a.attisdropped)) AND (r.relkind = 'r'::"char")) AND (NOT pg_is_other_temp_schema(nr.oid))) AND ((pg_has_role(r.relowner, 'USAGE'::text) OR has_table_privilege(r.oid, 'INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER'::text)) OR has_any_column_privilege(r.oid, 'INSERT, UPDATE, REFERENCES'::text)));


ALTER TABLE table_constraints OWNER TO postgres;

--
-- Name: table_constraints; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE table_constraints FROM PUBLIC;
REVOKE ALL ON TABLE table_constraints FROM postgres;
GRANT ALL ON TABLE table_constraints TO postgres;
GRANT SELECT ON TABLE table_constraints TO PUBLIC;

