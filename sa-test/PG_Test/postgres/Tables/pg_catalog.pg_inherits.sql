SET SCHEMA "pg_catalog";

CREATE TABLE pg_inherits (
    inhrelid oid NOT NULL,
    inhparent oid NOT NULL,
    inhseqno integer NOT NULL
);

ALTER TABLE ONLY pg_inherits REPLICA IDENTITY NOTHING;


ALTER TABLE pg_inherits OWNER TO postgres;

--
-- Name: pg_inherits_parent_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE INDEX pg_inherits_parent_index ON pg_inherits USING btree (inhparent);


--
-- Name: pg_inherits_relid_seqno_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_inherits_relid_seqno_index ON pg_inherits USING btree (inhrelid, inhseqno);


--
-- Name: pg_inherits; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_inherits FROM PUBLIC;
REVOKE ALL ON TABLE pg_inherits FROM postgres;
GRANT SELECT ON TABLE pg_inherits TO PUBLIC;

