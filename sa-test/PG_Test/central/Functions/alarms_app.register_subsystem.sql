CREATE FUNCTION "alarms_app"."register_subsystem"(_subsystem in character varying)
  RETURNS integer AS
$$
DECLARE
_id_subsystem INT;
BEGIN
	SELECT	id_subsystem
	INTO	_id_subsystem 
	FROM	alarms.szn_subsystems
	WHERE	subsystem_name=_subsystem;



	IF _id_subsystem IS NULL THEN
		INSERT INTO alarms.szn_subsystems
			( subsystem_name )
		VALUES	( _subsystem )
		RETURNING id_subsystem INTO _id_subsystem;
	END IF;

	return _id_subsystem;

END;
$$
LANGUAGE PLPGSQL;