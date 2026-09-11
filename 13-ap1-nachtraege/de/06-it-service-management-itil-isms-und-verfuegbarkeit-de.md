---
pruefung: AP1
thema: IT-Service-Management, ITIL, ISMS und Verfügbarkeit
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Deutsch
gegenstueck: ../ru/06-it-service-management-itil-isms-und-verfuegbarkeit-ru.md
---

# IT-Service-Management, ITIL, ISMS und Verfügbarkeit

## 1. Lernziele

Du kannst:

- Service, Wert, Nutzen und Servicequalität erklären;
- wichtige ITIL-Practices fallbezogen unterscheiden;
- Incident, Service Request, Problem und Change sauber trennen;
- SLA, OLA und Underpinning Contract einordnen;
- ITSM und ISMS voneinander abgrenzen und verbinden;
- IT-Sicherheits- und Datenschutzrollen unterscheiden;
- Passwort-Policy und NAS-Verfügbarkeit bewerten.

## 2. Prüfungsminimum — 15 Minuten

1. IT-Service-Management steuert Services über ihren Lebenszyklus, um gemeinsam Wert zu ermöglichen.
2. Utility bedeutet Eignung für den Zweck; Warranty bedeutet Eignung für die Nutzung, etwa Verfügbarkeit und Kapazität.
3. Incident: ungeplante Unterbrechung oder Qualitätsminderung; Ziel ist schnelle Wiederherstellung.
4. Service Request: standardisierte Benutzeranfrage; Problem: Ursache eines oder mehrerer Incidents.
5. Change: kontrollierte Änderung; Standard Change ist vorab genehmigt und risikoarm, Emergency Change folgt einem beschleunigten kontrollierten Verfahren.
6. SLA vereinbart messbare Serviceziele mit dem Kunden; OLA regelt interne Beiträge.
7. ITSM fokussiert Servicewert und -qualität; ISMS steuert Informationssicherheitsrisiken systematisch.
8. Datenschutzbeauftragter überwacht Datenschutz unabhängig; IT-Sicherheitsbeauftragter koordiniert Informationssicherheit. Rollen nicht gleichsetzen.
9. Passwort-Policy muss Länge, erlaubte Zeichen, Sperrlisten, MFA, sichere Speicherung, Rücksetzung und Monitoring zusammen betrachten.
10. RAID/NAS-Redundanz erhöht Verfügbarkeit, ersetzt aber weder Backup noch Wiederanlaufplan.

## 3. ITIL und Servicewert

ITIL ist ein verbreiteter Rahmen für Service Management, keine zwingende Produktanweisung. PeopleCert führt im September 2026 ITIL 4 weiterhin und bietet zugleich die neue ITIL Version 5 an. Für AP1 werden deshalb zuerst die versionsübergreifenden Begriffe und der tatsächlich bei WBS gelehrte Stand beherrscht; versionsspezifische Modelle werden nicht geraten. Ein `Service` ermöglicht Kunden Ergebnisse, ohne dass sie alle spezifischen Kosten und Risiken selbst verwalten müssen.

| Begriff | Kernfrage |
|---|---|
| Value | Welcher wahrgenommene Nutzen entsteht? |
| Utility | Unterstützt der Service das gewünschte Ergebnis? |
| Warranty | Ist der Service ausreichend verfügbar, sicher und leistungsfähig? |
| Outcome | Welches Ergebnis ermöglicht der Service? |
| Output | Welches unmittelbare Arbeitsergebnis wird geliefert? |

Continual Improvement bedeutet, Services und Arbeitsweisen anhand von Soll, Ist, Messwerten und Feedback fortlaufend zu verbessern.

## 4. Practices und Prozessunterschiede

| Begriff | Beispiel | primäres Ziel |
|---|---|---|
| Incident | Druckdienst ist ausgefallen | Service schnell wiederherstellen |
| Major Incident | geschäftskritischer Gesamtausfall | koordinierte höchste Priorität |
| Service Request | neuer Standardzugang | standardisiert erfüllen |
| Problem | wiederkehrender Treiberfehler | Ursache und Wiederholung behandeln |
| Known Error | bekannte Ursache mit Workaround | Wissen nutzbar machen |
| Change | neue Druckserver-Version | Nutzen und Risiko kontrollieren |
| Event | Speichergrenze überschritten | Zustand erkennen und reagieren |

Ein Workaround kann einen Incident lösen, ohne die Problemursache zu beseitigen. Ein Change ist nicht automatisch ein Incident und ein Emergency Change ist nicht ungenehmigt.

### Priorisierung

```text
Priorität = Wirkung × Dringlichkeit nach festgelegter Matrix
```

Die Position einer meldenden Person allein darf keine fachliche Auswirkungsanalyse ersetzen.

## 5. SLA, ISMS und Rollen

| Vereinbarung | Beziehung |
|---|---|
| SLA | Service Provider ↔ Kunde |
| OLA | interne Einheiten desselben Providers |
| Underpinning Contract | Provider ↔ externer Lieferant |

Messgrößen benötigen Definition, Messpunkt, Zeitraum und Ausschlüsse. `99,9 %` ohne Servicezeit und Ausfallregel ist unvollständig.

Ein `ISMS` legt Regeln, Verantwortlichkeiten und einen kontinuierlichen Prozess zur Behandlung von Informationssicherheitsrisiken fest. Typische Schritte: Kontext und Werte bestimmen, Risiken analysieren, Maßnahmen auswählen, Wirksamkeit prüfen, verbessern.

| Rolle | Schwerpunkt |
|---|---|
| Informationssicherheitsbeauftragter | Sicherheitsorganisation, Risiken, Maßnahmen, Reporting |
| Datenschutzbeauftragter | unabhängige Beratung und Überwachung der Datenschutzvorschriften |
| Systemadministrator | technische Umsetzung und Betrieb im zugewiesenen Auftrag |
| Verantwortlicher | entscheidet über Zwecke und Mittel personenbezogener Verarbeitung |

## 6. Passwort-Policy, NAS und Anwendungsfall

### 6.1 Passwort-Policy bewerten

Eine gute Policy:

- bevorzugt ausreichende Länge und erlaubt lange Passphrasen;
- blockiert bekannte kompromittierte oder sehr häufige Passwörter;
- erzwingt keinen grundlosen periodischen Wechsel, sondern Wechsel bei Verdacht/Kompromittierung;
- fordert MFA entsprechend Risiko und Schutzbedarf;
- speichert Passwörter nur als geeigneten gesalzenen Passwort-Hash;
- regelt sichere Wiederherstellung, Rate Limiting, Protokollierung und Schulung.

Starre Komplexitätsregeln allein führen häufig zu vorhersehbaren Mustern. Die konkrete Policy muss zur geltenden Organisation, Bedrohung und aktuellen Richtlinie passen.

### 6.2 NAS-Verfügbarkeit

Für ein NAS sind zu betrachten:

- redundante Datenträger und deren Wiederaufbauzeit;
- Netzteile, Netzwerkpfade und Switches;
- Controller, Firmware und Stromversorgung;
- USV und kontrolliertes Herunterfahren;
- Monitoring, Ersatzteile und Wiederanlauf;
- getrenntes, getestetes Backup gegen Löschen, Malware und Standortschäden.

### 6.3 Anwendungsfall

Nach wiederkehrenden NAS-Abbrüchen stellt der Service Desk den Zugriff über einen dokumentierten Ersatzpfad wieder her (`Incident`). Die Ursache einer fehlerhaften Firmware wird untersucht (`Problem`). Das geprüfte Update wird mit Backup, Wartungsfenster, Rückfallplan und Abnahmetest eingeführt (`Change`). Das ISMS bewertet zusätzlich Risiken und Maßnahmen; SLA-Kennzahlen prüfen die Servicewirkung.

## 7. Prüfungsformulierungen und typische Fallen

> Der Zugriffsausfall ist als Incident zu bearbeiten, weil eine ungeplante Unterbrechung des vereinbarten Services vorliegt.

> Die Ursachenanalyse gehört zum Problem Management, da wiederkehrende Incidents dauerhaft verhindert werden sollen.

> Die Datenträgerredundanz erhöht die Verfügbarkeit, ersetzt jedoch kein getrenntes Backup, weil logische Fehler und Schadsoftware auf redundante Datenträger übertragen werden können.

Typische Fallen:

- ITIL als verbindliche Norm oder starre Prozessvorschrift bezeichnen.
- Incident und Problem nach Schwere statt Zweck unterscheiden.
- jeden Benutzerwunsch als Incident erfassen.
- Emergency Change ohne Bewertung, Autorisierung und Nachkontrolle durchführen.
- SLA ohne Messdefinition formulieren.
- ITSM und ISMS gleichsetzen.
- Datenschutzbeauftragten zum operativ Verantwortlichen aller Sicherheitsmaßnahmen machen.
- RAID/NAS mit Backup verwechseln.
- Passwortwechsel nach Kalender pauschal als wichtigste Schutzmaßnahme nennen.

## 8. Selbsttest

1. Grenze Utility und Warranty ab.
2. Ordne zu: Standardsoftware bestellen, Dienst ausgefallen, wiederkehrende Abstürze, Patch einführen.
3. Erkläre SLA und OLA.
4. Warum ist ein Workaround keine endgültige Problemlösung?
5. Nenne vier Kriterien einer Passwort-Policy.
6. Begründe zwei Maßnahmen für die Verfügbarkeit eines NAS und eine getrennte Backup-Maßnahme.

<details>
<summary>Lösungen anzeigen</summary>

1. Utility ist die funktionale Eignung für das Ergebnis; Warranty sichert Nutzbarkeit etwa durch Verfügbarkeit, Kapazität und Sicherheit.
2. Service Request, Incident, Problem, Change.
3. SLA vereinbart Ziele mit dem Kunden; OLA sichert interne Beiträge zur Erfüllung.
4. Er stellt den Service eventuell wieder her, beseitigt aber nicht zwingend die Ursache.
5. Länge/Passphrase, Sperrliste kompromittierter Werte, MFA, gesalzener Passwort-Hash, sichere Rücksetzung, Rate Limiting.
6. Zum Beispiel Datenträger- und Netzpfadredundanz; getrenntes versioniertes Backup mit Restore-Test.

</details>

## 9. Quellen und Abgleich

- PeopleCert: offizielle ITIL-Übersicht mit ITIL 4 und ITIL Version 5; geprüft am 11.09.2026.
- ISO/IEC 20000-1 für Service-Management-Systeme und ISO/IEC 27001 für ISMS, ohne Detailnormwissen vorauszusetzen.
- NIST SP 800-63B und BSI-Empfehlungen zur Authentisierung.
- WBS-Kursinhalt ITIL/IT-Service-Management; bestätigt am 11.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Wurde bei WBS ITIL 4, ITIL Version 5 oder ein versionsneutraler ITSM-Überblick gelehrt?
- Welche ITIL-Practices und Begriffe verlangt WBS namentlich?
- Welche konkrete Prioritätsmatrix wird im Kurs verwendet?
- Wird eine ISO-Zertifizierung nur eingeordnet oder mit Anforderungen geprüft?
