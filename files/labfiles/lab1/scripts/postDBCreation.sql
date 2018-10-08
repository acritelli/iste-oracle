SET VERIFY OFF
spool /u03/labfiles/lab1/scripts/postDBCreation.log append
host /u01/app/oracle/product/12.2.0/db_1/OPatch/datapatch -skip_upgrade_check -db JOBS;
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
create spfile='/u01/app/oracle/product/12.2.0/db_1/dbs/spfileJOBS.ora' FROM pfile='/u03/labfiles/lab1/scripts/init.ora';
connect "SYS"/"&&sysPassword" as SYSDBA
select 'utlrp_begin: ' || to_char(sysdate, 'HH:MI:SS') from dual;
@/u01/app/oracle/product/12.2.0/db_1/rdbms/admin/utlrp.sql;
select 'utlrp_end: ' || to_char(sysdate, 'HH:MI:SS') from dual;
select comp_id, status from dba_registry;
shutdown immediate;
connect "SYS"/"&&sysPassword" as SYSDBA
startup ;
spool off
exit;
