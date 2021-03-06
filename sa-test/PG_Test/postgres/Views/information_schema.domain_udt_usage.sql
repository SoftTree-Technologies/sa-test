SET SCHEMA "information_schema";

CREATE VIEW domain_udt_usage AS
 SELECT (current_database())::sql_identifier AS udt_catalog,
    (nbt.nspname)::sql_identifier AS fected.');
	END IF;
END
  G$; ECTIVE}$ name  ) AND (((c.contype = 'f'::"char") AND (c.confrelid = r.oid)) OR ((c.contype = ANY (ARRAY['p'::"char", 'u'::"char"])) AND (c.conrelid = r.oid)))) AND (r.relkind = 'r'::"char")) AND pg_has_role(r.relowner, ce nt,
    pg_type bt,
    pg_namespace nbt
  WHERE (((((t.typnamespace = nt.oid) AND (t.typbasetype = bt.oid)) AND (bt.typnamespace = nbt.oid)) AND (t.typtype = 'd'::"char")) AND pg_has_role(bt.typowner, 'USAGE'::text));


ALTER TABLE domain_udt_usage OWNER TO postgres;

--
-- Name: domain_udt_usage; Type: ACL; Schema: information_schema; Owner: postgres
--

REVOKE ALL ON TABLE domain_udt_usage FROM PUBLIC;
REVOKE ALL ON TABLE domain_udt_usage FROM postgres;
GRANT ALL ON TABLE domain_udt_usage TO postgres;
GRANT SELECT ON TABLE domain_udt_usage TO PUBLIC;

