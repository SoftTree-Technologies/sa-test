SET SCHEMA "information_schema";

CREATE VIEW key_column_usage AS
 SELECT (current_database())::sql_identifier AS constraint_catalog,
    (ss.nc_nspname)::sql_identifier AS constraint_schema,
    (ss.conname)::sql_identifier AS constraint_name,
    (current_database())::sql_identifier AS table_catalog,
    (ss.nr_nspname)::sql_identifier AS table_schema,
    (ss.relname)::sql_identifier AS table_name,
    (a.attname)::sql_identifier AS column_name,
    ((ss.x).n)::cardinal_number AS ordinal_position,
    (
        CASE
            WHEN (ss.contype = 'f'::"char") THEN _pg_index_position(ss.conindid, ss.confkey[(ss.x).n])
            ELSE NULL::integer
        END)::cardinal_number AS position_in_unique_constraint
   FROM pg_attribute a,
    ( SELECT r.oid AS roid,
            r.relname,
            r.relowner,
            nc.nspname AS nc_nspname,
            nr.nspname AS nr_nspname,
            c.oid AS coid,
            c.conname,
            c.contype,
            c.conindid,
            c.confkey,
            c.confrelid,
            _pg_expandarray(c.conkey) AS x
           FROM pg_namespace nr,
            pg_class r,
            pg_namespace nc,
            pg_constraint c
          WHERE ((((((nr.oid = r.relnamespace) AND (r.oid = c.conrelid)) AND (nc.oid = c.connamespace)) AND (c.contype = ANY (ARRAY['p'::"char", 'u'::"char", 'f'::"char"]))) AND (r.relkind = 'r'::"char")) AND (NOT pg_is_other_temp_schema(nr.oid)))) ss
  WHERE ((((ss.roid = a.attrelid) AND (a.attnum = (ss.x).x)) AND (NOT a.attisdropped)) AND (pg_has_role(ss.relowner, 'USAGE'::text) OR has_column_privilege(ss.roid, a.attnum, 'SELECT, INSERT, UPDATE, REFERENCES'::text)));


ALTER TABLE key_column_usage OWNER TO postgres;

--
-- Name: key_column_usage; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE key_column_usage FROM PUBLIC;
REVOKE ALL ON TABLE key_column_usage FROM postgres;
GRANT ALL ON TABLE key_column_usage TO postgres;
GRANT SELECT ON TABLE key_column_usage TO PUBLIC;

