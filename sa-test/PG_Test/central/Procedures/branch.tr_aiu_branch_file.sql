CREATE FUNCTION "branch"."tr_aiu_branch_file"()
  RETURNS trigger AS
$$
DECLARE
  v_xml xml;

BEGIN

  PERFORM id_branch_config FROM branch.tab_branch_config WHERE hostname = NEW.hostname;
  IF NOT FOUND THEN
    INSERT INTO branch.tab_branch_config (hostname) VALUES (NEW.hostname);
  END IF;

  BEGIN
    IF NEW.filename = '/opt/sazkyV2/frontend/app/config.cz.xml' AND NEW.status IN (1,2) THEN
      v_xml := XMLPARSE (CONTENT NEW.filecontent);
      UPDATE branch.tab_branch_config
      SET
        backend_port = XMLSERIALIZE(CONTENT (xpath('/config/backend_port/text()', v_xml))[1] AS text)::int,
        backend_address = XMLSERIALIZE(CONTENT (xpath('/config/backend_address/text()', v_xml))[1] AS text)::inet
      WHERE hostname = NEW.hostname;
    END IF;
  EXCEPTION
    WHEN invalid_xml_content OR	invalid_text_representation THEN
      UPDATE branch.tab_branch_config SET backend_port = NULL, backend_address = NULL WHERE hostname = NEW.hostname;
  END;

RETURN NEW;
END;$$
LANGUAGE PLPGSQL;