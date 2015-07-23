SET SCHEMA "appconfig";

CREATE TABLE szn_module (
    id_module integer NOT NULL,
    id_app integer NOT NULL,
    module_name character varying
);


ALTER TABLE szn_module OWNER TO postgres;

--
-- Name: szn_module_id_module_seq; Type: SEQUENCE; Schema: appconfig; Owner: postgres
--

CREATE SEQUENCE szn_module_id_module_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE szn_module_id_module_seq OWNER TO postgres;

--
-- Name: szn_module_id_module_seq; Type: SEQUENCE OWNED BY; Schema: appconfig; Owner: postgres
--

ALTER SEQUENCE szn_module_id_module_seq OWNED BY szn_module.id_module;


--
-- Name: id_module; Type: DEFAULT; Schema: appconfig; Owner: postgres
--

ALTER TABLE ONLY szn_module ALTER COLUMN id_module SET DEFAULT nextval('szn_module_id_module_seq'::regclass);


--
-- Name: szn_module_pkey; Type: CONSTRAINT; Schema: appconfig; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY szn_module
    ADD CONSTRAINT szn_module_pkey PRIMARY KEY (id_module);


--
-- Name: szn_module_id_app_fkey; Type: FK CONSTRAINT; Schema: appconfig; Owner: postgres
--

ALTER TABLE ONLY szn_module
    ADD CONSTRAINT szn_module_id_app_fkey FOREIGN KEY (id_app) REFERENCES szn_app(id_app) ON UPDATE CASCADE ON DELETE CASCADE;

