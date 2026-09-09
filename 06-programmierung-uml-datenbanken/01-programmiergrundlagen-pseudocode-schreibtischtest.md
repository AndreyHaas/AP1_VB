---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Programmiergrundlagen, Pseudocode und Schreibtischtest

## Grundbegriffe

`Variable`: benannter Speicherwert mit Datentyp.

`Verzweigung`: wählt abhängig von einer Bedingung einen Ablauf (`if/else`).

`Schleife`: wiederholt Anweisungen (`for`, `while`).

`Funktion/Methode`: gekapselte Verarbeitung mit Parametern und möglichem Rückgabewert.

`Klasse`: Bauplan für Objekte.

`Objekt`: konkrete Instanz einer Klasse.

`Attribut`: Zustand/Eigenschaft eines Objekts.

`Methode`: Verhalten eines Objekts.

`Sichtbarkeit`: `public` ist von außen zugänglich; `private` nur innerhalb der Klasse.

Vererbung ist laut aktualisiertem Prüfungskatalog kein AP1-Schwerpunkt. Klassen, Attribute, Objekte, Methoden und Sichtbarkeit bleiben relevant.

## Prozedural und objektorientiert

`prozedural`: Programm wird primär in Prozeduren/Funktionen und Daten gegliedert.

`objektorientiert`: Zustand und Verhalten werden in Objekten gekapselt.

## Pseudocode

Pseudocode zeigt die Logik unabhängig von einer konkreten Programmiersprache.

```text
summe ← 0

FÜR jede zahl IN zahlen
    WENN zahl > 0
        summe ← summe + zahl
    ENDE WENN
ENDE FÜR

AUSGABE summe
```

`Struktogramm` und `Programmablaufplan` gehören nicht mehr zum AP1-Kern; Kontrollstrukturen werden mit Pseudocode oder UML-Aktivitätsdiagramm dargestellt.

## Schreibtischtest

Beim `Schreibtischtest` wird Code manuell Zeile für Zeile mit konkreten Testdaten ausgeführt. Variablenwerte und Ausgaben werden tabellarisch notiert.

Beispiel:

```text
x ← 3
y ← 1

SOLANGE x > 0
    y ← y * 2
    x ← x - 1
ENDE SOLANGE

AUSGABE y
```

| Durchlauf | x vor Bedingung | y nach Multiplikation | x danach |
|---:|---:|---:|---:|
| Start | 3 | 1 | 3 |
| 1 | 3 | 2 | 2 |
| 2 | 2 | 4 | 1 |
| 3 | 1 | 8 | 0 |

Ausgabe: `8`.

## Fehlerarten

```text
Syntaxfehler      → Code verletzt Sprachregeln
Laufzeitfehler    → Fehler während Ausführung, z. B. Division durch null
Logikfehler       → Programm läuft, liefert aber falsches Ergebnis
Randfallfehler    → z. B. leere Liste, Nullwert, Grenzwert nicht berücksichtigt
```

## Testdaten auswählen

Für eine Bedingung `alter >= 18`:

```text
17 → direkt unter Grenze
18 → Grenze
19 → direkt über Grenze
```

Zusätzlich ungültige und leere Eingaben prüfen.

## Selbsttest

Führe einen Schreibtischtest durch:

```text
summe ← 0
FÜR i VON 1 BIS 4
    WENN i MOD 2 = 0
        summe ← summe + i
    ENDE WENN
ENDE FÜR
AUSGABE summe
```

## Lösungen

```text
i=1 → summe 0
i=2 → summe 2
i=3 → summe 2
i=4 → summe 6
Ausgabe: 6
```

## Offene Punkte / Korrekturen

- Separate Sammlung realer AP1-Codefehler erstellen.
