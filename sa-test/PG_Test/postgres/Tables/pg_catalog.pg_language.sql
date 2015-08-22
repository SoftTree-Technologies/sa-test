SET SCHEMA "pg_catalog";

CREATE TABLE pg_language (
    lanname name NOT NULL,
    lanowner oid NOT NULL,
    lanispl boolean NOT NULL,
    lanpltrusted boolean NOT NULL,
    lanplcallfoid oid NOT NULL,
    laninline oid NOT NULL,
    lanvalidator oid NOT NULL,
    lanacl aclitem[]
);

ALTER TABLE ONLY pg_language REPLICA IDENTITY NOTHING;


ALTER TABLE pg_language OWNER TO postgres;

--
-- Name: pg_language_name_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_language_name_index ON pg_language USING btree (lanname);


--
-- Name: pg_language_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_language_oid_index ON pg_language USING btree (oid);


--
-- Name: pg_language; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_language FROM PUBLIC;
REVOKE ALL ON TABLE pg_language FROM postgres;
GRANT SELECT ON TABLE pg_language TO PUBLIC;

