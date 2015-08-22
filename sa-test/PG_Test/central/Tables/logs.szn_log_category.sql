SET SCHEMA "logs";

CREATE TABLE szn_log_category (
    id_log_category integer NOT NULL,
    log_category_name character varying(100)
);


ALTER TABLE szn_log_category OWNER TO postgres;

--
-- Name: szn_log_category_id_log_category_seq; Type: SEQUENCE; Schema: logs; Owner: postgres
--

CREATE SEQUENCE szn_log_category_id_log_category_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE szn_log_category_id_log_category_seq OWNER TO postgres;

--
-- Name: szn_log_category_id_log_category_seq; Type: SEQUENCE OWNED BY; Schema: logs; Owner: postgres
--

ALTER SEQUENCE szn_log_category_id_log_category_seq OWNED BY szn_log_category.id_log_category;


--
-- Name: id_log_category; Type: DEFAULT; Schema: logs; Owner: postgres
--

ALTER TABLE ONLY szn_log_category ALTER COLUMN id_log_category SET DEFAULT nextval('szn_log_category_id_log_category_seq'::regclass);


--
-- Name: szn_log_category_pkey; Type: CONSTRAINT; Schema: logs; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY szn_log_category
    ADD CONSTRAINT szn_log_category_pkey PRIMARY KEY (id_log_category);

