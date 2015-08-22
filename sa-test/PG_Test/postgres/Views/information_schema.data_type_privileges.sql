SET SCHEMA "information_schema";

CREATE VIEW data_type_privileges AS
 SELECT (current_database())::sql_identifier AS object_catalog,
    x.objschema AS object_schema,
    x.objname AS object_name,
    (x.objtype)::character_data AS object_type,
    x.objdtdid AS dtd_identifier
   FROM ( SELECT attributes.udt_schema,
            attributes.udt_name,
            'USER-DEFINED TYPE'::text AS text,
            attributes.dtd_identifier
           FROM attributes
        UNION ALL
         SELECT columns.table_schema,
            columns.table_name,
            'TABLE'::text AS text,
            columns.dtd_identifier
           FROM columns
        UNION ALL
         SELECT domains.domain_schema,
            domains.domain_name,
            'DOMAIN'::text AS text,
            domains.dtd_identifier
           FROM domains
        UNION ALL
         SELECT parameters.specific_schema,
            parameters.specific_name,
            'ROUTINE'::text AS text,
            parameters.dtd_identifier
           FROM parameters
        UNION ALL
         SELECT routines.specific_schema,
            routines.specific_name,
            'ROUTINE'::text AS text,
            routines.dtd_identifier
           FROM routines) x(objschema, objname, objtype, objdtdid);


ALTER TABLE data_type_privileges OWNER TO postgres;

--
-- Name: data_type_privileges; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE data_type_privileges FROM PUBLIC;
REVOKE ALL ON TABLE data_type_privileges FROM postgres;
GRANT ALL ON TABLE data_type_privileges TO postgres;
GRANT SELECT ON TABLE data_type_privileges TO PUBLIC;

