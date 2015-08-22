CREATE FUNCTION "branch"."file_put"(a_hostname in character varying,a_filename in character varying,a_filecontent in text,a_mtime in timestamp without time zone)
  RETURNS void AS
$$
BEGIN
-- Nahraje novou verzi souboru
-- Updated: 2011-04-20 R.Brich

  INSERT INTO branch.tab_branch_file
  (hostname, filename, filecontent, mtime)
  VALUES
  (a_hostname, a_filename, a_filecontent, a_mtime);

  RETURN;

END;
$$
LANGUAGE PLPGSQL;