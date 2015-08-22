SET SCHEMA "pg_catalog";

CREATE TABLE pg_largeobject_metadata (
    lomowner oid NOT NULL,
    lomacl aclitem[]
);

ALTER TABLE ONLY pg_largeobject_metadata REPLICA IDENTITY NOTHING;


ALTER TABLE pg_largeobject_metadata OWNER TO postgres;

--
-- Name: pg_largeobject_metadata_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_largeobject_metadata_oid_index ON pg_largeobject_metadata USING btree (oid);


--
-- Name: pg_largeobject_metadata; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_largeobject_metadata FROM PUBLIC;
REVOKE ALL ON TABLE pg_largeobject_metadata FROM postgres;
GRANT SELECT ON TABLE pg_largeobject_metadata TO PUBLIC;

