CREATE FUNCTION "alarms_app"."set_alarm"(_id_subsystem in integer,_id_alarm_message in integer,_alarm_args in ARRAY)
  RETURNS void AS
$$
DECLARE
_id_alarm BIGINT;
BEGIN

	PERFORM alarms_app.set_alarm(LOCALTIMESTAMP, LOCALTIMESTAMP, _id_subsystem, _id_alarm_message, _alarm_args);
END;
$$
LANGUAGE PLPGSQL;