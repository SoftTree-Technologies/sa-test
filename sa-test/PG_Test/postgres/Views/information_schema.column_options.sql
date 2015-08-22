SET SCHEMA "information_schema";

CREATE VIEW column_options AS
 SELECT (current_database())::sql_identifier AS table_catalog,
    c.nspname AS table_schema,
    c.relname AS table_name,
    c.attname AS column_name,
    ((pg_options_to_table(c.attfdwoptions)).option_name)::sql_identifier AS option_name,
    ((pg_options_to_table(c.attfdwoptions)).option_value)::character_data AS option_value
   FROM _pg_foreign_table_columns c;


ALTER TABLE column_options OWNER TO postgres;

--
-- Name: column_options; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE column_options FROM PUBLIC;
REVOKE ALL ON TABLE column_options FROM postgres;
GRANT ALL ON TABLE column_options TO postgres;
GRANT SELECT ON TABLE column_options TO PUBLIC;

