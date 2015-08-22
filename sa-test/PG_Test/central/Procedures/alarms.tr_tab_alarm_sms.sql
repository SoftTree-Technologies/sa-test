CREATE FUNCTION "alarms"."tr_tab_alarm_sms"()
  RETURNS trigger AS
$$
DECLARE
  v_conn varchar;
  v_rec record;
  v_msg varchar;
  v_number varchar;

BEGIN

  SELECT dblink.get_conn('sms_cz') INTO v_conn;

  SELECT message_text INTO v_msg
  FROM alarms.szn_alarm_message WHERE id_alarm_message = NEW.id_alarm_message;

  v_msg := format(v_msg, NEW.alarm_args);

  FOR v_number IN
    SELECT phone_number
    FROM alarms.tab_subsystem_sms
    JOIN alarms.tab_cellphone USING (id_cellphone)
    WHERE id_subsystem = NEW.id_subsystem
  LOOP
    PERFORM * FROM dblink(v_conn, 'SELECT komunikace.send_sms(''' || v_msg || ''', ''' || v_number || ''')') AS t1(smsid integer);
  END LOOP;

  PERFORM dblink.put_conn(v_conn);

        RETURN NEW;
END;
$$
LANGUAGE PLPGSQL;