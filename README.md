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
