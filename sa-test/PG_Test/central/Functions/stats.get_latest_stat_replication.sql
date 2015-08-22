CREATE FUNCTION "stats"."get_latest_stat_replication"(_replication_name out character varying,_stat_time out timestamp without time zone,_last_rec_timestamp out timestamp without time zone,_recs_remaining out integer,_recs_processed out integer,_read_time out numeric,_processing_time out numeric,_errors_duplicate out integer,_errors_badkey out integer,_errors_other out integer)
  RETURNS record AS
$$
DECLARE
  v_id int;

BEGIN

FOR v_id, _replication_name IN
  SELECT id_replication, replication_name
  FROM config.tab_replication
  WHERE monitor=1
  ORDER BY display_order, id_replication
LOOP

  SELECT
    s.stat_time, s.last_rec_timestamp,
    s.recs_remaining, s.recs_processed, s.read_time, s.processing_time,
    s.errors_duplicate, s.errors_badkey, s.errors_other
  INTO
    _stat_time, _last_rec_timestamp,
    _recs_remaining, _recs_processed, _read_time, _processing_time,
    _errors_duplicate, _errors_badkey, _errors_other
  FROM stats.tab_stat_replication s
  WHERE id_replication = v_id
  ORDER BY stat_time DESC
  LIMIT 1;

  RETURN NEXT;

END LOOP;

RETURN;

END;$$
LANGUAGE PLPGSQL;