SET SCHEMA "pg_catalog";

CREATE TABLE pg_database (
    datname name NOT NULL,
    datdba oid NOT NULL,
    encoding integer NOT NULL,
    datcollate name NOT NULL,
    datctype name NOT NULL,
    datistemplate boolean NOT NULL,
    datallowconn boolean NOT NULL,
    datconnlimit integer NOT NULL,
    datlastsysoid oid NOT NULL,
    datfrozenxid xid NOT NULL,
    datminmxid xid NOT NULL,
    dattablespace oid NOT NULL,
    datacl aclitem[]
);

ALTER TABLE ONLY pg_database REPLICA IDENTITY NOTHING;


ALTER TABLE pg_database OWNER TO postgres;

--
-- Name: pg_database_datname_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: pg_global
--

CREATE UNIQUE INDEX pg_database_datname_index ON pg_database USING btree (datname);


--
-- Name: pg_database_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: pg_global
--

CREATE UNIQUE INDEX pg_database_oid_index ON pg_database USING btree (oid);


--
-- Name: pg_database; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_database FROM PUBLIC;
REVOKE ALL ON TABLE pg_database FROM postgres;
GRANT SELECT ON TABLE pg_database TO PUBLIC;

