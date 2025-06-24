# Oracle GoldenGate Replication for Port Authority of Kribi

This project sets up real-time database replication using **Oracle GoldenGate** between two physical locations:
- **Mboro**: Production database site (Kribi Port)
- **Yaoundé**: Remote representation site (for reporting, backup, or DR)

## Objectives

- Ensure real-time synchronization of operational data from Mboro to Yaoundé.
- Enable high availability and disaster recovery.
- Use secure, efficient, and maintainable Oracle GoldenGate configurations.

---

## Project Structure

```text
goldengate-replication-kribi/
├── architecture/        # Diagrams and topology
├── config/              # GoldenGate parameter files
├── scripts/             # Setup SQL and automation scripts
├── docs/                # Documentation and notes
└── README.md
