SET SCHEMA "logs";

CREATE TABLE tab_log_replication (
    id_log_replication integer NOT NULL,
    id_replication integer NOT NULL,
    log_time timestamp without time zone NOT NULL,
    id_log_category integer DEFAULT 0 NOT NULL,
    queue_number bigint,
    message character varying(250),
    sqlstate character(5),
    query_type integer,
    query_table character varying,
    query_condition character varying,
    query_full character varying
);


ALTER TABLE tab_log_replication OWNER TO postgres;

--
-- Name: tab_log_replication_id_log_replication_seq; Type: SEQUENCE; Schema: logs; Owner: postgres
--

CREATE SEQUENCE tab_log_replication_id_log_replication_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tab_log_replication_id_log_replication_seq OWNER TO postgres;

--
-- Name: tab_log_replication_id_log_replication_seq; Type: SEQUENCE OWNED BY; Schema: logs; Owner: postgres
--

ALTER SEQUENCE tab_log_replication_id_log_replication_seq OWNED BY tab_log_replication.id_log_replication;


--
-- Name: id_log_replication; Type: DEFAULT; Schema: logs; Owner: postgres
--

ALTER TABLE ONLY tab_log_replication ALTER COLUMN id_log_replication SET DEFAULT nextval('tab_log_replication_id_log_replication_seq'::regclass);


--
-- Name: tab_log_replication_pkey; Type: CONSTRAINT; Schema: logs; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_log_replication
    ADD CONSTRAINT tab_log_replication_pkey PRIMARY KEY (id_log_replication);


--
-- Name: tab_log_replication_id_log_category_fkey; Type: FK CONSTRAINT; Schema: logs; Owner: postgres
--

ALTER TABLE ONLY tab_log_replication
    ADD CONSTRAINT tab_log_replication_id_log_category_fkey FOREIGN KEY (id_log_category) REFERENCES szn_log_category(id_log_category);


--
-- Name: tab_log_replication_id_replication_fkey; Type: FK CONSTRAINT; Schema: logs; Owner: postgres
--

ALTER TABLE ONLY tab_log_replication
    ADD CONSTRAINT tab_log_replication_id_replication_fkey FOREIGN KEY (id_replication) REFERENCES config.tab_replication(id_replication);

