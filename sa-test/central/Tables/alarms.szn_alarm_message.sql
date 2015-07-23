SET SCHEMA "alarms";

CREATE TABLE szn_alarm_message (
    id_alarm_message integer NOT NULL,
    message_text character varying,
    arg_count integer DEFAULT 0
);


ALTER TABLE szn_alarm_message OWNER TO postgres;

--
-- Name: szn_alarm_message_id_alarm_message_seq; Type: SEQUENCE; Schema: alarms; Owner: postgres
--

CREATE SEQUENCE szn_alarm_message_id_alarm_message_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE szn_alarm_message_id_alarm_message_seq OWNER TO postgres;

--
-- Name: szn_alarm_message_id_alarm_message_seq; Type: SEQUENCE OWNED BY; Schema: alarms; Owner: postgres
--

ALTER SEQUENCE szn_alarm_message_id_alarm_message_seq OWNED BY szn_alarm_message.id_alarm_message;


--
-- Name: id_alarm_message; Type: DEFAULT; Schema: alarms; Owner: postgres
--

ALTER TABLE ONLY szn_alarm_message ALTER COLUMN id_alarm_message SET DEFAULT nextval('szn_alarm_message_id_alarm_message_seq'::regclass);


--
-- Name: szn_alarm_message_pkey; Type: CONSTRAINT; Schema: alarms; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY szn_alarm_message
    ADD CONSTRAINT szn_alarm_message_pkey PRIMARY KEY (id_alarm_message);

