SET SCHEMA "alarms";

CREATE TABLE tab_subsystem_sms (
    id_subsystem integer NOT NULL,
    id_cellphone integer NOT NULL
);


ALTER TABLE tab_subsystem_sms OWNER TO postgres;

--
-- Name: tab_subsystem_sms_pkey; Type: CONSTRAINT; Schema: alarms; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_subsystem_sms
    ADD CONSTRAINT tab_subsystem_sms_pkey PRIMARY KEY (id_subsystem, id_cellphone);


--
-- Name: tab_subsystem_sms_id_cellphone_fkey; Type: FK CONSTRAINT; Schema: alarms; Owner: postgres
--

ALTER TABLE ONLY tab_subsystem_sms
    ADD CONSTRAINT tab_subsystem_sms_id_cellphone_fkey FOREIGN KEY (id_cellphone) REFERENCES tab_cellphone(id_cellphone) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tab_subsystem_sms_id_subsystem_fkey; Type: FK CONSTRAINT; Schema: alarms; Owner: postgres
--

ALTER TABLE ONLY tab_subsystem_sms
    ADD CONSTRAINT tab_subsystem_sms_id_subsystem_fkey FOREIGN KEY (id_subsystem) REFERENCES szn_subsystems(id_subsystem) ON UPDATE CASCADE ON DELETE CASCADE;

