SET SCHEMA "pg_catalog";

CREATE TABLE pg_seclabel (
    objoid oid NOT NULL,
    classoid oid NOT NULL,
    objsubid integer NOT NULL,
    provider text,
    label text
);

ALTER TABLE ONLY pg_seclabel REPLICA IDENTITY NOTHING;


ALTER TABLE pg_seclabel OWNER TO postgres;

--
-- Name: pg_seclabel_object_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_seclabel_object_index ON pg_seclabel USING btree (objoid, classoid, objsubid, provider);


--
-- Name: pg_seclabel; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_seclabel FROM PUBLIC;
REVOKE ALL ON TABLE pg_seclabel FROM postgres;
GRANT SELECT ON TABLE pg_seclabel TO PUBLIC;

