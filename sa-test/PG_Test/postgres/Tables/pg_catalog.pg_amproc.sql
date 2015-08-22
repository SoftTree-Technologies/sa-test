SET SCHEMA "pg_catalog";

CREATE TABLE pg_amproc (
    amprocfamily oid NOT NULL,
    amproclefttype oid NOT NULL,
    amprocrighttype oid NOT NULL,
    amprocnum smallint NOT NULL,
    amproc regproc NOT NULL
);

ALTER TABLE ONLY pg_amproc REPLICA IDENTITY NOTHING;


ALTER TABLE pg_amproc OWNER TO postgres;

--
-- Name: pg_amproc_fam_proc_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_amproc_fam_proc_index ON pg_amproc USING btree (amprocfamily, amproclefttype, amprocrighttype, amprocnum);


--
-- Name: pg_amproc_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_amproc_oid_index ON pg_amproc USING btree (oid);


--
-- Name: pg_amproc; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_amproc FROM PUBLIC;
REVOKE ALL ON TABLE pg_amproc FROM postgres;
GRANT SELECT ON TABLE pg_amproc TO PUBLIC;

