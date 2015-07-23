SET SCHEMA "alarms";

CREATE TABLE tab_alarm_group_subsystem (
    id_alarm_group integer NOT NULL,
    id_subsystem integer NOT NULL
);


ALTER TABLE tab_alarm_group_subsystem OWNER TO postgres;

--
-- Name: tab_alarm_group_subsystem_pkey; Type: CONSTRAINT; Schema: alarms; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_alarm_group_subsystem
    ADD CONSTRAINT tab_alarm_group_subsystem_pkey PRIMARY KEY (id_alarm_group, id_subsystem);


--
-- Name: tab_alarm_group_subsystem_id_alarm_group_fkey; Type: FK CONSTRAINT; Schema: alarms; Owner: postgres
--

ALTER TABLE ONLY tab_alarm_group_subsystem
    ADD CONSTRAINT tab_alarm_group_subsystem_id_alarm_group_fkey FOREIGN KEY (id_alarm_group) REFERENCES tab_alarm_group(id_alarm_group);


--
-- Name: tab_alarm_group_subsystem_id_alarm_subsystem_fkey; Type: FK CONSTRAINT; Schema: alarms; Owner: postgres
--

ALTER TABLE ONLY tab_alarm_group_subsystem
    ADD CONSTRAINT tab_alarm_group_subsystem_id_alarm_subsystem_fkey FOREIGN KEY (id_subsystem) REFERENCES szn_subsystems(id_subsystem);

