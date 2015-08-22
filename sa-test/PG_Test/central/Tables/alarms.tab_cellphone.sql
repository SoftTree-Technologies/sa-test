SET SCHEMA "alarms";

CREATE TABLE tab_cellphone (
    id_cellphone integer NOT NULL,
    phone_number character(13) NOT NULL,
    CONSTRAINT tab_cellphone_phone_number_check CHECK ((phone_number ~ '\+[0-9]{12}'::text))
);


ALTER TABLE tab_cellphone OWNER TO postgres;

--
-- Name: tab_cellphone_id_cellphone_seq; Type: SEQUENCE; Schema: alarms; Owner: postgres
--

CREATE SEQUENCE tab_cellphone_id_cellphone_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tab_cellphone_id_cellphone_seq OWNER TO postgres;

--
-- Name: tab_cellphone_id_cellphone_seq; Type: SEQUENCE OWNED BY; Schema: alarms; Owner: postgres
--

ALTER SEQUENCE tab_cellphone_id_cellphone_seq OWNED BY tab_cellphone.id_cellphone;


--
-- Name: id_cellphone; Type: DEFAULT; Schema: alarms; Owner: postgres
--

ALTER TABLE ONLY tab_cellphone ALTER COLUMN id_cellphone SET DEFAULT nextval('tab_cellphone_id_cellphone_seq'::regclass);


--
-- Name: tab_cellphone_pkey; Type: CONSTRAINT; Schema: alarms; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_cellphone
    ADD CONSTRAINT tab_cellphone_pkey PRIMARY KEY (id_cellphone);

