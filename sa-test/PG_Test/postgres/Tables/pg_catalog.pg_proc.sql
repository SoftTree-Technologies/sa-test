SET SCHEMA "pg_catalog";

CREATE TABLE pg_proc (
    proname name NOT NULL,
    pronamespace oid NOT NULL,
    proowner oid NOT NULL,
    prolang oid NOT NULL,
    procost real NOT NULL,
    prorows real NOT NULL,
    provariadic oid NOT NULL,
    protransform regproc NOT NULL,
    proisagg boolean NOT NULL,
    proiswindow boolean NOT NULL,
    prosecdef boolean NOT NULL,
    proleakproof boolean NOT NULL,
    proisstrict boolean NOT NULL,
    proretset boolean NOT NULL,
    provolatile "char" NOT NULL,
    pronargs smallint NOT NULL,
    pronargdefaults smallint NOT NULL,
    prorettype oid NOT NULL,
    proargtypes oidvector NOT NULL,
    proallargtypes oid[],
    proargmodes "char"[],
    proargnames text[],
    proargdefaults pg_node_tree,
    prosrc text,
    probin text,
    proconfig text[],
    proacl aclitem[]
);

ALTER TABLE ONLY pg_proc REPLICA IDENTITY NOTHING;


ALTER TABLE pg_proc OWNER TO postgres;

--
-- Name: pg_proc_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_proc_oid_index ON pg_proc USING btree (oid);


--
-- Name: pg_proc_proname_args_nsp_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_proc_proname_args_nsp_index ON pg_proc USING btree (proname, proargtypes, pronamespace);


--
-- Name: pg_proc; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_proc FROM PUBLIC;
REVOKE ALL ON TABLE pg_proc FROM postgres;
GRANT SELECT ON TABLE pg_proc TO PUBLIC;

