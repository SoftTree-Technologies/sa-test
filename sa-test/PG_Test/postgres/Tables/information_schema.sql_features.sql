SET SCHEMA "information_schema";

CREATE TABLE sql_features (
    feature_id character_data,
    feature_name character_data,
    sub_feature_id character_data,
    sub_feature_name character_data,
    is_supported yes_or_no,
    is_verified_by character_data,
    comments character_data
);


ALTER TABLE sql_features OWNER TO postgres;

--
-- Name: sql_features; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE sql_features FROM PUBLIC;
REVOKE ALL ON TABLE sql_features FROM postgres;
GRANT ALL ON TABLE sql_features TO postgres;
GRANT SELECT ON TABLE sql_features TO PUBLIC;

