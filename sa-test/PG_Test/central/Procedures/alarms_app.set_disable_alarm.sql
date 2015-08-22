CREATE FUNCTION "alarms_app"."set_disable_alarm"(_id_alarm in bigint)
  RETURNS void AS
$$
DECLARE
_alarm_confirmed BIGINT;
BEGIN

	SELECT	alarm_confirmed
	INTO	_alarm_confirmed
	FROM	alarms.tab_alarm
	WHERE	id_alarm=_id_alarm;

	IF _alarm_confirmed=1 THEN
		RAISE EXCEPTION 'Alarm #% is disabled already', _id_alarm;
	END IF;

	IF _alarm_confirmed IS NULL THEN
		RAISE EXCEPTION 'There is no alarm #% to disable', _id_alarm;
	END IF;

	UPDATE alarms.tab_alarm SET
		alarm_lastlog=CURRENT_TIMESTAMP,
		alarm_end=CURRENT_TIMESTAMP,
		alarm_confirmed=1
	WHERE id_alarm=_id_alarm;

END;
$$
LANGUAGE PLPGSQL;