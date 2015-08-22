SET SCHEMA "information_schema";

CREATE TABLE sql_sizing (
    sizing_id cardinal_number,
    sizing_name character_data,
    supported_value cardinal_number,
    comments character_data
);


ALTER TABLE sql_sizing OWNER TO postgres;

--
-- Name: sql_sizing; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE sql_sizing FROM PUBLIC;
REVOKE ALL ON TABLE sql_sizing FROM postgres;
GRANT ALL ON TABLE sql_sizing TO postgres;
GRANT SELECT ON TABLE sql_sizing TO PUBLIC;

