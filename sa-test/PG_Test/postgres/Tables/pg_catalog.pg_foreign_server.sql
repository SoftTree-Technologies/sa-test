SET SCHEMA "pg_catalog";

CREATE TABLE pg_foreign_server (
    srvname name NOT NULL,
    srvowner oid NOT NULL,
    srvfdw oid NOT NULL,
    srvtype text,
    srvversion text,
    srvacl aclitem[],
    srvoptions text[]
);

ALTER TABLE ONLY pg_foreign_server REPLICA IDENTITY NOTHING;


ALTER TABLE pg_foreign_server OWNER TO postgres;

--
-- Name: pg_foreign_server_name_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_foreign_server_name_index ON pg_foreign_server USING btree (srvname);


--
-- Name: pg_foreign_server_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_foreign_server_oid_index ON pg_foreign_server USING btree (oid);


--
-- Name: pg_foreign_server; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_foreign_server FROM PUBLIC;
REVOKE ALL ON TABLE pg_foreign_server FROM postgres;
GRANT SELECT ON TABLE pg_foreign_server TO PUBLIC;

