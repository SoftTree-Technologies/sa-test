SET SCHEMA "branch";

CREATE TABLE szn_branch_file_status (
    id_branch_file_status integer NOT NULL,
    name_internal character varying(30),
    name_ui character varying(30)
);


ALTER TABLE szn_branch_file_status OWNER TO postgres;

--
-- Name: szn_branch_file_status_pkey; Type: CONSTRAINT; Schema: branch; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY szn_branch_file_status
    ADD CONSTRAINT szn_branch_file_status_pkey PRIMARY KEY (id_branch_file_status);

