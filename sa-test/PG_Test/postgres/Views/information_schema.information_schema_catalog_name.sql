SET SCHEMA "information_schema";

CREATE VIEW information_schema_catalog_name AS
 SELECT (current_database())::sql_identifier AS catalog_name;


ALTER TABLE information_schema_catalog_name OWNER TO postgres;

--
-- Name: information_schema_catalog_name; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE information_schema_catalog_name FROM PUBLIC;
REVOKE ALL ON TABLE information_schema_catalog_name FROM postgres;
GRANT ALL ON TABLE information_schema_catalog_name TO postgres;
GRANT SELECT ON TABLE information_schema_catalog_name TO PUBLIC;

