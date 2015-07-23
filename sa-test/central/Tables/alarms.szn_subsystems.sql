SET SCHEMA "alarms";

CREATE TABLE szn_subsystems (
    id_subsystem integer NOT NULL,
    subsystem_name character varying NOT NULL
);


ALTER TABLE szn_subsystems OWNER TO postgres;

--
-- Name: szn_subsystems_id_subsystem_seq; Type: SEQUENCE; Schema: alarms; Owner: postgres
--

CREATE SEQUENCE szn_subsystems_id_subsystem_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE szn_subsystems_id_subsystem_seq OWNER TO postgres;

--
-- Name: szn_subsystems_id_subsystem_seq; Type: SEQUENCE OWNED BY; Schema: alarms; Owner: postgres
--

ALTER SEQUENCE szn_subsystems_id_subsystem_seq OWNED BY szn_subsystems.id_subsystem;


--
-- Name: id_subsystem; Type: DEFAULT; Schema: alarms; Owner: postgres
--

ALTER TABLE ONLY szn_subsystems ALTER COLUMN id_subsystem SET DEFAULT nextval('szn_subsystems_id_subsystem_seq'::regclass);


--
-- Name: szn_subsystems_pkey; Type: CONSTRAINT; Schema: alarms; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY szn_subsystems
    ADD CONSTRAINT szn_subsystems_pkey PRIMARY KEY (id_subsystem);


--
-- Name: ux_subsystems_name; Type: INDEX; Schema: alarms; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ux_subsystems_name ON szn_subsystems USING btree (subsystem_name);

