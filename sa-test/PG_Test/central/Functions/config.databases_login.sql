CREATE FUNCTION "config"."databases_login"(in_login_name in character varying,in_server_name in character varying,database_name out character varying,dbhost out character varying,dbport out smallint,dbname out character varying,hostaddr out inet,dbuser out character varying,dbpass out character varying)
  RETURNS record AS
$$
BEGIN

    RETURN QUERY
    SELECT 
            db.database_name, 
            db.dbhost, 
            db.dbport, 
            db.dbname, 
            db.hostaddr,
            login.db_login_name, 
            login.db_login_pass
    FROM config.tab_database db
    LEFT JOIN config.tab_db_login login ON login.id_database = db.id_database
    WHERE db_login_active = 1
        AND (in_server_name IS NULL OR db.database_name = in_server_name)
        AND (in_login_name IS NULL OR login.db_login_name = in_login_name)
    ORDER BY display_order;

END;
$$
LANGUAGE PLPGSQL;