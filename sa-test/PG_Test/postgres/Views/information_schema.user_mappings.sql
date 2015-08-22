SET SCHEMA "information_schema";

CREATE VIEW user_mappings AS
 SELECT _pg_user_mappings.authorization_identifier,
    _pg_user_mappings.foreign_server_catalog,
    _pg_user_mappings.foreign_server_name
   FROM _pg_user_mappings;


ALTER TABLE user_mappings OWNER TO postgres;

--
-- Name: user_mappings; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE user_mappings FROM PUBLIC;
REVOKE ALL ON TABLE user_mappings FROM postgres;
GRANT ALL ON TABLE user_mappings TO postgres;
GRANT SELECT ON TABLE user_mappings TO PUBLIC;

