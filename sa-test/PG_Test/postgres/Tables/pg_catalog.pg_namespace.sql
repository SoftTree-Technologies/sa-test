SET SCHEMA "pg_catalog";

CREATE TABLE pg_namespace (
    nspname name NOT NULL,
    nspowner oid NOT NULL,
    nspacl aclitem[]
);

ALTER TABLE ONLY pg_namespace REPLICA IDENTITY NOTHING;


ALTER TABLE pg_namespace OWNER TO postgres;

--
-- Name: pg_namespace_nspname_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_namespace_nspname_index ON pg_namespace USING btree (nspname);


--
-- Name: pg_namespace_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_namespace_oid_index ON pg_namespace USING btree (oid);


--
-- Name: pg_namespace; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_namespace FROM PUBLIC;
REVOKE ALL ON TABLE pg_namespace FROM postgres;
GRANT SELECT ON TABLE pg_namespace TO PUBLIC;

