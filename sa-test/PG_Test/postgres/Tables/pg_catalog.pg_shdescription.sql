SET SCHEMA "pg_catalog";

CREATE TABLE pg_shdescription (
    objoid oid NOT NULL,
    classoid oid NOT NULL,
    description text
);

ALTER TABLE ONLY pg_shdescription REPLICA IDENTITY NOTHING;


ALTER TABLE pg_shdescription OWNER TO postgres;

--
-- Name: pg_shdescription_o_c_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: pg_global
--

CREATE UNIQUE INDEX pg_shdescription_o_c_index ON pg_shdescription USING btree (objoid, classoid);


--
-- Name: pg_shdescription; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_shdescription FROM PUBLIC;
REVOKE ALL ON TABLE pg_shdescription FROM postgres;
GRANT SELECT ON TABLE pg_shdescription TO PUBLIC;

