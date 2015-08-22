SET SCHEMA "information_schema";

CREATE VIEW foreign_server_options AS
 SELECT s.foreign_server_catalog,
    s.foreign_server_name,
    ((pg_options_to_table(s.srvoptions)).option_name)::sql_identifier AS option_name,
    ((pg_options_to_table(s.srvoptions)).option_value)::character_data AS option_value
   FROM _pg_foreign_servers s;


ALTER TABLE foreign_server_options OWNER TO postgres;

--
-- Name: foreign_server_options; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE foreign_server_options FROM PUBLIC;
REVOKE ALL ON TABLE foreign_server_options FROM postgres;
GRANT ALL ON TABLE foreign_server_options TO postgres;
GRANT SELECT ON TABLE foreign_server_options TO PUBLIC;

