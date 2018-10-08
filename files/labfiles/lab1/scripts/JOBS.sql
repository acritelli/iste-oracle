set verify off
ACCEPT sysPassword CHAR PROMPT 'Enter new password for SYS: ' HIDE
ACCEPT systemPassword CHAR PROMPT 'Enter new password for SYSTEM: ' HIDE
host /u01/app/oracle/product/12.2.0/db_1/bin/orapwd file=/u01/app/oracle/product/12.2.0/db_1/dbs/orapwJOBS force=y format=12
@/u03/labfiles/lab1/scripts/CreateDB.sql
@/u03/labfiles/lab1/scripts/CreateDBFiles.sql
@/u03/labfiles/lab1/scripts/CreateDBCatalog.sql
@/u03/labfiles/lab1/scripts/lockAccount.sql
@/u03/labfiles/lab1/scripts/postDBCreation.sql
