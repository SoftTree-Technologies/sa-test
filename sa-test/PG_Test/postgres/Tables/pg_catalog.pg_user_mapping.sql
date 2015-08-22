SET SCHEMA "pg_catalog";

CREATE TABLE pg_user_mapping (
    umuser oid NOT NULL,
    umserver oid NOT NULL,
    umoptions text[]
);

ALTER TABLE ONLY pg_user_mapping REPLICA IDENTITY NOTHING;


ALTER TABLE pg_user_mapping OWNER TO postgres;

--
-- Name: pg_user_mapping_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_user_mapping_oid_index ON pg_user_mapping USING btree (oid);


--
-- Name: pg_user_mapping_user_server_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_user_mapping_user_server_index ON pg_user_mapping USING btree (umuser, umserver);


--
-- Name: pg_user_mapping; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_user_mapping FROM PUBLIC;
REVOKE ALL ON TABLE pg_user_mapping FROM postgres;
GRANT ALL ON TABLE pg_user_mapping TO postgres;

