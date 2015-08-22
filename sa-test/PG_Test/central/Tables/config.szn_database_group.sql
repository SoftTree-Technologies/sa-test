SET SCHEMA "config";

CREATE TABLE szn_database_group (
    id_database_group integer NOT NULL,
    database_group_name character varying NOT NULL
);


ALTER TABLE szn_database_group OWNER TO postgres;

--
-- Name: szn_database_group_id_database_group_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE szn_database_group_id_database_group_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE szn_database_group_id_database_group_seq OWNER TO postgres;

--
-- Name: szn_database_group_id_database_group_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE szn_database_group_id_database_group_seq OWNED BY szn_database_group.id_database_group;


--
-- Name: id_database_group; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY szn_database_group ALTER COLUMN id_database_group SET DEFAULT nextval('szn_database_group_id_database_group_seq'::regclass);


--
-- Name: szn_database_group_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY szn_database_group
    ADD CONSTRAINT szn_database_group_pkey PRIMARY KEY (id_database_group);

