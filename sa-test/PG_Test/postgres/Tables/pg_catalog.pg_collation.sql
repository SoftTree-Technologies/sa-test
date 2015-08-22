SET SCHEMA "pg_catalog";

CREATE TABLE pg_collation (
    collname name NOT NULL,
    collnamespace oid NOT NULL,
    collowner oid NOT NULL,
    collencoding integer NOT NULL,
    collcollate name NOT NULL,
    collctype name NOT NULL
);

ALTER TABLE ONLY pg_collation REPLICA IDENTITY NOTHING;


ALTER TABLE pg_collation OWNER TO postgres;

--
-- Name: pg_collation_name_enc_nsp_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_collation_name_enc_nsp_index ON pg_collation USING btree (collname, collencoding, collnamespace);


--
-- Name: pg_collation_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_collation_oid_index ON pg_collation USING btree (oid);


--
-- Name: pg_collation; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_collation FROM PUBLIC;
REVOKE ALL ON TABLE pg_collation FROM postgres;
GRANT SELECT ON TABLE pg_collation TO PUBLIC;

