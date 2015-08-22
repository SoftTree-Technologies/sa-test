CREATE FUNCTION "dblink"."get_conn"(a_database_name in character varying)
  RETURNS text AS
$$
DECLARE
  v_id_database int;
  v_id int;
  v_name text;

BEGIN

  SELECT id_database INTO v_id_database
  FROM config.tab_database WHERE database_name = a_database_name;

  -- je v tab_connection volne pripojeni?
  SELECT id_connection, connection_name INTO v_id, v_name
  FROM dblink.tab_connection
  WHERE id_database = v_id_database AND used = 0
  FOR UPDATE;

  IF FOUND THEN
    UPDATE dblink.tab_connection
    SET used = 1
    WHERE id_connection = v_id AND used = 0;

    PERFORM dblink.connect(v_id);
    RETURN v_name;
  END IF;

  -- vytvorit nove pripojeni
  INSERT INTO dblink.tab_connection (connection_name, id_database, used)
  VALUES ('', v_id_database, 1)
  RETURNING id_connection INTO v_id;

  v_name := a_database_name || '_' || v_id;

  UPDATE dblink.tab_connection
  SET connection_name = v_name
  WHERE id_connection = v_id;

  PERFORM dblink.connect(v_id);

  RETURN v_name;

END;
$$
LANGUAGE PLPGSQL;