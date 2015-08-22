SET SCHEMA "pg_catalog";

CREATE TABLE pg_rewrite (
    rulename name NOT NULL,
    ev_class oid NOT NULL,
    ev_type "char" NOT NULL,
    ev_enabled "char" NOT NULL,
    is_instead boolean NOT NULL,
    ev_qual pg_node_tree,
    ev_action pg_node_tree
);

ALTER TABLE ONLY pg_rewrite REPLICA IDENTITY NOTHING;


ALTER TABLE pg_rewrite OWNER TO postgres;

--
-- Name: pg_rewrite_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_rewrite_oid_index ON pg_rewrite USING btree (oid);


--
-- Name: pg_rewrite_rel_rulename_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_rewrite_rel_rulename_index ON pg_rewrite USING btree (ev_class, rulename);


--
-- Name: pg_rewrite; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_rewrite FROM PUBLIC;
REVOKE ALL ON TABLE pg_rewrite FROM postgres;
GRANT SELECT ON TABLE pg_rewrite TO PUBLIC;

