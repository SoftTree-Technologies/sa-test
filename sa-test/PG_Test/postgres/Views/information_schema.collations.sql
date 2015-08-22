SET SCHEMA "information_schema";

CREATE VIEW collations AS
 SELECT (current_database())::sql_identifier AS collation_catalog,
    (nc.nspname)::sql_identifier AS collation_schema,
    (c.collname)::sql_identifier AS collation_name,
    ('NO PAD'::character varying)::character_data AS pad_attribute
   FROM pg_collation c,
    pg_namespace nc
  WHERE ((c.collnamespace = nc.oid) AND (c.collencoding = ANY (ARRAY[(-1), ( SELECT pg_database.encoding
           FROM pg_database
          WHERE (pg_database.datname = current_database()))])));


ALTER TABLE collations OWNER TO postgres;

--
-- Name: collations; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE collations FROM PUBLIC;
REVOKE ALL ON TABLE collations FROM postgres;
GRANT ALL ON TABLE collations TO postgres;
GRANT SELECT ON TABLE collations TO PUBLIC;

