SET SCHEMA "config";

CREATE TABLE tab_password (
    id_password integer NOT NULL,
    password_plain character varying
);


ALTER TABLE tab_password OWNER TO postgres;

--
-- Name: tab_password_id_password_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE tab_password_id_password_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tab_password_id_password_seq OWNER TO postgres;

--
-- Name: tab_password_id_password_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE tab_password_id_password_seq OWNED BY tab_password.id_password;


--
-- Name: id_password; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY tab_password ALTER COLUMN id_password SET DEFAULT nextval('tab_password_id_password_seq'::regclass);


--
-- Name: tab_password_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_password
    ADD CONSTRAINT tab_password_pkey PRIMARY KEY (id_password);

