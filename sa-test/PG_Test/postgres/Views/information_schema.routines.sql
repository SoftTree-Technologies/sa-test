SET SCHEMA "information_schema";

CREATE VIEW routines AS
 SELECT (current_database())::sql_identifier AS specific_catalog,
    (n.nspname)::sql_identifier AS specific_schema,
    ((((p.proname)::text || '_'::text) || (p.oid)::text))::sql_identifier AS specific_name,
    (current_database())::sql_identifier AS routine_catalog,
    (n.nspname)::sql_identifier AS routine_schema,
    (p.proname)::sql_identifier AS routine_name,
    ('FUNCTION'::character varying)::character_data AS routine_type,
    (NULL::character varying)::sql_identifier AS module_catalog,
    (NULL::character varying)::sql_identifier AS module_schema,
    (NULL::character varying)::sql_identifier AS module_name,
    (NULL::character varying)::sql_identifier AS udt_catalog,
    (NULL::character varying)::sql_identifier AS udt_schema,
    (NULL::character varying)::sql_identifier AS udt_name,
    (
        CASE
            WHEN ((t.typelem <> (0)::oid) AND (t.typlen = (-1))) THEN 'ARRAY'::text
            WHEN (nt.nspname = 'pg_catalog'::name) THEN format_type(t.oid, NULL::integer)
            ELSE 'USER-DEFINED'::text
        END)::character_data AS data_type,
    (NULL::integer)::cardinal_number AS character_maximum_length,
    (NULL::integer)::cardinal_number AS character_octet_length,
    (NULL::character varying)::sql_identifier AS character_set_catalog,
    (NULL::character varying)::sql_identifier AS character_set_schema,
    (NULL::character varying)::sql_identifier AS character_set_name,
    (NULL::character varying)::sql_identifier AS collation_catalog,
    (NULL::character varying)::sql_identifier AS collation_schema,
    (NULL::character varying)::sql_identifier AS collation_name,
    (NULL::integer)::cardinal_number AS numeric_precision,
    (NULL::integer)::cardinal_number AS numeric_precision_radix,
    (NULL::integer)::cardinal_number AS numeric_scale,
    (NULL::integer)::cardinal_number AS datetime_precision,
    (NULL::character varying)::character_data AS interval_type,
    (NULL::integer)::cardinal_number AS interval_precision,
    (current_database())::sql_identifier AS type_udt_catalog,
    (nt.nspname)::sql_identifier AS type_udt_schema,
    (t.typname)::sql_identifier AS type_udt_name,
    (NULL::character varying)::sql_identifier AS scope_catalog,
    (NULL::character varying)::sql_identifier AS scope_schema,
    (NULL::character varying)::sql_identifier AS scope_name,
    (NULL::integer)::cardinal_number AS maximum_cardinality,
    (0)::sql_identifier AS dtd_identifier,
    (
        CASE
            WHEN (l.lanname = 'sql'::name) THEN 'SQL'::text
            ELSE 'EXTERNAL'::text
        END)::character_data AS routine_body,
    (
        CASE
            WHEN pg_has_role(p.proowner, 'USAGE'::text) THEN p.prosrc
            ELSE NULL::text
        END)::character_data AS routine_definition,
    (
        CASE
            WHEN (l.lanname = 'c'::name) THEN p.prosrc
            ELSE NULL::text
        END)::character_data AS external_name,
    (upper((l.lanname)::text))::character_data AS external_language,
    ('GENERAL'::character varying)::character_data AS parameter_style,
    (
        CASE
            WHEN (p.provolatile = 'i'::"char") THEN 'YES'::text
            ELSE 'NO'::text
        END)::yes_or_no AS is_deterministic,
    ('MODIFIES'::character varying)::character_data AS sql_data_access,
    (
        CASE
            WHEN p.proisstrict THEN 'YES'::text
            ELSE 'NO'::text
        END)::yes_or_no AS is_null_call,
    (NULL::character varying)::character_data AS sql_path,
    ('YES'::character varying)::yes_or_no AS schema_level_routine,
    (0)::cardinal_number AS max_dynamic_result_sets,
    (NULL::character varying)::yes_or_no AS is_user_defined_cast,
    (NULL::character varying)::yes_or_no AS is_implicitly_invocable,
    (
        CASE
            WHEN p.prosecdef THEN 'DEFINER'::text
            ELSE 'INVOKER'::text
        END)::character_data AS security_type,
    (NULL::character varying)::sql_identifier AS to_sql_specific_catalog,
    (NULL::character varying)::sql_identifier AS to_sql_specific_schema,
    (NULL::character varying)::sql_identifier AS to_sql_specific_name,
    ('NO'::character varying)::yes_or_no AS as_locator,
    (NULL::timestamp with time zone)::time_stamp AS created,
    (NULL::timestamp with time zone)::time_stamp AS last_altered,
    (NULL::character varying)::yes_or_no AS new_savepoint_level,
    ('NO'::character varying)::yes_or_no AS is_udt_dependent,
    (NULL::character varying)::character_data AS result_cast_from_data_type,
    (NULL::character varying)::yes_or_no AS result_cast_as_locator,
    (NULL::integer)::cardinal_number AS result_cast_char_max_length,
    (NULL::integer)::cardinal_number AS result_cast_char_octet_length,
    (NULL::character varying)::sql_identifier AS result_cast_char_set_catalog,
    (NULL::character varying)::sql_identifier AS result_cast_char_set_schema,
    (NULL::character varying)::sql_identifier AS result_cast_character_set_name,
    (NULL::character varying)::sql_identifier AS result_cast_collation_catalog,
    (NULL::character varying)::sql_identifier AS result_cast_collation_schema,
    (NULL::character varying)::sql_identifier AS result_cast_collation_name,
    (NULL::integer)::cardinal_number AS result_cast_numeric_precision,
    (NULL::integer)::cardinal_number AS result_cast_numeric_precision_radix,
    (NULL::integer)::cardinal_number AS result_cast_numeric_scale,
    (NULL::integer)::cardinal_number AS result_cast_datetime_precision,
    (NULL::character varying)::character_data AS result_cast_interval_type,
    (NULL::integer)::cardinal_number AS result_cast_interval_precision,
    (NULL::character varying)::sql_identifier AS result_cast_type_udt_catalog,
    (NULL::character varying)::sql_identifier AS result_cast_type_udt_schema,
    (NULL::character varying)::sql_identifier AS result_cast_type_udt_name,
    (NULL::character varying)::sql_identifier AS result_cast_scope_catalog,
    (NULL::character varying)::sql_identifier AS result_cast_scope_schema,
    (NULL::character varying)::sql_identifier AS result_cast_scope_name,
    (NULL::integer)::cardinal_number AS result_cast_maximum_cardinality,
    (NULL::character varying)::sql_identifier AS result_cast_dtd_identifier
   FROM pg_namespace n,
    pg_proc p,
    pg_language l,
    pg_type t,
    pg_namespace nt
  WHERE (((((n.oid = p.pronamespace) AND (p.prolang = l.oid)) AND (p.prorettype = t.oid)) AND (t.typnamespace = nt.oid)) AND (pg_has_role(p.proowner, 'USAGE'::text) OR has_function_privilege(p.oid, 'EXECUTE'::text)));


ALTER TABLE routines OWNER TO postgres;

--
-- Name: routines; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE routines FROM PUBLIC;
REVOKE ALL ON TABLE routines FROM postgres;
GRANT ALL ON TABLE routines TO postgres;
GRANT SELECT ON TABLE routines TO PUBLIC;

