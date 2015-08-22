CREATE FUNCTION "config"."list_printables"(_name out character varying,_host out character varying,_port out integer,_dbname out character varying)
  RETURNS record AS
$$
BEGIN

  RETURN QUERY
  SELECT
    p.printables_name AS "name",
    COALESCE(m.machine_dns, host(m.machine_ip)) AS "host",
    p.port,
    d.database_name AS "dbname"
  FROM config.tab_printables p
  JOIN config.tab_machine m USING (id_machine)
  JOIN config.tab_database d USING (id_database)
  ORDER BY d.display_order, p.display_order;

  RETURN;
  
END;
$$
LANGUAGE PLPGSQL;