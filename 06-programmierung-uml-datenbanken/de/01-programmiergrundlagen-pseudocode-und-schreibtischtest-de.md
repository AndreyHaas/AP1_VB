---
pruefung: AP1
thema: Programmierung
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Deutsch
gegenstueck: ../ru/01-programmiergrundlagen-pseudocode-und-schreibtischtest-ru.md
---

# Programmiergrundlagen, Pseudocode und Schreibtischtest

## 1. Lernziele

Du kannst:

- Variablen, Datentypen, Operatoren und Ausdrücke erklären;
- Sequenz, Verzweigung und Schleife lesen und formulieren;
- Arrays/Listen, Funktionen, Parameter und Rückgabewerte anwenden;
- sprachneutralen Pseudocode in einen Ablauf übersetzen;
- einen Schreibtischtest lückenlos durchführen;
- Syntax-, Laufzeit-, Logik- und Randfallfehler unterscheiden.

## 2. Prüfungsminimum — 15 Minuten

1. Variable = benannter Speicherplatz/Wert mit einem Datentyp.
2. Zuweisung verändert einen Wert; Vergleich prüft eine Bedingung.
3. `AND` verlangt beide Bedingungen, `OR` mindestens eine, `NOT` negiert.
4. `if/else` wählt einen Pfad; eine Schleife wiederholt Anweisungen.
5. `for` eignet sich oft bei bekannter Wiederholungszahl, `while` bei bedingungsabhängiger Wiederholung.
6. `MOD` liefert den Rest einer Ganzzahldivision; `zahl MOD 2 = 0` prüft auf gerade Zahlen.
7. Eine Funktion kapselt Verarbeitung; Parameter sind Eingaben, `RETURN` liefert ein Ergebnis.
8. Beim Schreibtischtest werden Werte nach jeder relevanten Anweisung notiert.
9. Schleifengrenzen und Indexbasis müssen aus der Aufgabe gelesen werden.
10. Testdaten enthalten Normal-, Grenz-, ungültige und leere Fälle.

> Der Schreibtischtest wird zeilenweise durchgeführt, damit jede Änderung der Variablen und die tatsächliche Ausgabe nachvollziehbar bleiben.

## 3. Grundlagen

### 3.1 Datentypen und Variablen

| Datentyp | Beispiel | Verwendung |
|---|---|---|
| Integer | `42` | ganze Zahlen, Zähler |
| Decimal/Real | `19.95` | Werte mit Nachkommastellen |
| Boolean | `true` | wahr/falsch |
| Character | `'A'` | einzelnes Zeichen |
| String | `"AP1"` | Zeichenfolge |
| Date/Time | `2026-09-30` | Datum/Zeit, sprachabhängige Darstellung |

Ein Datentyp bestimmt zulässige Werte und Operationen. Für Geld sind binäre Gleitkommazahlen häufig ungeeignet; in realen Programmen werden Decimal-Typen oder kleinste Währungseinheiten verwendet.

### 3.2 Zuweisung und Vergleich

In diesem Kapitel gilt:

```text
x ← 5        // Zuweisung
x = 5        // Vergleich in einer Bedingung
```

Konkrete Programmiersprachen verwenden andere Symbole. Entscheidend ist, ob ein Wert gespeichert oder verglichen wird.

### 3.3 Operatoren

| Gruppe | Operatoren | Beispiel |
|---|---|---|
| arithmetisch | `+ - * / MOD` | `rest ← 17 MOD 5` ergibt `2` |
| Vergleich | `= ≠ < ≤ > ≥` | `alter ≥ 18` |
| logisch | `AND OR NOT` | `aktiv AND NOT gesperrt` |

Klammern machen Reihenfolge eindeutig. Ohne klare Vorgabe keine eigene Operatorrangfolge erfinden.

### 3.4 Drei Grundstrukturen

`Sequenz`:

```text
preisNetto ← 100
preisBrutto ← preisNetto * 1,19
AUSGABE preisBrutto
```

`Verzweigung`:

```text
WENN bestand > 0
    AUSGABE "lieferbar"
SONST
    AUSGABE "nicht lieferbar"
ENDE WENN
```

`Schleife`:

```text
summe ← 0
FÜR i VON 1 BIS 5
    summe ← summe + i
ENDE FÜR
```

`VON 1 BIS 5` ist hier einschließlich beider Grenzen. In echtem Code kann die obere Grenze ausgeschlossen sein. Die Aufgabe entscheidet.

## 4. Vertiefung und Zusammenhänge

### 4.1 Kopfgesteuerte und fußgesteuerte Schleifen

```text
SOLANGE bedingung
    anweisungen
ENDE SOLANGE
```

Die Bedingung wird vor dem ersten Durchlauf geprüft; die Schleife kann nullmal laufen.

```text
WIEDERHOLE
    anweisungen
BIS bedingung
```

Der Körper läuft mindestens einmal. Die genaue Bedeutung von `BIS` muss in der verwendeten Notation geklärt sein.

Typische Endlosschleife:

```text
i ← 0
SOLANGE i < 10
    AUSGABE i
    // i wird nicht verändert
ENDE SOLANGE
```

### 4.2 Arrays und Listen

Ein Array oder eine Liste speichert mehrere Werte. Wichtig:

- beginnt der Index bei `0` oder `1`?
- ist die obere Grenze eingeschlossen?
- was passiert bei leerer Liste?
- darf ein Index außerhalb des Bereichs angesprochen werden?

```text
werte ← [4, 7, 2]
summe ← 0
FÜR jedes element IN werte
    summe ← summe + element
ENDE FÜR
```

Eine Iteration über Elemente vermeidet manche Indexfehler, erlaubt aber nicht jede benötigte Operation.

### 4.3 Funktionen, Parameter und Rückgabe

```text
FUNKTION maximum(a, b)
    WENN a > b
        RETURN a
    SONST
        RETURN b
    ENDE WENN
ENDE FUNKTION

groesser ← maximum(8, 5)
```

`a` und `b` sind Parameter. `8` und `5` sind beim Aufruf Argumente. Die Funktion liefert `8` zurück.

Seiteneffekte verändern Zustand außerhalb der Rückgabe, etwa eine globale Variable oder Datei. Für einen Schreibtischtest müssen solche Änderungen ebenfalls notiert werden.

### 4.4 Objektorientierte Grundbegriffe

| Begriff | Bedeutung |
|---|---|
| Klasse | Bauplan für Objekte |
| Objekt | konkrete Instanz einer Klasse |
| Attribut | Zustand/Eigenschaft |
| Methode | Verhalten/Operation |
| `private` | Zugriff nur innerhalb der vorgesehenen Kapselung |
| `public` | von außen zugängliche Schnittstelle |

Diese Begriffe helfen beim Lesen von Code und UML. Vererbung wird in diesem Projekt nicht als AP1-Kern vertieft, solange Prüfungskatalog/WBS nichts anderes verlangen.

### 4.5 Fehlerarten

| Fehlerart | Bedeutung | Beispiel |
|---|---|---|
| Syntaxfehler | Sprachregeln verletzt | fehlende Klammer |
| Laufzeitfehler | Fehler während Ausführung | Division durch null |
| Logikfehler | Programm läuft, Ergebnis falsch | Rabatt addiert statt abgezogen |
| Randfallfehler | Sonder-/Grenzfall fehlt | leere Liste, letzter Index |

Ein Compiler oder Interpreter findet nicht automatisch jeden Logikfehler.

### 4.6 Programmiersprache auswählen: Compiler, Interpreter und JIT

Ein **Compiler** übersetzt Quellcode vor der Ausführung in Zielcode. Ein **Interpreter** verarbeitet Anweisungen zur Laufzeit; konkrete Implementierungen können beide Ansätze kombinieren. **JIT-Compilation** übersetzt häufig benötigte Teile während der Laufzeit. Deshalb darf aus „kompiliert“ oder „interpretiert“ allein keine pauschale Aussage über Geschwindigkeit oder Sicherheit abgeleitet werden.

| Kriterium | Prüfungsfrage |
|---|---|
| Problem und Paradigma | prozedural, objektorientiert, funktional oder ereignisgesteuert passend? |
| Zielplattform | Betriebssystem, Browser, Mobile, Embedded oder Cloud unterstützt? |
| Bibliotheken und Schnittstellen | benötigte Frameworks, Treiber und APIs verfügbar? |
| Qualität | Typprüfung, Tests, Debugger, sichere Bibliotheken und Wartbarkeit? |
| Betrieb | Laufzeitumgebung, Deployment, Performance und Ressourcenbedarf? |
| Organisation | Teamkenntnisse, Lizenz, Community, Support und Lebenszyklus? |

Eine gute Prüfungsantwort nennt die Anforderung, wählt danach die Sprache und begründet den Zusammenhang. „Sprache X ist immer schneller“ ist keine belastbare Begründung.

## 5. Schreibtischtest und Modellierung

### 5.1 Vorgehensalgorithmus

1. Eingaben und Anfangswerte notieren.
2. Spalten für alle veränderten Variablen, Bedingung und Ausgabe anlegen.
3. Code exakt in der angegebenen Reihenfolge ausführen.
4. Vor jedem Schleifendurchlauf Bedingung prüfen.
5. Nach jeder Zuweisung den neuen Wert eintragen.
6. Nur tatsächlich ausgeführte Zweige berücksichtigen.
7. Endbedingung und Ausgabe kontrollieren.
8. Ergebnis mit einem Plausibilitätstest prüfen.

### 5.2 Beispiel 1: Summe gerader Zahlen

```text
summe ← 0
FÜR i VON 1 BIS 5
    WENN i MOD 2 = 0
        summe ← summe + i
    ENDE WENN
ENDE FÜR
AUSGABE summe
```

| i | `i MOD 2 = 0` | summe danach |
|---:|---|---:|
| Start | — | 0 |
| 1 | falsch | 0 |
| 2 | wahr | 2 |
| 3 | falsch | 2 |
| 4 | wahr | 6 |
| 5 | falsch | 6 |

Ausgabe: `6`.

### 5.3 Beispiel 2: Anzahl und Maximum

```text
werte ← [7, 3, 9, 9]
maximum ← werte[0]
anzahl ← 0

FÜR jedes x IN werte
    WENN x > maximum
        maximum ← x
    ENDE WENN
    WENN x = maximum
        anzahl ← anzahl + 1
    ENDE WENN
ENDE FÜR
```

Der Code scheint die Häufigkeit des Maximums zu zählen, liefert aber ein falsches Ergebnis: `7` wird zuerst gezählt, obwohl das endgültige Maximum `9` ist. Wenn später ein neues Maximum gefunden wird, müsste `anzahl` zurückgesetzt werden.

Korrektur:

```text
WENN x > maximum
    maximum ← x
    anzahl ← 1
SONST WENN x = maximum
    anzahl ← anzahl + 1
ENDE WENN
```

### 5.4 Grenzwerttest

Für `alter ≥ 18`:

| Testwert | Zweck | Erwartung |
|---:|---|---|
| 17 | direkt unter Grenze | abgelehnt |
| 18 | auf Grenze | akzeptiert |
| 19 | direkt über Grenze | akzeptiert |
| leer/Text | ungültige Eingabe | Validierungsreaktion |

## 6. Prüfungsformulierungen

> Die Schleife wird beendet, sobald `i` den Wert 10 erreicht, da die Bedingung `i < 10` dann nicht mehr erfüllt ist.

> Es liegt ein Logikfehler vor, weil das Programm ausführbar ist, die Anzahl jedoch beim Finden eines neuen Maximums nicht zurückgesetzt wird.

> Die Werte 17, 18 und 19 werden gewählt, damit der Bereich direkt unter, auf und über der Grenze geprüft wird.

> Eine Funktion verbessert die Wiederverwendbarkeit, da die Verarbeitung einmal definiert und mit unterschiedlichen Argumenten aufgerufen werden kann.

## 7. Typische Prüfungsfallen

- Zuweisung und Vergleich verwechseln.
- `AND` und `OR` vertauschen.
- Schleifenobergrenze ohne Hinweis als inklusive oder exklusive annehmen.
- Index `0` vergessen oder einen Index außerhalb der Liste lesen.
- Variable nicht initialisieren oder in jedem Durchlauf versehentlich neu initialisieren.
- Änderung der Schleifenvariable vergessen.
- Integerdivision und Dezimaldivision verwechseln.
- Nur Endwert nennen, ohne nachvollziehbare Tabelle.
- Nicht ausgeführten `else`-Zweig trotzdem berechnen.
- Einen Syntaxfehler nennen, obwohl der Code läuft und nur fachlich falsch rechnet.
- Leere Eingabe, Null und Grenzwerte nicht testen.
- Pseudocode als feste Programmiersprache behandeln.

## 8. Selbsttest

1. Unterscheide Variable, Datentyp und Wert.
2. Was liefert `17 MOD 5`?
3. Wann eignet sich `while` besser als `for`?
4. Was ist der Unterschied zwischen Parameter und Argument?
5. Führe aus: `x ← 3; y ← x * 2; x ← y - 1`. Nenne `x` und `y`.
6. Bestimme die Ausgabe:

```text
summe ← 0
FÜR i VON 0 BIS 3
    summe ← summe + i
ENDE FÜR
AUSGABE summe
```

7. Finde den Fehler:

```text
i ← 1
SOLANGE i ≤ 5
    AUSGABE i
ENDE SOLANGE
```

8. Klassifiziere: Division durch null; falsche Rabattberechnung; fehlende Klammer.
9. Entwirf Pseudocode, der die positiven Zahlen einer Liste zählt.
10. Erstelle Grenztests für `passwortLaenge ≥ 12`.
11. Warum ist eine leere Liste beim Maximum-Algorithmus problematisch?
12. Bewerte: „Wenn der Code kompiliert, ist er korrekt.“

<details>
<summary>Lösungen anzeigen</summary>

1. Variable ist ein benannter Speicherbezug, Datentyp legt mögliche Werte/Operationen fest, Wert ist der aktuelle Inhalt.
2. `2`.
3. Wenn die Anzahl der Durchläufe vorher nicht feststeht und eine Bedingung entscheidet.
4. Parameter steht in der Funktionsdefinition, Argument wird beim Aufruf übergeben.
5. `x = 5`, `y = 6`.
6. `0 + 1 + 2 + 3 = 6`.
7. `i` wird nicht verändert; die Schleife endet nicht. Ergänzung `i ← i + 1`.
8. Laufzeitfehler; Logikfehler; Syntaxfehler.
9. Zähler mit 0 initialisieren, über Elemente iterieren, bei `x > 0` erhöhen, Zähler ausgeben/zurückgeben.
10. 11, 12 und 13 Zeichen sowie leerer/ungültiger Wert.
11. Es existiert kein erstes Element zur Initialisierung; der Fall muss vorher behandelt werden.
12. Falsch: syntaktisch gültiger Code kann Logik-, Randfall- und Sicherheitsfehler enthalten.

</details>

## 9. Quellen und Abgleich

- [BIBB: Fachinformatiker/Fachinformatikerin – Umsetzungshilfe](https://www.bibb.de/dienst/publikationen/de/16661) — berufliche Handlungskompetenzen und Ausbildungsbezug.
- [The Python Language Reference](https://docs.python.org/3/reference/) — Beispiel einer offiziellen Sprachreferenz; die Kapitelnotation bleibt bewusst sprachneutral.
- Abgleich mit der AP1-Themenmatrix und dem Projekt-Schreibstandard; Stand 10.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Welche konkrete Pseudocode-Notation verwendet WBS in Aufgaben?
- Sind obere Schleifengrenzen dort standardmäßig inklusiv oder jeweils angegeben?
- Welche Datentypen und OOP-Begriffe verlangt der aktuelle Prüfungskatalog ausdrücklich?
