SET SCHEMA "pg_catalog";

CREATE TABLE pg_auth_members (
    roleid oid NOT NULL,
    member oid NOT NULL,
    grantor oid NOT NULL,
    admin_option boolean NOT NULL
);

ALTER TABLE ONLY pg_auth_members REPLICA IDENTITY NOTHING;


ALTER TABLE pg_auth_members OWNER TO postgres;

--
-- Name: pg_auth_members_member_role_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: pg_global
--

CREATE UNIQUE INDEX pg_auth_members_member_role_index ON pg_auth_members USING btree (member, roleid);


--
-- Name: pg_auth_members_role_member_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: pg_global
--

CREATE UNIQUE INDEX pg_auth_members_role_member_index ON pg_auth_members USING btree (roleid, member);


--
-- Name: pg_auth_members; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_auth_members FROM PUBLIC;
REVOKE ALL ON TABLE pg_auth_members FROM postgres;
GRANT SELECT ON TABLE pg_auth_members TO PUBLIC;

