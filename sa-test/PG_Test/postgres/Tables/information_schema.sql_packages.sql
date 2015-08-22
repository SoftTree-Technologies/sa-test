SET SCHEMA "information_schema";

CREATE TABLE sql_packages (
    feature_id character_data,
    feature_name character_data,
    is_supported yes_or_no,
    is_verified_by character_data,
    comments character_data
);


ALTER TABLE sql_packages OWNER TO postgres;

--
-- Name: sql_packages; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE sql_packages FROM PUBLIC;
REVOKE ALL ON TABLE sql_packages FROM postgres;
GRANT ALL ON TABLE sql_packages TO postgres;
GRANT SELECT ON TABLE sql_packages TO PUBLIC;

