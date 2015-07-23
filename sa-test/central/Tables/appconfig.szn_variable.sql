SET SCHEMA "appconfig";

CREATE TABLE szn_variable (
    id_variable integer NOT NULL,
    id_module integer NOT NULL,
    variable_name character varying
);


ALTER TABLE szn_variable OWNER TO postgres;

--
-- Name: szn_variable_id_variable_seq; Type: SEQUENCE; Schema: appconfig; Owner: postgres
--

CREATE SEQUENCE szn_variable_id_variable_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE szn_variable_id_variable_seq OWNER TO postgres;

--
-- Name: szn_variable_id_variable_seq; Type: SEQUENCE OWNED BY; Schema: appconfig; Owner: postgres
--

ALTER SEQUENCE szn_variable_id_variable_seq OWNED BY szn_variable.id_variable;


--
-- Name: id_variable; Type: DEFAULT; Schema: appconfig; Owner: postgres
--

ALTER TABLE ONLY szn_variable ALTER COLUMN id_variable SET DEFAULT nextval('szn_variable_id_variable_seq'::regclass);


--
-- Name: szn_variable_pkey; Type: CONSTRAINT; Schema: appconfig; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY szn_variable
    ADD CONSTRAINT szn_variable_pkey PRIMARY KEY (id_variable);


--
-- Name: szn_variable_id_module_fkey; Type: FK CONSTRAINT; Schema: appconfig; Owner: postgres
--

ALTER TABLE ONLY szn_variable
    ADD CONSTRAINT szn_variable_id_module_fkey FOREIGN KEY (id_module) REFERENCES szn_module(id_module) ON UPDATE CASCADE ON DELETE CASCADE;

