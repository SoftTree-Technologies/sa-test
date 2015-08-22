SET SCHEMA "pg_catalog";

CREATE TABLE pg_foreign_table (
    ftrelid oid NOT NULL,
    ftserver oid NOT NULL,
    ftoptions text[]
);

ALTER TABLE ONLY pg_foreign_table REPLICA IDENTITY NOTHING;


ALTER TABLE pg_foreign_table OWNER TO postgres;

--
-- Name: pg_foreign_table_relid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_foreign_table_relid_index ON pg_foreign_table USING btree (ftrelid);


--
-- Name: pg_foreign_table; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_foreign_table FROM PUBLIC;
REVOKE ALL ON TABLE pg_foreign_table FROM postgres;
GRANT SELECT ON TABLE pg_foreign_table TO PUBLIC;

