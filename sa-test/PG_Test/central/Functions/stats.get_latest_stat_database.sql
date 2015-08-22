CREATE FUNCTION "stats"."get_latest_stat_database"(_database_name out character varying,_stat_time out timestamp without time zone,_repl_tmp_queue_size out integer,_backends_total out integer,_backends_busy out integer,_tup_returned out bigint,_tup_fetched out bigint,_tup_inserted out bigint,_tup_updated out bigint,_tup_deleted out bigint)
  RETURNS record AS
$$
DECLARE
  v_id int;

BEGIN

FOR v_id, _database_name IN
  SELECT id_database, database_name
  FROM config.tab_database
  WHERE monitor=1
  ORDER BY display_order, id_database
LOOP

  SELECT
    s.stat_time, s.repl_tmp_queue_size,
    s.backends_total, s.backends_busy,
    s.tup_returned, s.tup_fetched, s.tup_inserted, s.tup_updated, s.tup_deleted
  INTO
    _stat_time, _repl_tmp_queue_size,
    _backends_total, _backends_busy,
    _tup_returned, _tup_fetched, _tup_inserted, _tup_updated, _tup_deleted
  FROM stats.tab_stat_database s
  WHERE id_database = v_id
  ORDER BY stat_time DESC
  LIMIT 1;

  RETURN NEXT;

END LOOP;

RETURN;

END;$$
LANGUAGE PLPGSQL;