SET SCHEMA "information_schema";

CREATE VIEW collation_character_set_applicability AS
 SELECT (current_database())::sql_identifier AS collation_catalog,
    (nc.nspname)::sql_identifier AS collation_schema,
    (c.collname)::sql_identifier AS collation_name,
    (NULL::character varying)::sql_identifier AS character_set_catalog,
    (NULL::character varying)::sql_identifier AS character_set_schema,
    (getdatabaseencoding())::sql_identifier AS character_set_name
   FROM pg_collation c,
    pg_namespace nc
  WHERE ((c.collnamespace = nc.oid) AND (c.collencoding = ANY (ARRAY[(-1), ( SELECT pg_database.encoding
           FROM pg_database
          WHERE (pg_database.datname = current_database()))])));


ALTER TABLE collation_character_set_applicability OWNER TO postgres;

--
-- Name: collation_character_set_applicability; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE collation_character_set_applicability FROM PUBLIC;
REVOKE ALL ON TABLE collation_character_set_applicability FROM postgres;
GRANT ALL ON TABLE collation_character_set_applicability TO postgres;
GRANT SELECT ON TABLE collation_character_set_applicability TO PUBLIC;

