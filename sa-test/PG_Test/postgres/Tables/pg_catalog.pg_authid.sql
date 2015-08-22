SET SCHEMA "pg_catalog";

CREATE TABLE pg_authid (
    rolname name NOT NULL,
    rolsuper boolean NOT NULL,
    rolinherit boolean NOT NULL,
    rolcreaterole boolean NOT NULL,
    rolcreatedb boolean NOT NULL,
    rolcatupdate boolean NOT NULL,
    rolcanlogin boolean NOT NULL,
    rolreplication boolean NOT NULL,
    rolconnlimit integer NOT NULL,
    rolpassword text,
    rolvaliduntil timestamp with time zone
);

ALTER TABLE ONLY pg_authid REPLICA IDENTITY NOTHING;


ALTER TABLE pg_authid OWNER TO postgres;

--
-- Name: pg_authid_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: pg_global
--

CREATE UNIQUE INDEX pg_authid_oid_index ON pg_authid USING btree (oid);


--
-- Name: pg_authid_rolname_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: pg_global
--

CREATE UNIQUE INDEX pg_authid_rolname_index ON pg_authid USING btree (rolname);


--
-- Name: pg_authid; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_authid FROM PUBLIC;
REVOKE ALL ON TABLE pg_authid FROM postgres;
GRANT ALL ON TABLE pg_authid TO postgres;

