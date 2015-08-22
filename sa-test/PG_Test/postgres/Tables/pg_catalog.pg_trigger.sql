SET SCHEMA "pg_catalog";

CREATE TABLE pg_trigger (
    tgrelid oid NOT NULL,
    tgname name NOT NULL,
    tgfoid oid NOT NULL,
    tgtype smallint NOT NULL,
    tgenabled "char" NOT NULL,
    tgisinternal boolean NOT NULL,
    tgconstrrelid oid NOT NULL,
    tgconstrindid oid NOT NULL,
    tgconstraint oid NOT NULL,
    tgdeferrable boolean NOT NULL,
    tginitdeferred boolean NOT NULL,
    tgnargs smallint NOT NULL,
    tgattr int2vector NOT NULL,
    tgargs bytea,
    tgqual pg_node_tree
);

ALTER TABLE ONLY pg_trigger REPLICA IDENTITY NOTHING;


ALTER TABLE pg_trigger OWNER TO postgres;

--
-- Name: pg_trigger_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_trigger_oid_index ON pg_trigger USING btree (oid);


--
-- Name: pg_trigger_tgconstraint_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE INDEX pg_trigger_tgconstraint_index ON pg_trigger USING btree (tgconstraint);


--
-- Name: pg_trigger_tgrelid_tgname_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_trigger_tgrelid_tgname_index ON pg_trigger USING btree (tgrelid, tgname);


--
-- Name: pg_trigger; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_trigger FROM PUBLIC;
REVOKE ALL ON TABLE pg_trigger FROM postgres;
GRANT SELECT ON TABLE pg_trigger TO PUBLIC;

