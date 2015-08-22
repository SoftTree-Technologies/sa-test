SET SCHEMA "pg_catalog";

CREATE TABLE pg_ts_config_map (
    mapcfg oid NOT NULL,
    maptokentype integer NOT NULL,
    mapseqno integer NOT NULL,
    mapdict oid NOT NULL
);

ALTER TABLE ONLY pg_ts_config_map REPLICA IDENTITY NOTHING;


ALTER TABLE pg_ts_config_map OWNER TO postgres;

--
-- Name: pg_ts_config_map_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_ts_config_map_index ON pg_ts_config_map USING btree (mapcfg, maptokentype, mapseqno);


--
-- Name: pg_ts_config_map; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_ts_config_map FROM PUBLIC;
REVOKE ALL ON TABLE pg_ts_config_map FROM postgres;
GRANT SELECT ON TABLE pg_ts_config_map TO PUBLIC;

