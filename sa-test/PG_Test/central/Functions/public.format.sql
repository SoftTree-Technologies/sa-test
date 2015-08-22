CREATE FUNCTION "public"."format"(_pattern in text,_args in ARRAY)
  RETURNS text AS
$$
DECLARE
  v_tmp text;
BEGIN
-- Replace marks in _pattern with corresponding text from _args
--
-- Example:
--   format('$1 and $2', array['spam', 'eggs'])
--
-- Output:
--   'spam and eggs'
--
-- Dollar sign can be printed by $$.
--
-- Radek Brich, 2010-11-23

v_tmp := replace(_pattern, '$$', '##dollar##');

FOR i IN array_lower(_args,1) .. array_upper(_args,1)
LOOP
  v_tmp := replace(v_tmp, '$'||i, _args[i]);
END LOOP;

RETURN replace(v_tmp, '##dollar##', '$');

END;
$$
LANGUAGE PLPGSQL;