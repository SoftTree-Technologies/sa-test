SET SCHEMA "config";

CREATE TABLE tab_db_login (
    id_database integer NOT NULL,
    db_login_name character varying NOT NULL,
    db_login_pass character varying NOT NULL,
    db_login_active integer DEFAULT 1 NOT NULL
);


ALTER TABLE tab_db_login OWNER TO postgres;

--
-- Name: pk_tabdblogin_iddatabase_dbloginname; Type: CONSTRAINT; Schema: config; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_db_login
    ADD CONSTRAINT pk_tabdblogin_iddatabase_dbloginname PRIMARY KEY (id_database, db_login_name);


--
-- Name: fk_tabdatabase_tabdblogin; Type: FK CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY tab_db_login
    ADD CONSTRAINT fk_tabdatabase_tabdblogin FOREIGN KEY (id_database) REFERENCES tab_database(id_database) ON UPDATE CASCADE ON DELETE CASCADE;

