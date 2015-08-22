CREATE FUNCTION "stats"."get_latest_stat_communicator"(_communicator_name out character varying,_stat_time out timestamp without time zone,_threads_connected out integer,_threads_busy out integer,_query_time out integer,_busy_time out integer,_request_count out integer,_error_count out integer,_last_request out timestamp without time zone)
  RETURNS record AS
$$
DECLARE
  v_id int;

BEGIN

FOR v_id, _communicator_name IN
  SELECT id_communicator, communicator_name
  FROM config.tab_communicator
  WHERE monitor=1
  ORDER BY display_order, id_communicator
LOOP

  SELECT
    s.stat_time,
    s.threads_connected, s.threads_busy,
    s.query_time, s.busy_time,
    s.request_count, s.error_count,
    s.last_request
  INTO
    _stat_time,
    _threads_connected, _threads_busy,
    _query_time, _busy_time,
    _request_count, _error_count,
    _last_request
  FROM stats.tab_stat_communicator s
  WHERE id_communicator = v_id
  ORDER BY stat_time DESC
  LIMIT 1;

  RETURN NEXT;

END LOOP;

RETURN;

END;$$
LANGUAGE PLPGSQL;