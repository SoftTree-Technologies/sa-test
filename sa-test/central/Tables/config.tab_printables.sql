SET SCHEMA "config";

CREATE TABLE tab_printables (
    id_printables integer NOT NULL,
    printables_name character varying NOT NULL,
    id_machine integer NOT NULL,
    port integer NOT NULL,
    monitor integer DEFAULT 0 NOT NULL,
    display_order integer,
    id_database integer NOT NULL
);


ALTER TABLE tab_printables OWNER TO postgres;

--
-- Name: tab_printables_id_printables_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE tab_printables_id_printables_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tab_printables_id_printables_seq OWNER TO postgres;

--
-- Name: tab_printables_id_printables_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE tab_printables_id_printables_seq OWNED BY tab_printables.id_printables;


--
-- Name: id_printables; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY tab_printables ALTER COLUMN id_printables SET DEFAULT nextval('tab_printables_id_printables_seq'::regclass);


--
-- Name: tab_printables_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_printables
    ADD CONSTRAINT tab_printables_pkey PRIMARY KEY (id_printables);


--
-- Name: tab_printables_id_database_fkey; Type: FK CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY tab_printables
    ADD CONSTRAINT tab_printables_id_database_fkey FOREIGN KEY (id_database) REFERENCES tab_database(id_database) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: tab_printables_id_machine_fkey; Type: FK CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY tab_printables
    ADD CONSTRAINT tab_printables_id_machine_fkey FOREIGN KEY (id_machine) REFERENCES tab_machine(id_machine) ON UPDATE CASCADE ON DELETE RESTRICT;

