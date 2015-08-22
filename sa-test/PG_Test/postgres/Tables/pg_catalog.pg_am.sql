SET SCHEMA "pg_catalog";

CREATE TABLE pg_am (
    amname name NOT NULL,
    amstrategies smallint NOT NULL,
    amsupport smallint NOT NULL,
    amcanorder boolean NOT NULL,
    amcanorderbyop boolean NOT NULL,
    amcanbackward boolean NOT NULL,
    amcanunique boolean NOT NULL,
    amcanmulticol boolean NOT NULL,
    amoptionalkey boolean NOT NULL,
    amsearcharray boolean NOT NULL,
    amsearchnulls boolean NOT NULL,
    amstorage boolean NOT NULL,
    amclusterable boolean NOT NULL,
    ampredlocks boolean NOT NULL,
    amkeytype oid NOT NULL,
    aminsert regproc NOT NULL,
    ambeginscan regproc NOT NULL,
    amgettuple regproc NOT NULL,
    amgetbitmap regproc NOT NULL,
    amrescan regproc NOT NULL,
    amendscan regproc NOT NULL,
    ammarkpos regproc NOT NULL,
    amrestrpos regproc NOT NULL,
    ambuild regproc NOT NULL,
    ambuildempty regproc NOT NULL,
    ambulkdelete regproc NOT NULL,
    amvacuumcleanup regproc NOT NULL,
    amcanreturn regproc NOT NULL,
    amcostestimate regproc NOT NULL,
    amoptions regproc NOT NULL
);

ALTER TABLE ONLY pg_am REPLICA IDENTITY NOTHING;


ALTER TABLE pg_am OWNER TO postgres;

--
-- Name: pg_am_name_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_am_name_index ON pg_am USING btree (amname);


--
-- Name: pg_am_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_am_oid_index ON pg_am USING btree (oid);


--
-- Name: pg_am; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_am FROM PUBLIC;
REVOKE ALL ON TABLE pg_am FROM postgres;
GRANT SELECT ON TABLE pg_am TO PUBLIC;

