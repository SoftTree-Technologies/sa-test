SET SCHEMA "information_schema";

CREATE VIEW user_mapping_options AS
 SELECT um.authorization_identifier,
    um.foreign_server_catalog,
    um.foreign_server_name,
    ((pg_options_to_table(um.umoptions)).option_name)::sql_identifier AS option_name,
    (
        CASE
            WHEN ((((um.umuser <> (0)::oid) AND ((um.authorization_identifier)::name = "current_user"())) OR ((um.umuser = (0)::oid) AND pg_has_role((um.srvowner)::name, 'USAGE'::text))) OR ( SELECT pg_authid.rolsuper
               FROM pg_authid
              WHERE (pg_authid.rolname = "current_user"()))) THEN (pg_options_to_table(um.umoptions)).option_value
            ELSE NULL::text
        END)::character_data AS option_value
   FROM _pg_user_mappings um;


ALTER TABLE user_mapping_options OWNER TO postgres;

--
-- Name: user_mapping_options; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE user_mapping_options FROM PUBLIC;
REVOKE ALL ON TABLE user_mapping_options FROM postgres;
GRANT ALL ON TABLE user_mapping_options TO postgres;
GRANT SELECT ON TABLE user_mapping_options TO PUBLIC;

