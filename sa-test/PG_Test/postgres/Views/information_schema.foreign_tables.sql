SET SCHEMA "information_schema";

CREATE VIEW foreign_tables AS
 SELECT _pg_foreign_tables.foreign_table_catalog,
    _pg_foreign_tables.foreign_table_schema,
    _pg_foreign_tables.foreign_table_name,
    _pg_foreign_tables.foreign_server_catalog,
    _pg_foreign_tables.foreign_server_name
   FROM _pg_foreign_tables;


ALTER TABLE foreign_tables OWNER TO postgres;

--
-- Name: foreign_tables; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE foreign_tables FROM PUBLIC;
REVOKE ALL ON TABLE foreign_tables FROM postgres;
GRANT ALL ON TABLE foreign_tables TO postgres;
GRANT SELECT ON TABLE foreign_tables TO PUBLIC;

