CREATE FUNCTION "branch"."file_get"(a_hostname in character varying,a_filename in character varying)
  RETURNS text AS
$$
-- Vrati obsah souboru k nahrani na pobocku (NULL pokud nic k nahrani neni)
-- Updated: 2011-04-20 R.Brich

  SELECT filecontent
  FROM branch.tab_branch_file
  WHERE region = 'cz' AND hostname = $1 AND filename = $2 AND status = 3
  ORDER BY submited DESC LIMIT 1

$$
LANGUAGE SQL;