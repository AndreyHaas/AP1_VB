---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Wasserfall, Scrum und Planungswerkzeuge

## Wasserfallmodell

Typische lineare Phasen:

```text
Analyse → Entwurf → Implementierung → Test → Einführung/Betrieb
```

Vorteile:

- klare Reihenfolge und Dokumentation;
- gut planbar bei stabilen Anforderungen.

Nachteile:

- nutzbares Ergebnis und Feedback kommen spät;
- Änderungen an frühen Annahmen sind später teuer.

## Scrum

Scrum arbeitet iterativ und inkrementell in `Sprints`.

Verantwortlichkeiten:

```text
Product Owner → maximiert Produktwert und verantwortet Product Backlog
Scrum Master  → unterstützt Scrum, beseitigt Prozesshindernisse
Developers    → erstellen in jedem Sprint ein nutzbares Increment
```

Wichtige Ereignisse:

```text
Sprint
Sprint Planning
Daily Scrum
Sprint Review
Sprint Retrospective
```

Artefakte:

```text
Product Backlog
Sprint Backlog
Increment
```

Scrum passt zu veränderlichen Anforderungen und frühem Feedback, verlangt aber aktive Zusammenarbeit und konsequente Priorisierung.

## Projektstrukturplan (PSP)

PSP zerlegt das Gesamtprojekt vollständig in plan- und kontrollierbare Elemente bis zu `Arbeitspaketen`. Er zeigt eine statische Struktur, keine zeitliche Reihenfolge.

Gliederung kann objekt-, funktions- oder phasenorientiert sein.

## Gantt-Diagramm

Zeigt Vorgänge als Balken auf einer Zeitachse. Sichtbar werden Dauer, Parallelität, Termine und häufig Abhängigkeiten. Puffer und kritischer Pfad sind in einem Netzplan meist genauer erkennbar.

## Netzplan

Ein Netzplan zeigt logische/zeitliche Abhängigkeiten zwischen Vorgängen.

Vorwärtsrechnung:

```text
FAZ = frühester Anfangszeitpunkt
FEZ = FAZ + Dauer
FAZ eines Nachfolgers = größter FEZ seiner Vorgänger
```

Rückwärtsrechnung:

```text
SEZ = spätester Endzeitpunkt
SAZ = SEZ − Dauer
SEZ eines Vorgängers = kleinster SAZ seiner Nachfolger
```

Puffer:

```text
Gesamtpuffer GP = SAZ − FAZ = SEZ − FEZ
freier Puffer FP = kleinster FAZ der Nachfolger − FEZ
```

Vorgänge mit `Gesamtpuffer = 0` liegen auf dem kritischen Pfad. Ihre Verzögerung verschiebt ohne Gegenmaßnahme den Projektendtermin.

## Meilenstein und Arbeitspaket

`Meilenstein`: wichtiges Ereignis ohne eigene Dauer, например Freigabe oder Abnahme.

`Arbeitspaket`: kleinste plan- und verantwortbare Einheit des PSP mit Ergebnis, Aufwand, Termin, Verantwortlichem und Prüfkriterien.

## IHK-Merksätze

> Der Projektstrukturplan zeigt, was zum Projekt gehört; das Gantt-Diagramm zeigt die zeitliche Lage; der Netzplan zeigt Abhängigkeiten, Puffer und den kritischen Pfad.

> Der kritische Pfad besteht aus Vorgängen ohne Gesamtpuffer.

## Selbsttest

Vorgang A dauert 3 Tage, danach laufen B (4 Tage) und C (2 Tage) parallel. D (1 Tag) beginnt erst nach B und C. Bestimme Projektdauer und kritischen Pfad.

## Lösungen

```text
A: Tag 0–3
B: Tag 3–7
C: Tag 3–5
D: Tag 7–8

Projektdauer: 8 Tage
kritischer Pfad: A → B → D
C besitzt 2 Tage Puffer.
```

## Offene Punkte / Korrekturen

- Komplexere Netzpläne mit mehreren Vorgängern als eigene Übungsserie ergänzen.
