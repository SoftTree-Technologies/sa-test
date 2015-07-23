SET SCHEMA "appconfig";

CREATE TABLE szn_configuration (
    id_configuration integer NOT NULL,
    id_module integer NOT NULL,
    configuration_name character varying
);


ALTER TABLE szn_configuration OWNER TO postgres;

--
-- Name: szn_configuration_id_configuration_seq; Type: SEQUENCE; Schema: appconfig; Owner: postgres
--

CREATE SEQUENCE szn_configuration_id_configuration_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE szn_configuration_id_configuration_seq OWNER TO postgres;

--
-- Name: szn_configuration_id_configuration_seq; Type: SEQUENCE OWNED BY; Schema: appconfig; Owner: postgres
--

ALTER SEQUENCE szn_configuration_id_configuration_seq OWNED BY szn_configuration.id_configuration;


--
-- Name: id_configuration; Type: DEFAULT; Schema: appconfig; Owner: postgres
--

ALTER TABLE ONLY szn_configuration ALTER COLUMN id_configuration SET DEFAULT nextval('szn_configuration_id_configuration_seq'::regclass);


--
-- Name: szn_configuration_pkey; Type: CONSTRAINT; Schema: appconfig; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY szn_configuration
    ADD CONSTRAINT szn_configuration_pkey PRIMARY KEY (id_configuration);


--
-- Name: szn_configuration_id_module_fkey; Type: FK CONSTRAINT; Schema: appconfig; Owner: postgres
--

ALTER TABLE ONLY szn_configuration
    ADD CONSTRAINT szn_configuration_id_module_fkey FOREIGN KEY (id_module) REFERENCES szn_module(id_module) ON UPDATE CASCADE ON DELETE CASCADE;

