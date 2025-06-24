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
```
sql

ALTER DATABASE ADD SUPPLEMENTAL LOG DATA;
ALTER SYSTEM SET ENABLE_GOLDENGATE_REPLICATION = TRUE SCOPE=BOTH;

CREATE USER ggate IDENTIFIED BY yourpassword;
GRANT DBA TO ggate;
GRANT SELECT ANY DICTIONARY TO ggate;

```

## Monitoring
You can integrate with:
- Oracle GoldenGate Monitor
- Custom logs/alerts using shell scripts or Prometheus exporters



## Project Structure

```text
goldengate-replication-kribi/
├── architecture/        # Diagrams and topology
├── config/              # GoldenGate parameter files
├── scripts/             # Setup SQL and automation scripts
├── docs/                # Documentation and notes
└── README.md
