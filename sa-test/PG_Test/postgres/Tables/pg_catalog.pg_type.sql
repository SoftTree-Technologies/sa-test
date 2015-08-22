SET SCHEMA "pg_catalog";

CREATE TABLE pg_type (
    typname name NOT NULL,
    typnamespace oid NOT NULL,
    typowner oid NOT NULL,
    typlen smallint NOT NULL,
    typbyval boolean NOT NULL,
    typtype "char" NOT NULL,
    typcategory "char" NOT NULL,
    typispreferred boolean NOT NULL,
    typisdefined boolean NOT NULL,
    typdelim "char" NOT NULL,
    typrelid oid NOT NULL,
    typelem oid NOT NULL,
    typarray oid NOT NULL,
    typinput regproc NOT NULL,
    typoutput regproc NOT NULL,
    typreceive regproc NOT NULL,
    typsend regproc NOT NULL,
    typmodin regproc NOT NULL,
    typmodout regproc NOT NULL,
    typanalyze regproc NOT NULL,
    typalign "char" NOT NULL,
    typstorage "char" NOT NULL,
    typnotnull boolean NOT NULL,
    typbasetype oid NOT NULL,
    typtypmod integer NOT NULL,
    typndims integer NOT NULL,
    typcollation oid NOT NULL,
    typdefaultbin pg_node_tree,
    typdefault text,
    typacl aclitem[]
);

ALTER TABLE ONLY pg_type REPLICA IDENTITY NOTHING;


ALTER TABLE pg_type OWNER TO postgres;

--
-- Name: pg_type_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_type_oid_index ON pg_type USING btree (oid);


--
-- Name: pg_type_typname_nsp_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_type_typname_nsp_index ON pg_type USING btree (typname, typnamespace);


--
-- Name: pg_type; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_type FROM PUBLIC;
REVOKE ALL ON TABLE pg_type FROM postgres;
GRANT SELECT ON TABLE pg_type TO PUBLIC;

