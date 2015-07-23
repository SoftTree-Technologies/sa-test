SET SCHEMA "querysched";

CREATE TABLE def_query (
    id_query integer NOT NULL,
    query_sql character varying NOT NULL,
    query_timeout interval,
    query_name character varying
);


ALTER TABLE def_query OWNER TO postgres;

--
-- Name: def_query_id_query_seq; Type: SEQUENCE; Schema: querysched; Owner: postgres
--

CREATE SEQUENCE def_query_id_query_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE def_query_id_query_seq OWNER TO postgres;

--
-- Name: def_query_id_query_seq; Type: SEQUENCE OWNED BY; Schema: querysched; Owner: postgres
--

ALTER SEQUENCE def_query_id_query_seq OWNED BY def_query.id_query;


--
-- Name: id_query; Type: DEFAULT; Schema: querysched; Owner: postgres
--

ALTER TABLE ONLY def_query ALTER COLUMN id_query SET DEFAULT nextval('def_query_id_query_seq'::regclass);


--
-- Name: def_query_pkey; Type: CONSTRAINT; Schema: querysched; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY def_query
    ADD CONSTRAINT def_query_pkey PRIMARY KEY (id_query);

