SET SCHEMA "pg_catalog";

CREATE TABLE pg_ts_parser (
    prsname name NOT NULL,
    prsnamespace oid NOT NULL,
    prsstart regproc NOT NULL,
    prstoken regproc NOT NULL,
    prsend regproc NOT NULL,
    prsheadline regproc NOT NULL,
    prslextype regproc NOT NULL
);

ALTER TABLE ONLY pg_ts_parser REPLICA IDENTITY NOTHING;


ALTER TABLE pg_ts_par Type: INDEX; Schema: pg_catalog; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pg_ts_parser_prsname_index ON pg_ts_parser USING btree (prsname, prsnamespace);


--
-- Name: pg_ts_parser; Type: ACL; Schema: pg_catalog; Owner: postgres
--
 kH
PI��kH
�I��kH
�I��kH
@J�0F��J�h���J����0K�(���� lH
��HlH
0�plH
 ��lH
p��lH
�������lH
��mH
0j�����m�8mH
�m�atabase dump complete
--

 

--
-- PostgreSQL database dump complete
--

 
 ����nH
����nH
���nH
���
REVOKE ALL ON TABLE pg_ts_parser FROM PUBLIC;
REVOKE ALL ON TABLE pg_ts_parser FROM postgres;
GRANT SELECT ON TABLE pg_ts_parser TO PUBLIC;

