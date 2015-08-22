SET SCHEMA "information_schema";

CREATE VIEW _pg_foreign_servers AS
 SELECT s.oid,
    s.srvoptions,
    (current_database())::sql_identifier AS foreign_server_catalog,
    (s.srvname)::sql_identifier AS foreign_server_name,
    (current_database())::sql_identifier AS foreign_data_wrapper_catalog,
    (w.fdwname)::sql_identifier AS foreign_data_wrapper_name,
    (s.srvtype)::character_data AS foreign_server_type,
    (s.srvversion)::character_data AS foreign_server_version,
    (u.rolname)::sql_identifier AS authorization_identifier
   FROM pg_foreign_server s,
    pg_foreign_data_wrapper w,
    pg_authid u
  WHERE (((w.oid = s.srvfdw) AND (u.oid = s.srvowner)) AND (pg_has_role(s.srvowner, 'USAGE'::text) OR has_server_privilege(s.oid, 'USAGE'::text)));


ALTER TABLE _pg_foreign_servers OWNER TO postgres;
