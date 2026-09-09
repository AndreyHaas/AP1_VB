---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Backup-Arten und Wiederherstellung

## RAID ist kein Backup

Redundanz kann die Verfügbarkeit bei Hardwareausfall erhöhen, schützt aber nicht zuverlässig vor versehentlichem Löschen, Ransomware, logischer Beschädigung, Diebstahl oder Brand. Ein Backup ist eine getrennte, wiederherstellbare Kopie.

## Vollbackup

Sichert alle ausgewählten Daten.

```text
Vorteil: einfache und schnelle Wiederherstellung
Nachteil: hoher Speicherbedarf und lange Sicherungsdauer
Restore: letztes benötigtes Vollbackup
```

## Differenzielles Backup

Sichert alle Änderungen seit dem letzten Vollbackup.

```text
Vorteil: Restore benötigt nur Vollbackup + letztes Differential
Nachteil: Sicherungen wachsen bis zum nächsten Vollbackup
```

## Inkrementelles Backup

Sichert Änderungen seit der letzten Sicherung der verwendeten Kette.

```text
Vorteil: geringe tägliche Sicherungsmenge
Nachteil: Restore benötigt Vollbackup + alle folgenden Inkremente
```

## Rechenbeispiel

```text
Montag Vollbackup: 100 GB
Dienstag neu/geändert: 10 GB
Mittwoch zusätzlich: 5 GB
Donnerstag zusätzlich: 8 GB
```

| Tag | Inkrementell | Differenziell seit Montag |
|---|---:|---:|
| Dienstag | 10 GB | 10 GB |
| Mittwoch | 5 GB | 15 GB |
| Donnerstag | 8 GB | 23 GB |

```text
Gesamt inkrementell: 100 + 10 + 5 + 8 = 123 GB
Gesamt differenziell: 100 + 10 + 15 + 23 = 148 GB

Restore Donnerstag inkrementell:
Montag + Dienstag + Mittwoch + Donnerstag

Restore Donnerstag differenziell:
Montag + Donnerstag
```

## Wie werden Änderungen erkannt?

Je nach Software zum Beispiel durch:

```text
Dateiattribute/Archivbit
Zeitstempel und Größe
Backup-Katalog
Prüfsummen
Changed Block Tracking
Anwendungs- oder Dateisystem-Snapshots
```

## IHK-Merksatz

> Inkrementelle Sicherungen sparen Speicherplatz, benötigen für die Wiederherstellung jedoch die vollständige Sicherungskette. Differenzielle Sicherungen benötigen mehr Platz, vereinfachen aber den Restore.

## Selbsttest

Montag: Vollbackup 200 GB. Änderungen: Dienstag 12 GB, Mittwoch weitere 7 GB, Donnerstag weitere 6 GB; die Mengen überschneiden sich nicht. Berechne Tages- und Gesamtsummen für inkrementell und differenziell.

## Lösungen

```text
inkrementell: 12, 7, 6 GB; gesamt 225 GB
differenziell: 12, 19, 25 GB; gesamt 256 GB
```

## Offene Punkte / Korrekturen

- Restore-Aufgaben erneut ohne Tabelle rechnen.
