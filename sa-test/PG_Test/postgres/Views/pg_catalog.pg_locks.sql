SET SCHEMA "pg_catalog";

CREATE VIEW pg_locks AS
 SELECT l.locktype,
    l.database,
    l.relation,
    l.page,
    l.tuple,
    l.virtualxid,
    l.transactionid,
    l.classid,
    l.objid,
    l.objsubid,
    l.virtualtransaction--
-- Name: pg_settings_n; Type: RULE; Schema: pg_catalog; Owner: postgres
--

CREATE RULE pg_settings_n AS
    ON UPDATE TO pg_settings DO INSTEAD NOTHING;


--
-- Name: pg_settings_u; Type: RULid, mode, granted, fastpath);


ALTER TABLE pg_locks OWNER TO postgres;

--
-- Name: pg_locks; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_locks FROM PUBLIC;
REVOKE ALL ON TABLE pg_locks FROM postgres;
GRANT SELECT ON TABLE pg_locks TO PUBLIC;

