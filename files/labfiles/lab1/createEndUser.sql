REM  Create JOBS database endUser user account Script
REM  Bill Stratton, 1999
REM  Brian Ballsun-Stanton, 2006

CREATE USER endUser
IDENTIFIED BY useStuff
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA unlimited ON users;

GRANT connect TO endUser;
GRANT create table to endUser;
GRANT create synonym to endUser;
