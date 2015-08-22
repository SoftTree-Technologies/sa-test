SET SCHEMA "stats";

CREATE TABLE tab_stat_replication (
    id_stat_replication integer NOT NULL,
    id_replication integer NOT NULL,
    stat_time timestamp without time zone DEFAULT now() NOT NULL,
    last_rec_timestamp timestamp without time zone,
    recs_remaining integer,
    recs_processed integer,
    read_time numeric(6,2),
    processing_time numeric(6,2),
    errors_duplicate integer,
    errors_badkey integer,
    errors_other integer
);


ALTER TABLE tab_stat_replication OWNER TO postgres;

--
-- Name: tab_stat_replication_id_stat_replication_seq; Type: SEQUENCE; Schema: stats; Owner: postgres
--

CREATE SEQUENCE tab_stat_replication_id_stat_replication_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tab_stat_replication_id_stat_replication_seq OWNER TO postgres;

--
-- Name: tab_stat_replication_id_stat_replication_seq; Type: SEQUENCE OWNED BY; Schema: stats; Owner: postgres
--

ALTER SEQUENCE tab_stat_replication_id_stat_replication_seq OWNED BY tab_stat_replication.id_stat_replication;


--
-- Name: id_stat_replication; Type: DEFAULT; Schema: stats; Owner: postgres
--

ALTER TABLE ONLY tab_stat_replication ALTER COLUMN id_stat_replication SET DEFAULT nextval('tab_stat_replication_id_stat_replication_seq'::regclass);


--
-- Name: tab_stat_replication_pkey; Type: CONSTRAINT; Schema: stats; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_stat_replication
    ADD CONSTRAINT tab_stat_replication_pkey PRIMARY KEY (id_stat_replication);


--
-- Name: ix_tab_stat_replication_id_replication; Type: INDEX; Schema: stats; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_tab_stat_replication_id_replication ON tab_stat_replication USING btree (id_replication);


--
-- Name: ix_tab_stat_replication_id_replication_date; Type: INDEX; Schema: stats; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_tab_stat_replication_id_replication_date ON tab_stat_replication USING btree (id_replication, date(stat_time));


--
-- Name: ix_tab_stat_replication_stat_time; Type: INDEX; Schema: stats; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_tab_stat_replication_stat_time ON tab_stat_replication USING btree (stat_time);


--
-- Name: tab_stat_replication_id_replication_fkey; Type: FK CONSTRAINT; Schema: stats; Owner: postgres
--

ALTER TABLE ONLY tab_stat_replication
    ADD CONSTRAINT tab_stat_replication_id_replication_fkey FOREIGN KEY (id_replication) REFERENCES config.tab_replication(id_replication) ON UPDATE CASCADE ON DELETE CASCADE;

