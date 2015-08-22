SET SCHEMA "querysched";

CREATE TABLE tab_executed (
    id_executed integer NOT NULL,
    id_schedule integer NOT NULL,
    executed timestamp without time zone NOT NULL,
    finished timestamp without time zone,
    status character varying NOT NULL,
    detail character varying
);


ALTER TABLE tab_executed OWNER TO postgres;

--
-- Name: tab_executed_id_executed_seq; Type: SEQUENCE; Schema: querysched; Owner: postgres
--

CREATE SEQUENCE tab_executed_id_executed_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tab_executed_id_executed_seq OWNER TO postgres;

--
-- Name: tab_executed_id_executed_seq; Type: SEQUENCE OWNED BY; Schema: querysched; Owner: postgres
--

ALTER SEQUENCE tab_executed_id_executed_seq OWNED BY tab_executed.id_executed;


--
-- Name: id_executed; Type: DEFAULT; Schema: querysched; Owner: postgres
--

ALTER TABLE ONLY tab_executed ALTER COLUMN id_executed SET DEFAULT nextval('tab_executed_id_executed_seq'::regclass);


--
-- Name: tab_executed_pkey; Type: CONSTRAINT; Schema: querysched; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_executed
    ADD CONSTRAINT tab_executed_pkey PRIMARY KEY (id_executed);


--
-- Name: tab_executed_id_schedule_fkey; Type: FK CONSTRAINT; Schema: querysched; Owner: postgres
--

ALTER TABLE ONLY tab_executed
    ADD CONSTRAINT tab_executed_id_schedule_fkey FOREIGN KEY (id_schedule) REFERENCES def_schedule(id_schedule) ON UPDATE CASCADE ON DELETE RESTRICT;

