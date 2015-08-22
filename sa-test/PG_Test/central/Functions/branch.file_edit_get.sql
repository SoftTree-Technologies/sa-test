CREATE FUNCTION "branch"."file_edit_get"(a_hostname in character varying,a_filename in character varying,filecontent out text,status out integer)
  RETURNS record AS
$$
-- Updated: 2011-04-20 R.Brich

  SELECT filecontent, status
  FROM branch.tab_branch_file
  WHERE status IN (1,2,3) AND hostname=$1 AND filename=$2
  ORDER BY submited DESC
  LIMIT 1

$$
LANGUAGE SQL;