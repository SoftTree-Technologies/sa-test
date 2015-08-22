CREATE FUNCTION "alarms"."update_alarm_len"()
  RETURNS trigger AS
$$
BEGIN
	IF NEW.alarm_start IS NOT NULL AND NEW.alarm_end IS NOT NULL THEN
		NEW.alarm_length=NEW.alarm_end-NEW.alarm_start;
	END IF;

	RETURN NEW;
END;
$$
LANGUAGE PLPGSQL;