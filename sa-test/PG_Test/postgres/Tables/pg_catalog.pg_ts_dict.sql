SET SCHEMA "pg_catalog";

CREATE TABLE pg_ts_dict (
    dictname name NOT NULL,
    dictnamespace oid NOT NULL,
    dictowner oid NOT NULL,
    dicttemplate oid NOT NULL,
    dictinitoption text
);

ALTER TABLE ONLY pg_ts_dict REPLICA IDENTITY NOTHING;


ALTER TABLE pg_ts_dict OWNER TO postgres;

--
-- Name: pg_ts_dict_dictname_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_ts_dict_dictname_index ON pg_ts_dict USING btree (dictname, dictnamespace);


--
-- Name: pg_ts_dict_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_ts_dict_oid_index ON pg_ts_dict USING btree (oid);


--
-- Name: pg_ts_dict; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_ts_dict FROM PUBLIC;
REVOKE ALL ON TABLE pg_ts_dict FROM postgres;
GRANT SELECT ON TABLE pg_ts_dict TO PUBLIC;

