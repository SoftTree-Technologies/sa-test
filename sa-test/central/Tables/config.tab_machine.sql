SET SCHEMA "config";

CREATE TABLE tab_machine (
    id_machine integer NOT NULL,
    machine_name character varying(30) NOT NULL,
    machine_ip inet NOT NULL,
    machine_dns character varying
);


ALTER TABLE tab_machine OWNER TO postgres;

--
-- Name: tab_machine_id_machine_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE tab_machine_id_machine_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tab_machine_id_machine_seq OWNER TO postgres;

--
-- Name: tab_machine_id_machine_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE tab_machine_id_machine_seq OWNED BY tab_machine.id_machine;


--
-- Name: id_machine; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY tab_machine ALTER COLUMN id_machine SET DEFAULT nextval('tab_machine_id_machine_seq'::regclass);


--
-- Name: tab_machine_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_machine
    ADD CONSTRAINT tab_machine_pkey PRIMARY KEY (id_machine);

