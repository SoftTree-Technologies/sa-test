CREATE FUNCTION "branch"."file_ack"(a_hostname in character varying,a_filename in character varying,a_filecontent_md5 in character,a_mtime in timestamp without time zone)
  RETURNS void AS
$$
BEGIN
-- Nahraje novou verzi souboru
-- Updated: 2011-04-20 R. Brich

  UPDATE branch.tab_branch_file
  SET mtime = a_mtime, status = 2
  WHERE
    hostname = a_hostname AND
    filename = a_filename AND
    filecontent_md5 = a_filecontent_md5 AND
    status = 3;

  IF NOT FOUND THEN
    UPDATE branch.tab_branch_file
    SET mtime = a_mtime, status = 4
    WHERE hostname = a_hostname AND filename = a_filename AND status = 3;
  END IF;

  RETURN;

END;
$$
LANGUAGE PLPGSQL;