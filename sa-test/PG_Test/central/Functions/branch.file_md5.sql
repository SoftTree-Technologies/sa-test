CREATE FUNCTION "branch"."file_md5"(a_hostname in character varying,a_filename in character varying)
  RETURNS character AS
$$
-- Vrati md5 posledni verze souboru (nahrany nebo stazeny)
-- Updated: 2011-04-20 R.Brich

  SELECT filecontent_md5
  FROM branch.tab_branch_file
  WHERE region = 'cz' AND hostname = $1 AND filename = $2 AND status IN (1,2)
  ORDER BY submited DESC LIMIT 1;

$$
LANGUAGE SQL;