---
pruefung: AP1
thema: Backup und Wiederherstellung
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Deutsch
gegenstueck: ../ru/01-backup-arten-gvs-medien-und-restore-ru.md
---

# Backup: Voll-, differenzielle und inkrementelle Sicherung, GVS, Medien und Restore

## 1. Lernziele

Du kannst:

- Backup, Snapshot, Synchronisation, Archiv und Redundanz unterscheiden;
- Voll-, differenzielle und inkrementelle Sicherungen vergleichen und berechnen;
- die benötigte Restore-Kette bestimmen;
- GVS und 3-2-1-Regel unabhängig von der Sicherungsart erklären;
- RPO und RTO aus betrieblichen Anforderungen ableiten;
- geeignete Medien nach Kapazität, Zeit, Schutz und Kosten auswählen;
- Hot-, Warm- und Cold-Backup einordnen;
- ein Sicherungs- und Wiederherstellungskonzept erstellen;
- Backup-Erfolg durch Restore-Test, Integritätsprüfung und Protokoll nachweisen.

## 2. Prüfungsminimum — 15 Minuten

1. Backup ist eine getrennte, wiederherstellbare Kopie; RAID, Synchronisation und Snapshot ersetzen es nicht automatisch.
2. Vollbackup sichert alle ausgewählten Daten; Restore benötigt grundsätzlich dieses Backup.
3. Differenziell sichert Änderungen seit letztem Vollbackup; Restore: Voll + letztes Differential.
4. Inkrementell sichert Änderungen seit letzter Sicherung der Kette; Restore: Voll + alle folgenden Inkremente.
5. GVS bestimmt Generationen und Aufbewahrung, nicht Voll/differenziell/inkrementell.
6. 3-2-1: drei Kopien insgesamt, zwei unterschiedliche Medien/Systeme, eine Kopie extern; offline/immutable erhöht Ransomware-Schutz.
7. `RPO`: maximal tolerierbarer Datenverlust in Zeit; `RTO`: Zielzeit bis Wiederherstellung.
8. Backupfenster, Änderungsmenge, Restorezeit und Aufbewahrung gemeinsam planen.
9. Verschlüsselung braucht Schlüsselverwaltung; sonst kann weder Angreifer noch Betrieb den Restore zuverlässig durchführen.
10. Nur ein erfolgreich getesteter Restore belegt Wiederherstellbarkeit.

> Für das Tagesziel wird eine inkrementelle Sicherung eingesetzt, da sie das Backupfenster reduziert; die längere Restore-Kette wird durch regelmäßige Vollsicherungen und getestete Wiederherstellungsabläufe beherrscht.

## 3. Grundlagen und Sicherungsarten

### 3.1 Abgrenzung

| Verfahren | Hauptzweck | Grenze |
|---|---|---|
| Backup | Wiederherstellung nach Verlust/Fehler | nur wertvoll, wenn getrennt und testbar |
| Snapshot | schneller Zustands-/Rollbackpunkt | oft im selben System und von dessen Ausfall betroffen |
| Synchronisation | Zustände abgleichen | Löschung/Verschlüsselung kann synchronisiert werden |
| Archiv | langfristige nachvollziehbare Aufbewahrung | nicht auf schnellen Betriebs-Restore optimiert |
| Redundanz/RAID | Betrieb bei Komponentenausfall | schützt nicht vor Löschen, Malware, Brand oder Fehlkonfiguration |

### 3.2 Vollbackup

Sichert alle ausgewählten Daten.

```text
Vorteil: einfache Restore-Kette, meist schnelle Wiederherstellung
Nachteil: hoher Speicherbedarf und langes Backupfenster
Restore: passendes Vollbackup
```

### 3.3 Differenzielles Backup

Sichert alle Änderungen seit dem letzten Vollbackup.

```text
Vorteil: Restore nur mit Vollbackup + letztem Differential
Nachteil: tägliche Sicherung wächst bis zum nächsten Vollbackup
```

### 3.4 Inkrementelles Backup

Sichert Änderungen seit der letzten Sicherung innerhalb der Kette.

```text
Vorteil: geringe tägliche Datenmenge und kurzes Backupfenster
Nachteil: längere, fehlerempfindlichere Restore-Kette
Restore: Vollbackup + jedes nachfolgende Inkrement bis Zielzeitpunkt
```

Änderungen werden je Produkt etwa über Katalog, Zeitstempel, Prüfsummen, Changed Block Tracking oder anwendungsgeeignete Snapshots erkannt.

## 4. Sicherungskonzept, Ziele und Medien

### 4.1 GVS und 3-2-1

```text
Sohn      → häufig/täglich, kurze Aufbewahrung
Vater     → wöchentlich, länger
Großvater → monatlich, lang
```

GVS regelt **wann und wie lange** Generationen bleiben. Die Sicherungsart regelt **welcher Datenumfang** kopiert wird. Beides kann beliebig sinnvoll kombiniert werden.

```text
3 Kopien insgesamt einschließlich Produktivdaten
2 unterschiedliche Medien oder unabhängige Speichersysteme
1 Kopie an anderem Ort
```

Die Erweiterung `3-2-1-1-0` ergänzt eine offline oder unveränderbare Kopie und das Ziel null ungeprüfter Fehler nach Verifikation. Es ist eine Praxisregel, kein Gesetz.

### 4.2 RPO und RTO

`Recovery Point Objective (RPO)`: Wie alt darf der letzte wiederherstellbare Datenstand höchstens sein?

`Recovery Time Objective (RTO)`: Innerhalb welcher Zielzeit soll der Dienst wiederhergestellt sein?

Beispiel:

```text
RPO = 4 h  → Sicherungs-/Replikationskonzept muss höchstens 4 h Datenverlust ermöglichen
RTO = 8 h  → Wiederherstellung von Ausfall bis Zielbetrieb höchstens 8 h
```

RPO ist keine Garantie, wenn Sicherungen fehlschlagen. RTO umfasst Erkennung, Entscheidung, Bereitstellung, Datenrestore, Tests und Freigabe.

### 4.3 Medienauswahl

| Medium/System | Stärke | Risiko/Prüfpunkt |
|---|---|---|
| lokale Disk/Appliance | schnell | Online-Zugriff und gemeinsamer Standort |
| Band | hohe Kapazität, offline lagerbar | Laufwerk, Transport und längerer Direktzugriff |
| Object Storage/Cloud | extern, skalierbar, Versionierung möglich | Zugang, Kosten, Datenschutz, Anbieterabhängigkeit |
| Wechselmedium | physisch trennbar | Verlust, Alterung, manueller Prozess |

Kriterien: Kapazität, Schreib-/Lesedauer, Haltbarkeit, Medienfehler, Kosten, Verschlüsselung, Offsite-/Offlinefähigkeit und erwartete Restorezeit.

### 4.4 Hot, Warm und Cold

- `Hot Backup`: Anwendung läuft; hohe Verfügbarkeit, Konsistenz durch anwendungsgeeignete Mechanismen sichern.
- `Warm Backup`: Betrieb teilweise eingeschränkt oder definierter konsistenter Zustand.
- `Cold Backup`: Anwendung gestoppt; Konsistenz einfacher, aber Ausfallzeit.

Dateikopie einer laufenden Datenbank ist nicht automatisch konsistent.

## 5. Berechnung und Restore-Fall

Montag wird ein Vollbackup mit `200 GB` erstellt. Nicht überlappende Änderungen:

```text
Dienstag 12 GB
Mittwoch  7 GB
Donnerstag 6 GB
```

### 5.1 Datenmengen

| Tag | inkrementell | differenziell seit Montag |
|---|---:|---:|
| Montag | 200 GB | 200 GB |
| Dienstag | 12 GB | 12 GB |
| Mittwoch | 7 GB | 19 GB |
| Donnerstag | 6 GB | 25 GB |

```text
Inkrementell gesamt = 200 + 12 + 7 + 6 = 225 GB
Differenziell gesamt = 200 + 12 + 19 + 25 = 256 GB
```

### 5.2 Restore auf Donnerstagabend

```text
inkrementell: Montag Voll + Dienstag + Mittwoch + Donnerstag
differenziell: Montag Voll + Donnerstag Differential
```

Fehlt das Mittwoch-Inkrement, ist die nachfolgende inkrementelle Kette für diesen Restore in der Regel unvollständig. Ein älterer konsistenter Zielpunkt kann dennoch möglich sein.

### 5.3 Restore-Runbook

1. Vorfall und gewünschten Zielzeitpunkt bestimmen.
2. saubere, isolierte Zielumgebung bereitstellen.
3. benötigte Medien, Kataloge, Schlüssel und Softwareversionen prüfen.
4. Wiederherstellung in korrekter Reihenfolge durchführen.
5. Integrität, Anwendungskonsistenz, Berechtigungen und Funktion testen.
6. Fachverantwortliche Freigabe einholen.
7. Zeiten, Datenverlust, Fehler und Abweichungen protokollieren.
8. Erkenntnisse in Sicherungsplan und RTO/RPO-Bewertung übernehmen.

## 6. Prüfungsformulierungen

> Für den inkrementellen Restore werden das Vollbackup und alle nachfolgenden Inkremente benötigt, da jedes Inkrement nur die Änderungen seit der vorherigen Sicherung enthält.

> Die Synchronisation ersetzt kein Backup, weil versehentliche Löschungen oder verschlüsselte Dateien auf das zweite System übertragen werden können.

> Das RPO beträgt vier Stunden und beschreibt den maximal tolerierten Datenverlust, während das RTO die angestrebte Wiederherstellungsdauer festlegt.

> Die Wiederherstellbarkeit wird durch einen dokumentierten Restore-Test nachgewiesen, weil ein fehlerfreies Sicherungsprotokoll allein keine nutzbaren Daten garantiert.

## 7. Typische Prüfungsfallen

- RAID oder Spiegelung als Backup bezeichnen.
- GVS mit Sicherungsart verwechseln.
- beim Differential nur Änderungen seit Vortag zählen.
- beim Inkrement alle Änderungen seit Vollbackup addieren.
- für inkrementellen Restore ein Zwischeninkrement auslassen.
- RPO und RTO vertauschen.
- Backupintervall automatisch mit garantiertem RPO gleichsetzen.
- Cloud-Synchronisation ohne Versionen/Trennung als vollständiges Backup ansehen.
- Verschlüsselung ohne Schlüsselbackup und Recovery-Prozess einrichten.
- nur Produktivdaten, aber keine Konfiguration/Kataloge sichern.
- Erfolg am Backupjob statt am Restore messen.
- Aufbewahrungsfristen ohne Rechts- und Geschäftskontext pauschal festlegen.

## 8. Selbsttest

1. Grenze Backup, Snapshot, Synchronisation, Archiv und RAID ab.
2. Erkläre Voll-, differenzielle und inkrementelle Sicherung.
3. Welche Kette benötigt der jeweilige Restore?
4. Was regelt GVS?
5. Erkläre 3-2-1 und die optionale Erweiterung 1-0.
6. Grenze RPO und RTO ab.
7. Nenne sechs Kriterien für Backupmedien.
8. Warum kann eine Dateikopie einer laufenden Datenbank inkonsistent sein?
9. Berechne die Gesamtdatenmengen aus dem Beispiel.
10. Was passiert, wenn das Mittwoch-Inkrement fehlt?
11. Nenne sechs Schritte eines Restore-Tests.
12. Bewerte: „Der Backupjob war grün, also ist der Restore sicher möglich.“

<details>
<summary>Lösungen anzeigen</summary>

1. Wiederherstellungskopie; Zustandsmarke; Abgleich; Langzeitaufbewahrung; Betriebsredundanz.
2. alles; seit Voll; seit vorheriger Sicherung.
3. Voll; Voll + letztes Differential; Voll + alle folgenden Inkremente.
4. Zeitpunkte/Generationen und Aufbewahrung.
5. drei Kopien, zwei Systeme/Medien, eine extern; zusätzlich offline/immutable und null ungeprüfte Fehler.
6. maximaler Datenverlust in Zeit; Zielzeit bis Wiederherstellung.
7. Kapazität, Geschwindigkeit, Haltbarkeit, Kosten, Offsite, Offline, Verschlüsselung, Restorezeit; sechs genügen.
8. zusammengehörige Schreibvorgänge können während der Kopie unterschiedliche Zustände haben.
9. 225 GB inkrementell, 256 GB differenziell.
10. Restore der späteren Kette ist regelmäßig nicht möglich; älterer Zielpunkt prüfen.
11. Zielpunkt, Umgebung, Medien/Schlüssel, Reihenfolge, Integrität/Funktion, Freigabe, Protokoll; sechs genügen.
12. Falsch; Medien, Katalog, Schlüssel, Konsistenz oder Verfahren können beim Restore versagen.

</details>

## 9. Quellen und Abgleich

- [BSI IT-Grundschutz-Kompendium](https://www.bsi.bund.de/grundschutz-kompendium) — aktuelle Anforderungen zu Datensicherung, Wiederherstellung, Kryptografie und Notfallvorsorge.
- [NIST SP 800-34 Rev. 1](https://csrc.nist.gov/pubs/sp/800/34/r1/upd1/final) — Contingency Planning, Priorisierung und Wiederherstellungsplanung; konkrete Technik wegen Dokumentalter gegen aktuelle Systeme prüfen.
- [CISA StopRansomware Guide](https://www.cisa.gov/stopransomware/ransomware-guide) — offizielle Empfehlungen zu getrennten/offline Backups und Wiederherstellung.

## 10. Offene Prüfpunkte für den Unterricht

- Verwendet WBS exakt 3-2-1 oder auch 3-2-1-1-0?
- Werden RPO/RTO in diesem Kapitel oder erst bei Verfügbarkeit geprüft?
- Welche Annahmen gelten in Rechenaufgaben bei überlappenden Änderungsdaten?
