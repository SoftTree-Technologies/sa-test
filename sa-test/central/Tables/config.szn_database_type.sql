SET SCHEMA "config";

CREATE TABLE szn_database_type (
    id_database_type integer NOT NULL,
    database_type_name character varying(20) NOT NULL
);


ALTER TABLE szn_database_type OWNER TO postgres;

--
-- Name: szn_database_type_id_database_type_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE szn_database_type_id_database_type_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE szn_database_type_id_database_type_seq OWNER TO postgres;

--
-- Name: szn_database_type_id_database_type_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE szn_database_type_id_database_type_seq OWNED BY szn_database_type.id_database_type;


--
-- Name: id_database_type; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY szn_database_type ALTER COLUMN id_database_type SET DEFAULT nextval('szn_database_type_id_database_type_seq'::regclass);


--
-- Name: szn_database_type_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY szn_database_type
    ADD CONSTRAINT szn_database_type_pkey PRIMARY KEY (id_database_type);

