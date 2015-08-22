SET SCHEMA "config";

CREATE TABLE tab_replication (
    id_replication integer NOT NULL,
    replication_name character varying(30),
    id_database_src integer,
    id_database_dst integer,
    id_replication_group integer,
    monitor integer DEFAULT 0 NOT NULL,
    display_order integer,
    packet_size integer DEFAULT 250 NOT NULL
);


ALTER TABLE tab_replication OWNER TO postgres;

--
-- Name: tab_replication_id_replication_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE tab_replication_id_replication_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tab_replication_id_replication_seq OWNER TO postgres;

--
-- Name: tab_replication_id_replication_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE tab_replication_id_replication_seq OWNED BY tab_replication.id_replication;


--
-- Name: id_replication; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY tab_replication ALTER COLUMN id_replication SET DEFAULT nextval('tab_replication_id_replication_seq'::regclass);


--
-- Name: szn_replicate_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_replication
    ADD CONSTRAINT szn_replicate_pkey PRIMARY KEY (id_replication);


--
-- Name: szn_replicate_dst_id_database_fkey; Type: FK CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY tab_replication
    ADD CONSTRAINT szn_replicate_dst_id_database_fkey FOREIGN KEY (id_database_dst) REFERENCES tab_database(id_database) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: szn_replicate_src_id_database_fkey; Type: FK CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY tab_replication
    ADD CONSTRAINT szn_replicate_src_id_database_fkey FOREIGN KEY (id_database_src) REFERENCES tab_database(id_database) ON UPDATE CASCADE ON DELETE CASCADE;

