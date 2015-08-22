SET SCHEMA "pg_catalog";

CREATE TABLE pg_tablespace (
    spcname name NOT NULL,
    spcowner oid NOT NULL,
    spcacl aclitem[],
    spcoptions text[]
);

ALTER TABLE ONLY pg_tablespace REPLICA IDENTITY NOTHING;


ALTER TABLE pg_tablespace OWNER TO postgres;

--
-- Name: pg_tablespace_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: pg_global
--

CREATE UNIQUE INDEX pg_tablespace_oid_index ON pg_tablespace USING btree (oid);


--
-- Name: pg_tablespace_spcname_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: pg_global
--

CREATE UNIQUE INDEX pg_tablespace_spcname_index ON pg_tablespace USING btree (spcname);


--
-- Name: pg_tablespace; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_tablespace FROM PUBLIC;
REVOKE ALL ON TABLE pg_tablespace FROM postgres;
GRANT SELECT ON TABLE pg_tablespace TO PUBLIC;

