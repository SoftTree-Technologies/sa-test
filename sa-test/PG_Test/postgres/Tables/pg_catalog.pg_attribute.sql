SET SCHEMA "pg_catalog";

CREATE TABLE pg_attribute (
    attrelid oid NOT NULL,
    attname name NOT NULL,
    atttypid oid NOT NULL,
    attstattarget integer NOT NULL,
    attlen smallint NOT NULL,
    attnum smallint NOT NULL,
    attndims integer NOT NULL,
    attcacheoff integer NOT NULL,
    atttypmod integer NOT NULL,
    attbyval boolean NOT NULL,
    attstorage "char" NOT NULL,
    attalign "char" NOT NULL,
    attnotnull boolean NOT NULL,
    atthasdef boolean NOT NULL,
    attisdropped boolean NOT NULL,
    attislocal boolean NOT NULL,
    attinhcount integer NOT NULL,
    attcollation oid NOT NULL,
    attacl aclitem[],
    attoptions text[],
    attfdwoptions text[]
);

ALTER TABLE ONLY pg_attribute REPLICA IDENTITY NOTHING;


ALTER TABLE pg_attribute OWNER TO postgres;

--
-- Name: pg_attribute_relid_attnam_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_attribute_relid_attnam_index ON pg_attribute USING btree (attrelid, attname);


--
-- Name: pg_attribute_relid_attnum_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_attribute_relid_attnum_index ON pg_attribute USING btree (attrelid, attnum);


--
-- Name: pg_attribute; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_attribute FROM PUBLIC;
REVOKE ALL ON TABLE pg_attribute FROM postgres;
GRANT SELECT ON TABLE pg_attribute TO PUBLIC;

