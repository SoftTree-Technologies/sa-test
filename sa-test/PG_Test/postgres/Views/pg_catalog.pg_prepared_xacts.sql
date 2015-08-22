SET SCHEMA "pg_catalog";

CREATE VIEW pg_prepared_xacts AS
 SELECT p.transaction,
    p.gid,
    p.prepared,
    u.rolname AS owner,
    d.datname AS database
   FROM ((pg_prepared_xact() p(transaction, gid, prepared, ownerid, dbid)
     LEFT JOIN pg_authid u ON ((p.ownerid = u.oid)))
     LEFT JOIN pg_database d ON ((p.dbid = d.oid)));


ALTER TABLE pg_prepared_xacts OWNER TO postgres;

--
-- Name: pg_prepared_xacts; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_prepared_xacts FROM PUBLIC;
REVOKE ALL ON TABLE pg_prepared_xacts FROM postgres;
GRANT SELECT ON TABLE pg_prepared_xacts TO PUBLIC;

