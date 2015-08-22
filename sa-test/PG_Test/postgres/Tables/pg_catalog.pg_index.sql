SET SCHEMA "pg_catalog";

CREATE TABLE pg_index (
    indexrelid oid NOT NULL,
    indrelid oid NOT NULL,
    indnatts smallint NOT NULL,
    indisunique boolean NOT NULL,
    indisprimary boolean NOT NULL,
    indisexclusion boolean NOT NULL,
    indimmediate boolean NOT NULL,
    indisclustered boolean NOT NULL,
    indisvalid boolean NOT NULL,
    indcheckxmin boolean NOT NULL,
    indisready boolean NOT NULL,
    indislive boolean NOT NULL,
    indisreplident boolean NOT NULL,
    indkey int2vector NOT NULL,
    indcollation oidvector NOT NULL,
    indclass oidvector NOT NULL,
    indoption int2vector NOT NULL,
    indexprs pg_node_tree,
    indpred pg_node_tree
);

ALTER TABLE ONLY pg_index REPLICA IDENTITY NOTHING;


ALTER TABLE pg_index OWNER TO postgres;

--
-- Name: pg_index_indexrelid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_index_indexrelid_index ON pg_index USING btree (indexrelid);


--
-- Name: pg_index_indrelid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE INDEX pg_index_indrelid_index ON pg_index USING btree (indrelid);


--
-- Name: pg_index; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_index FROM PUBLIC;
REVOKE ALL ON TABLE pg_index FROM postgres;
GRANT SELECT ON TABLE pg_index TO PUBLIC;

