CREATE FUNCTION "querysched"."get_schedule_not_ok"(a_datum in date,o_id_schedule out integer,o_query_sql out character varying,o_session_name out character varying,o_execute_time out time without time zone,o_status out character varying)
  RETURNS record AS
$$
BEGIN

  RETURN QUERY
    SELECT s.id_schedule, q.query_sql, d.session_name, t.execute_time, e.status
    FROM querysched.def_schedule s
    JOIN querysched.def_query q USING (id_query)
    JOIN querysched.def_exectime t USING (id_exectime)
    JOIN querysched.def_session d USING (id_session)
    LEFT JOIN querysched.tab_executed e ON e.id_schedule = s.id_schedule AND e.executed::date = a_datum
    WHERE t.execute_date IS NULL AND (e.status IS NULL OR e.status <> 'ok')
    ORDER BY t.execute_time, q.id_query;
  RETURN;

END;
$$
LANGUAGE PLPGSQL;