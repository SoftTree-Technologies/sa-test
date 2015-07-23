SET SCHEMA "appconfig";

CREATE TABLE szn_app (
    id_app integer NOT NULL,
    app_name character varying
);


ALTER TABLE szn_app OWNER TO postgres;

--
-- Name: szn_app_id_app_seq; Type: SEQUENCE; Schema: appconfig; Owner: postgres
--

CREATE SEQUENCE szn_app_id_app_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE szn_app_id_app_seq OWNER TO postgres;

--
-- Name: szn_app_id_app_seq; Type: SEQUENCE OWNED BY; Schema: appconfig; Owner: postgres
--

ALTER SEQUENCE szn_app_id_app_seq OWNED BY szn_app.id_app;


--
-- Name: id_app; Type: DEFAULT; Schema: appconfig; Owner: postgres
--

ALTER TABLE ONLY szn_app ALTER COLUMN id_app SET DEFAULT nextval('szn_app_id_app_seq'::regclass);


--
-- Name: szn_app_pkey; Type: CONSTRAINT; Schema: appconfig; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY szn_app
    ADD CONSTRAINT szn_app_pkey PRIMARY KEY (id_app);

