SET SCHEMA "pg_catalog";

CREATE TABLE pg_operator (
    oprname name NOT NULL,
    oprnamespace oid NOT NULL,
    oprowner oid NOT NULL,
    oprkind "char" NOT NULL,
    oprcanmerge boolean NOT NULL,
    oprcanhash boolean NOT NULL,
    oprleft oid NOT NULL,
    oprright oid NOT NULL,
    oprresult oid NOT NULL,
    oprcom oid NOT NULL,
    oprnegate oid NOT NULL,
    oprcode regproc NOT NULL,
    oprrest regproc NOT NULL,
    oprjoin regproc NOT NULL
);

ALTER TABLE ONLY pg_operator REPLICA IDENTITY NOTHING;


ALTER TABLE pg_operator OWNER TO postgres;

--
-- Name: pg_operator_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_operator_oid_index ON pg_operator USING btree (oid);


--
-- Name: pg_operator_oprname_l_r_n_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_operator_oprname_l_r_n_index ON pg_operator USING btree (oprname, oprleft, oprright, oprnamespace);


--
-- Name: pg_operator; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_operator FROM PUBLIC;
REVOKE ALL ON TABLE pg_operator FROM postgres;
GRANT SELECT ON TABLE pg_operator TO PUBLIC;

