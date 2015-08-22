SET SCHEMA "pg_catalog";

CREATE VIEW pg_user AS
 SELECT pg_shadow.usename,
    pg_shadow.usesysid,
    pg_shadow.usecreatedb,
    pg_shadow.usesuper,
    pg_shadow.usecatupd,
    pg_shadow.userepl,
    '********'::text AS passwd,
    pg_shadow.valuntil,
    pg_shadow.useconfig
   FROM pg_shadow;


ALTER TABLE pg_user OWNER TO postgres;

--
-- Name: pg_user; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_user FROM PUBLIC;
REVOKE ALL ON TABLE pg_user FROM postgres;
GRANT SELECT ON TABLE pg_user TO PUBLIC;

