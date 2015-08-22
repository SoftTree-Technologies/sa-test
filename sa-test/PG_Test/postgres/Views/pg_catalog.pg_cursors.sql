SET SCHEMA "pg_catalog";

CREATE VIEW pg_cursors AS
 SELECT c.name,
    c.statement,
    c.is_holdable,
    c.is_binary,
    c.is_scrollable,
    c.creation_time
   FROM pg_cursor() c(name, statement, is_holdable, is_binary, is_scrollable, creation_time);


ALTER TABLE pg_cursors OWNER TO postgres;

--
-- Name: pg_cursors; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_cursors FROM PUBLIC;
REVOKE ALL ON TABLE pg_cursors FROM postgres;
GRANT SELECT ON TABLE pg_cursors TO PUBLIC;

