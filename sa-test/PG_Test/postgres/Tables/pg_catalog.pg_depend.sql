SET SCHEMA "pg_catalog";

CREATE TABLE pg_depend (
    classid oid NOT NULL,
    objid oid NOT NULL,
    objsubid integer NOT NULL,
    refclassid oid NOT NULL,
    refobjid oid NOT NULL,
    refobjsubid integer NOT NULL,
    deptype "char" NOT NULL
);

ALTER TABLE ONLY pg_depend REPLICA IDENTITY NOTHING;


ALTER TABLE pg_depend OWNER TO postgres;

--
-- Name: pg_depend_depender_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE INDEX pg_depend_depender_index ON pg_depend USING btree (classid, objid, objsubid);


--
-- Name: pg_depend_reference_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE INDEX pg_depend_reference_index ON pg_depend USING btree (refclassid, refobjid, refobjsubid);


--
-- Name: pg_depend; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_depend FROM PUBLIC;
REVOKE ALL ON TABLE pg_depend FROM postgres;
GRANT SELECT ON TABLE pg_depend TO PUBLIC;

