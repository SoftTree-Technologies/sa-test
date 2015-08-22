SET SCHEMA "pg_catalog";

CREATE TABLE pg_foreign_data_wrapper (
    fdwname name NOT NULL,
    fdwowner oid NOT NULL,
    fdwhandler oid NOT NULL,
    fdwvalidator oid NOT NULL,
    fdwacl aclitem[],
    fdwoptions text[]
);

ALTER TABLE ONLY pg_foreign_data_wrapper REPLICA IDENTITY NOTHING;


ALTER TABLE pg_foreign_data_wrapper OWNER TO postgres;

--
-- Name: pg_foreign_data_wrapper_name_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_foreign_data_wrapper_name_index ON pg_foreign_data_wrapper USING btree (fdwname);


--
-- Name: pg_foreign_data_wrapper_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_foreign_data_wrapper_oid_index ON pg_foreign_data_wrapper USING btree (oid);


--
-- Name: pg_foreign_data_wrapper; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_foreign_data_wrapper FROM PUBLIC;
REVOKE ALL ON TABLE pg_foreign_data_wrapper FROM postgres;
GRANT SELECT ON TABLE pg_foreign_data_wrapper TO PUBLIC;

