set verify off
ACCEPT sysPassword CHAR PROMPT 'Enter new password for SYS: ' HIDE
ACCEPT systemPassword CHAR PROMPT 'Enter new password for SYSTEM: ' HIDE
host /u01/app/oracle/product/12.2.0/db_1/bin/orapwd file=/u01/app/oracle/product/12.2.0/db_1/dbs/orapwJOBS force=y format=12
@/home/oracle/scripts/CreateDB.sql
@/home/oracle/scripts/CreateDBFiles.sql
@/home/oracle/scripts/CreateDBCatalog.sql
@/home/oracle/scripts/lockAccount.sql
@/home/oracle/scripts/postDBCreation.sql
