SET SCHEMA "pg_catalog";

CREATE TABLE pg_largeobject (
    loid oid NOT NULL,
    pageno integer NOT NULL,
    data bytea
);

ALTER TABLE ONLY pg_largeobject REPLICA IDENTITY NOTHING;


ALTER TABLE pg_largeobject OWNER TO postgres;

--
-- Name: pg_largeobject_loid_pn_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_largeobject_loid_pn_index ON pg_largeobject USING btree (loid, pageno);


--
-- Name: pg_largeobject; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_largeobject FROM PUBLIC;
REVOKE ALL ON TABLE pg_largeobject FROM postgres;

