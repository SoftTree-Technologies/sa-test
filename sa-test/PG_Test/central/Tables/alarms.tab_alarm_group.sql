SET SCHEMA "alarms";

CREATE TABLE tab_alarm_group (
    id_alarm_group integer NOT NULL,
    alarm_group_name character varying
);


ALTER TABLE tab_alarm_group OWNER TO postgres;

--
-- Name: szn_alarm_group_id_alarm_group_seq; Type: SEQUENCE; Schema: alarms; Owner: postgres
--

CREATE SEQUENCE szn_alarm_group_id_alarm_group_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE szn_alarm_group_id_alarm_group_seq OWNER TO postgres;

--
-- Name: szn_alarm_group_id_alarm_group_seq; Type: SEQUENCE OWNED BY; Schema: alarms; Owner: postgres
--

ALTER SEQUENCE szn_alarm_group_id_alarm_group_seq OWNED BY tab_alarm_group.id_alarm_group;


--
-- Name: id_alarm_group; Type: DEFAULT; Schema: alarms; Owner: postgres
--

ALTER TABLE ONLY tab_alarm_group ALTER COLUMN id_alarm_group SET DEFAULT nextval('szn_alarm_group_id_alarm_group_seq'::regclass);


--
-- Name: szn_alarm_group_pkey; Type: CONSTRAINT; Schema: alarms; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_alarm_group
    ADD CONSTRAINT szn_alarm_group_pkey PRIMARY KEY (id_alarm_group);

