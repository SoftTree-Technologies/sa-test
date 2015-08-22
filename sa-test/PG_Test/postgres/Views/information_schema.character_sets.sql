SET SCHEMA "information_schema";

CREATE VIEW character_sets AS
 SELECT (NULL::character varying)::sql_identifier AS character_set_catalog,
    (NULL::character varying)::sql_identifier AS character_set_schema,
    (getdatabaseencoding())::sql_identifier AS character_set_name,
    (
        CASE
            WHEN (getdatabaseencoding() = 'UTF8'::name) THEN 'UCS'::name
            ELSE getdatabaseencoding()
        END)::sql_identifier AS character_repertoire,
    (getdatabaseencoding())::sql_identifier AS form_of_use,
    (current_database())::sql_identifier AS default_collate_catalog,
    (nc.nspname)::sql_identifier AS default_collate_schema,
    (c.collname)::sql_identifier AS default_collate_name
   FROM (pg_database d
     LEFT JOIN (pg_collation c
     JOIN pg_namespace nc ON ((c.collnamespace = nc.oid))) ON (((d.datcollate = c.collcollate) AND (d.datctype = c.collctype))))
  WHERE (d.datname = current_database())
  ORDER BY char_length((c.collname)::text) DESC, c.collname
 LIMIT 1;


ALTER TABLE character_sets OWNER TO postgres;

--
-- Name: character_sets; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE character_sets FROM PUBLIC;
REVOKE ALL ON TABLE character_sets FROM postgres;
GRANT ALL ON TABLE character_sets TO postgres;
GRANT SELECT ON TABLE character_sets TO PUBLIC;

