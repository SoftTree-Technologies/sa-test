SET SCHEMA "stats";

CREATE TABLE tab_stat_communicator (
    id_stat_communicator integer NOT NULL,
    id_communicator integer NOT NULL,
    stat_time timestamp without time zone DEFAULT now() NOT NULL,
    threads_connected integer,
    threads_busy integer,
    query_time integer,
    busy_time integer,
    request_count integer,
    error_count integer,
    last_request timestamp without time zone
);


ALTER TABLE tab_stat_communicator OWNER TO postgres;

--
-- Name: tab_stat_communicator_id_stat_communicator_seq; Type: SEQUENCE; Schema: stats; Owner: postgres
--

CREATE SEQUENCE tab_stat_communicator_id_stat_communicator_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tab_stat_communicator_id_stat_communicator_seq OWNER TO postgres;

--
-- Name: tab_stat_communicator_id_stat_communicator_seq; Type: SEQUENCE OWNED BY; Schema: stats; Owner: postgres
--

ALTER SEQUENCE tab_stat_communicator_id_stat_communicator_seq OWNED BY tab_stat_communicator.id_stat_communicator;


--
-- Name: id_stat_communicator; Type: DEFAULT; Schema: stats; Owner: postgres
--

ALTER TABLE ONLY tab_stat_communicator ALTER COLUMN id_stat_communicator SET DEFAULT nextval('tab_stat_communicator_id_stat_communicator_seq'::regclass);


--
-- Name: tab_stat_communicator_pkey; Type: CONSTRAINT; Schema: stats; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_stat_communicator
    ADD CONSTRAINT tab_stat_communicator_pkey PRIMARY KEY (id_stat_communicator);


--
-- Name: ix_tab_stat_communicator_id_communicator; Type: INDEX; Schema: stats; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_tab_stat_communicator_id_communicator ON tab_stat_communicator USING btree (id_communicator);


--
-- Name: ix_tab_stat_communicator_id_communicator_date; Type: INDEX; Schema: stats; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_tab_stat_communicator_id_communicator_date ON tab_stat_communicator USING btree (id_communicator, date(stat_time));


--
-- Name: ix_tab_stat_communicator_stat_time; Type: INDEX; Schema: stats; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_tab_stat_communicator_stat_time ON tab_stat_communicator USING btree (stat_time);


--
-- Name: tab_stat_communicator_id_communicator_fkey; Type: FK CONSTRAINT; Schema: stats; Owner: postgres
--

ALTER TABLE ONLY tab_stat_communicator
    ADD CONSTRAINT tab_stat_communicator_id_communicator_fkey FOREIGN KEY (id_communicator) REFERENCES config.tab_communicator(id_communicator) ON UPDATE CASCADE ON DELETE CASCADE;

