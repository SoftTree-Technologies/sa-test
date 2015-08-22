SET SCHEMA "information_schema";

CREATE VIEW foreign_data_wrapper_options AS
 SELECT w.foreign_data_wrapper_catalog,
    w.foreign_data_wrapper_name,
    ((pg_options_to_table(w.fdwoptions)).option_name)::sql_identifier AS option_name,
    ((pg_options_to_table(w.fdwoptions)).option_value)::character_data AS option_value
   FROM _pg_foreign_data_wrappers w;


ALTER TABLE foreign_data_wrapper_options OWNER TO postgres;

--
-- Name: foreign_data_wrapper_options; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE foreign_data_wrapper_options FROM PUBLIC;
REVOKE ALL ON TABLE foreign_data_wrapper_options FROM postgres;
GRANT ALL ON TABLE foreign_data_wrapper_options TO postgres;
GRANT SELECT ON TABLE foreign_data_wrapper_options TO PUBLIC;

