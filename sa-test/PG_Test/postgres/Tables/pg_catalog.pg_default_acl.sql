SET SCHEMA "pg_catalog";

CREATE TABLE pg_default_acl (
    defaclrole oid NOT NULL,
    defaclnamespace oid NOT NULL,
    defaclobjtype "char" NOT NULL,
    defaclacl aclitem[]
);

ALTER TABLE ONLY pg_default_acl REPLICA IDENTITY NOTHING;


ALTER TABLE pg_default_acl OWNER TO postgres;

--
-- Name: pg_default_acl_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_default_acl_oid_index ON pg_default_acl USING btree (oid);


--
-- Name: pg_default_acl_role_nsp_obj_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_default_acl_role_nsp_obj_index ON pg_default_acl USING btree (defaclrole, defaclnamespace, defaclobjtype);


--
-- Name: pg_default_acl; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_default_acl FROM PUBLIC;
REVOKE ALL ON TABLE pg_default_acl FROM postgres;
GRANT SELECT ON TABLE pg_default_acl TO PUBLIC;

