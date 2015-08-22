SET SCHEMA "pg_catalog";

CREATE TABLE pg_opclass (
    opcmethod oid NOT NULL,
    opcname name NOT NULL,
    opcnamespace oid NOT NULL,
    opcowner oid NOT NULL,
    opcfamily oid NOT NULL,
    opcintype oid NOT NULL,
    opcdefault boolean NOT NULL,
    opckeytype oid NOT NULL
);

ALTER TABLE ONLY pg_opclass REPLICA IDENTITY NOTHING;


ALTER TABLE pg_opclass OWNER TO postgres;

--
-- Name: pg_opclass_am_name_nsp_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_opclass_am_name_nsp_index ON pg_opclass USING btree (opcmethod, opcname, opcnamespace);


--
-- Name: pg_opclass_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_opclass_oid_index ON pg_opclass USING btree (oid);


--
-- Name: pg_opclass; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_opclass FROM PUBLIC;
REVOKE ALL ON TABLE pg_opclass FROM postgres;
GRANT SELECT ON TABLE pg_opclass TO PUBLIC;

