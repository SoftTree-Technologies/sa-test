CREATE FUNCTION "branch"."file_edit_submit"(a_hostname in character varying,a_filename in character varying,a_filecontent in text)
  RETURNS void AS
$$
DECLARE
  v_id int;
BEGIN
  -- Updated: 2011-04-20 R.Brich
  
  SELECT id_branch_file INTO v_id
  FROM branch.tab_branch_file
  WHERE hostname=a_hostname AND filename=a_filename AND status=3;

  IF FOUND THEN
  
    UPDATE branch.tab_branch_file
    SET filecontent = a_filecontent, filecontent_md5 = md5(a_filecontent), mtime = now()
    WHERE id_branch_file = v_id;
    
  ELSE

    INSERT INTO branch.tab_branch_file
    (hostname, region, filename, filecontent, filecontent_md5, mtime, status)
    VALUES
    (a_hostname, 'cz', a_filename, a_filecontent, md5(a_filecontent), now(), 3);

  END IF;
  
  RETURN;

END;
$$
LANGUAGE PLPGSQL;