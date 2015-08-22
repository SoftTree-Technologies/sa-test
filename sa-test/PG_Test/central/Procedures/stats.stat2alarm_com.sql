CREATE FUNCTION "stats"."stat2alarm_com"(_date_start in date,_date_end in date,_com in integer)
  RETURNS void AS
$$
DECLARE
  rcd RECORD;  
  _prev_time TIMESTAMP;
  _tolerance INTERVAL DEFAULT '5s';
  _comname VARCHAR;
  _idsubsys INT;
  _alarm_start TIMESTAMP;
  _alarm_end TIMESTAMP;
BEGIN

	SELECT communicator_name 
	INTO _comname
	FROM config.tab_communicator 
	WHERE id_communicator=_com;

	RAISE NOTICE '%', _com;

	IF _comname IS NULL THEN
		RAISE NOTICE 'Communicator % not found', _com;
		RETURN;
	END IF;

	

	RAISE NOTICE 'filtering for % - %', _date_start + '0:0'::time, _date_end + '1d'::interval + '0:0'::time;
	
	_idsubsys = alarms_app.register_subsystem('Communicator ' || _comname || '[' || _com || ']');

	DELETE 
	FROM alarms.tab_alarm
	WHERE id_subsystem=_idsubsys
	  AND alarm_start>=_date_start + '0:0'::time 
	  AND alarm_start<_date_end + '1d'::interval + '0:0'::time;
	
	
	FOR rcd IN
		SELECT *
		FROM stats.tab_stat_communicator
		WHERE stat_time>=_date_start + '0:0'::time 
		  AND stat_time<_date_end + '1d'::interval + '0:0'::time
		  AND id_communicator=_com
		ORDER BY stat_time
	LOOP
		if _prev_time IS NOT NULL THEN
			RAISE NOTICE 'prev time: %; curr time: %; diff: %; tolerance: %', _prev_time, rcd.stat_time, rcd.stat_time-_prev_time, '1m' + _tolerance;
			IF  rcd.stat_time-_prev_time > '1m' + _tolerance THEN
				RAISE NOTICE 'set alarm';
				_alarm_start = _prev_time+'1m';
			ELSEIF _alarm_start IS NOT NULL THEN 
				RAISE NOTICE 'end alarm';
				_alarm_end = rcd.stat_time;
			END IF;

			IF _alarm_start IS NOT NULL AND _alarm_end IS NOT NULL THEN
				PERFORM alarms_app.set_alarm(_alarm_start, _alarm_end, _idsubsys, 2, NULL, 1);
				_alarm_start=NULL;
				_alarm_end=NULL;
			END IF;
		END IF;
		_prev_time=rcd.stat_time;
	END LOOP;
		

RETURN;

END;$$
LANGUAGE PLPGSQL;