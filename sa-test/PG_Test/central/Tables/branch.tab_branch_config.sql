SET SCHEMA "branch";

CREATE TABLE tab_branch_config (
    id_branch_config integer NOT NULL,
    hostname character varying(30) NOT NULL,
    backend_address inet,
    backend_port integer
);


ALTER TABLE tab_branch_config OWNER TO postgres;

--
-- Name: tab_branch_config_id_branch_config_seq; Type: SEQUENCE; Schema: branch; Owner: postgres
--

CREATE SEQUENCE tab_branch_config_id_branch_config_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tab_branch_config_id_branch_config_seq OWNER TO postgres;

--
-- Name: tab_branch_config_id_branch_config_seq; Type: SEQUENCE OWNED BY; Schema: branch; Owner: postgres
--

ALTER SEQUENCE tab_branch_config_id_branch_config_seq OWNED BY tab_branch_config.id_branch_config;


--
-- Name: id_branch_config; Type: DEFAULT; Schema: branch; Owner: postgres
--

ALTER TABLE ONLY tab_branch_config ALTER COLUMN id_branch_config SET DEFAULT nextval('tab_branch_config_id_branch_config_seq'::regclass);


--
-- Name: tab_branch_config_hostname_key1; Type: CONSTRAINT; Schema: branch; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_branch_config
    ADD CONSTRAINT tab_branch_config_hostname_key1 UNIQUE (hostname);


--
-- Name: tab_branch_config_pkey1; Type: CONSTRAINT; Schema: branch; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_branch_config
    ADD CONSTRAINT tab_branch_config_pkey1 PRIMARY KEY (id_branch_config);


--
-- Name: tr_au_branch_config; Type: TRIGGER; Schema: branch; Owner: postgres
--

CREATE TRIGGER tr_au_branch_config BEFORE INSERT OR UPDATE ON tab_branch_config FOR EACH ROW EXECUTE PROCEDURE tr_au_branch_config();

