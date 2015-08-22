SET SCHEMA "pg_catalog";

CREATE TABLE pg_ts_config (
    cfgname name NOT NULL,
    cfgnamespace oid NOT NULL,
    cfgowner oid NOT NULL,
    cfgparser oid NOT NULL
);

ALTER TABLE ONLY pg_ts_config REPLICA IDENTITY NOTHING;


ALTER TABLE pg_ts_config OWNER TO postgres;

--
-- Name: pg_ts_config_cfgname_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_ts_config_cfgname_index ON pg_ts_config USING btree (cfgname, cfgnamespace);


--
-- Name: pg_ts_config_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_ts_config_oid_index ON pg_ts_config USING btree (oid);


--
-- Name: pg_ts_config; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_ts_config FROM PUBLIC;
REVOKE ALL ON TABLE pg_ts_config FROM postgres;
GRANT SELECT ON TABLE pg_ts_config TO PUBLIC;

