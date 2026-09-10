---
pruefung: AP1
thema: Programmierung
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Deutsch
gegenstueck: ../ru/02-codefehler-kontrollstrukturen-und-algorithmen-ru.md
---

# Codefehler, Kontrollstrukturen und einfache Algorithmen

## 1. Lernziele

Du kannst:

- unbekannten Code strukturiert lesen;
- Bedingungen, Schleifen und verschachtelte Abläufe nachvollziehen;
- Syntax-, Laufzeit-, Logik- und Randfallfehler finden;
- typische Off-by-one-, Initialisierungs- und Indexfehler korrigieren;
- lineare Suche, Zählen, Summe, Mittelwert, Minimum und Maximum formulieren;
- Korrektur und Testfälle vollständig auf Deutsch begründen.

## 2. Prüfungsminimum — 15 Minuten

1. Code zuerst in Eingabe, Verarbeitung und Ausgabe zerlegen.
2. Variablen mit Startwert, Datentyp und Zweck markieren.
3. Eine Bedingung ist nur `wahr` oder `falsch`; Teilausdrücke einzeln prüfen.
4. `AND` verlangt beide Teilaussagen, `OR` mindestens eine.
5. Bei Schleifen Start, Bedingung, Änderung und Ende kontrollieren.
6. `i < länge` und `i ≤ länge` unterscheiden: bei nullbasiertem Index ist der letzte gültige Index oft `länge - 1`.
7. Akkumulatoren wie `summe` und Zähler wie `anzahl` vor der Schleife initialisieren.
8. Division durch null, leere Liste und nicht gefundener Wert brauchen eine definierte Behandlung.
9. Eine Korrektur ist erst mit passenden Normal-, Grenz- und Fehlerfällen belegt.
10. Ein Schreibtischtest zeigt den tatsächlichen Ablauf, nicht die vermutete Absicht.

> Es liegt ein Off-by-one-Fehler vor, da die Schleife auch den Index `länge` anspricht, obwohl bei nullbasierter Indizierung nur `0` bis `länge - 1` gültig sind.

## 3. Grundlagen

### 3.1 Lesestrategie für unbekannten Code

1. Eingaben und erwartete Ausgabe bestimmen.
2. Namen, Datentypen und Anfangswerte notieren.
3. Schleifen und Verzweigungen mit Einrückung markieren.
4. Vergleichsgrenzen und logische Operatoren prüfen.
5. Änderungen jeder Variable verfolgen.
6. Rückgabewert und Seiteneffekte unterscheiden.
7. Ablauf mit kleinem Testdatensatz simulieren.
8. Ergebnis gegen die fachliche Anforderung prüfen.

### 3.2 Kontrollstrukturen

| Struktur | Zweck | typische Frage |
|---|---|---|
| Sequenz | Anweisungen nacheinander | stimmt die Reihenfolge? |
| Verzweigung | alternative Pfade | sind Fälle vollständig und überschneidungsfrei? |
| Zählschleife | bekannte Anzahl | stimmen Start und Grenze? |
| Bedingungsschleife | Wiederholung bis Bedingung | ändert sich die Bedingung? |
| verschachtelte Struktur | Kombination | welcher innere Block läuft wann? |

### 3.3 Fehlerklassen

| Klasse | Erkennung | Beispiel |
|---|---|---|
| Syntaxfehler | Parser/Compiler kann Anweisung nicht lesen | fehlende Klammer |
| Laufzeitfehler | Fehler erst bei Ausführung | Zugriff außerhalb Array, Division durch null |
| Logikfehler | Code läuft, Ergebnis falsch | Maximum mit falschem Vergleich |
| Randfallfehler | nur besondere Eingabe falsch | leere Liste, genau Grenzwert |

Eine unklare oder schlechte Anforderung kann zusätzlich zu fachlich falschem Code führen. Dann muss zuerst das Soll präzisiert werden.

## 4. Vertiefung und Zusammenhänge

### 4.1 Off-by-one

Gegeben sei eine Liste mit `länge = 4` und gültigen Indizes `0, 1, 2, 3`.

```text
FALSCH: FÜR i VON 0 BIS länge
RICHTIG: FÜR i VON 0 BIS länge - 1
```

Das Wort `BIS` wird hier inklusiv verwendet. In einer Sprache mit exklusiver Obergrenze kann `range(0, länge)` korrekt sein. Notation und Sprache entscheiden.

### 4.2 Initialisierungsfehler

```text
FALSCH:
FÜR jedes x IN werte
    summe ← 0
    summe ← summe + x
ENDE FÜR
```

`summe` wird in jedem Durchlauf gelöscht. Richtig ist die Initialisierung vor der Schleife.

Für ein Maximum ist `maximum ← 0` nur korrekt, wenn negative Werte ausgeschlossen sind. Robust:

```text
WENN werte leer
    FEHLER "kein Maximum"
SONST
    maximum ← werte[0]
ENDE WENN
```

### 4.3 Bedingungen und Bereiche

Soll eine Zahl zwischen 10 und 20 einschließlich liegen:

```text
RICHTIG: zahl ≥ 10 AND zahl ≤ 20
```

`zahl ≥ 10 OR zahl ≤ 20` ist für praktisch jede Zahl wahr und daher ein Logikfehler.

### 4.4 Schleifenfortschritt

Jede bedingungsgesteuerte Schleife braucht einen Weg zum Ende:

```text
i ← 0
SOLANGE i < 5
    AUSGABE i
    i ← i + 1
ENDE SOLANGE
```

Die Änderung kann auch durch Eingabe oder Zustand erfolgen. Sie muss aber nachvollziehbar die Bedingung beeinflussen.

### 4.5 Einfache Algorithmen

`Zählen`:

```text
anzahl ← 0
FÜR jedes x IN werte
    WENN x > 0
        anzahl ← anzahl + 1
    ENDE WENN
ENDE FÜR
```

`Summe und Mittelwert`:

```text
WENN werte leer
    FEHLER "kein Mittelwert"
ENDE WENN
summe ← 0
FÜR jedes x IN werte
    summe ← summe + x
ENDE FÜR
mittelwert ← summe / länge(werte)
```

`Minimum und Maximum`:

```text
minimum ← werte[0]
maximum ← werte[0]
FÜR jedes x IN werte
    WENN x < minimum
        minimum ← x
    ENDE WENN
    WENN x > maximum
        maximum ← x
    ENDE WENN
ENDE FÜR
```

`Lineare Suche`:

```text
gefunden ← falsch
i ← 0
SOLANGE i < länge(werte) AND NOT gefunden
    WENN werte[i] = gesucht
        gefunden ← wahr
    SONST
        i ← i + 1
    ENDE WENN
ENDE SOLANGE
```

Die lineare Suche funktioniert auch bei unsortierten Daten. Im ungünstigsten Fall prüft sie alle Elemente.

## 5. Anwendungsfall: fehlerhafte Bestandsprüfung

Anforderung: Zähle Artikel mit Bestand unter Mindestbestand. Leere Liste ist erlaubt.

Fehlerhafter Code:

```text
FUNKTION zaehleKnapp(bestand, minimum)
    anzahl ← 1
    FÜR i VON 0 BIS länge(bestand)
        WENN bestand[i] ≤ minimum
            anzahl ← anzahl + 1
        ENDE WENN
    ENDE FÜR
    RETURN anzahl
ENDE FUNKTION
```

Gefundene Fehler:

1. `anzahl` muss mit `0` starten.
2. „unter Mindestbestand“ bedeutet `<`, nicht `≤`, sofern die Anforderung wörtlich gilt.
3. Bei inklusivem `BIS` muss die Obergrenze `länge - 1` sein.
4. Die Schleife muss bei leerer Liste ohne Zugriff enden.

Korrektur:

```text
FUNKTION zaehleKnapp(bestand, minimum)
    anzahl ← 0
    FÜR jedes x IN bestand
        WENN x < minimum
            anzahl ← anzahl + 1
        ENDE WENN
    ENDE FÜR
    RETURN anzahl
ENDE FUNKTION
```

Testfälle:

| Bestand | Minimum | Erwartung | Zweck |
|---|---:|---:|---|
| `[8, 3, 5, 1]` | 5 | 2 | Normalfall |
| `[5]` | 5 | 0 | Grenze |
| `[]` | 5 | 0 | leere Liste |
| `[0, -1]` | 0 | 1 | Wertebereich prüfen |

## 6. Prüfungsformulierungen

> Der Zähler muss vor der Schleife mit null initialisiert werden, da noch kein passendes Element gefunden wurde.

> Die Bedingung wird von `≤` zu `<` geändert, weil laut Anforderung nur Bestände unterhalb und nicht genau auf dem Mindestbestand gezählt werden.

> Die Iteration über die Elemente verhindert hier einen ungültigen Index und verarbeitet auch eine leere Liste ohne Arrayzugriff.

> Der Testwert 5 prüft die Grenze, weil er genau dem Mindestbestand entspricht.

## 7. Typische Prüfungsfallen

- Codeabsicht statt tatsächlicher Anweisungen beschreiben.
- Inklusive und exklusive Obergrenze verwechseln.
- `=` und `≠`, `<` und `≤` übersehen.
- `AND` durch `OR` ersetzen und damit einen Bereichstest zerstören.
- Akkumulator innerhalb der Schleife initialisieren.
- Maximum mit `0` starten, obwohl negative Eingaben erlaubt sind.
- Beim Mittelwert die leere Liste nicht behandeln.
- Gefunden-Flag setzen, aber Schleife unnötig weiterlaufen lassen.
- Fehler korrigieren, ohne die fachliche Anforderung zu nennen.
- Nur einen Normalfall testen.
- Ausgabe und Rückgabewert verwechseln.
- Sprachspezifische Syntax auf sprachneutralen Pseudocode übertragen.

## 8. Selbsttest

1. Nenne die vier Fehlerklassen und je ein Beispiel.
2. Warum ist `i ≤ länge` bei nullbasiertem Array meist falsch?
3. Formuliere einen Bereichstest für 1 bis 100 einschließlich.
4. Finde den Fehler: `maximum ← 0` für `[-8, -3, -12]`.
5. Welche Werte testest du für `alter ≥ 18`?
6. Korrigiere eine Schleife, in der `i` nie verändert wird.
7. Schreibe Pseudocode zum Zählen gerader Zahlen.
8. Bestimme Ergebnis: lineare Suche nach `7` in `[2, 7, 9]`.
9. Warum braucht eine Mittelwertberechnung eine Behandlung der leeren Liste?
10. Erkläre den Unterschied zwischen Ausgabe und `RETURN`.
11. Entwirf Tests für `zaehleKnapp`.
12. Bewerte: „Nach einem erfolgreichen Normaltest ist der Algorithmus korrekt.“

<details>
<summary>Lösungen anzeigen</summary>

1. Syntax, Laufzeit, Logik und Randfall; Beispiele stehen in Abschnitt 3.3.
2. Der Index `länge` liegt hinter dem letzten gültigen Index `länge - 1`.
3. `x ≥ 1 AND x ≤ 100`.
4. Ergebnis würde 0 bleiben; mit dem ersten Listenelement initialisieren.
5. 17, 18, 19 sowie ungültige/leere Eingabe nach Schnittstelle.
6. Im Schleifenkörper `i ← i + 1` oder eine andere nachvollziehbare Fortschrittsänderung ergänzen.
7. Zähler 0; über Werte iterieren; bei `x MOD 2 = 0` erhöhen.
8. Gefunden wahr am Index 1 bei nullbasierter Indizierung.
9. Sonst entsteht eine Division durch null und es gibt fachlich keinen definierten Mittelwert.
10. Ausgabe zeigt Daten; `RETURN` gibt einen Wert an den Aufrufer zurück.
11. Normalfall, exakt Grenze, leer, alle passend, keiner passend, ungültige Werte nach Anforderung.
12. Falsch; Grenz-, Fehler- und Sonderfälle sowie Anforderung müssen geprüft werden.

</details>

## 9. Quellen und Abgleich

- [Python-Dokumentation: Kontrollfluss](https://docs.python.org/3/tutorial/controlflow.html) — offizielles konkretes Sprachbeispiel; die Prüfungsnotation bleibt sprachneutral.
- [BIBB: Fachinformatiker/Fachinformatikerin](https://www.bibb.de/dienst/publikationen/de/16661) — Ausbildungsbezug.
- Abgleich mit Kapitel 25 zu Pseudocode und Schreibtischtest; Stand 10.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Welche konkrete Sprache erscheint in WBS-Aufgaben neben Pseudocode?
- Werden Such- und Sortieralgorithmen namentlich verlangt?
- Wie werden exklusive Schleifengrenzen in den Aufgaben notiert?
