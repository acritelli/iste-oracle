SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /u03/labfiles/lab1/scripts/CreateDB.log append
startup nomount pfile="/u03/labfiles/lab1/scripts/init.ora";
CREATE DATABASE "jobs"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 100
DATAFILE '/u03/app/oracle/oradata/jobs/system01.dbf' SIZE 700M REUSE AUTOEXTEND ON NEXT  10240K MAXSIZE UNLIMITED
EXTENT MANAGEMENT LOCAL
SYSAUX DATAFILE '/u02/app/oracle/oradata/jobs/sysaux01.dbf' SIZE 550M REUSE AUTOEXTEND ON NEXT  10240K MAXSIZE UNLIMITED
SMALLFILE DEFAULT TEMPORARY TABLESPACE TEMP TEMPFILE '/u04/app/oracle/oradata/jobs/temp01.dbf' SIZE 20M REUSE AUTOEXTEND ON NEXT  640K MAXSIZE UNLIMITED
SMALLFILE UNDO TABLESPACE "UNDOTBS1" DATAFILE  '/u05/app/oracle/oradata/jobs/undotbs01.dbf' SIZE 200M REUSE AUTOEXTEND ON NEXT  5120K MAXSIZE UNLIMITED
CHARACTER SET AL32UTF8
NATIONAL CHARACTER SET AL16UTF16
LOGFILE GROUP 1 ('/u01/app/oracle/oradata/jobs/redo01a.log','/u05/app/oracle/oradata/jobs/redo01b.log') SIZE 200M,
GROUP 2 ('/u03/app/oracle/oradata/jobs/redo02a.log','/u06/app/oracle/oradata/jobs/redo02b.log') SIZE 200M
USER SYS IDENTIFIED BY "&&sysPassword" USER SYSTEM IDENTIFIED BY "&&systemPassword";
spool off
