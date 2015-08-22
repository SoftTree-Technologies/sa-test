SET SCHEMA "pg_catalog";

CREATE TABLE pg_db_role_setting (
    setdatabase oid NOT NULL,
    setrole oid NOT NULL,
    setconfig text[]
);

ALTER TABLE ONLY pg_db_role_setting REPLICA IDENTITY NOTHING;


ALTER TABLE pg_db_role_setting OWNER TO postgres;

--
-- Name: pg_db_role_setting_databaseid_rol_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: pg_global
--

CREATE UNIQUE INDEX pg_db_role_setting_databaseid_rol_index ON pg_db_role_setting USING btree (setdatabase, setrole);


--
-- Name: pg_db_role_setting; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_db_role_setting FROM PUBLIC;
REVOKE ALL ON TABLE pg_db_role_setting FROM postgres;
GRANT SELECT ON TABLE pg_db_role_setting TO PUBLIC;

