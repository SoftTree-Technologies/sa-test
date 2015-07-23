SET SCHEMA "config";

CREATE TABLE tab_user (
    id_user integer NOT NULL,
    user_name character varying(20) NOT NULL,
    user_pass character(32) DEFAULT md5('username:password'::text) NOT NULL
);


ALTER TABLE tab_user OWNER TO postgres;

--
-- Name: tab_user_id_user_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE tab_user_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tab_user_id_user_seq OWNER TO postgres;

--
-- Name: tab_user_id_user_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE tab_user_id_user_seq OWNED BY tab_user.id_user;


--
-- Name: id_user; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY tab_user ALTER COLUMN id_user SET DEFAULT nextval('tab_user_id_user_seq'::regclass);


--
-- Name: tab_user_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_user
    ADD CONSTRAINT tab_user_pkey PRIMARY KEY (id_user);

