SET SCHEMA "pg_catalog";

CREATE TABLE pg_shseclabel (
    objoid oid NOT NULL,
    classoid oid NOT NULL,
    provider text,
    label text
);

ALTER TABLE ONLY pg_shseclabel REPLICA IDENTITY NOTHING;


ALTER TABLE pg_shseclabel OWNER TO postgres;

--
-- Name: pg_shseclabel_object_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: pg_global
--

CREATE UNIQUE INDEX pg_shseclabel_object_index ON pg_shseclabel USING btree (objoid, classoid, provider);


--
-- Name: pg_shseclabel; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_shseclabel FROM PUBLIC;
REVOKE ALL ON TABLE pg_shseclabel FROM postgres;
GRANT SELECT ON TABLE pg_shseclabel TO PUBLIC;

