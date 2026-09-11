---
pruefung: AP1
thema: Service und Support
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Deutsch
gegenstueck: ../ru/02-service-support-ticket-prioritaet-eskalation-und-sla-ru.md
---

# Service und Support: Ticket, Priorität, Eskalation und SLA

## 1. Lernziele

Du kannst:

- Incident, Service Request, Problem und Change unterscheiden;
- ein vollständiges, datensparsames Ticket erfassen;
- Auswirkung und Dringlichkeit getrennt bewerten;
- eine vorgegebene Prioritätsmatrix anwenden und begründen;
- First, Second und Third Level Support sinnvoll zuordnen;
- funktional und hierarchisch eskalieren;
- Reaktions-, Wiederherstellungs- und Lösungszeit aus SLA überwachen;
- Nutzer zielgruppengerecht informieren und Erwartungen steuern;
- Ticketabschluss, Wissenssicherung und Verbesserung durchführen;
- Sicherheits- und Datenschutzvorfälle in den richtigen Sonderprozess geben.

## 2. Prüfungsminimum — 15 Minuten

1. `Incident`: ungeplante Unterbrechung oder Qualitätsminderung eines Services.
2. `Service Request`: standardisierte Nutzeranfrage, etwa freigegebene Software oder Information.
3. `Problem`: zugrunde liegende Ursache eines oder mehrerer Incidents; Ursachenanalyse kann nach Wiederherstellung folgen.
4. `Change`: kontrollierte Änderung an Service oder Infrastruktur.
5. Priorität wird häufig aus Auswirkung und Dringlichkeit nach der vorgegebenen Matrix abgeleitet.
6. Supportlevel beschreiben Zuständigkeit/Expertise, nicht Priorität.
7. Funktionale Eskalation gibt an kompetentere Stelle; hierarchische Eskalation bindet Leitung/Entscheidung ein.
8. Reaktionszeit endet nicht automatisch mit Lösung.
9. Ticket dokumentiert Fakten, Zeit, Maßnahmen, Kommunikation, Ergebnis und Nachweis.
10. Ein gelöster Incident wird erst nach Prüfung, Nutzerinformation und sauberem Abschluss geschlossen.

> Das Ticket erhält Priorität 1, da ein geschäftskritischer Service für alle Standorte ausgefallen ist und kein Workaround zur Verfügung steht.

## 3. Prozesse und Ticketqualität

### 3.1 Incident, Request, Problem und Change

| Begriff | Ziel | Beispiel |
|---|---|---|
| Incident | normalen Service schnell wiederherstellen | Druckdienst ausgefallen |
| Service Request | standardisierte Leistung bereitstellen | genehmigte Software installieren |
| Problem | Ursache und Wiederholungen bearbeiten | wiederkehrender Druckspoolerfehler |
| Change | Änderung geplant, bewertet, freigegeben umsetzen | Druckserverversion aktualisieren |

Ein Workaround kann einen Incident lösen beziehungsweise den Service wiederherstellen, ohne die Grundursache zu beseitigen. Ein Change kann aus der Problemanalyse entstehen.

### 3.2 Ticketfelder

Ein gutes Ticket enthält:

- eindeutige ID, Erstellzeit und Meldekanal;
- meldende Person und notwendigen Kontakt;
- betroffenen Service, Gerät, Standort und Umfang;
- beobachtetes Verhalten statt vorschneller Diagnose;
- Zeitpunkt, Reproduzierbarkeit und letzte funktionierende Situation;
- Auswirkung, Dringlichkeit und abgeleitete Priorität;
- Status, Verantwortlichen und SLA-Zeitmarken;
- Schritte, Ergebnisse, Logs/Fehlercodes und Workaround;
- Kommunikation, Eskalation, Lösung und Abschlussbestätigung.

Nur erforderliche personenbezogene Daten aufnehmen. Passwörter, private Schlüssel oder unnötige vollständige Datensätze gehören nicht ins Ticket.

### 3.3 Gute Beschreibung

```text
schlecht:  „Internet kaputt, dringend!“
besser:    „Seit 09:12 erreichen 24 Benutzer am Standort Nord
            keine externen HTTPS-Ziele. Interne Anwendungen und
            DNS-Auflösung funktionieren. Kein Workaround bekannt.“
```

Fakten ermöglichen Klassifikation und Diagnose. Vermutungen werden als Hypothese gekennzeichnet.

## 4. Priorität, Supportlevel und Eskalation

### 4.1 Auswirkung und Dringlichkeit

`Auswirkung`: Wie viele Personen, Standorte, Services und Geschäftsprozesse sind betroffen und wie schwer?

`Dringlichkeit`: Wie schnell muss gehandelt werden, bevor Folgen eintreten oder ein Zeitfenster endet?

Beispielmatrix:

| Auswirkung \ Dringlichkeit | hoch | mittel | niedrig |
|---|---:|---:|---:|
| hoch | P1 | P2 | P3 |
| mittel | P2 | P3 | P4 |
| niedrig | P3 | P4 | P4 |

Die Matrix ist organisationsspezifisch. In einer Aufgabe wird die vorgegebene Matrix verwendet; Sonderregeln werden dokumentiert.

### 4.2 Supportlevel

```text
First Level  → Annahme, Qualifizierung, Standarddiagnose, bekannte Lösungen
Second Level → vertiefte Fachanalyse und spezialisierte Systeme
Third Level  → Entwicklung, Hersteller oder höchste Spezialexpertise
```

First Level ist nicht „unwichtig“. Gute Erfassung, Erstdiagnose, Kommunikation und bekannte Lösung verkürzen die Gesamtzeit.

### 4.3 Eskalationsarten

`funktionale Eskalation`: fehlende Kompetenz, Berechtigung oder Werkzeug → zuständige Fachstelle.

`hierarchische Eskalation`: SLA-/Geschäftsrisiko, Ressourcen- oder Prioritätskonflikt → Führung/Serviceverantwortung.

`zeitbasierte Eskalation`: definierter Schwellenwert vor SLA-Verletzung löst Eskalation aus.

Eskalation ist kein Scheitern, sondern ein geplanter Steuerungsmechanismus. Ticket bleibt mit Kontext, bisherigen Schritten und klarer Fragestellung übergabefähig.

### 4.4 SLA-Überwachung

| Zeit | Start | Ende |
|---|---|---|
| Reaktionszeit | qualifizierter Eingang | bestätigte Aufnahme/Bearbeitungsbeginn laut SLA |
| Wiederherstellungszeit | Incidentbeginn/-meldung nach Definition | Service nutzbar/Workaround akzeptiert |
| Lösungszeit | definierter Start | Ursache dauerhaft beseitigt |

Pausen, Servicezeiten und Wartezustände werden nur entsprechend SLA-Regel behandelt. „Warten auf Benutzer“ stoppt die Uhr nicht automatisch.

## 5. Anwendungsfall: zentraler Anmeldedienst fällt aus

Um 08:05 melden mehrere Standorte, dass sich niemand am Warenwirtschaftssystem anmelden kann. 180 Personen sind betroffen, Versandbeginn ist 09:00, kein Workaround bekannt. SLA: P1-Reaktion 15 Minuten, Wiederherstellungsziel 2 Stunden.

### 5.1 Klassifikation

```text
Typ:          Incident
Auswirkung:   hoch — mehrere Standorte, geschäftskritischer Prozess
Dringlichkeit: hoch — Versand beginnt in weniger als einer Stunde
Priorität:    P1 nach Beispielmatrix
```

### 5.2 Bearbeitung

1. Ticket und Major-Incident-Prozess starten; Zeitstempel sichern.
2. Umfang und letzte Änderungen prüfen, Monitoring/Logs korrelieren.
3. Identitätsdienst, Netzwerk, DNS/Zeit und Abhängigkeiten testen.
4. Incident-Koordination, technische Bearbeitung und Kommunikation rollenmäßig trennen.
5. früh funktional eskalieren; bei SLA-/Geschäftsrisiko hierarchisch informieren.
6. sicheren Workaround bewerten, nicht Schutzkontrollen ungeprüft umgehen.
7. alle 30 Minuten vereinbarte Statusinformation liefern.
8. Service wiederherstellen, Funktions- und Negativtests durchführen.
9. Nutzer informieren, Ursache als Problem verfolgen und Ticket sauber schließen.

### 5.3 Zeitprüfung

```text
Eingang:              08:05
Bearbeitung bestätigt: 08:16
Reaktionszeit:        11 min → Ziel 15 min eingehalten
Wiederherstellung:    09:42
Dauer:                1 h 37 min → Ziel 2 h eingehalten
```

Die dauerhafte Ursache kann später über Problem und kontrollierten Change beseitigt werden.

### 5.4 Abschlusskriterien

- betroffener Service und Nutzergruppe funktionieren wieder;
- Monitoring zeigt stabilen Zustand;
- Workaround und Restrisiko sind bekannt;
- Nutzer/Service Owner wurden informiert;
- Dokumentation und Zeitmarken sind vollständig;
- Folgeproblem, Change oder Security-Incident ist verknüpft;
- Abschlusscode und verständliche Lösung sind eingetragen.

## 6. Prüfungsformulierungen

> Die Störung wird als Incident klassifiziert, da ein zuvor verfügbarer Service ungeplant nicht mehr genutzt werden kann.

> Die Priorität ergibt sich aus hoher Auswirkung und hoher Dringlichkeit, weil mehrere Standorte betroffen sind und der Versandprozess unmittelbar bevorsteht.

> Das Ticket wird funktional an den Second Level eskaliert, da für die Analyse des zentralen Identitätsdienstes spezialisierte Berechtigungen und Kenntnisse erforderlich sind.

> Die Reaktionszeit wurde eingehalten, weil zwischen Eingang um 08:05 und bestätigtem Bearbeitungsbeginn um 08:16 nur elf Minuten liegen.

## 7. Typische Prüfungsfallen

- Incident und Service Request verwechseln.
- sofort Ursachenanalyse betreiben, während ein geschäftskritischer Service wiederhergestellt werden muss.
- Problem und Incident gleichsetzen.
- Priorität nur nach Lautstärke oder Hierarchie des Meldenden vergeben.
- Auswirkung und Dringlichkeit nicht begründen.
- Supportlevel als Prioritätsstufen ansehen.
- Ticket ohne bisherige Schritte eskalieren.
- Reaktionszeit mit Lösung verwechseln.
- SLA-Uhr ohne Vertragsregel pausieren.
- Passwörter oder unnötige personenbezogene Daten ins Ticket schreiben.
- unsicheren Workaround ohne Risiko/Freigabe einsetzen.
- Ticket direkt nach technischem Eingriff ohne Test und Nutzerinformation schließen.

## 8. Selbsttest

1. Grenze Incident, Service Request, Problem und Change ab.
2. Nenne acht Ticketfelder.
3. Grenze Auswirkung und Dringlichkeit ab.
4. Bestimme in der Beispielmatrix Priorität bei hoher Auswirkung und mittlerer Dringlichkeit.
5. Welche Aufgaben haben First, Second und Third Level?
6. Grenze funktionale und hierarchische Eskalation ab.
7. Was ist zeitbasierte Eskalation?
8. Grenze Reaktions-, Wiederherstellungs- und Lösungszeit ab.
9. Berechne die Reaktionszeit von 13:47 bis 14:05.
10. Warum gehört ein Passwort nicht ins Ticket?
11. Nenne sechs Abschlusskriterien.
12. Bewerte: „Ein Workaround beseitigt immer das Problem.“

<details>
<summary>Lösungen anzeigen</summary>

1. Störung; Standardanfrage; Grundursache; kontrollierte Änderung.
2. ID, Zeit, Kontakt, Service/Umfang, Beschreibung, Auswirkung/Dringlichkeit/Priorität, Status/Owner, Schritte, Kommunikation, Lösung; acht genügen.
3. Breite/Schwere der Betroffenheit; zeitlicher Handlungsdruck.
4. P2.
5. Annahme/Standardlösung; Fachanalyse; Hersteller/Entwicklung/Spezialisten.
6. an Fachkompetenz; an Leitung/Entscheidung.
7. Eskalation beim Erreichen definierter Zeitgrenze vor SLA-Verletzung.
8. bis Bearbeitungsbeginn; bis Nutzbarkeit; bis dauerhafter Behebung.
9. 18 Minuten.
10. Geheimnisoffenlegung, unnötige Speicherung, breite Ticketzugriffe und Protokollkopien.
11. Funktion, Monitoring, Risiko/Workaround, Information, Dokumentation, Folgeprozess, Abschlusscode; sechs genügen.
12. Falsch; er stellt Service bereit, die Ursache kann als Problem bestehen bleiben.

</details>

## 9. Quellen und Abgleich

- [BIBB – Umsetzungshilfe Fachinformatiker/Fachinformatikerin](https://www.bibb.de/dienst/publikationen/de/16661) — beruflicher Kontext für Service, Störungsbearbeitung, Kommunikation und Dokumentation.
- [BSI IT-Grundschutz-Kompendium](https://www.bsi.bund.de/grundschutz-kompendium) — aktuelle Anforderungen zu Störungs-/Sicherheitsvorfällen, Protokollierung und geregelten Betriebsprozessen.
- [FIAusbV § 9](https://www.gesetze-im-internet.de/fiausbv/__9.html) — Kundenunterweisung, Leistungskontrolle und Protokollierung im AP1-Prüfungsbereich.

## 10. Offene Prüfpunkte für den Unterricht

- Welche Prioritätsmatrix und SLA-Uhrregeln verwendet WBS?
- Werden Major Incident und Problem Management namentlich verlangt?
- Welche Ticketpflichtfelder erwartet die WBS-Prüfungsvorlage?
