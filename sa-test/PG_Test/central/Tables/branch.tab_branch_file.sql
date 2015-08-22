SET SCHEMA "branch";

CREATE TABLE tab_branch_file (
    id_branch_file integer NOT NULL,
    hostname character varying(30),
    region character(2) DEFAULT 'cz'::bpchar NOT NULL,
    filename character varying(250),
    filecontent text,
    mtime timestamp without time zone,
    filecontent_md5 character(32),
    submited timestamp without time zone DEFAULT now(),
    status integer DEFAULT 1 NOT NULL
);


ALTER TABLE tab_branch_file OWNER TO postgres;

--
-- Name: tab_branch_file_id_branch_file_seq; Type: SEQUENCE; Schema: branch; Owner: postgres
--

CREATE SEQUENCE tab_branch_file_id_branch_file_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tab_branch_file_id_branch_file_seq OWNER TO postgres;

--
-- Name: tab_branch_file_id_branch_file_seq; Type: SEQUENCE OWNED BY; Schema: branch; Owner: postgres
--

ALTER SEQUENCE tab_branch_file_id_branch_file_seq OWNED BY tab_branch_file.id_branch_file;


--
-- Name: id_branch_file; Type: DEFAULT; Schema: branch; Owner: postgres
--

ALTER TABLE ONLY tab_branch_file ALTER COLUMN id_branch_file SET DEFAULT nextval('tab_branch_file_id_branch_file_seq'::regclass);


--
-- Name: tab_branch_config_hostname_key; Type: CONSTRAINT; Schema: branch; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_branch_file
    ADD CONSTRAINT tab_branch_config_hostname_key UNIQUE (hostname, region, filename, mtime);


--
-- Name: tab_branch_config_pkey; Type: CONSTRAINT; Schema: branch; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_branch_file
    ADD CONSTRAINT tab_branch_config_pkey PRIMARY KEY (id_branch_file);


--
-- Name: fki_; Type: INDEX; Schema: branch; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_ ON tab_branch_file USING btree (status);


--
-- Name: tr_aiu_branch_file; Type: TRIGGER; Schema: branch; Owner: postgres
--

CREATE TRIGGER tr_aiu_branch_file BEFORE INSERT OR UPDATE ON tab_branch_file FOR EACH ROW EXECUTE PROCEDURE tr_aiu_branch_file();


--
-- Name: tr_aiu_branch_file_filecontent; Type: TRIGGER; Schema: branch; Owner: postgres
--

CREATE TRIGGER tr_aiu_branch_file_filecontent BEFORE INSERT OR UPDATE ON tab_branch_file FOR EACH ROW EXECUTE PROCEDURE tr_aiu_branch_file_filecontent();


--
-- Name: tab_branch_file_status_fkey; Type: FK CONSTRAINT; Schema: branch; Owner: postgres
--

ALTER TABLE ONLY tab_branch_file
    ADD CONSTRAINT tab_branch_file_status_fkey FOREIGN KEY (status) REFERENCES szn_branch_file_status(id_branch_file_status) ON UPDATE CASCADE ON DELETE RESTRICT;

