SET SCHEMA "pg_catalog";

CREATE TABLE pg_conversion (
    conname name NOT NULL,
    connamespace oid NOT NULL,
    conowner oid NOT NULL,
    conforencoding integer NOT NULL,
    contoencoding integer NOT NULL,
    conproc regproc NOT NULL,
    condefault boolean NOT NULL
);

ALTER TABLE ONLY pg_conversion REPLICA IDENTITY NOTHING;


ALTER TABLE pg_conversion OWNER TO postgres;

--
-- Name: pg_conversion_default_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_conversion_default_index ON pg_conversion USING btree (connamespace, conforencoding, contoencoding, oid);


--
-- Name: pg_conversion_name_nsp_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_conversion_name_nsp_index ON pg_conversion USING btree (conname, connamespace);


--
-- Name: pg_conversion_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_conversion_oid_index ON pg_conversion USING btree (oid);


--
-- Name: pg_conversion; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_conversion FROM PUBLIC;
REVOKE ALL ON TABLE pg_conversion FROM postgres;
GRANT SELECT ON TABLE pg_conversion TO PUBLIC;

