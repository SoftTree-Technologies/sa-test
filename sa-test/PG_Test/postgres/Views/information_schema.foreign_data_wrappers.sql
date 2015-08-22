SET SCHEMA "information_schema";

CREATE VIEW foreign_data_wrappers AS
 SELECT w.foreign_data_wrapper_catalog,
    w.foreign_data_wrapper_name,
    w.authorization_identifier,
    (NULL::character varying)::character_data AS library_name,
    w.foreign_data_wrapper_language
   FROM _pg_foreign_data_wrappers w;


ALTER TABLE foreign_data_wrappers OWNER TO postgres;

--
-- Name: foreign_data_wrappers; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE foreign_data_wrappers FROM PUBLIC;
REVOKE ALL ON TABLE foreign_data_wrappers FROM postgres;
GRANT ALL ON TABLE foreign_data_wrappers TO postgres;
GRANT SELECT ON TABLE foreign_data_wrappers TO PUBLIC;

