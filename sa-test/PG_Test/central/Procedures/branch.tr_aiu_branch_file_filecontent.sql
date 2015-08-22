CREATE FUNCTION "branch"."tr_aiu_branch_file_filecontent"()
  RETURNS trigger AS
$$
BEGIN

IF ( TG_OP = 'INSERT' ) THEN
  NEW.filecontent_md5 = md5(NEW.filecontent);
END IF;

IF ( TG_OP = 'UPDATE' ) THEN
  IF NEW.filecontent <> OLD.filecontent THEN
    NEW.filecontent_md5 = md5(NEW.filecontent);
  END IF;
END IF;

RETURN NEW;
END;$$
LANGUAGE PLPGSQL;