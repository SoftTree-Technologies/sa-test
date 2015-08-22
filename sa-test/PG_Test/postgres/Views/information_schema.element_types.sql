SET SCHEMA "information_schema";

CREATE VIEW element_types AS
 SELECT (current_database())::sql_identifier AS object_catalog,
    (n.nspname)::sql_identifier AS object_schema,
    x.objname AS object_name,
    (x.objtype)::character_data AS object_type,
    (x.objdtdid)::sql_identifier AS collection_type_identifier,
    (
        CASE
            WHEN (nbt.nspname = 'pg_catalog'::name) THEN format_type(bt.oid, NULL::integer)
            ELSE 'USER-DEFINED'::text
        END)::character_data AS data_type,
    (NULL::integer)::cardinal_number AS character_maximum_length,
    (NULL::integer)::cardinal_number AS character_octet_length,
    (NULL::character varying)::sql_identifier AS character_set_catalog,
    (NULL::character varying)::sql_identifier AS character_set_schema,
    (NULL::character varying)::sql_identifier AS character_set_name,
    (
        CASE
            WHEN (nco.nspname IS NOT NULL) THEN current_database()
            ELSE NULL::name
        END)::sql_identifier AS collation_catalog,
    (nco.nspname)::sql_identifier AS collation_schema,
    (co.collname)::sql_identifier AS collation_name,
    (NULL::integer)::cardinal_number AS numeric_precision,
    (NULL::integer)::cardinal_number AS numeric_precision_radix,
    (NULL::integer)::cardinal_number AS numeric_scale,
    (NULL::integer)::cardinal_number AS datetime_precision,
    (NULL::character varying)::character_data AS interval_type,
    (NULL::integer)::cardinal_number AS interval_precision,
    (NULL::character varying)::character_data AS domain_default,
    (current_database())::sql_identifier AS udt_catalog,
    (nbt.nspname)::sql_identifier AS udt_schema,
    (bt.typname)::sql_identifier AS udt_name,
    (NULL::character varying)::sql_identifier AS scope_catalog,
    (NULL::character varying)::sql_identifier AS scope_schema,
    (NULL::character varying)::sql_identifier AS scope_name,
    (NULL::integer)::cardinal_number AS maximum_cardinality,
    (('a'::text || (x.objdtdid)::text))::sql_identifier AS dtd_identifier
   FROM pg_namespace n,
    pg_type at,
    pg_namespace nbt,
    pg_type bt,
    (( SELECT c.relnamespace,
            (c.relname)::sql_identifier AS relname,
                CASE
                    WHEN (c.relkind = 'c'::"char") THEN 'USER-DEFINED TYPE'::text
                    ELSE 'TABLE'::text
                END AS "case",
            a.attnum,
            a.atttypid,
            a.attcollation
           FROM pg_class c,
            pg_attribute a
          WHERE ((((c.oid = a.attrelid) AND (c.relkind = ANY (ARRAY['r'::"char", 'v'::"char", 'f'::"char", 'c'::"char"]))) AND (a.attnum > 0)) AND (NOT a.attisdropped))
        UNION ALL
         SELECT t.typnamespace,
            (t.typname)::sql_identifier AS typname,
            'DOMAIN'::text AS text,
            1,
            t.typbasetype,
            t.typcollation
           FROM pg_type t
          WHERE (t.typtype = 'd'::"char")
        UNION ALL
         SELECT ss.pronamespace,
            ((((ss.proname)::text || '_'::text) || (ss.oid)::text))::sql_identifier AS sql_identifier,
            'ROUTINE'::text AS text,
            (ss.x).n AS n,
            (ss.x).x AS x,
            0
           FROM ( SELECT p.pronamespace,
                    p.proname,
                    p.oid,
                    _pg_expandarray(COALESCE(p.proallargtypes, (p.proargtypes)::oid[])) AS x
                   FROM pg_proc p) ss
        UNION ALL
         SELECT p.pronamespace,
            ((((p.proname)::text || '_'::text) || (p.oid)::text))::sql_identifier AS sql_identifier,
            'ROUTINE'::text AS text,
            0,
            p.prorettype,
            0
           FROM pg_proc p) x(objschema, objname, objtype, objdtdid, objtypeid, objcollation)
     LEFT JOIN (pg_collation co
     JOIN pg_namespace nco ON ((co.collnamespace = nco.oid))) ON (((x.objcollation = co.oid) AND ((nco.nspname <> 'pg_catalog'::name) OR (co.collname <> 'default'::name)))))
  WHERE ((((((n.oid = x.objschema) AND (at.oid = x.objtypeid)) AND ((at.typelem <> (0)::oid) AND (at.typlen = (-1)))) AND (at.typelem = bt.oid)) AND (nbt.oid = bt.typnamespace)) AND ((n.nspname, (x.objname)::text, x.objtype, ((x.objdtdid)::sql_identifier)::text) IN ( SELECT data_type_privileges.object_schema,
            data_type_privileges.object_name,
            data_type_privileges.object_type,
            data_type_privileges.dtd_identifier
           FROM data_type_privileges)));


ALTER TABLE element_types OWNER TO postgres;

--
-- Name: element_types; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE element_types FROM PUBLIC;
REVOKE ALL ON TABLE element_types FROM postgres;
GRANT ALL ON TABLE element_types TO postgres;
GRANT SELECT ON TABLE element_types TO PUBLIC;

