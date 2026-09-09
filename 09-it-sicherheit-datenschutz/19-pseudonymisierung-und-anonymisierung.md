---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Pseudonymisierung und Anonymisierung

## Pseudonymisierung

Direkte Identifikationsmerkmale werden durch ein Kennzeichen ersetzt. Mit getrennt aufbewahrten Zusatzinformationen kann die Person wieder zugeordnet werden.

```text
Max Müller → Teilnehmer-ID T-1048
Zuordnungstabelle getrennt gespeichert
```

Pseudonymisierte Daten bleiben personenbezogene Daten. Die DSGVO gilt weiterhin.

## Anonymisierung

Der Personenbezug ist so entfernt, dass eine Identifizierung unter Berücksichtigung der vernünftigerweise einsetzbaren Mittel nicht mehr möglich ist.

Anonymisierte Informationen fallen nicht mehr unter die DSGVO. Eine echte Anonymisierung ist anspruchsvoll: Kombinationen, kleine Gruppen und externe Datenquellen können eine Re-Identifizierung ermöglichen.

## Abgrenzung

```text
Identifizierung mit Zusatzwissen möglich → pseudonymisiert
Identifizierung praktisch nicht mehr möglich → anonymisiert
nur Name gelöscht, andere eindeutige Merkmale bleiben → weder ausreichend pseudonymisiert noch anonymisiert
```

Beispiele:

```text
Studiennummer + separater Schlüssel      → Pseudonymisierung
nur aggregierter Durchschnitt ohne Datensätze → kann anonymisiert sein
Nachname + vollständige Adresse bleiben  → keine ausreichende Pseudonymisierung
Video irreversibel verpixelt, Original gelöscht, keine weiteren Merkmale → kann anonymisiert sein
```

## IHK-Merksatz

> Pseudonymisierung reduziert den direkten Personenbezug, hebt ihn aber nicht auf; anonymisierte Daten lassen sich mit vertretbaren Mitteln keiner Person mehr zuordnen.

## Selbsttest

Ein Arzt ersetzt Patientennamen durch Studiennummern und verwahrt die Zuordnungsliste getrennt. Wie ist das einzuordnen?

## Lösungen

> Es handelt sich um Pseudonymisierung, weil der Arzt die Person mithilfe der getrennten Zuordnungsliste wieder identifizieren kann.

## Offene Punkte / Korrekturen

- Bei Beispielen nie automatisch von Anonymisierung ausgehen; Re-Identifizierungsrisiko prüfen.
