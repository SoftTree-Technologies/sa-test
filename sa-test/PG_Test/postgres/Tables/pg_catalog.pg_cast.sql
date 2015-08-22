SET SCHEMA "pg_catalog";

CREATE TABLE pg_cast (
    castsource oid NOT NULL,
    casttarget oid NOT NULL,
    castfunc oid NOT NULL,
    castcontext "char" NOT NULL,
    castmethod "char" NOT NULL
);

ALTER TABLE ONLY pg_cast REPLICA IDENTITY NOTHING;


ALTER TABLE pg_cast OWNER TO postgres;

--
-- Name: pg_cast_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_cast_oid_index ON pg_cast USING btree (oid);


--
-- Name: pg_cast_source_target_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_cast_source_target_index ON pg_cast USING btree (castsource, casttarget);


--
-- Name: pg_cast; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_cast FROM PUBLIC;
REVOKE ALL ON TABLE pg_cast FROM postgres;
GRANT SELECT ON TABLE pg_cast TO PUBLIC;

