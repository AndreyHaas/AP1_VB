---
pruefung: AP1
thema: Prozessmodellierung
prioritaet: Abgleich
status: Entwurf
stand: 2026-09-10
sprache: Deutsch
gegenstueck: ../ru/05-bpmn-grundlagen-ru.md
---

# BPMN-Grundlagen

## 1. Lernziele

Du kannst:

- Zweck und Grenzen eines BPMN-Prozessdiagramms erklären;
- Ereignisse, Aktivitäten, Gateways, Sequence Flow und Message Flow unterscheiden;
- Pool und Lane sinnvoll verwenden;
- einen einfachen Geschäftsprozess mit XOR- und AND-Gateway lesen;
- typische Modellierungsfehler erkennen;
- BPMN und UML-Aktivitätsdiagramm auf Grundniveau abgrenzen.

## 2. Prüfungsminimum — 15 Minuten

1. BPMN modelliert Geschäftsprozesse und Kommunikation zwischen Beteiligten.
2. Event = etwas geschieht; Task = Arbeit wird ausgeführt; Gateway = Ablauf wird verzweigt/synchronisiert.
3. Start Event beginnt, End Event beendet einen Prozesspfad.
4. Sequence Flow verbindet Elemente innerhalb eines Pools.
5. Message Flow zeigt Kommunikation zwischen verschiedenen Pools.
6. Pool repräsentiert einen Teilnehmer; Lane ordnet Verantwortung innerhalb eines Teilnehmers.
7. XOR: genau ein alternativer Pfad; AND: alle parallelen Pfade.
8. Bedingungen stehen an ausgehenden Sequence Flows eines datenbasierten Gateways.
9. Ein AND-Split braucht häufig einen passenden AND-Join, wenn später auf alle Pfade gewartet wird.
10. Der genaue AP1-Umfang von BPMN bleibt mit WBS/Prüfungskatalog abzugleichen.

> Der Message Flow wird verwendet, weil Kunde und Unternehmen als getrennte Teilnehmer in unterschiedlichen Pools modelliert sind.

## 3. Grundlagen

### 3.1 Hauptelemente

| Kategorie | Element | Bedeutung |
|---|---|---|
| Flow Object | Event | Auslöser oder Ergebnis |
| Flow Object | Activity/Task | auszuführende Arbeit |
| Flow Object | Gateway | Verzweigung oder Zusammenführung |
| Connecting Object | Sequence Flow | Reihenfolge im Pool |
| Connecting Object | Message Flow | Nachricht zwischen Pools |
| Swimlane | Pool | Teilnehmer/Prozessgrenze |
| Swimlane | Lane | Verantwortungsbereich im Pool |
| Artifact | Data Object/Annotation | Daten oder ergänzende Information |

### 3.2 Events

- `Start Event`: löst den Prozess aus; dünner Kreis.
- `Intermediate Event`: tritt während des Prozesses auf; doppelter Kreis.
- `End Event`: kennzeichnet Ergebnis/Ende; dicker Kreis.

Symbole im Event konkretisieren Typen wie Nachricht oder Timer. Für das Prüfungsminimum zuerst Start, Zwischenereignis und Ende sicher unterscheiden.

### 3.3 Tasks

Ein Task ist eine atomare Aktivität auf der betrachteten Modellebene. Namen enthalten idealerweise Verb und Objekt:

```text
Ticket erfassen
Bestellung prüfen
Freigabe erteilen
Kunde informieren
```

`Prüfung` allein benennt weniger klar, wer was tut. Zustände wie „Ticket offen“ sind keine Tasks.

### 3.4 Pool und Lane

Ein Pool steht für einen Prozessbeteiligten, etwa `Kunde` oder `Unternehmen`. Lanes teilen einen Pool in Verantwortungsbereiche, etwa `Service Desk` und `Second Level`.

Lanes sind keine getrennten Kommunikationspartner. Zwischen Lanes desselben Pools fließt Sequence Flow, nicht Message Flow.

## 4. Gateways und Flüsse

### 4.1 Exclusive Gateway (XOR)

Genau ein ausgehender Pfad wird gewählt:

```text
Ticket vollständig?
  [ja]   → Priorität bestimmen
  [nein] → Rückfrage senden
```

Guards sollen sich gegenseitig ausschließen und alle erwarteten Fälle abdecken. Ein Default Flow kann einen Restfall aufnehmen.

### 4.2 Parallel Gateway (AND)

Alle ausgehenden Pfade starten parallel:

```text
AND-Split
  → Benutzer informieren
  → Monitoring aktualisieren
AND-Join
  → Ticket schließen
```

Der Join wartet auf die eingehenden parallelen Pfade. Ein falscher Join kann Deadlock oder ungewolltes Weiterlaufen modellieren.

### 4.3 Inclusive Gateway (OR)

Ein oder mehrere Pfade werden nach Bedingungen gewählt. Es ist nicht dasselbe wie XOR. Da die Synchronisation komplexer ist, gehört OR erst nach sicherem XOR/AND-Verständnis zum Lernumfang.

### 4.4 Sequence Flow und Message Flow

| Flow | innerhalb eines Pools | zwischen Pools |
|---|---:|---:|
| Sequence Flow | ja | nein |
| Message Flow | nein | ja |

Message Flow zeigt fachliche Kommunikation, nicht zwingend ein bestimmtes Netzwerkprotokoll.

## 5. Anwendungsfall: Supportticket

Teilnehmer:

- Pool `Kunde`;
- Pool `IT-Dienstleister` mit Lanes `Service Desk` und `Second Level`.

Ablauf:

```text
Kunde: Störung melden
  ..Message Flow..
ServiceDesk: Ticket erfassen
ServiceDesk: Angaben vollständig?
  [nein] → Rückfrage senden ..Message Flow.. Kunde
  [ja]   → Priorität bestimmen
ServiceDesk: im First Level lösbar?
  [ja]   → Lösung umsetzen
  [nein] → an Second Level übergeben
SecondLevel: Ursache analysieren
SecondLevel: Lösung umsetzen
AND-Split: Kunde informieren + Dokumentation aktualisieren
AND-Join: Ticket schließen
```

Prüfung des Modells:

1. Jeder XOR-Ausgang hat klare Guards.
2. Rückfrage führt nach Antwort wieder zur Vollständigkeitsprüfung.
3. Übergabe zwischen Lanes bleibt Sequence Flow.
4. Kommunikation zum Kunden ist Message Flow.
5. Ticket wird erst nach beiden parallelen Abschlussarbeiten geschlossen.

### 5.1 BPMN oder UML-Aktivitätsdiagramm?

| Frage | BPMN | UML-Aktivitätsdiagramm |
|---|---|---|
| Geschäftsprozess und Teilnehmer | besonders geeignet | möglich |
| Nachrichten zwischen Organisationen | expliziter Message Flow | anders/vereinfacht modelliert |
| Software-/Arbeitsablauf | möglich | häufig geeignet |
| Klassen/Struktur | nicht Zweck | anderes UML-Diagramm nötig |

Beide Notationen können Abläufe darstellen. Symbole dürfen nicht unbemerkt gemischt werden.

## 6. Prüfungsformulierungen

> Das exklusive Gateway wird verwendet, da abhängig von der Vollständigkeit genau einer der beiden alternativen Pfade ausgeführt wird.

> Die Aufgaben „Kunde informieren“ und „Dokumentation aktualisieren“ werden mit einem parallelen Gateway gestartet, weil beide unabhängig ausgeführt werden müssen.

> Zwischen Service Desk und Second Level wird Sequence Flow verwendet, da beide Lanes zum selben Pool des IT-Dienstleisters gehören.

> Die Störungsmeldung zwischen Kunde und Dienstleister wird als Message Flow modelliert, da die Nachricht die Grenze zweier Pools überschreitet.

## 7. Typische Prüfungsfallen

- Event, Task und Gateway verwechseln.
- Zustand als Task ohne Verb modellieren.
- Message Flow innerhalb desselben Pools zeichnen.
- Sequence Flow über Poolgrenzen führen.
- Pool und Lane gleichsetzen.
- XOR verwenden, obwohl alle Pfade laufen sollen.
- AND verwenden, obwohl nur ein Pfad gewählt werden darf.
- parallele Pfade ohne notwendigen Join weiterführen.
- XOR-Guards überlappen lassen oder Restfall vergessen.
- Nachrichtenfluss als technische TCP-Verbindung interpretieren.
- BPMN- und UML-Symbole mischen.
- BPMN als bestätigten AP1-Kern darstellen, obwohl Umfang noch abzugleichen ist.

## 8. Selbsttest

1. Was ist der Zweck von BPMN?
2. Unterscheide Event, Task und Gateway.
3. Wann verwendet man Sequence Flow?
4. Wann verwendet man Message Flow?
5. Unterscheide Pool und Lane.
6. Welches Gateway modelliert genau eine Alternative?
7. Welches Gateway startet alle parallelen Pfade?
8. Formuliere gute Guards für `Betrag ≥ 1000`.
9. Warum kann ein AND-Join nötig sein?
10. Darf Message Flow zwischen zwei Lanes desselben Pools liegen?
11. Modelliere textuell eine Bestellannahme mit Ablehnungspfad.
12. Begründe die Wahl BPMN statt Klassendiagramm für einen Supportprozess.

<details>
<summary>Lösungen anzeigen</summary>

1. Geschäftsprozesse, Verantwortungen und Kommunikation verständlich darstellen.
2. Event geschieht, Task wird ausgeführt, Gateway steuert Pfade.
3. Für die Reihenfolge innerhalb eines Pools.
4. Für Nachrichten zwischen unterschiedlichen Pools.
5. Pool = Teilnehmer; Lane = Verantwortungsbereich innerhalb des Teilnehmers.
6. XOR.
7. AND.
8. `[betrag ≥ 1000]` und `[betrag < 1000]`.
9. Damit ein Folgeschritt erst beginnt, wenn alle parallelen Pfade abgeschlossen sind.
10. Nein, dort wird Sequence Flow verwendet.
11. Start → Bestellung prüfen → XOR `[gültig]` annehmen / `[ungültig]` ablehnen → Ende.
12. BPMN stellt Prozess, Zuständigkeiten und Kommunikation dar; ein Klassendiagramm zeigt statische Struktur.

</details>

## 9. Quellen und Abgleich

- [OMG BPMN 2.0.2](https://www.omg.org/spec/BPMN/2.0.2/About-BPMN) — normative Spezifikation und offizielle Beispieldokumente.
- Themenumfang als `Abgleich`, weil die konkrete AP1-Tiefe durch WBS beziehungsweise Prüfungskatalog bestätigt werden muss; Stand 10.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Gehört BPMN im verwendeten Prüfungskatalog verbindlich zu AP1?
- Welche Eventtypen und Gateways verlangt WBS?
- Muss ein Diagramm gezeichnet oder nur gelesen und korrigiert werden?
