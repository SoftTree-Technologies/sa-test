SET SCHEMA "information_schema";

CREATE VIEW foreign_servers AS
 SELECT _pg_foreign_servers.foreign_server_catalog,
    _pg_foreign_servers.foreign_server_name,
    _pg_foreign_servers.foreign_data_wrapper_catalog,
    _pg_foreign_servers.foreign_data_wrapper_name,
    _pg_foreign_servers.foreign_server_type,
    _pg_foreign_servers.foreign_server_version,
    _pg_foreign_servers.authorization_identifier
   FROM _pg_foreign_servers;


ALTER TABLE foreign_servers OWNER TO postgres;

--
-- Name: foreign_servers; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE foreign_servers FROM PUBLIC;
REVOKE ALL ON TABLE foreign_servers FROM postgres;
GRANT ALL ON TABLE foreign_servers TO postgres;
GRANT SELECT ON TABLE foreign_servers TO PUBLIC;

