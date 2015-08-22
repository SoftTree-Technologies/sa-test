CREATE FUNCTION "config"."replication_remote_add"(server_alias in character varying,repl_name in character varying)
  RETURNS void AS
$$

    -- Author: Michal Kozusznik
    -- Created: 2015-02-01
    -- Adds new replication to replikace.rep_stanice
    -- FYI: it adds only destination connection data.

    /*
    Examples:
    SELECT config.replication_remote_add('sazky_pl','web_test03_pl');
    
    */


DECLARE
	conn_name VARCHAR;
	conndata RECORD;
    sqlquery VARCHAR;
    rcd RECORD;
    isexisting BOOLEAN;
BEGIN

    -- Get connection data of remote server
    SELECT database_name, dbhost,dbport,dbname,dbuser,password_plain dbpass
    INTO conndata
      FROM config.tab_database 
    JOIN config.tab_password USING(id_password)
    WHERE database_name = server_alias;
    
    IF NOT FOUND THEN
    	RAISE EXCEPTION 'Database not found: %', server_alias;
    END IF;
    
    
    
    conn_name = 'admconn_' ||  conndata.database_name;
    RAISE NOTICE 'Connection name: : %' , conn_name;
    
    -- connect to remote server
    IF NOT COALESCE(conn_name = ANY (dblink_get_connections()),FALSE) THEN
    	RAISE NOTICE 'Connection to: %' , conndata;
        PERFORM dblink_connect(conn_name , 'dbname=' || conndata.dbname || ' host=' || conndata.dbhost || ' user=' || conndata.dbuser || ' password=' || conndata.dbpass || '');
    END IF;
    
    -- Check if replication is already added to remote server
    SELECT _check
    INTO isexisting
	FROM dblink(conn_name, 'SELECT EXISTS(SELECT 1 FROM replikace.rep_stanice WHERE nazev_stanice=' || quote_literal(repl_name) || ')')
	AS conn (_check BOOLEAN);
	
	IF isexisting THEN
--		PERFORM dblink_close(conn_name);
		RAISE EXCEPTION SQLSTATE '23505' USING MESSAGE = 'Replication: ' || repl_name || ' already exists in destination database: ' || server_alias;
	END IF;
    
    
    -- read replication data
    SELECT * 
    INTO rcd
    FROM config.replication_get_data(repl_name);
    
    IF NOT FOUND THEN
 --   	PERFORM dblink_close(conn_name);
    	RAISE EXCEPTION 'Replication not found: %', repl_name;
    END IF;
    
    sqlquery = 'INSERT INTO replikace.rep_stanice
        (
        id_stanice, 
        nazev_stanice, 
        skupina, 
        ip, 
        port, 
        dbname, 
        dbuser, 
        dbpassw
        )
    VALUES
    (
        ' || quote_literal(rcd.id_replication) || ',
        ' || quote_literal(rcd.replication_name) || ',
        ' || quote_literal(rcd.id_replication_group) || ',
        ' || quote_literal(rcd.dst_host) || ',
        ' || quote_literal(rcd.dst_port) || ',
        ' || quote_literal(rcd.dst_dbname) || ',
        ' || quote_literal(rcd.dst_dbuser) || ',
        ' || quote_literal(rcd.dst_dbpass) || '
    )';
    

    -- add replication to remote server
    PERFORM dblink_exec(conn_name, sqlquery)
    FROM config.replication_get_data(repl_name);

  --  PERFORM dblink_close(conn_name);
   
END;

$$
LANGUAGE PLPGSQL;