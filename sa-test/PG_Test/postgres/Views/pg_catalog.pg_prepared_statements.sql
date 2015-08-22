SET SCHEMA "pg_catalog";

CREATE VIEW pg_prepared_statements AS
 SELECT p.name,
    p.statement,
    p.prepare_time,
    p.parameter_types,
    p.from_sql
   FROM pg_prepared_statement() p(name, statement, prepare_time, parameter_types, from_sql);


ALTER TABLE pg_prepared_statements OWNER TO postgres;

--
-- Name: pg_prepared_statements; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_prepared_statements FROM PUBLIC;
REVOKE ALL ON TABLE pg_prepared_statements FROM postgres;
GRANT SELECT ON TABLE pg_prepared_statements TO PUBLIC;

