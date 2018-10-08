#!/bin/sh

OLD_UMASK=`umask`
umask 0027
mkdir -p /u01/app/oracle
mkdir -p /u01/app/oracle/admin/jobs/adump
mkdir -p /u01/app/oracle/admin/jobs/dpdump
mkdir -p /u01/app/oracle/admin/jobs/pfile
mkdir -p /u01/app/oracle/audit
mkdir -p /u01/app/oracle/cfgtoollogs/dbca/jobs
mkdir -p /u01/app/oracle/fast_recovery_area/jobs
mkdir -p /u01/app/oracle/oradata/jobs
mkdir -p /u01/app/oracle/product/12.2.0/db_1/dbs
mkdir -p /u02/app/oracle/oradata/jobs
mkdir -p /u03/app/oracle/oradata/jobs
mkdir -p /u04/app/oracle/oradata/jobs
mkdir -p /u05/app/oracle/oradata/jobs
mkdir -p /u06/app/oracle/oradata/jobs
umask ${OLD_UMASK}
PERL5LIB=$ORACLE_HOME/rdbms/admin:$PERL5LIB; export PERL5LIB
ORACLE_SID=JOBS; export ORACLE_SID
PATH=$ORACLE_HOME/bin:$ORACLE_HOME/perl/bin:$PATH; export PATH
echo You should Add this entry in the /etc/oratab: JOBS:/u01/app/oracle/product/12.2.0/db_1:Y
/u01/app/oracle/product/12.2.0/db_1/bin/sqlplus /nolog @/home/oracle/scripts/JOBS.sql
