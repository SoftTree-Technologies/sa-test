SET SCHEMA "pg_catalog";

CREATE TABLE pg_ts_template (
    tmplname name NOT NULL,
    tmplnamespace oid NOT NULL,
    tmplinit regproc NOT NULL,
    tmpllexize regproc NOT NULL
);

ALTER TABLE ONLY pg_ts_template REPLICA IDENTITY NOTHING;


ALTER TABLE pg_ts_template OWNER TO postgres;

--
-- Name: pg_ts_template_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_ts_template_oid_index ON pg_ts_template USING btree (oid);


--
-- Name: pg_ts_template_tmplname_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_ts_template_tmplname_index ON pg_ts_template USING btree (tmplname, tmplnamespace);


--
-- Name: pg_ts_template; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_ts_template FROM PUBLIC;
REVOKE ALL ON TABLE pg_ts_template FROM postgres;
GRANT SELECT ON TABLE pg_ts_template TO PUBLIC;

