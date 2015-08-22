SET SCHEMA "information_schema";

CREATE VIEW user_defined_types AS
 SELECT (current_database())::sql_identifier AS user_defined_type_catalog,
    (n.nspname)::sql_identifier AS user_defined_type_schema,
    (c.relname)::sql_identifier AS user_defined_type_name,
    ('STRUCTURED'::character varying)::character_data AS user_defined_type_category,
    ('YES'::character varying)::yes_or_no AS is_instantiable,
    (NULL::character varying)::yes_or_no AS is_final,
    (NULL::character varying)::character_data AS ordering_form,
    (NULL::character varying)::character_data AS ordering_category,
    (NULL::character varying)::sql_identifier AS ordering_routine_catalog,
    (NULL::character varying)::sql_identifier AS ordering_routine_schema,
    (NULL::character varying)::sql_identifier AS ordering_routine_name,
    (NULL::character varying)::character_data AS reference_type,
    (NULL::character varying)::character_data AS data_type,
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
    (NULL::character varying)::sql_identifier AS source_dtd_identifier,
    (NULL::character varying)::sql_identifier AS ref_dtd_identifier
   FROM pg_namespace n,
    pg_class c,
    pg_type t
  WHERE ((((n.oid = c.relnamespace) AND (t.typrelid = c.oid)) AND (c.relkind = 'c'::"char")) AND (pg_has_role(t.typowner, 'USAGE'::text) OR has_type_privilege(t.oid, 'USAGE'::text)));


ALTER TABLE user_defined_types OWNER TO postgres;

--
-- Name: user_defined_types; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE user_defined_types FROM PUBLIC;
REVOKE ALL ON TABLE user_defined_types FROM postgres;
GRANT ALL ON TABLE user_defined_types TO postgres;
GRANT SELECT ON TABLE user_defined_types TO PUBLIC;

