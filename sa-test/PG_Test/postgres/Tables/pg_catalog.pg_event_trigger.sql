SET SCHEMA "pg_catalog";

CREATE TABLE pg_event_trigger (
    evtname name NOT NULL,
    evtevent name NOT NULL,
    evtowner oid NOT NULL,
    evtfoid oid NOT NULL,
    evtenabled "char" NOT NULL,
    evttags text[]
);

ALTER TABLE ONLY pg_event_trigger REPLICA IDENTITY NOTHING;


ALTER TABLE pg_event_trigger OWNER TO postgres;

--
-- Name: pg_event_trigger_evtname_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_event_trigger_evtname_index ON pg_event_trigger USING btree (evtname);


--
-- Name: pg_event_trigger_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_event_trigger_oid_index ON pg_event_trigger USING btree (oid);


--
-- Name: pg_event_trigger; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_event_trigger FROM PUBLIC;
REVOKE ALL ON TABLE pg_event_trigger FROM postgres;
GRANT SELECT ON TABLE pg_event_trigger TO PUBLIC;

