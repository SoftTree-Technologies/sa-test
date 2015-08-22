SET SCHEMA "information_schema";

CREATE TABLE sql_sizing_profiles (
    sizing_id cardinal_number,
    sizing_name character_data,
    profile_id character_data,
    required_value cardinal_number,
    comments character_data
);


ALTER TABLE sql_sizing_profiles OWNER TO postgres;

--
-- Name: sql_sizing_profiles; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE sql_sizing_profiles FROM PUBLIC;
REVOKE ALL ON TABLE sql_sizing_profiles FROM postgres;
GRANT ALL ON TABLE sql_sizing_profiles TO postgres;
GRANT SELECT ON TABLE sql_sizing_profiles TO PUBLIC;

