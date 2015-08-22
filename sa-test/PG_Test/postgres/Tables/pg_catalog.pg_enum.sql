SET SCHEMA "pg_catalog";

CREATE TABLE pg_enum (
    enumtypid oid NOT NULL,
    enumsortorder real NOT NULL,
    enumlabel name NOT NULL
);

ALTER TABLE ONLY pg_enum REPLICA IDENTITY NOTHING;


ALTER TABLE pg_enum OWNER TO postgres;

--
-- Name: pg_enum_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_enum_oid_index ON pg_enum USING btree (oid);


--
-- Name: pg_enum_typid_label_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_enum_typid_label_index ON pg_enum USING btree (enumtypid, enumlabel);


--
-- Name: pg_enum_typid_sortorder_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_enum_typid_sortorder_index ON pg_enum USING btree (enumtypid, enumsortorder);


--
-- Name: pg_enum; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_enum FROM PUBLIC;
REVOKE ALL ON TABLE pg_enum FROM postgres;
GRANT SELECT ON TABLE pg_enum TO PUBLIC;

