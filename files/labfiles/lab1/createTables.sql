REM  ICSA485 JOBS Database Tables Creation Script
REM  Bill Stratton, 1999

create table STATE (
statecode   char(2),
description varchar2(30)       CONSTRAINT state_description_nn NOT NULL,
CONSTRAINT  state_statecode_pk PRIMARY KEY(statecode))
tablespace CO_OP;

create table QUARTER (
qtrcode     varchar2(5),
location    char(2),
minsal      number(6,2) CONSTRAINT quarter_minsal_nn NOT NULL,
minhrs      number(2)   CONSTRAINT quarter_minhrs_nn NOT NULL,
CONSTRAINT  quarter_location_fk    FOREIGN KEY (location) REFERENCES state (statecode),
CONSTRAINT  quarter_qtrcode_pk PRIMARY KEY(qtrcode))
tablespace CO_OP;

create table EMPLOYER (
companyname     varchar2(30),
division        varchar2(30),
address         varchar2(30),
city            varchar2(20),
statecode       char(2),
zipcode         number(5),
CONSTRAINT employer_companyname_pk  PRIMARY KEY(companyname, division),
CONSTRAINT employer_zip_ck          CHECK (zipcode > 0),
CONSTRAINT employer_statecode_fk    FOREIGN KEY (statecode) REFERENCES state (statecode))
tablespace CO_OP;
