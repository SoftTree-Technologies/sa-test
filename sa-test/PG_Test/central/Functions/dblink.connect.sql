CREATE FUNCTION "dblink"."connect"(a_id_connection in integer)
  RETURNS text AS
$$
DECLARE
  v_conn_name varchar;
  v_conn_str varchar;
  v_db record;
BEGIN

  SELECT connection_name INTO v_conn_name
  FROM dblink.tab_connection
  WHERE id_connection = a_id_connection;

  IF ARRAY[v_conn_name]::text[] <@ dblink_get_connections() THEN
    RETURN 'already connected';
  END IF;

  SELECT db.*, dbpass.password_plain AS dbpass INTO v_db
  FROM dblink.tab_connection AS c
  JOIN config.tab_database AS db USING (id_database)
  LEFT JOIN config.tab_password AS dbpass USING (id_password)
  WHERE c.id_connection = a_id_connection;

  v_conn_str := 'hostaddr=' || host(v_db.dbhost)
  || ' port=' || v_db.dbport
  || ' dbname=' || v_db.dbname
  || ' user=' || v_db.dbuser;

  IF v_db.dbpass IS NOT NULL THEN
    v_conn_str := v_conn_str || ' password=' || v_db.dbpass;
  END IF;

  PERFORM dblink_connect(v_conn_name, v_conn_str);

  UPDATE dblink.tab_connection
  SET connected = 1
  WHERE id_connection = a_id_connection;

  RETURN v_conn_str;

END;
$$
LANGUAGE PLPGSQL;