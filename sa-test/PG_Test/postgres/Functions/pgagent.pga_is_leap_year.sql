CREATE FUNCTION "pgagent"."pga_is_leap_year"( in smallint)
  RETURNS boolean AS
$$
BEGIN
    IF $1 % 4 != 0 THEN
        RETURN FALSE;
    END IF;

    IF $1 % 100 != 0 THEN
        RETURN TRUE;
    END IF;

    RETURN $1 % 400 = 0;
END;
$$
LANGUAGE PLPGSQL;