SET SCHEMA "querysched";

CREATE TABLE def_session (
    id_session integer NOT NULL,
    session_name character varying NOT NULL,
    database_name character varying NOT NULL
);


ALTER TABLE def_session OWNER TO postgres;

--
-- Name: def_session_id_session_seq; Type: SEQUENCE; Schema: querysched; Owner: postgres
--

CREATE SEQUENCE def_session_id_session_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE def_session_id_session_seq OWNER TO postgres;

--
-- Name: def_session_id_session_seq; Type: SEQUENCE OWNED BY; Schema: querysched; Owner: postgres
--

ALTER SEQUENCE def_session_id_session_seq OWNED BY def_session.id_session;


--
-- Name: id_session; Type: DEFAULT; Schema: querysched; Owner: postgres
--

ALTER TABLE ONLY def_session ALTER COLUMN id_session SET DEFAULT nextval('def_session_id_session_seq'::regclass);


--
-- Name: def_session_pkey; Type: CONSTRAINT; Schema: querysched; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY def_session
    ADD CONSTRAINT def_session_pkey PRIMARY KEY (id_session);


--
-- Name: def_session_database_name_fkey; Type: FK CONSTRAINT; Schema: querysched; Owner: postgres
--

ALTER TABLE ONLY def_session
    ADD CONSTRAINT def_session_database_name_fkey FOREIGN KEY (database_name) REFERENCES config.tab_database(database_name) ON UPDATE CASCADE ON DELETE RESTRICT;

