SET SCHEMA "information_schema";

CREATE VIEW _pg_foreign_data_wrappers AS
 SELECT w.oid,
    w.fdwowner,
    w.fdwoptions,
    (current_database())::sql_identifier AS foreign_data_wrapper_catalog,
    (w.fdwname)::sql_identifier AS foreign_data_wrapper_name,
    (u.rolname)::sql_identifier AS authorization_identifier,
    ('c'::character varying)::character_data AS foreign_data_wrapper_language
   FROM pg_foreign_data_wrapper w,
    pg_authid u
  WHERE ((u.oid = w.fdwowner) AND (pg_has_role(w.fdwowner, 'USAGE'::text) OR has_foreign_data_wrapper_privilege(w.oid, 'USAGE'::text)));


ALTER TABLE _pg_foreign_data_wrappers OWNER TO postgres;
