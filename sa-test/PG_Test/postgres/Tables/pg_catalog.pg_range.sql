SET SCHEMA "pg_catalog";

CREATE TABLE pg_range (
    rngtypid oid NOT NULL,
    rngsubtype oid NOT NULL,
    rngcollation oid NOT NULL,
    rngsubopc oid NOT NULL,
    rngcanonical regproc NOT NULL,
    rngsubdiff regproc NOT NULL
);

ALTER TABLE ONLY pg_range REPLICA IDENTITY NOTHING;


ALTER TABLE pg_range OWNER TO postgres;

--
-- Name: pg_range_rngtypid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_range_rngtypid_index ON pg_range USING btree (rngtypid);


--
-- Name: pg_range; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_range FROM PUBLIC;
REVOKE ALL ON TABLE pg_range FROM postgres;
GRANT SELECT ON TABLE pg_range TO PUBLIC;

