SET SCHEMA "information_schema";

CREATE VIEW schemata AS
 SELECT (current_database())::sql_identifier AS catalog_name,
    (n.nspname)::sql_identifier AS schema_name,
    (u.rolname)::sql_identifier AS schema_owner,
    (NULL::character varying)::sql_identifier AS default_character_set_catalog,
    (NULL::character varying)::sql_identifier AS default_character_set_schema,
    (NULL::character varying)::sql_identifier AS default_character_set_name,
    (NULL::character varying)::character_data AS sql_path
   FROM pg_namespace n,
    pg_authid u
  WHERE ((n.nspowner = u.oid) AND (pg_has_role(n.nspowner, 'USAGE'::text) OR has_schema_privilege(n.oid, 'CREATE, USAGE'::text)));


ALTER TABLE schemata OWNER TO postgres;

--
-- Name: schemata; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE schemata FROM PUBLIC;
REVOKE ALL ON TABLE schemata FROM postgres;
GRANT ALL ON TABLE schemata TO postgres;
GRANT SELECT ON TABLE schemata TO PUBLIC;

