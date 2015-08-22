SET SCHEMA "config";

CREATE TABLE tab_database (
    id_database integer NOT NULL,
    database_name character varying(30),
    id_database_type integer,
    dbhost character varying,
    dbport smallint,
    dbname character varying,
    dbuser character varying(30),
    monitor integer DEFAULT 0 NOT NULL,
    display_order integer,
    id_password integer,
    hostaddr inet
);


ALTER TABLE tab_database OWNER TO postgres;

--
-- Name: tab_database_id_database_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE tab_database_id_database_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tab_database_id_database_seq OWNER TO postgres;

--
-- Name: tab_database_id_database_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE tab_database_id_database_seq OWNED BY tab_database.id_database;


--
-- Name: id_database; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY tab_database ALTER COLUMN id_database SET DEFAULT nextval('tab_database_id_database_seq'::regclass);


--
-- Name: szn_database_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_database
    ADD CONSTRAINT szn_database_pkey PRIMARY KEY (id_database);


--
-- Name: tab_database_database_name_key; Type: CONSTRAINT; Schema: config; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_database
    ADD CONSTRAINT tab_database_database_name_key UNIQUE (database_name);


--
-- Name: fki_database_type; Type: INDEX; Schema: config; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_database_type ON tab_database USING btree (id_database_type);


--
-- Name: fki_password; Type: INDEX; Schema: config; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_password ON tab_database USING btree (id_password);


--
-- Name: ux_database_name; Type: INDEX; Schema: config; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ux_database_name ON tab_database USING btree (database_name);


--
-- Name: tab_database_id_database_type_fkey; Type: FK CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY tab_database
    ADD CONSTRAINT tab_database_id_database_type_fkey FOREIGN KEY (id_database_type) REFERENCES szn_database_type(id_database_type) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tab_database_id_password_fkey; Type: FK CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY tab_database
    ADD CONSTRAINT tab_database_id_password_fkey FOREIGN KEY (id_password) REFERENCES tab_password(id_password) ON UPDATE CASCADE ON DELETE SET NULL;

