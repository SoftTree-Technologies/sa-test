SET SCHEMA "stats";

CREATE TABLE tab_stat_database (
    id_stat_database integer NOT NULL,
    id_database integer NOT NULL,
    stat_time timestamp without time zone DEFAULT now() NOT NULL,
    repl_tmp_queue_size integer,
    backends_total integer,
    backends_busy integer,
    tup_fetched bigint,
    tup_inserted integer,
    tup_updated integer,
    tup_deleted integer,
    tup_returned bigint
);


ALTER TABLE tab_stat_database OWNER TO postgres;

--
-- Name: tab_stat_database_id_stat_database_seq; Type: SEQUENCE; Schema: stats; Owner: postgres
--

CREATE SEQUENCE tab_stat_database_id_stat_database_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tab_stat_database_id_stat_database_seq OWNER TO postgres;

--
-- Name: tab_stat_database_id_stat_database_seq; Type: SEQUENCE OWNED BY; Schema: stats; Owner: postgres
--

ALTER SEQUENCE tab_stat_database_id_stat_database_seq OWNED BY tab_stat_database.id_stat_database;


--
-- Name: id_stat_database; Type: DEFAULT; Schema: stats; Owner: postgres
--

ALTER TABLE ONLY tab_stat_database ALTER COLUMN id_stat_database SET DEFAULT nextval('tab_stat_database_id_stat_database_seq'::regclass);


--
-- Name: tab_stat_database_pkey; Type: CONSTRAINT; Schema: stats; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_stat_database
    ADD CONSTRAINT tab_stat_database_pkey PRIMARY KEY (id_stat_database);


--
-- Name: ix_tab_stat_database_id_database; Type: INDEX; Schema: stats; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_tab_stat_database_id_database ON tab_stat_database USING btree (id_database);


--
-- Name: ix_tab_stat_database_id_database_date; Type: INDEX; Schema: stats; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_tab_stat_database_id_database_date ON tab_stat_database USING btree (id_database, date(stat_time));


--
-- Name: ix_tab_stat_database_stat_time; Type: INDEX; Schema: stats; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_tab_stat_database_stat_time ON tab_stat_database USING btree (stat_time);


--
-- Name: tab_stat_database_id_database_fkey; Type: FK CONSTRAINT; Schema: stats; Owner: postgres
--

ALTER TABLE ONLY tab_stat_database
    ADD CONSTRAINT tab_stat_database_id_database_fkey FOREIGN KEY (id_database) REFERENCES config.tab_database(id_database) ON UPDATE CASCADE ON DELETE CASCADE;

