SET SCHEMA "pg_catalog";

CREATE TABLE pg_description (
    objoid oid NOT NULL,
    classoid oid NOT NULL,
    objsubid integer NOT NULL,
    description text
);

ALTER TABLE ONLY pg_description REPLICA IDENTITY NOTHING;


ALTER TABLE pg_description OWNER TO postgres;

--
-- Name: pg_description_o_c_o_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_description_o_c_o_index ON pg_description USING btree (objoid, classoid, objsubid);


--
-- Name: pg_description; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_description FROM PUBLIC;
REVOKE ALL ON TABLE pg_description FROM postgres;
GRANT SELECT ON TABLE pg_description TO PUBLIC;

