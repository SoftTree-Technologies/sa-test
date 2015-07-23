SET SCHEMA "config";

CREATE TABLE szn_replication_group (
    id_replication_group integer DEFAULT 0 NOT NULL,
    replication_group_name character varying(100)
);


ALTER TABLE szn_replication_group OWNER TO postgres;

--
-- Name: szn_group_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY szn_replication_group
    ADD CONSTRAINT szn_group_pkey PRIMARY KEY (id_replication_group);

