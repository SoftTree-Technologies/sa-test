SET SCHEMA "information_schema";

CREATE TABLE sql_implementation_info (
    implementation_info_id character_data,
    implementation_info_name character_data,
    integer_value cardinal_number,
    character_value character_data,
    comments character_data
);


ALTER TABLE sql_implementation_info OWNER TO postgres;

--
-- Name: sql_implementation_info; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE sql_implementation_info FROM PUBLIC;
REVOKE ALL ON TABLE sql_implementation_info FROM postgres;
GRANT ALL ON TABLE sql_implementation_info TO postgres;
GRANT SELECT ON TABLE sql_implementation_info TO PUBLIC;

