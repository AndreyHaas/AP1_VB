---
pruefung: AP2
prioritaet: Nicht AP1
status: Ausgelagert
stand: 2026-09-09
---

# RAID – Zusatzwissen für AP2

> Laut zweiter Auflage des Prüfungskatalogs werden RAID und SQL ausschließlich in AP2 thematisiert. Dieses File gehört nicht in den aktuellen AP1-Lernplan.

## Überblick

| RAID-Level | Mindestzahl | Nutzkapazität bei gleich großen Platten | Ausfalltoleranz |
|---|---:|---|---|
| RAID 0 | 2 | `n × Kapazität` | keine |
| RAID 1 | 2 | bei zwei Platten `1 × Kapazität` | eine der beiden |
| RAID 5 | 3 | `(n − 1) × Kapazität` | eine Platte |
| RAID 6 | 4 | `(n − 2) × Kapazität` | zwei Platten |
| RAID 10 | 4, gerade Anzahl | `n/2 × Kapazität` | mindestens eine; mehrere nur bei günstiger Verteilung |

```text
RAID 0  → Striping
RAID 1  → Mirroring
RAID 5/6 → verteilte Parität
RAID 10 → Mirroring + Striping
```

Berechnet wird mit der Kapazität der kleinsten beteiligten Festplatte.

## RAID ist kein Backup

RAID kann den Betrieb bei Plattenausfall fortsetzen, schützt aber nicht gegen versehentliches Löschen, Malware, logische Beschädigung, Diebstahl, Brand oder unbemerkte fehlerhafte Änderungen.

## Beispiele

```text
4 × 2 TB in RAID 5:
(4 − 1) × 2 TB = 6 TB; eine Platte darf ausfallen.

6 × 2 TB in RAID 10:
6 / 2 × 2 TB = 6 TB.
Mindestens ein Plattenausfall wird toleriert.
Mehrere Ausfälle sind nur möglich, wenn kein Spiegelpaar vollständig ausfällt.
```

## Offene Punkte / Korrekturen

- Erst nach AP1 wiederholen.
