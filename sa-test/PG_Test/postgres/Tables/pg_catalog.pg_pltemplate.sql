SET SCHEMA "pg_catalog";

CREATE TABLE pg_pltemplate (
    tmplname name NOT NULL,
    tmpltrusted boolean NOT NULL,
    tmpldbacreate boolean NOT NULL,
    tmplhandler text,
    tmplinline text,
    tmplvalidator text,
    tmpllibrary text,
    tmplacl aclitem[]
);

ALTER TABLE ONLY pg_pltemplate REPLICA IDENTITY NOTHING;


ALTER TABLE pg_pltemplate OWNER TO postgres;

--
-- Name: pg_pltemplate_name_index; Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: pg_global
--

CREATE UNIQUE INDEX pg_pltemplate_name_index ON pg_pltemplate USING btree (tmplname);


--
-- Name: pg_pltemplate; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_pltemplate FROM PUBLIC;
REVOKE ALL ON TABLE pg_pltemplate FROM postgres;
GRANT SELECT ON TABLE pg_pltemplate TO PUBLIC;

