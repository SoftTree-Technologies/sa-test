SET SCHEMA "appconfig";

CREATE TABLE tab_config (
    id_configuration integer NOT NULL,
    id_variable integer NOT NULL,
    variable_value character varying
);


ALTER TABLE tab_config OWNER TO postgres;

--
-- Name: tab_config_pkey; Type: CONSTRAINT; Schema: appconfig; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_config
    ADD CONSTRAINT tab_config_pkey PRIMARY KEY (id_configuration, id_variable);


--
-- Name: tab_config_id_configuration_fkey; Type: FK CONSTRAINT; Schema: appconfig; Owner: postgres
--

ALTER TABLE ONLY tab_config
    ADD CONSTRAINT tab_config_id_configuration_fkey FOREIGN KEY (id_configuration) REFERENCES szn_configuration(id_configuration) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tab_config_id_variable_fkey; Type: FK CONSTRAINT; Schema: appconfig; Owner: postgres
--

ALTER TABLE ONLY tab_config
    ADD CONSTRAINT tab_config_id_variable_fkey FOREIGN KEY (id_variable) REFERENCES szn_variable(id_variable) ON UPDATE CASCADE ON DELETE CASCADE;

