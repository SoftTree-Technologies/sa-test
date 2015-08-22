SET SCHEMA "pg_catalog";

CREATE TABLE pg_constraint (
    conname name NOT NULL,
    connamespace oid NOT NULL,
    contype "char" NOT NULL,
    condeferrable boolean NOT NULL,
    condeferred boolean NOT NULL,
    convalidated boolean NOT NULL,
    conrelid oid NOT NULL,
    contypid oid NOT NULL,
    conindid oid NOT NULL,
    confrelid oid NOT NULL,
    confupdtype "char" NOT NULL,
    confdeltype "char" NOT NULL,
    confmatchtype "char" NOT NULL,
    conislocal boolean NOT NULL,
    coninhcount integer NOT NULL,
    connoinherit boolean NOT NULL,
    conkey smallint[],
    confkey smallint[],
    conpfeqop oid[],
    conppeqop oid[],
    conffeqop oid[],
    conexclop oid[],
    conbin pg_node_tree,
    consrc text
);

ALTER TABLE ONLY pg_constraint REPLICA IDENTITY NOTHING;


ALTER TABLE pg_constraint OWNER TO postgres;

--
-- Name: pg_constraint_conname_nsp_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE INDEX pg_constraint_conname_nsp_index ON pg_constraint USING btree (conname, connamespace);


--
-- Name: pg_constraint_conrelid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE INDEX pg_constraint_conrelid_index ON pg_constraint USING btree (conrelid);


--
-- Name: pg_constraint_contypid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE INDEX pg_constraint_contypid_index ON pg_constraint USING btree (contypid);


--
-- Name: pg_constraint_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_constraint_oid_index ON pg_constraint USING btree (oid);


--
-- Name: pg_constraint; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_constraint FROM PUBLIC;
REVOKE ALL ON TABLE pg_constraint FROM postgres;
GRANT SELECT ON TABLE pg_constraint TO PUBLIC;

