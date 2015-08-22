SET SCHEMA "pg_catalog";

CREATE TABLE pg_attrdef (
    adrelid oid NOT NULL,
    adnum smallint NOT NULL,
    adbin pg_node_tree,
    adsrc text
);

ALTER TABLE ONLY pg_attrdef REPLICA IDENTITY NOTHING;


ALTER TABLE pg_attrdef OWNER TO postgres;

--
-- Name: pg_attrdef_adrelid_adnum_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_attrdef_adrelid_adnum_index ON pg_attrdef USING btree (adrelid, adnum);


--
-- Name: pg_attrdef_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_attrdef_oid_index ON pg_attrdef USING btree (oid);


--
-- Name: pg_attrdef; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_attrdef FROM PUBLIC;
REVOKE ALL ON TABLE pg_attrdef FROM postgres;
GRANT SELECT ON TABLE pg_attrdef TO PUBLIC;

