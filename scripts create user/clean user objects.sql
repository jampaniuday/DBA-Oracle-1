whenever sqlerror exit
-- verify user <> 'SYS'
select decode(to_number(decode(user,'SYS','A','SYSTEM','A','1')),'1','CREAZIONE SCHEMA','') from dual;
SPOOL 'drop_objects.sql'
SET LINESIZE 200
SET TRIMSPOOL ON
SET PAGESIZE 0
SET HEAD OFF
SET ECHO OFF
SET FEEDBACK  OFF
SET TERM OFF
SET VERIFY OFF
SET TIMING OFF
SELECT 'ALTER TABLE '||TABLE_NAME||' DROP CONSTRAINT '||CONSTRAINT_NAME||';' FROM USER_CONSTRAINTS;
SELECT 'DROP '||OBJECT_TYPE||' '||OBJECT_NAME||DECODE(OBJECT_TYPE,'TYPE',' FORCE','TABLE',' PURGE','')||';' FROM USER_OBJECTS
 WHERE OBJECT_TYPE IN ('PACKAGE','FUNCTION','TYPE','PROCEDURE','VIEW','SYNONYM','SEQUENCE','TABLE');
SPOOL OFF
SET FEEDBACK ON
SET TERM ON
@drop_objects.sql