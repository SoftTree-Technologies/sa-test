SET SCHEMA "alarms";

CREATE TABLE szn_alarm_message_l10n (
    id_alarm_message integer NOT NULL,
    lang character(2) NOT NULL,
    message_text character varying
);


ALTER TABLE szn_alarm_message_l10n OWNER TO postgres;

--
-- Name: szn_alarm_message_l10n_pkey; Type: CONSTRAINT; Schema: alarms; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY szn_alarm_message_l10n
    ADD CONSTRAINT szn_alarm_message_l10n_pkey PRIMARY KEY (id_alarm_message, lang);


--
-- Name: szn_alarm_message_l10n_id_alarm_message_fkey; Type: FK CONSTRAINT; Schema: alarms; Owner: postgres
--

ALTER TABLE ONLY szn_alarm_message_l10n
    ADD CONSTRAINT szn_alarm_message_l10n_id_alarm_message_fkey FOREIGN KEY (id_alarm_message) REFERENCES szn_alarm_message(id_alarm_message) ON UPDATE CASCADE ON DELETE CASCADE;

