SET SCHEMA "pg_catalog";

CREATE TABLE pg_statistic (
    starelid oid NOT NULL,
    staattnum smallint NOT NULL,
    stainherit boolean NOT NULL,
    stanullfrac real NOT NULL,
    stawidth integer NOT NULL,
    stadistinct real NOT NULL,
    stakind1 smallint NOT NULL,
    stakind2 smallint NOT NULL,
    stakind3 smallint NOT NULL,
    stakind4 smallint NOT NULL,
    stakind5 smallint NOT NULL,
    staop1 oid NOT NULL,
    staop2 oid NOT NULL,
    staop3 oid NOT NULL,
    staop4 oid NOT NULL,
    staop5 oid NOT NULL,
    stanumbers1 real[],
    stanumbers2 real[],
    stanumbers3 real[],
    stanumbers4 real[],
    stanumbers5 real[],
    stavalues1 anyarray,
    stavalues2 anyarray,
    stavalues3 anyarray,
    stavalues4 anyarray,
    stavalues5 anyarray
);

ALTER TABLE ONLY pg_statistic REPLICA IDENTITY NOTHING;


ALTER TABLE pg_statistic OWNER TO postgres;

--
-- Name: pg_statistic_relid_att_inh_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_statistic_relid_att_inh_index ON pg_statistic USING btree (starelid, staattnum, stainherit);


--
-- Name: pg_statistic; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_statistic FROM PUBLIC;
REVOKE ALL ON TABLE pg_statistic FROM postgres;
GRANT ALL ON TABLE pg_statistic TO postgres;

