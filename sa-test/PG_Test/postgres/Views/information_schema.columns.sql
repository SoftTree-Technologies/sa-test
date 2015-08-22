SET SCHEMA "information_schema";

CREATE VIEW columns AS
 SELECT (current_database())::sql_identifier AS table_catalog,
    (nc.nspname)::sql_identifier AS table_schema,
    (c.relname)::sql_identifier AS table_name,
    (a.attname)::sql_identifier AS column_name,
    (a.attnum)::cardinal_number AS ordinal_position,
    (pg_get_expr(ad.adbin, ad.adrelid))::character_data AS column_default,
    (
        CASE
            WHEN (a.attnotnull OR ((t.typtype = 'd'::"char") AND t.typnotnull)) THEN 'NO'::text
            ELSE 'YES'::text
        END)::yes_or_no AS is_nullable,
    (
        CASE
            WHEN (t.typtype = 'd'::"char") THEN
            CASE
                WHEN ((bt.typelem <> (0)::oid) AND (bt.typlen = (-1))) THEN 'ARRAY'::text
                WHEN (nbt.nspname = 'pg_catalog'::name) THEN format_type(t.typbasetype, NULL::integer)
                ELSE 'USER-DEFINED'::text
            END
            ELSE
            CASE
                WHEN ((t.typelem <> (0)::oid) AND (t.typlen = (-1))) THEN 'ARRAY'::text
                WHEN (nt.nspname = 'pg_catalog'::name) THEN format_type(a.atttypid, NULL::integer)
                ELSE 'USER-DEFINED'::text
            END
        END)::character_data AS data_type,
    (_pg_char_max_length(_pg_truetypid(a.*, t.*), _pg_truetypmod(a.*, t.*)))::cardinal_number AS character_maximum_length,
    (_pg_char_octet_length(_pg_truetypid(a.*, t.*), _pg_truetypmod(a.*, t.*)))::cardinal_number AS character_octet_length,
    (_pg_numeric_precision(_pg_truetypid(a.*, t.*), _pg_truetypmod(a.*, t.*)))::cardinal_number AS numeric_precision,
    (_pg_numeric_precision_radix(_pg_truetypid(a.*, t.*), _pg_truetypmod(a.*, t.*)))::cardinal_number AS numeric_precision_radix,
    (_pg_numeric_scale(_pg_truetypid(a.*, t.*), _pg_truetypmod(a.*, t.*)))::cardinal_number AS numeric_scale,
    (_pg_datetime_precision(_pg_truetypid(a.*, t.*), _pg_truetypmod(a.*, t.*)))::cardinal_number AS datetime_precision,
    (_pg_interval_type(_pg_truetypid(a.*, t.*), _pg_truetypmod(a.*, t.*)))::character_data AS interval_type,
    (NULL::integer)::cardinal_number AS interval_precision,
    (NULL::character varying)::sql_identifier AS character_set_catalog,
    (NULL::character varying)::sql_identifier AS character_set_schema,
    (NULL::character varying)::sql_identifier AS character_set_name,
    (
        CASE
            WHEN (nco.nspname IS NOT NULL) THEN current_database()
            ELSE NULL::name
        END)::sql_identifier AS collation_catalog,
    (nco.nspname)::sql_identifier AS collation_schema,
    (co.collname)::sql_identifier AS collation_name,
    (
        CASE
            WHEN (t.typtype = 'd'::"char") THEN current_database()
            ELSE NULL::name
        END)::sql_identifier AS domain_catalog,
    (
        CASE
            WHEN (t.typtype = 'd'::"char") THEN nt.nspname
            ELSE NULL::name
        END)::sql_identifier AS domain_schema,
    (
        CASE
            WHEN (t.typtype = 'd'::"char") THEN t.typname
            ELSE NULL::name
        END)::sql_identifier AS domain_name,
    (current_database())::sql_identifier AS udt_catalog,
    (COALESCE(nbt.nspname, nt.nspname))::sql_identifier AS udt_schema,
    (COALESCE(bt.typname, t.typname))::sql_identifier AS udt_name,
    (NULL::character varying)::sql_identifier AS scope_catalog,
    (NULL::character varying)::sql_identifier AS scope_schema,
    (NULL::character varying)::sql_identifier AS scope_name,
    (NULL::integer)::cardinal_number AS maximum_cardinality,
    (a.attnum)::sql_identifier AS dtd_identifier,
    ('NO'::character varying)::yes_or_no AS is_self_referencing,
    ('NO'::character varying)::yes_or_no AS is_identity,
    (NULL::character varying)::character_data AS identity_generation,
    (NULL::character varying)::character_data AS identity_start,
    (NULL::character varying)::character_data AS identity_increment,
    (NULL::character varying)::character_data AS identity_maximum,
    (NULL::character varying)::character_data AS identity_minimum,
    (NULL::character varying)::yes_or_no AS identity_cycle,
    ('NEVER'::character varying)::character_data AS is_generated,
    (NULL::character varying)::character_data AS generation_expression,
    (
        CASE
            WHEN ((c.relkind = 'r'::"char") OR ((c.relkind = ANY (ARRAY['v'::"char", 'f'::"char"])) AND pg_column_is_updatable((c.oid)::regclass, a.attnum, false))) THEN 'YES'::text
            ELSE 'NO'::text
        END)::yes_or_no AS is_updatable
   FROM (((((pg_attribute a
     LEFT JOIN pg_attrdef ad ON (((a.attrelid = ad.adrelid) AND (a.attnum = ad.adnum))))
     JOIN (pg_class c
     JOIN pg_namespace nc ON ((c.relnamespace = nc.oid))) ON ((a.attrelid = c.oid)))
     JOIN (pg_type t
     JOIN pg_namespace nt ON ((t.typnamespace = nt.oid))) ON ((a.atttypid = t.oid)))
     LEFT JOIN (pg_type bt
     JOIN pg_namespace nbt ON ((bt.typnamespace = nbt.oid))) ON (((t.typtype = 'd'::"char") AND (t.typbasetype = bt.oid))))
     LEFT JOIN (pg_collation co
     JOIN pg_namespace nco ON ((co.collnamespace = nco.oid))) ON (((a.attcollation = co.oid) AND ((nco.nspname <> 'pg_catalog'::name) OR (co.collname <> 'default'::name)))))
  WHERE (((((NOT pg_is_other_temp_schema(nc.oid)) AND (a.attnum > 0)) AND (NOT a.attisdropped)) AND (c.relkind = ANY (ARRAY['r'::"char", 'v'::"char", 'f'::"char"]))) AND (pg_has_role(c.relowner, 'USAGE'::text) OR has_column_privilege(c.oid, a.attnum, 'SELECT, INSERT, UPDATE, REFERENCES'::text)));


ALTER TABLE columns OWNER TO postgres;

--
-- Name: columns; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE columns FROM PUBLIC;
REVOKE ALL ON TABLE columns FROM postgres;
GRANT ALL ON TABLE columns TO postgres;
GRANT SELECT ON TABLE columns TO PUBLIC;

