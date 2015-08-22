CREATE FUNCTION "pgagent"."pgagent_schema_version"()
  RETURNS smallint AS
$$
BEGIN
    -- RETURNS PGAGENT MAJOR VERSION
    -- WE WILL CHANGE THE MAJOR VERSION, ONLY IF THERE IS A SCHEMA CHANGE
    RETURN 3;
END;
$$
LANGUAGE PLPGSQL;