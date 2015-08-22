SET SCHEMA "pg_catalog";

CREATE VIEW pg_stat_user_functions AS
 SELECT p.oid AS funcid,
    n.nspname AS schemaname,
    p.proname AS funcname,
    pg_stat_get_function_calls(p.oid) AS calls,
    pg_stat_get_function_total_time(p.oid) AS total_time,
    pg_stat_get_function_self_time(p.oid) AS self_time
   FROM (pg_proc p
     LEFT JOIN pg_namespace n ON ((n.oid = p.pronamespace)))
  WHERE ((p.prolang <> (12)::oid) AND (pg_stat_get_function_calls(p.oid) IS NOT NULL));


ALTER TABLE pg_stat_user_functions OWNER TO postgres;

--
-- Name: pg_stat_user_functions; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_stat_user_functions FROM PUBLIC;
REVOKE ALL ON TABLE pg_stat_user_functions FROM postgres;
GRANT SELECT ON TABLE pg_stat_user_functions TO PUBLIC;

