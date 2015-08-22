SET SCHEMA "pg_catalog";

CREATE TABLE pg_extension (
    extname name NOT NULL,
    extowner oid NOT NULL,
    extnamespace oid NOT NULL,
    extrelocatable boolean NOT NULL,
    extversion text,
    extconfig oid[],
    extcondition text[]
);

ALTER TABLE ONLY pg_extension REPLICA IDENTITY NOTHING;


ALTER TABLE pg_extension OWNER TO postgres;

--
-- Name: pg_extension_name_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_extension_name_index ON pg_extension USING btree (extname);


--
-- Name: pg_extension_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_extension_oid_index ON pg_extension USING btree (oid);


--
-- Name: pg_extension; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_extension FROM PUBLIC;
REVOKE ALL ON TABLE pg_extension FROM postgres;
GRANT SELECT ON TABLE pg_extension TO PUBLIC;

