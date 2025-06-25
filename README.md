# Oracle GoldenGate Replication for Port Authority of Kribi

This project sets up real-time database replication using **Oracle GoldenGate** between two physical locations:
- **Mboro**: Production database site (Kribi Port)
- **Yaoundé**: Remote representation site (for reporting, backup, or DR)

## Objectives

- Ensure real-time synchronization of operational data from Mboro to Yaoundé.
- Enable high availability and disaster recovery.
- Use secure, efficient, and maintainable Oracle GoldenGate configurations.

---
## Technologies Used

- Oracle GoldenGate
- Oracle Database 19c
- Linux (RHEL / CentOS)
- SQL, Shell scripting
- VPN or secured WAN connection

## Database Preparation (on Mboro & Yaoundé)

### DBMS Logging

Logging is enabled to allow the DBMS to recognize and accept the services provided by the GoldenGate application.
This is done through SQL*Plus using the following commands:

We will restart the database and set it to ARCHIVELOG mode using the following instructions:

```
sql

SHUTDOWN IMMEDIATE;
STARTUP MOUNT;
ALTER DATABASE ARCHIVELOG;
ALTER DATABASE OPEN;
```
Then, verify that the mode has been enabled in the DBMS with the following command:
```
sql

SELECT LOG_MODE FROM V$DATABASE;
```
### Recovery Logging
This provides a guarantee that all changes made will be captured and available for recovery in the redo log.
This is done using the following commands:
```
sql

alter database add supplemental log data(all) columns;
select SUPPLEMENTAL_LOG_DATA_ALL from v$database;
alter database force logging;
alter system switch logfile;
alter database add supplemental log data;
```
Enable replication activity using the following command:
```
sql

alter system set enable_goldengate_replication=TRUE SCOPE=BOTH;
EXEC dbms_goldengate_auth.grant_admin_privilege('ggadmin');
```
<b>NOTE</b>:THESE INSTRUCTIONS MUST BE EXECUTED BOTH AT THE SOURCE AND AT THE DESTINATION.

### Schema Creation
#### first site mboro
```
sql

Create user schema_name(mboro for the case) identified by password(mboro for the case);
Grant resource, dba, connect to mboro;
connect mboro/mboro
```
#### second site Yaoundé
```
sql
Create user emergence identified by emergence;
Grant resource, dba, connect to emergence;
connect emergence/emergence
```
#### Creation of the intermediate user schema (ggadmin)
This schema is dedicated to Oracle GoldenGate and will handle all replication transactions. Therefore, it must be granted the appropriate privileges to perform its tasks effectively.
```
sql

Create user ggadmin identified by ggadmin;
Grant resource, dba, connect to ggadmin;
```
#### create a tablespace and assign it to the ggadmin user
```
sql

Create tablespace goldengate 
Datafile ‘G:\ORACLE\db_home\oradata\ORCL\ggadmin01.dbf’ size 100m
autoextend on;
alter user ggadmin default tablespace ggadmin;
```

## Monitoring
You can integrate with:
- Oracle GoldenGate Monitor
- Custom logs/alerts using shell scripts or Zabbix.



## Project Structure

```text
goldengate-replication-kribi/
├── configuration/             # GoldenGate parameter files
├── scripts/                   # Setup SQL and automation scripts
├── README.md
├── database_preparation.txt   # These prepare your database for GoldenGate by creating the necessary user, tablespace, and grants.           
└── architecture.png           # Diagrams and topology
