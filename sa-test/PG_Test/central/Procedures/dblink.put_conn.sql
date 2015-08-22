CREATE FUNCTION "dblink"."put_conn"(a_connection_name in character varying)
  RETURNS void AS
$$
BEGIN

  UPDATE dblink.tab_connection
  SET used = 0
  WHERE connection_name = a_connection_name;

END;
$$
LANGUAGE PLPGSQL;