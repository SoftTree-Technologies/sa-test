CREATE FUNCTION "alarms_app"."set_alarm_old"(_time_start in timestamp without time zone,_time_end in timestamp without time zone,_id_subsystem in integer,_id_alarm_message in integer,_alarm_args in ARRAY)
  RETURNS void AS
$$
DECLARE
_id_alarm BIGINT;
BEGIN

	SELECT	id_alarm
	INTO	_id_alarm 
	FROM	alarms.tab_alarm 
	WHERE	id_alarm_message=_id_alarm_message
	  AND   id_subsystem=_id_subsystem
	  AND	alarm_confirmed=0
	FOR UPDATE;

	IF _id_alarm IS NULL THEN
		INSERT INTO alarms.tab_alarm
			( alarm_start,alarm_lastlog,id_subsystem, id_alarm_message, alarm_args )
		VALUES	(_time_start, _time_end,_id_subsystem, _id_alarm_message, _alarm_args);

	ELSE
		UPDATE alarms.tab_alarm SET
			alarm_lastlog=CURRENT_TIMESTAMP,
			alarm_count=alarm_count+1
		WHERE id_alarm=_id_alarm;
	END IF;

END;
$$
LANGUAGE PLPGSQL;