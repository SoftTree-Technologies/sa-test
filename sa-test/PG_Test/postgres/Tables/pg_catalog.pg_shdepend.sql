SET SCHEMA "pg_catalog";

CREATE TABLE pg_shdepend (
    dbid oid NOT NULL,
    classid oid NOT NULL,
    objid oid NOT NULL,
    objsubid integer NOT NULL,
    refclassid oid NOT NULL,
    refobjid oid NOT NULL,
    deptype "char" NOT NULL
);

ALTER TABLE ONLY pg_shdepend REPLICA IDENTITY NOTHING;


ALTER TABLE pg_shdepend OWNER TO postgres;

--
-- Name: pg_shdepend_depender_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: pg_global
--

CREATE INDEX pg_shdepend_depender_index ON pg_shdepend USING btree (dbid, classid, objid, objsubid);


--
-- Name: pg_shdepend_reference_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: pg_global
--

CREATE INDEX pg_shdepend_reference_index ON pg_shdepend USING btree (refclassid, refobjid);


--
-- Name: pg_shdepend; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_shdepend FROM PUBLIC;
REVOKE ALL ON TABLE pg_shdepend FROM postgres;
GRANT SELECT ON TABLE pg_shdepend TO PUBLIC;

