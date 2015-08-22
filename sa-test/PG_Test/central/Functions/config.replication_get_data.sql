CREATE FUNCTION "config"."replication_get_data"(repl_name in character varying,id_replication out integer,replication_name out character varying,id_replication_group out integer,src_host out character varying,src_alias out character varying,src_port out integer,src_dbname out character varying,src_dbuser out character varying,src_pass out character varying,dst_host out character varying,dst_alias out character varying,dst_port out integer,dst_dbname out character varying,dst_dbuser out character varying,dst_dbpass out character varying)
  RETURNS record AS
$$

    -- Author: Michal Kozusznik
    -- Created: 2015-02-01
    -- Returns all connection data about replication which name is passed via input argument

    /*
    Examples:
    SELECT * FROM admin.replication_get_data('web_test03_pl');
    
    */
	
    SELECT id_replication _id_replication, replication_name _replication_name, tr.id_replication_group _id_replication_group,
tsrc.dbhost _src_host,tsrc.database_name _src_alias,tsrc.dbport::integer _src_port,tsrc.dbname _src_dbname,tsrc.dbuser _src_dbuser,tpsrc.password_plain _src_dbpass,
tdst.dbhost _dst_host,tdst.database_name _dst_alias,tdst.dbport::integer _dst_port,tdst.dbname _dst_dbname,tdst.dbuser _dst_dbuser,tpdst.password_plain _dst_dbpass
  FROM config.tab_replication tr 
JOIN config.tab_database tsrc ON tr.id_database_src=tsrc.id_database
JOIN config.tab_database tdst ON tr.id_database_dst=tdst.id_database
JOIN config.tab_password tpsrc ON tsrc.id_password = tpsrc.id_password
JOIN config.tab_password tpdst ON tpdst.id_password = tdst.id_password
WHERE replication_name=$1;


$$
LANGUAGE SQL;