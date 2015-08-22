SET SCHEMA "information_schema";

CREATE TABLE sql_languages (
    sql_language_source character_data,
    sql_language_year character_data,
    sql_language_conformance character_data,
    sql_language_integrity character_data,
    sql_language_implementation character_data,
    sql_language_binding_style character_data,
    sql_language_programming_language character_data
);


ALTER TABLE sql_languages OWNER TO postgres;

--
-- Name: sql_languages; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE sql_languages FROM PUBLIC;
REVOKE ALL ON TABLE sql_languages FROM postgres;
GRANT ALL ON TABLE sql_languages TO postgres;
GRANT SELECT ON TABLE sql_languages TO PUBLIC;

