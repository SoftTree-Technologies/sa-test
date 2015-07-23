SET SCHEMA "querysched";

CREATE TABLE def_exectime (
    id_exectime integer NOT NULL,
    execute_date date,
    execute_time time without time zone NOT NULL,
    do_not_execute_after time without time zone
);


ALTER TABLE def_exectime OWNER TO postgres;

--
-- Name: def_exectime_id_exectime_seq; Type: SEQUENCE; Schema: querysched; Owner: postgres
--

CREATE SEQUENCE def_exectime_id_exectime_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE def_exectime_id_exectime_seq OWNER TO postgres;

--
-- Name: def_exectime_id_exectime_seq; Type: SEQUENCE OWNED BY; Schema: querysched; Owner: postgres
--

ALTER SEQUENCE def_exectime_id_exectime_seq OWNED BY def_exectime.id_exectime;


--
-- Name: id_exectime; Type: DEFAULT; Schema: querysched; Owner: postgres
--

ALTER TABLE ONLY def_exectime ALTER COLUMN id_exectime SET DEFAULT nextval('def_exectime_id_exectime_seq'::regclass);


--
-- Name: def_exectime_pkey; Type: CONSTRAINT; Schema: querysched; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY def_exectime
    ADD CONSTRAINT def_exectime_pkey PRIMARY KEY (id_exectime);

