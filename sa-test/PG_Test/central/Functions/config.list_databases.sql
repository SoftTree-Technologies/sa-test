CREATE FUNCTION "config"."list_databases"(database_name out character varying,dbhost out inet,dbport out smallint,dbname out character varying,dbuser out character varying,dbpass out character varying)
  RETURNS record AS
$$
BEGIN
  IF session_user = 'betsys' THEN
    RETURN QUERY
      SELECT d.database_name, d.dbhost, d.dbport, d.dbname, d.dbuser, dp.password_plain
      FROM config.tab_database AS d
      LEFT JOIN config.tab_password AS dp USING (id_password)
      WHERE d.id_database_group in (1,2)
      ORDER BY display_order;
  ELSE
    RETURN QUERY
      SELECT d.database_name, d.dbhost, d.dbport, d.dbname, d.dbuser, dp.password_plain
      FROM config.tab_database AS d
      LEFT JOIN config.tab_password AS dp USING (id_password)
      ORDER BY display_order;
  END IF;
END;
$$
LANGUAGE PLPGSQL;