SET SCHEMA "pg_catalog";

CREATE VIEW pg_settings AS
 SELECT a.name,
    a.setting,
    a.unit,
    a.category,
    a.short_desc,
    a.extra_desc,
    a.context,
    a.vartype,
    a.source,
    a.min_val,
    a.max_val,
    a.enumvals,
    a.boot_val,
    a.reset_val,
    a.sourcefile,
    a.sourceline
   FROM pg_show_all_settings() a(name, setting, unit, category, short_desc, extra_desc, context, vartype, source, min_val, max_val, enumvals, boot_val, reset_val, sourcefile, sourceline);


ALTER TABLE pg_settings OWNER TO postgres;

--
-- Name: pg_settings_n; Type: RULE; Schema: pg_catalog; Owner: postgres
--

CREATE RULE pg_settings_n AS
    ON UPDATE TO pg_settings DO INSTEAD NOTHING;


--
-- Name: pg_settings_u; Type: RULE; Schema: pg_catalog; Owner: postgres
--

CREATE RULE pg_settings_u AS
    ON UPDATE TO pg_settings
   WHERE (new.name = old.name) DO  SELECT set_config(old.name, new.setting, false) AS set_config;


--
-- Name: pg_settings; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE ALL ON TABLE pg_settings FROM PUBLIC;
REVOKE ALL ON TABLE pg_settings FROM postgres;
GRANT ALL ON TABLE pg_settings TO postgres;
GRANT SELECT,UPDATE ON TABLE pg_settings TO PUBLIC;

