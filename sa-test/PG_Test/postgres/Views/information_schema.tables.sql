SET SCHEMA "information_schema";

CREATE VIEW tables AS
 SELECT (current_database())::sql_identifier AS table_catalog,
    (nc.nspname)::sql_identifier AS table_schema,
    (c.relname)::sql_identifier AS table_name,
    (
        CASE
            WHEN (nc.oid = pg_my_temp_schema()) THEN 'LOCAL TEMPORARY'::text
            WHEN (c.relkind = 'r'::"char") THEN 'BASE TABLE'::text
            WHEN (c.relkind = 'v'::"char") THEN 'VIEW'::text
            WHEN (c.relkind = 'f'::"char") THEN 'FOREIGN TABLE'::text
            ELSE NULL::text
        END)::character_data AS table_type,
    (NULL::character varying)::sql_identifier AS self_referencing_column_name,
    (NULL::character varying)::character_data AS reference_generation,
    (
        CASE
            WHEN (t.typname IS NOT NULL) THEN current_database()
            ELSE NULL::name
        END)::sql_identifier AS user_defined_type_catalog,
    (nt.nspname)::sql_identifier AS user_defined_type_schema,
    (t.typname)::sql_identifier AS user_defined_type_name,
    (
        CASE
            WHEN ((c.relkind = 'r'::"char") OR ((c.relkind = ANY (ARRAY['v'::"char", 'f'::"char"])) AND ((pg_relation_is_updatable((c.oid)::regclass, false) & 8) = 8))) THEN 'YES'::text
            ELSE 'NO'::text
        END)::yes_or_no AS is_insertable_into,
    (
        CASE
            WHEN (t.typname IS NOT NULL) THEN 'YES'::text
            ELSE 'NO'::text
        END)::yes_or_no AS is_typed,
    (NULL::character varying)::character_data AS commit_action
   FROM ((pg_namespace nc
     JOIN pg_class c ON ((nc.oid = c.relnamespace)))
     LEFT JOIN (pg_type t
     JOIN pg_namespace nt ON ((t.typnamespace = nt.oid))) ON ((c.reloftype = t.oid)))
  WHERE (((c.relkind = ANY (ARRAY['r'::"char", 'v'::"char", 'f'::"char"])) AND (NOT pg_is_other_temp_schema(nc.oid))) AND ((pg_has_role(c.relowner, 'USAGE'::text) OR has_table_privilege(c.oid, 'SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER'::text)) OR has_any_column_privilege(c.oid, 'SELECT, INSERT, UPDATE, REFERENCES'::text)));


ALTER TABLE tables OWNER TO postgres;

--
-- Name: tables; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE tables FROM PUBLIC;
REVOKE ALL ON TABLE tables FROM postgres;
GRANT ALL ON TABLE tables TO postgres;
GRANT SELECT ON TABLE tables TO PUBLIC;

