SET SCHEMA "querysched";

CREATE TABLE def_schedule (
    id_schedule integer NOT NULL,
    id_query integer NOT NULL,
    id_exectime integer NOT NULL,
    id_session integer NOT NULL
);


ALTER TABLE def_schedule OWNER TO postgres;

--
-- Name: def_schedule_id_schedule_seq; Type: SEQUENCE; Schema: querysched; Owner: postgres
--

CREATE SEQUENCE def_schedule_id_schedule_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE def_schedule_id_schedule_seq OWNER TO postgres;

--
-- Name: def_schedule_id_schedule_seq; Type: SEQUENCE OWNED BY; Schema: querysched; Owner: postgres
--

ALTER SEQUENCE def_schedule_id_schedule_seq OWNED BY def_schedule.id_schedule;


--
-- Name: id_schedule; Type: DEFAULT; Schema: querysched; Owner: postgres
--

ALTER TABLE ONLY def_schedule ALTER COLUMN id_schedule SET DEFAULT nextval('def_schedule_id_schedule_seq'::regclass);


--
-- Name: def_schedule_id_query_key; Type: CONSTRAINT; Schema: querysched; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY def_schedule
    ADD CONSTRAINT def_schedule_id_query_key UNIQUE (id_query, id_exectime, id_session);


--
-- Name: def_schedule_pkey; Type: CONSTRAINT; Schema: querysched; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY def_schedule
    ADD CONSTRAINT def_schedule_pkey PRIMARY KEY (id_schedule);


--
-- Name: def_schedule_id_exectime_fkey; Type: FK CONSTRAINT; Schema: querysched; Owner: postgres
--

ALTER TABLE ONLY def_schedule
    ADD CONSTRAINT def_schedule_id_exectime_fkey FOREIGN KEY (id_exectime) REFERENCES def_exectime(id_exectime) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: def_schedule_id_query_fkey; Type: FK CONSTRAINT; Schema: querysched; Owner: postgres
--

ALTER TABLE ONLY def_schedule
    ADD CONSTRAINT def_schedule_id_query_fkey FOREIGN KEY (id_query) REFERENCES def_query(id_query) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: def_schedule_id_session_fkey; Type: FK CONSTRAINT; Schema: querysched; Owner: postgres
--

ALTER TABLE ONLY def_schedule
    ADD CONSTRAINT def_schedule_id_session_fkey FOREIGN KEY (id_session) REFERENCES def_session(id_session) ON UPDATE CASCADE ON DELETE RESTRICT;

