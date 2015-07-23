SET SCHEMA "alarms";

CREATE TABLE tab_alarm (
    id_alarm integer NOT NULL,
    id_alarm_message integer,
    alarm_args character varying[],
    alarm_start timestamp without time zone DEFAULT now() NOT NULL,
    alarm_end timestamp without time zone,
    alarm_count integer DEFAULT 0 NOT NULL,
    alarm_confirmed integer DEFAULT 0 NOT NULL,
    id_subsystem integer NOT NULL,
    alarm_lastlog timestamp without time zone NOT NULL,
    alarm_length interval
);


ALTER TABLE tab_alarm OWNER TO postgres;

--
-- Name: tab_alarm_id_alarm_seq; Type: SEQUENCE; Schema: alarms; Owner: postgres
--

CREATE SEQUENCE tab_alarm_id_alarm_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tab_alarm_id_alarm_seq OWNER TO postgres;

--
-- Name: tab_alarm_id_alarm_seq; Type: SEQUENCE OWNED BY; Schema: alarms; Owner: postgres
--

ALTER SEQUENCE tab_alarm_id_alarm_seq OWNED BY tab_alarm.id_alarm;


--
-- Name: id_alarm; Type: DEFAULT; Schema: alarms; Owner: postgres
--

ALTER TABLE ONLY tab_alarm ALTER COLUMN id_alarm SET DEFAULT nextval('tab_alarm_id_alarm_seq'::regclass);


--
-- Name: tab_alarm_pkey; Type: CONSTRAINT; Schema: alarms; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_alarm
    ADD CONSTRAINT tab_alarm_pkey PRIMARY KEY (id_alarm);


--
-- Name: ix_tabalarms_idsubsstart; Type: INDEX; Schema: alarms; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_tabalarms_idsubsstart ON tab_alarm USING btree (id_subsystem, alarm_start);


--
-- Name: tr_tab_alarm_sms; Type: TRIGGER; Schema: alarms; Owner: postgres
--

CREATE TRIGGER tr_tab_alarm_sms AFTER INSERT ON tab_alarm FOR EACH ROW EXECUTE PROCEDURE tr_tab_alarm_sms();

ALTER TABLE tab_alarm DISABLE TRIGGER tr_tab_alarm_sms;


--
-- Name: tr_tabalarm; Type: TRIGGER; Schema: alarms; Owner: postgres
--

CREATE TRIGGER tr_tabalarm BEFORE INSERT OR UPDATE ON tab_alarm FOR EACH ROW EXECUTE PROCEDURE update_alarm_len();


--
-- Name: tab_alarm_id_alarm_message_fkey; Type: FK CONSTRAINT; Schema: alarms; Owner: postgres
--

ALTER TABLE ONLY tab_alarm
    ADD CONSTRAINT tab_alarm_id_alarm_message_fkey FOREIGN KEY (id_alarm_message) REFERENCES szn_alarm_message(id_alarm_message) ON UPDATE CASCADE ON DELETE RESTRICT;

