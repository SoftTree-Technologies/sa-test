SET SCHEMA "dblink";

CREATE TABLE tab_connection (
    id_connection integer NOT NULL,
    connection_name character varying NOT NULL,
    id_database integer NOT NULL,
    connected integer DEFAULT 0 NOT NULL,
    used integer DEFAULT 0 NOT NULL
);


ALTER TABLE tab_connection OWNER TO postgres;

--
-- Name: tab_connection_id_connection_seq; Type: SEQUENCE; Schema: dblink; Owner: postgres
--

CREATE SEQUENCE tab_connection_id_connection_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tab_connection_id_connection_seq OWNER TO postgres;

--
-- Name: tab_connection_id_connection_seq; Type: SEQUENCE OWNED BY; Schema: dblink; Owner: postgres
--

ALTER SEQUENCE tab_connection_id_connection_seq OWNED BY tab_connection.id_connection;


--
-- Name: id_connection; Type: DEFAULT; Schema: dblink; Owner: postgres
--

ALTER TABLE ONLY tab_connection ALTER COLUMN id_connection SET DEFAULT nextval('tab_connection_id_connection_seq'::regclass);


--
-- Name: tab_connection_pkey; Type: CONSTRAINT; Schema: dblink; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_connection
    ADD CONSTRAINT tab_connection_pkey PRIMARY KEY (id_connection);


--
-- Name: fki_; Type: INDEX; Schema: dblink; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_ ON tab_connection USING btree (id_database);


--
-- Name: tab_connection_id_database_fkey; Type: FK CONSTRAINT; Schema: dblink; Owner: postgres
--

ALTER TABLE ONLY tab_connection
    ADD CONSTRAINT tab_connection_id_database_fkey FOREIGN KEY (id_database) REFERENCES config.tab_database(id_database) ON UPDATE CASCADE ON DELETE RESTRICT;

