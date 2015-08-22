SET SCHEMA "information_schema";

CREATE VIEW check_constraints AS
 SELECT (current_database())::sql_identifier AS constraint_catalog,
    (rs.nspname)::sql_identifier AS constraint_schema,
    (con.conname)::sql_identifier AS constraint_name,
    ("substring"(pg_get_constraintdef(con.oid), 7))::character_data AS check_clause
   FROM (((pg_constraint con
     LEFT JOIN pg_namespace rs ON ((rs.oid = con.connamespace)))
     LEFT JOIN pg_class c ON ((c.oid = con.conrelid)))
     LEFT JOIN pg_type t ON ((t.oid = con.contypid)))
  WHERE (pg_has_role(COALESCE(c.relowner, t.typowner), 'USAGE'::text) AND (con.contype = 'c'::"char"))
UNION
 SELECT (current_database())::sql_identifier AS constraint_catalog,
    (n.nspname)::sql_identifier AS constraint_schema,
    (((((((n.oid)::text || '_'::text) || (r.oid)::text) || '_'::text) || (a.attnum)::text) || '_not_null'::text))::sql_identifier AS constraint_name,
    (((a.attname)::text || ' IS NOT NULL'::text))::character_data AS check_clause
   FROM pg_namespace n,
    pg_class r,
    pg_attribute a
  WHERE (((((((n.oid = r.relnamespace) AND (r.oid = a.attrelid)) AND (a.attnum > 0)) AND (NOT a.attisdropped)) AND a.attnotnull) AND (r.relkind = 'r'::"char")) AND pg_has_role(r.relowner, 'USAGE'::text));


ALTER TABLE check_constraints OWNER TO postgres;

--
-- Name: check_constraints; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE check_constraints FROM PUBLIC;
REVOKE ALL ON TABLE check_constraints FROM postgres;
GRANT ALL ON TABLE check_constraints TO postgres;
GRANT SELECT ON TABLE check_constraints TO PUBLIC;

