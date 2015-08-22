SET SCHEMA "config";

CREATE TABLE tab_database_database_group (
    id_database integer NOT NULL,
    id_database_group integer NOT NULL
);


ALTER TABLE tab_database_database_group OWNER TO postgres;

--
-- Name: pk_db2groups; Type: CONSTRAINT; Schema: config; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_database_database_group
    ADD CONSTRAINT pk_db2groups PRIMARY KEY (id_database, id_database_group);


--
-- Name: dk_db2groups_iddbgroup; Type: FK CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY tab_database_database_group
    ADD CONSTRAINT dk_db2groups_iddbgroup FOREIGN KEY (id_database_group) REFERENCES szn_database_group(id_database_group);


--
-- Name: fk_db2groups_iddatabase; Type: FK CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY tab_database_database_group
    ADD CONSTRAINT fk_db2groups_iddatabase FOREIGN KEY (id_database) REFERENCES tab_database(id_database) ON UPDATE CASCADE ON DELETE CASCADE;

