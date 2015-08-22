SET SCHEMA "pg_catalog";

CREATE TABLE pg_class (
    relname name NOT NULL,
    relnamespace oid NOT NULL,
    reltype oid NOT NULL,
    reloftype oid NOT NULL,
    relowner oid NOT NULL,
    relam oid NOT NULL,
    relfilenode oid NOT NULL,
    reltablespace oid NOT NULL,
    relpages integer NOT NULL,
    reltuples real NOT NULL,
    relallvisible integer NOT NULL,
    reltoastrelid oid NOT NULL,
    relhasindex boolean NOT NULL,
    relisshared boolean NOT NULL,
    relpersistence "char" NOT NULL,
    relkind "char" NOT NULL,
    relnatts smallint NOT NULL,
    relchecks smallint NOT NULL,
    relhasoids boolean NOT NULL,
    relhaspkey boolean NOT NULL,
    relhasrules boolean NOT NULL,
    relhastriggers boolean NOT NULL,
    relhassubclass boolean NOT NULL,
    relispopulated boolean NOT NULL,
    relreplident "char" NOT NULL,
    relfrozenxid xid NOT NULL,
    relminmxid xid NOT NULL,
    relacl aclitem[],
    reloptions text[]
);

ALTER TABLE ONLY pg_class REPLICA IDENTITY NOTHING;


ALTER TABLE pg_class OWNER TO postgres;

--
-- Name: pg_class_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_class_oid_index ON pg_class USING btree (oid);


--
-- Name: pg_class_relname_nsp_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_class_relname_nsp_index ON pg_class USING btree (relname, relnamespace);


--
-- Name: pg_class_tblspc_relfilenode_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE INDEX pg_class_tblspc_relfilenode_index ON pg_class USING btree (reltablespace, relfilenode);


--
-- Name: pg_class; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_class FROM PUBLIC;
REVOKE ALL ON TABLE pg_class FROM postgres;
GRANT SELECT ON TABLE pg_class TO PUBLIC;

