SET SCHEMA "information_schema";

CREATE VIEW sequences AS
 SELECT (current_database())::sql_identifier AS sequence_catalog,
    (nc.nspname)::sql_identifier AS sequence_schema,
    (c.relname)::sql_identifier AS sequence_name,
    ('bigint'::character varying)::character_data AS data_type,
    (64)::cardinal_number AS numeric_precision,
    (2)::cardinal_number AS numeric_precision_radix,
    (0)::cardinal_number AS numeric_scale,
    (p.start_value)::character_data AS start_value,
    (p.minimum_value)::character_data AS minimum_value,
    (p.maximum_value)::character_data AS maximum_value,
    (p.increment)::character_data AS increment,
    (
        CASE
            WHEN p.cycle_option THEN 'YES'::text
            ELSE 'NO'::text
        END)::yes_or_no AS cycle_option
   FROM pg_namespace nc,
    pg_class c,
    LATERAL pg_sequence_parameters(c.oid) p(start_value, minimum_value, maximum_value, increment, cycle_option)
  WHERE ((((c.relnamespace = nc.oid) AND (c.relkind = 'S'::"char")) AND (NOT pg_is_other_temp_schema(nc.oid))) AND (pg_has_role(c.relowner, 'USAGE'::text) OR has_sequence_privilege(c.oid, 'SELECT, UPDATE, USAGE'::text)));


ALTER TABLE sequences OWNER TO postgres;

--
-- Name: sequences; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE sequences FROM PUBLIC;
REVOKE ALL ON TABLE sequences FROM postgres;
GRANT ALL ON TABLE sequences TO postgres;
GRANT SELECT ON TABLE sequences TO PUBLIC;

