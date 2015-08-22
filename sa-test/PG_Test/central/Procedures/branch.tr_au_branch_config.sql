CREATE FUNCTION "branch"."tr_au_branch_config"()
  RETURNS trigger AS
$$
DECLARE
  v_filename varchar = '/opt/sazkyV2/frontend/app/config.cz.xml';
  v_content varchar;
  
BEGIN

  IF NEW.backend_port <> OLD.backend_port THEN
    -- read original xml
    SELECT filecontent INTO v_content FROM branch.file_edit_get(NEW.hostname, v_filename);
    -- replace port number
    v_content := regexp_replace(v_content, '(<backend_port>)[0-9]+(</backend_port>)', E'\\1' || NEW.backend_port || E'\\2');
    -- write new xml
    PERFORM branch.file_edit_submit(NEW.hostname, v_filename, v_content);
  END IF;

RETURN NEW;
END;$$
LANGUAGE PLPGSQL;