SET SCHEMA "information_schema";

CREATE VIEW domains AS
 SELECT (current_database())::sql_identifier AS domain_catalog,
    (nt.nspname)::sql_identifier AS domain_schema,
    (t.typname)::sql_identifier AS domain_name,
    (
        CASE
            WHEN ((t.typelem <> (0)::oid) AND (t.typlen = (-1))) THEN 'ARRAY'::text
            WHEN (nbt.nspname = 'pg_catalog'::name) THEN format_type(t.typbasetype, NULL::integer)
            ELSE 'USER-DEFINED'::text
        END)::character_data AS data_type,
    (_pg_char_max_length(t.typbasetype, t.typtypmod))::cardinal_number AS character_maximum_length,
    (_pg_char_octet_length(t.typbasetype, t.typtypmod))::cardinal_number AS character_octet_length,
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
    (_pg_numeric_precision(t.typbasetype, t.typtypmod))::cardinal_number AS numeric_precision,
    (_pg_numeric_precision_radix(t.typbasetype, t.typtypmod))::cardinal_number AS numeric_precision_radix,
    (_pg_numeric_scale(t.typbasetype, t.typtypmod))::cardinal_number AS numeric_scale,
    (_pg_datetime_precision(t.typbasetype, t.typtypmod))::cardinal_number AS datetime_precision,
    (_pg_interval_type(t.typbasetype, t.typtypmod))::character_data AS interval_type,
    (NULL::integer)::cardinal_number AS interval_precision,
    (t.typdefault)::character_data AS domain_default,
    (current_database())::sql_identifier AS udt_catalog,
    (nbt.nspname)::sql_identifier AS udt_schema,
    (bt.typname)::sql_identifier AS udt_name,
    (NULL::character varying)::sql_identifier AS scope_catalog,
    (NULL::character varying)::sql_identifier AS scope_schema,
    (NULL::character varying)::sql_identifier AS scope_name,
    (NULL::integer)::cardinal_number AS maximum_cardinality,
    (1)::sql_identifier AS dtd_identifier
   FROM (((pg_type t
     JOIN pg_namespace nt ON ((t.typnamespace = nt.oid)))
     JOIN (pg_type bt
     JOIN pg_namespace nbt ON ((bt.typnamespace = nbt.oid))) ON (((t.typbasetype = bt.oid) AND (t.typtype = 'd'::"char"))))
     LEFT JOIN (pg_collation co
     JOIN pg_namespace nco ON ((co.collnamespace = nco.oid))) ON (((t.typcollation = co.oid) AND ((nco.nspname <> 'pg_catalog'::name) OR (co.collname <> 'default'::name)))))
  WHERE (pg_has_role(t.typowner, 'USAGE'::text) OR has_type_privilege(t.oid, 'USAGE'::text));


ALTER TABLE domains OWNER TO postgres;

--
-- Name: domains; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE domains FROM PUBLIC;
REVOKE ALL ON TABLE domains FROM postgres;
GRANT ALL ON TABLE domains TO postgres;
GRANT SELECT ON TABLE domains TO PUBLIC;

