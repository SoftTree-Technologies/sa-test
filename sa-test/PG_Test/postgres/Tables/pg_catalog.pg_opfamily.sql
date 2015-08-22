SET SCHEMA "pg_catalog";

CREATE TABLE pg_opfamily (
    opfmethod oid NOT NULL,
    opfname name NOT NULL,
    opfnamespace oid NOT NULL,
    opfowner oid NOT NULL
);

ALTER TABLE ONLY pg_opfamily REPLICA IDENTITY NOTHING;


ALTER TABLE pg_opfamily OWNER TO postgres;

--
-- Name: pg_opfamily_am_name_nsp_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_opfamily_am_name_nsp_index ON pg_opfamily USING btree (opfmethod, opfname, opfnamespace);


--
-- Name: pg_opfamily_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_opfamily_oid_index ON pg_opfamily USING btree (oid);


--
-- Name: pg_opfamily; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_opfamily FROM PUBLIC;
REVOKE ALL ON TABLE pg_opfamily FROM postgres;
GRANT SELECT ON TABLE pg_opfamily TO PUBLIC;

