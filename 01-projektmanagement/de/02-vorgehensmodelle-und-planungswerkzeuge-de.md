---
pruefung: AP1
thema: Projektmanagement
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Deutsch
gegenstueck: ../ru/02-vorgehensmodelle-und-planungswerkzeuge-ru.md
---

# AP1: Vorgehensmodelle und Planungswerkzeuge

Dieses Kapitel behandelt das `Wasserfallmodell`, `Scrum`, den `Projektstrukturplan (PSP)`, `Arbeitspakete`, das `Gantt-Diagramm` und den `Netzplan`. Ziel ist nicht nur das Wiedergeben von Definitionen, sondern die begründete Auswahl eines Vorgehens, das Lesen eines Plans und die Berechnung von Terminen.

## 1. Lernziele

Nach der Bearbeitung dieses Kapitels solltest du:

- ein klassisches und ein agiles Vorgehen vergleichen können;
- Vorteile, Grenzen und geeignete Einsatzbedingungen des `Wasserfallmodells` erklären können;
- Verantwortlichkeiten, Ereignisse, Artefakte und Commitments in `Scrum` korrekt benennen können;
- Scrum keine Rollen und Prozesse zuschreiben, die nicht zum offiziellen Framework gehören;
- einen `Projektstrukturplan` erstellen und lesen können;
- `PSP`, `Gantt-Diagramm` und `Netzplan` unterscheiden können;
- `FAZ`, `FEZ`, `SAZ`, `SEZ`, `Gesamtpuffer` und `freien Puffer` berechnen können;
- den `kritischen Pfad` bestimmen und die Folgen einer Verzögerung bewerten können.

---

## 2. Prüfungsminimum — 15 Minuten

1. Ein Vorgehensmodell wird nach Anforderungsstabilität, Risiko, Feedbackbedarf, Compliance und Lieferstrategie gewählt.
2. Wasserfall plant überwiegend sequenziell; iterativ/inkrementell gewinnt Erkenntnis und Nutzen in Wiederholungen.
3. Scrum nutzt Product Owner, Scrum Master und Developers sowie Product Backlog, Sprint Backlog und Inkrement.
4. Der PSP zerlegt den Projektumfang hierarchisch in planbare Arbeitspakete.
5. Das Gantt-Diagramm zeigt Vorgänge auf einer Zeitachse; ein Netzplan macht Abhängigkeiten und Puffer berechenbar.
6. Vorwärtsrechnung ermittelt früheste, Rückwärtsrechnung späteste Termine.
7. Gesamtpuffer `GP = SAZ − FAZ = SEZ − FEZ`; Vorgänge mit GP 0 liegen typischerweise auf dem kritischen Pfad.
8. Ein Modell wird mit Fallmerkmalen begründet, nicht mit „agil ist immer besser“.

> Das iterative Vorgehen ist geeignet, da frühe Rückmeldungen die noch unsicheren Anforderungen schrittweise präzisieren können.

## 3. Auswahl eines Vorgehensmodells

Ein `Vorgehensmodell` beschreibt, wie Analyse, Planung, Umsetzung, Prüfung und Rückmeldung organisiert werden.

Die Auswahl hängt unter anderem ab von:

- der Stabilität der Anforderungen;
- der technischen und organisatorischen Unsicherheit;
- den Kosten später Änderungen;
- dem Bedarf an frühen Zwischenergebnissen;
- der Verfügbarkeit von Auftraggebern und Anwendern für Feedback;
- den Anforderungen an Dokumentation, Sicherheit und Regulierung;
- der Größe und Erfahrung des Teams.

Kein Vorgehen ist in jedem Fall überlegen. In einer Prüfungsantwort muss die Auswahl mit den Bedingungen des konkreten Falls verknüpft werden.

---

## 4. Wasserfallmodell

### 4.1 Grundprinzip

Das `Wasserfallmodell` ist ein überwiegend sequenzielles Vorgehen. Das Ergebnis einer Phase bildet die Grundlage für die nächste Phase.

```text
Anforderungen
      ↓
Entwurf
      ↓
Implementierung
      ↓
Test
      ↓
Einführung und Betrieb
```

Bezeichnungen und Anzahl der Phasen können abweichen. Entscheidend ist die Logik: Anforderungen und Entwurf werden weitgehend vor der Umsetzung festgelegt; anschließend folgen Realisierung und Prüfung.

### 4.2 Stärken

- verständliche Reihenfolge und Zuständigkeiten;
- ausführliche Planung vor der Umsetzung;
- klar definierte Dokumente und Freigabepunkte;
- Termine und Budget sind bei stabilen Anforderungen leichter planbar;
- geeignet, wenn späte Änderungen besonders teuer sind.

### 4.3 Grenzen

- Anwender erhalten ein nutzbares Ergebnis häufig erst spät;
- falsche Annahmen können erst beim Test sichtbar werden;
- Änderungen freigegebener Anforderungen erfordern Anpassungen an Plänen und Dokumenten;
- bei hoher Unsicherheit verlieren frühe Schätzungen schnell ihre Gültigkeit;
- ein formaler Phasenabschluss beweist nicht, dass die ursprünglichen Anforderungen richtig waren.

### 4.4 Geeignete Einsatzbedingungen

Das `Wasserfallmodell` lässt sich begründen, wenn:

- Anforderungen bekannt, stabil und prüfbar sind;
- die Technologie gut beherrscht wird;
- Ergebnisse formale Freigaben durchlaufen müssen;
- der Auftraggeber keine häufigen Zwischenlieferungen benötigt;
- die Abhängigkeiten eine überwiegend sequenzielle Bearbeitung erlauben.

> Das Wasserfallmodell ist geeignet, weil die Anforderungen vollständig dokumentiert und während der Umsetzung voraussichtlich stabil sind.

---

## 5. Scrum

### 5.1 Grundidee

`Scrum` ist ein leichtgewichtiges Framework zur Wertschöpfung durch Lösungen für komplexe Probleme. Die Arbeit erfolgt `iterativ` und `inkrementell`.

- `iterativ`: Vorgehen und Lösung werden anhand von Erfahrungen wiederholt überprüft und verbessert;
- `inkrementell`: Das Produkt wächst in nutzbaren Schritten;
- `empirisch`: Entscheidungen beruhen auf beobachtbaren Ergebnissen.

Die drei Säulen der Empirie:

- `Transparenz` – der Zustand der Arbeit ist für die Beteiligten verständlich;
- `Überprüfung` – Ergebnis und Fortschritt werden regelmäßig betrachtet;
- `Anpassung` – Vorgehen oder Plan werden bei Abweichungen angepasst.

Scrum stützt sich auf die Werte `Commitment, Fokus, Offenheit, Respekt und Mut`.

### 5.2 Scrum Team und Verantwortlichkeiten

Ein `Scrum Team` besteht aus:

| Verantwortlichkeit | Hauptverantwortung | Nicht verwechseln |
|---|---|---|
| `Product Owner` | Maximiert den Produktwert, formuliert und ordnet das `Product Backlog` und sorgt für transparente Ziele | Kein Ausschuss und kein reiner Anforderungssekretär |
| `Scrum Master` | Hilft, Scrum richtig zu verstehen und anzuwenden, organisatorische Hindernisse zu bearbeiten und die Wirksamkeit des Teams zu verbessern | Kein Teamleiter und kein klassischer Projektleiter |
| `Developers` | Planen die Arbeit des Sprints, erstellen ein nutzbares `Increment`, halten die `Definition of Done` ein und passen ihren Plan täglich an | Nicht nur Programmierer; gemeint sind alle, die das Produkt erstellen |

Der `Product Owner` darf einzelne Arbeiten delegieren, bleibt jedoch für das Ergebnis des Product-Backlog-Managements verantwortlich.

Im offiziellen Scrum gibt es keine eigene Verantwortlichkeit `Projektleiter`. Eine Organisation kann Manager außerhalb des Scrum Teams einsetzen, deren Befugnisse dürfen aber nicht automatisch in das Scrum Framework übertragen werden.

### 5.3 Scrum Events

Der `Sprint` ist der Container für alle anderen Ereignisse. Er dauert höchstens einen Monat. Kürzere Sprints können die Häufigkeit von Feedback erhöhen und Risiken begrenzen.

| Ereignis | Zweck | Wichtige Abgrenzung |
|---|---|---|
| `Sprint` | Wertvolles, nutzbares Increment erstellen und auf das `Sprint Goal` hinarbeiten | Ein neuer Sprint beginnt unmittelbar nach dem vorherigen |
| `Sprint Planning` | Wert des Sprints klären, Arbeit auswählen und Umsetzung planen | Das gesamte Scrum Team nimmt teil |
| `Daily Scrum` | Developers überprüfen den Fortschritt zum `Sprint Goal` und passen ihren Arbeitsplan an | 15 Minuten; kein Bericht an einen Vorgesetzten |
| `Sprint Review` | Ergebnis gemeinsam mit Stakeholdern überprüfen und weitere Richtung anpassen | Nicht nur eine Vorführung und kein Abnahmeprotokoll |
| `Sprint Retrospective` | Qualität und Wirksamkeit der Zusammenarbeit verbessern | Betrachtet Prozess, Interaktion und Arbeitsweisen |

Nur der `Product Owner` kann einen Sprint abbrechen, wenn das `Sprint Goal` gegenstandslos geworden ist.

### 5.4 Artefakte und Commitments

| Artefakt | Inhalt | Commitment |
|---|---|---|
| `Product Backlog` | Geordnete Liste der für das Produkt benötigten Arbeit | `Product Goal` |
| `Sprint Backlog` | `Sprint Goal`, ausgewählte Product-Backlog-Einträge und Umsetzungsplan | `Sprint Goal` |
| `Increment` | Konkreter Schritt in Richtung Product Goal, der die Definition of Done erfüllt | `Definition of Done` |

Arbeit, die nicht der `Definition of Done` entspricht, ist kein Bestandteil eines nutzbaren Increments und darf nicht als abgeschlossen dargestellt werden.

### 5.5 Geeignete Einsatzbedingungen

Scrum lässt sich begründen, wenn:

- sich Anforderungen voraussichtlich verändern;
- der beste Lösungsweg nicht vollständig bekannt ist;
- häufiges Feedback von Anwendern benötigt wird;
- das Produkt in nutzbaren Teilen entstehen kann;
- das Team seine Umsetzung selbst organisieren kann.

> Scrum ist geeignet, weil die Anforderungen noch nicht vollständig feststehen und durch kurze Sprints regelmäßig nutzbare Ergebnisse sowie frühes Feedback entstehen.

### 5.6 Wasserfall und Scrum im Vergleich

| Kriterium | `Wasserfallmodell` | `Scrum` |
|---|---|---|
| Planung | Großer Anteil im Voraus | Wird fortlaufend konkretisiert |
| Anforderungen | Möglichst stabil | Dürfen sich weiterentwickeln |
| Lieferung | Nutzbares Gesamtergebnis häufig spät | Increment in jedem Sprint |
| Feedback | Seltener und an Phasengrenzen | Regelmäßig |
| Änderungen | Formeller Änderungsprozess | Anpassung des Product Backlogs zwischen Sprints |
| Arbeitssteuerung | Phasenbezogener Projektplan | Selbstmanagendes Scrum Team |
| Geeigneter Kontext | Geringe Unsicherheit | Komplexität und hohe Unsicherheit |

Auch bei Scrum gelten Anforderungen an Sicherheit, Datenschutz, Budget und Verträge. Agilität bedeutet anpassungsfähige Steuerung, nicht den Verzicht auf Planung oder notwendige Dokumentation.

---

## 6. Projektstrukturplan (PSP)

### 6.1 Zweck

Der `PSP` gliedert den gesamten Projektumfang hierarchisch in überschaubare Bestandteile. Er schafft ein gemeinsames Bild des `Projektumfangs` und bildet die Grundlage für die Planung von Terminen, Kosten, Ressourcen und Verantwortlichkeiten.

Das kleinste plan- und kontrollierbare Element ist das `Arbeitspaket`.

```text
Projekt: 20 Arbeitsplätze einrichten
├── 1 Planung
│   ├── 1.1 Anforderungen aufnehmen
│   └── 1.2 Lösung auswählen
├── 2 Beschaffung
│   ├── 2.1 Hardware bestellen
│   └── 2.2 Lizenzen beschaffen
├── 3 Umsetzung
│   ├── 3.1 Betriebssystem installieren
│   ├── 3.2 Software konfigurieren
│   └── 3.3 Domänenaufnahme
└── 4 Abschluss
    ├── 4.1 Systemtest
    └── 4.2 Einweisung und Abnahme
```

### 6.2 Gliederungsarten

| Art | Gliederungsgrundlage | Beispiel |
|---|---|---|
| `phasenorientiert` | Projektphasen | Planung, Umsetzung, Test, Abschluss |
| `objektorientiert` | Bestandteile des Ergebnisses | Client, Server, Netzwerk, Dokumentation |
| `funktionsorientiert` | Tätigkeitsarten | analysieren, beschaffen, installieren, testen |
| `gemischt` | Kombination mehrerer Prinzipien | Oben Phasen, darunter Objekte |

Innerhalb einer Ebene sollte nach Möglichkeit ein einheitliches Gliederungsprinzip verwendet werden, damit keine Arbeit doppelt erfasst oder übersehen wird.

### 6.3 Anforderungen an ein Arbeitspaket

Ein gutes `Arbeitspaket` enthält:

- eine eindeutige Kennung;
- eine Beschreibung des erwarteten Ergebnisses;
- eine verantwortliche Person;
- geplanten Beginn, geplantes Ende und Dauer;
- Aufwand und benötigte Ressourcen;
- Vorgänger und Abhängigkeiten;
- Fertigstellungs- und Abnahmekriterien.

Wichtig ist die Unterscheidung:

- `Dauer` – kalendarische Zeitspanne;
- `Aufwand` – benötigte Arbeitsmenge, zum Beispiel 16 Personenstunden.

Zwei Mitarbeitende halbieren die Dauer nicht automatisch. Eine Aufgabe kann unteilbar sein, zusätzliche Abstimmung verursachen oder von einer einzigen Ressource abhängen.

---

## 7. Gantt-Diagramm

Ein `Gantt-Diagramm` stellt Vorgänge als Balken auf einer Zeitachse dar.

Typischerweise sind erkennbar:

- Beginn und Ende;
- Dauer;
- Parallelität;
- Reihenfolge;
- Meilensteine;
- je nach Darstellung auch Abhängigkeiten, Fortschritt und Ressourcen.

Die Stärke ist die anschauliche Kalenderplanung. Bei vielen Vorgängen können logische Abhängigkeiten und Puffer jedoch weniger deutlich sein als in einem `Netzplan`.

Der `PSP` beantwortet vor allem: **Was gehört zum Projekt?**  
Das `Gantt-Diagramm` beantwortet: **Wann finden die Vorgänge statt?**  
Der `Netzplan` beantwortet: **Welche Abhängigkeiten, Puffer und kritischen Wege bestehen?**

---

## 8. Netzplan

### 8.1 Grundbegriffe

| Kürzel | Begriff | Bedeutung |
|---|---|---|
| `D` | `Dauer` | Zeitspanne eines Vorgangs |
| `FAZ` | `frühester Anfangszeitpunkt` | Frühester möglicher Beginn |
| `FEZ` | `frühester Endzeitpunkt` | Frühestes mögliches Ende |
| `SAZ` | `spätester Anfangszeitpunkt` | Spätester Beginn ohne Verzögerung des Projekts |
| `SEZ` | `spätester Endzeitpunkt` | Spätestes Ende ohne Verzögerung des Projekts |
| `GP` | `Gesamtpuffer` | Maximale Verzögerung eines Vorgangs ohne Verschiebung des Projektendes |
| `FP` | `freier Puffer` | Verzögerung ohne Verschiebung des frühen Starts eines direkten Nachfolgers |

In vielen Aufgaben beginnt die Zeitrechnung bei `0`. Werden Kalenderdaten oder eine andere Zählweise vorgegeben, ist die Aufgabenstellung maßgeblich.

### 8.2 Vorwärtsrechnung

Für einen Startvorgang:

```text
FAZ = 0
FEZ = FAZ + Dauer
```

Für einen Vorgang mit einem oder mehreren Vorgängern:

```text
FAZ = größter FEZ aller unmittelbaren Vorgänger
FEZ = FAZ + Dauer
```

Der **größte** FEZ wird verwendet, weil der Vorgang erst beginnen kann, wenn alle notwendigen Vorgänger beendet sind.

### 8.3 Rückwärtsrechnung

Für einen Endvorgang:

```text
SEZ = Projektdauer
SAZ = SEZ − Dauer
```

Für einen Vorgang mit einem oder mehreren Nachfolgern:

```text
SEZ = kleinster SAZ aller unmittelbaren Nachfolger
SAZ = SEZ − Dauer
```

Der **kleinste** SAZ wird verwendet, damit keiner der notwendigen Nachfolger verspätet beginnt.

### 8.4 Pufferzeiten

```text
Gesamtpuffer:
GP = SAZ − FAZ
GP = SEZ − FEZ

Freier Puffer:
FP = kleinster FAZ der unmittelbaren Nachfolger − FEZ
```

Bei einem Endvorgang kann der freie Puffer in einfachen Aufgaben auf den Projektendtermin bezogen werden.

Vorgänge mit `GP = 0` liegen auf dem `kritischen Pfad`. Ihre Verzögerung verschiebt normalerweise das Projektende, wenn sie nicht durch eine andere Maßnahme ausgeglichen wird.

---

## 9. Vollständiges Netzplanbeispiel

### 9.1 Ausgangsdaten

| Vorgang | Dauer | Unmittelbare Vorgänger |
|---|---:|---|
| A | 3 | – |
| B | 4 | A |
| C | 2 | A |
| D | 5 | B |
| E | 3 | B, C |
| F | 2 | D, E |

### 9.2 Vorwärtsrechnung

| Vorgang | Berechnung FAZ | FAZ | FEZ |
|---|---|---:|---:|
| A | Start | 0 | 3 |
| B | FEZ(A) | 3 | 7 |
| C | FEZ(A) | 3 | 5 |
| D | FEZ(B) | 7 | 12 |
| E | max(FEZ(B), FEZ(C)) = max(7, 5) | 7 | 10 |
| F | max(FEZ(D), FEZ(E)) = max(12, 10) | 12 | 14 |

`Projektdauer = 14 Zeiteinheiten`.

### 9.3 Rückwärtsrechnung

| Vorgang | Berechnung SEZ | SAZ | SEZ |
|---|---|---:|---:|
| F | Projektende | 12 | 14 |
| D | SAZ(F) | 7 | 12 |
| E | SAZ(F) | 9 | 12 |
| B | min(SAZ(D), SAZ(E)) = min(7, 9) | 3 | 7 |
| C | SAZ(E) | 7 | 9 |
| A | min(SAZ(B), SAZ(C)) = min(3, 7) | 0 | 3 |

### 9.4 Puffer und kritischer Pfad

| Vorgang | FAZ | FEZ | SAZ | SEZ | GP | FP |
|---|---:|---:|---:|---:|---:|---:|
| A | 0 | 3 | 0 | 3 | 0 | 0 |
| B | 3 | 7 | 3 | 7 | 0 | 0 |
| C | 3 | 5 | 7 | 9 | 4 | 2 |
| D | 7 | 12 | 7 | 12 | 0 | 0 |
| E | 7 | 10 | 9 | 12 | 2 | 2 |
| F | 12 | 14 | 12 | 14 | 0 | 0 |

`Kritischer Pfad: A → B → D → F`.

Warum besitzt C einen `GP von 4`, aber nur einen `FP von 2`?

- C darf insgesamt höchstens vier Zeiteinheiten später liegen, ohne das Projektende zu verschieben.
- Bereits nach zwei Zeiteinheiten Verzögerung verschiebt sich der früheste Anfang von E.
- E besitzt selbst noch zwei Zeiteinheiten Gesamtpuffer.

### 9.5 Plausibilitätsprüfung

- Summe der Dauern des kritischen Pfads: `3 + 4 + 5 + 2 = 14`;
- dieser Wert entspricht der berechneten Projektdauer;
- alle Vorgänge des kritischen Pfads besitzen `GP = 0`.

---

## 10. Änderungen und Steuerungsmaßnahmen

Wenn sich Vorgang D um zwei Zeiteinheiten verzögert:

- D liegt auf dem kritischen Pfad;
- der `Gesamtpuffer` von D beträgt 0;
- F beginnt ohne Gegenmaßnahme zwei Zeiteinheiten später;
- das Projektende verschiebt sich von 14 auf 16.

Mögliche Maßnahmen:

- prüfen, ob Arbeit teilweise parallel durchgeführt werden kann – `Fast Tracking`;
- geeignete zusätzliche Ressourcen einsetzen – `Crashing`;
- Umfang oder Prioritäten anpassen;
- eine technische Alternative einsetzen;
- einen neuen Termin über den `Änderungsprozess` abstimmen.

Die Maßnahme muss realistisch sein. Zusätzliches Personal hilft nicht automatisch und kann den Abstimmungsaufwand erhöhen.

---

## 11. Prüfungsformulierungen

### Wasserfall auswählen

> Das Wasserfallmodell ist geeignet, weil die Anforderungen vollständig beschrieben, stabil und vor der Umsetzung formal freizugeben sind.

### Scrum auswählen

> Scrum ist geeignet, weil die Anforderungen noch nicht vollständig feststehen und regelmäßige Increments frühes Feedback der Anwender ermöglichen.

### Planungswerkzeuge unterscheiden

> Der Projektstrukturplan gliedert den vollständigen Projektumfang in Arbeitspakete. Das Gantt-Diagramm stellt deren zeitliche Lage dar. Der Netzplan zeigt zusätzlich logische Abhängigkeiten, Pufferzeiten und den kritischen Pfad.

### Kritischen Pfad begründen

> Die Vorgänge A, B, D und F liegen auf dem kritischen Pfad, weil ihr Gesamtpuffer jeweils null beträgt. Eine Verzögerung dieser Vorgänge verschiebt ohne Gegenmaßnahme den Projektendtermin.

### Daily Scrum erklären

> Das Daily Scrum dient den Developers zur Überprüfung des Fortschritts in Richtung Sprint Goal und zur Anpassung des Arbeitsplans. Es ist kein Statusbericht an einen Vorgesetzten.

---

## 12. Typische Prüfungsfallen

1. Der `Scrum Master` ist kein Vorgesetzter des Teams.
2. Der `Product Owner` verantwortet Wert und Product Backlog, verteilt aber nicht zwingend jede technische Aufgabe.
3. Das `Daily Scrum` ist kein Bericht an einen Projektleiter.
4. Das `Sprint Review` betrachtet Produkt und weitere Richtung; die `Sprint Retrospective` verbessert die Zusammenarbeit.
5. Ein `Increment` muss der `Definition of Done` entsprechen.
6. Ein `PSP` zeigt nicht automatisch die kalendarische Reihenfolge.
7. Bei mehreren Vorgängern wird in der Vorwärtsrechnung der **größte FEZ** verwendet.
8. Bei mehreren Nachfolgern wird in der Rückwärtsrechnung der **kleinste SAZ** verwendet.
9. `Gesamtpuffer` und `freier Puffer` sind nicht identisch.
10. Der kritische Pfad kann sich nach Verzögerungen oder geänderten Dauern verändern.
11. Mehrere kritische Pfade sind möglich und erhöhen das Terminrisiko.
12. `Aufwand` und `Dauer` sind keine Synonyme.

---

## 13. Selbsttest

### A. Verständnis

1. Nenne zwei Bedingungen, unter denen das `Wasserfallmodell` sinnvoll begründet werden kann.
2. Worin unterscheiden sich `iterativ` und `inkrementell`?
3. Wer ist für die Ordnung des `Product Backlogs` verantwortlich?
4. Welches Commitment gehört zum `Increment`?
5. Worin unterscheiden sich `Sprint Review` und `Sprint Retrospective`?
6. Welche Frage beantwortet vor allem der `PSP` und welche das `Gantt-Diagramm`?

### B. Anwendung

Für ein Projekt sind folgende Vorgänge gegeben:

| Vorgang | Dauer | Vorgänger |
|---|---:|---|
| A | 2 | – |
| B | 5 | A |
| C | 4 | A |
| D | 3 | B, C |
| E | 2 | C |
| F | 1 | D, E |

7. Führe die Vorwärts- und Rückwärtsrechnung durch.
8. Berechne den `GP` jedes Vorgangs.
9. Bestimme den kritischen Pfad und die Projektdauer.
10. Bewerte die Folge, wenn sich C um eine Zeiteinheit verzögert.

<details>
<summary>Lösungen anzeigen</summary>

1. Zum Beispiel: stabile Anforderungen, bekannte Technologie, formale Freigaben oder geringe Unsicherheit.
2. `Iterativ` bedeutet, Vorgehen und Lösung wiederholt zu prüfen und zu verbessern. `Inkrementell` bedeutet, das Produkt in nutzbaren Teilen zu erweitern.
3. Der `Product Owner`.
4. Die `Definition of Done`.
5. Das Review betrachtet das Produktergebnis und passt das Product Backlog an. Die Retrospective betrachtet und verbessert die Arbeitsweise des Scrum Teams.
6. Der PSP zeigt, was zum Projekt gehört. Das Gantt-Diagramm zeigt die zeitliche Lage der Vorgänge.

Berechnung:

| Vorgang | FAZ | FEZ | SAZ | SEZ | GP |
|---|---:|---:|---:|---:|---:|
| A | 0 | 2 | 0 | 2 | 0 |
| B | 2 | 7 | 2 | 7 | 0 |
| C | 2 | 6 | 3 | 7 | 1 |
| D | 7 | 10 | 7 | 10 | 0 |
| E | 6 | 8 | 8 | 10 | 2 |
| F | 10 | 11 | 10 | 11 | 0 |

7. Die Werte stehen in der Tabelle.
8. `GP`: A = 0, B = 0, C = 1, D = 0, E = 2, F = 0.
9. `Kritischer Pfad: A → B → D → F`; Projektdauer: 11 Zeiteinheiten.
10. C kann sich um eine Zeiteinheit verzögern, ohne das Projektende zu verschieben, weil `GP(C) = 1`. Danach ist der Gesamtpuffer verbraucht; D kann weiterhin zum Zeitpunkt 7 beginnen.

</details>

---

## 14. Quellen und Abgleich

- [The Scrum Guide, Ausgabe 2020](https://scrumguides.org/docs/scrumguide/v2020/2020-Scrum-Guide-German.pdf)
- [FIAusbV § 9](https://www.gesetze-im-internet.de/fiausbv/__9.html)
- [U-Form: Prüfungskatalog FIAE, gültig für AP1 ab Frühjahr 2025](https://www.u-form-shop.de/ihk-pruefungen/pruefungskataloge-abschlusspruefung/fachinformatiker-fachinformatikerin-anwendungsentwicklung-pruefungskatalog-fuer-die-ihk-abschlusspruefung-1)

Die Netzplanformeln in diesem Kapitel verwenden ein Vorgangsknotennetz und einen Zeitbeginn bei `0`. Verwendet eine Aufgabe eine andere Konvention, gilt die Aufgabenstellung.

## 15. Offene Prüfpunkte für den Unterricht

- Welche grafische Form des Netzplanknotens verwendet WBS?
- Beginnt die Zeitrechnung in den Aufgaben bei `0` oder mit dem ersten Kalendertag?
- Muss der `freie Puffer` getrennt berechnet werden oder nur der `Gesamtpuffer`?
- Verwendet die Lehrkraft den Begriff `Verantwortlichkeiten` aus dem Scrum Guide oder das traditionelle Wort `Rollen`?
