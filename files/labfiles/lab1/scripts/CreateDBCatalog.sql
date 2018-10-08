SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /u03/labfiles/lab1/scripts/CreateDBCatalog.log append
@/u01/app/oracle/product/12.2.0/db_1/rdbms/admin/catalog.sql;
@/u01/app/oracle/product/12.2.0/db_1/rdbms/admin/catproc.sql;
@/u01/app/oracle/product/12.2.0/db_1/rdbms/admin/catoctk.sql;
@/u01/app/oracle/product/12.2.0/db_1/rdbms/admin/owminst.plb;
connect "SYSTEM"/"&&systemPassword"
@/u01/app/oracle/product/12.2.0/db_1/sqlplus/admin/pupbld.sql;
connect "SYSTEM"/"&&systemPassword"
set echo on
spool /u03/labfiles/lab1/scripts/sqlPlusHelp.log append
@/u01/app/oracle/product/12.2.0/db_1/sqlplus/admin/help/hlpbld.sql helpus.sql;
spool off
spool off
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /u03/labfiles/lab1/scripts/postDBCreation.log append
create or replace directory ORACLE_HOME as '/u01/app/oracle/product/12.2.0/db_1';
create or replace directory ORACLE_BASE as '/u01/app/oracle';
grant sysdg to sysdg;
grant sysbackup to sysbackup;
grant syskm to syskm;
