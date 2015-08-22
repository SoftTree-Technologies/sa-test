SET SCHEMA "information_schema";

CREATE VIEW triggers AS
 SELECT (current_database())::sql_identifier AS trigger_catalog,
    (n.nspname)::sql_identifier AS trigger_schema,
    (t.tgname)::sql_identifier AS trigger_name,
    (em.text)::character_data AS event_manipulation,
    (current_database())::sql_identifier AS event_object_catalog,
    (n.nspname)::sql_identifier AS event_object_schema,
    (c.relname)::sql_identifier AS event_object_table,
    (NULL::integer)::cardinal_number AS action_order,
    (
        CASE
            WHEN pg_has_role(c.relowner, 'USAGE'::text) THEN ( SELECT rm.m[1] AS m
               FROM regexp_matches(pg_get_triggerdef(t.oid), '.{35,} WHEN \((.+)\) EXECUTE PROCEDURE'::text) rm(m)
             LIMIT 1)
            ELSE NULL::text
        END)::character_data AS action_condition,
    ("substring"(pg_get_triggerdef(t.oid), ("position"("substring"(pg_get_triggerdef(t.oid), 48), 'EXECUTE PROCEDURE'::text) + 47)))::character_data AS action_statement,
    (
        CASE ((t.tgtype)::integer & 1)
            WHEN 1 THEN 'ROW'::text
            ELSE 'STATEMENT'::text
        END)::character_data AS action_orientation,
    (
        CASE ((t.tgtype)::integer & 66)
            WHEN 2 THEN 'BEFORE'::text
            WHEN 64 THEN 'INSTEAD OF'::text
            ELSE 'AFTER'::text
        END)::character_data AS action_timing,
    (NULL::character varying)::sql_identifier AS action_reference_old_table,
    (NULL::character varying)::sql_identifier AS action_reference_new_table,
    (NULL::character varying)::sql_identifier AS action_reference_old_row,
    (NULL::character varying)::sql_identifier AS action_reference_new_row,
    (NULL::timestamp with time zone)::time_stamp AS created
   FROM pg_namespace n,
    pg_class c,
    pg_trigger t,
    ( VALUES (4,'INSERT'::text), (8,'DELETE'::text), (16,'UPDATE'::text)) em(num, text)
  WHERE ((((((n.oid = c.relnamespace) AND (c.oid = t.tgrelid)) AND (((t.tgtype)::integer & em.num) <> 0)) AND (NOT t.tgisinternal)) AND (NOT pg_is_other_temp_schema(n.oid))) AND ((pg_has_role(c.relowner, 'USAGE'::text) OR has_table_privilege(c.oid, 'INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER'::text)) OR has_any_column_privilege(c.oid, 'INSERT, UPDATE, REFERENCES'::text)));


ALTER TABLE triggers OWNER TO postgres;

--
-- Name: triggers; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE triggers FROM PUBLIC;
REVOKE ALL ON TABLE triggers FROM postgres;
GRANT ALL ON TABLE triggers TO postgres;
GRANT SELECT ON TABLE triggers TO PUBLIC;

