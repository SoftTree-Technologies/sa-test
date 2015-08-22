SET SCHEMA "information_schema";

CREATE VIEW foreign_table_options AS
 SELECT t.foreign_table_catalog,
    t.foreign_table_schema,
    t.foreign_table_name,
    ((pg_options_to_table(t.ftoptions)).option_name)::sql_identifier AS option_name,
    ((pg_options_to_table(t.ftoptions)).option_value)::character_data AS option_value
   FROM _pg_foreign_tables t;


ALTER TABLE foreign_table_options OWNER TO postgres;

--
-- Name: foreign_table_options; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE foreign_table_options FROM PUBLIC;
REVOKE ALL ON TABLE foreign_table_options FROM postgres;
GRANT ALL ON TABLE foreign_table_options TO postgres;
GRANT SELECT ON TABLE foreign_table_options TO PUBLIC;

