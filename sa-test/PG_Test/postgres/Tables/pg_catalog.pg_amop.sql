SET SCHEMA "pg_catalog";

CREATE TABLE pg_amop (
    amopfamily oid NOT NULL,
    amoplefttype oid NOT NULL,
    amoprighttype oid NOT NULL,
    amopstrategy smallint NOT NULL,
    amoppurpose "char" NOT NULL,
    amopopr oid NOT NULL,
    amopmethod oid NOT NULL,
    amopsortfamily oid NOT NULL
);

ALTER TABLE ONLY pg_amop REPLICA IDENTITY NOTHING;


ALTER TABLE pg_amop OWNER TO postgres;

--
-- Name: pg_amop_fam_strat_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_amop_fam_strat_index ON pg_amop USING btree (amopfamily, amoplefttype, amoprighttype, amopstrategy);


--
-- Name: pg_amop_oid_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_amop_oid_index ON pg_amop USING btree (oid);


--
-- Name: pg_amop_opr_fam_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_amop_opr_fam_index ON pg_amop USING btree (amopopr, amoppurpose, amopfamily);


--
-- Name: pg_amop; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_amop FROM PUBLIC;
REVOKE ALL ON TABLE pg_amop FROM postgres;
GRANT SELECT ON TABLE pg_amop TO PUBLIC;

