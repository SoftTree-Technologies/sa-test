SET SCHEMA "stats";

CREATE TABLE tab_stat_printables (
    id_stat_printables integer NOT NULL,
    id_printables integer NOT NULL,
    stat_time timestamp without time zone DEFAULT now() NOT NULL,
    request_count integer,
    prepare_ok integer,
    found_in_cache integer,
    prepare_error integer,
    no_output integer
);


ALTER TABLE tab_stat_printables OWNER TO postgres;

--
-- Name: tab_stat_printables_id_stat_printables_seq; Type: SEQUENCE; Schema: stats; Owner: postgres
--

CREATE SEQUENCE tab_stat_printables_id_stat_printables_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tab_stat_printables_id_stat_printables_seq OWNER TO postgres;

--
-- Name: tab_stat_printables_id_stat_printables_seq; Type: SEQUENCE OWNED BY; Schema: stats; Owner: postgres
--

ALTER SEQUENCE tab_stat_printables_id_stat_printables_seq OWNED BY tab_stat_printables.id_stat_printables;


--
-- Name: id_stat_printables; Type: DEFAULT; Schema: stats; Owner: postgres
--

ALTER TABLE ONLY tab_stat_printables ALTER COLUMN id_stat_printables SET DEFAULT nextval('tab_stat_printables_id_stat_printables_seq'::regclass);


--
-- Name: tab_stat_printables_pkey; Type: CONSTRAINT; Schema: stats; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_stat_printables
    ADD CONSTRAINT tab_stat_printables_pkey PRIMARY KEY (id_stat_printables);

