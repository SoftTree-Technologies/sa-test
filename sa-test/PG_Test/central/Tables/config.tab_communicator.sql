SET SCHEMA "config";

CREATE TABLE tab_communicator (
    id_communicator integer NOT NULL,
    communicator_name character varying(30),
    id_machine integer,
    port integer DEFAULT 55551 NOT NULL,
    monitor integer DEFAULT 0 NOT NULL,
    display_order integer
);


ALTER TABLE tab_communicator OWNER TO postgres;

--
-- Name: tab_communicator_id_communicator_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE tab_communicator_id_communicator_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tab_communicator_id_communicator_seq OWNER TO postgres;

--
-- Name: tab_communicator_id_communicator_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE tab_communicator_id_communicator_seq OWNED BY tab_communicator.id_communicator;


--
-- Name: id_communicator; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY tab_communicator ALTER COLUMN id_communicator SET DEFAULT nextval('tab_communicator_id_communicator_seq'::regclass);


--
-- Name: tab_communicator_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_communicator
    ADD CONSTRAINT tab_communicator_pkey PRIMARY KEY (id_communicator);


--
-- Name: tab_communicator_id_machine_fkey; Type: FK CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY tab_communicator
    ADD CONSTRAINT tab_communicator_id_machine_fkey FOREIGN KEY (id_machine) REFERENCES tab_machine(id_machine) ON UPDATE CASCADE ON DELETE SET NULL;

