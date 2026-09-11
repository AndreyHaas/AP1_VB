---
pruefung: AP1
thema: Zahlensysteme, Zeichencodierung, Prüfziffern und Parität
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Deutsch
gegenstueck: ../ru/03-zahlensysteme-zeichencodierung-pruefziffern-und-paritaet-ru.md
---

# Zahlensysteme, Zeichencodierung, Prüfziffern und Parität

## 1. Lernziele

Du kannst:

- Dual-, Oktal-, Dezimal- und Hexadezimalsystem erklären;
- ganze Zahlen sicher zwischen den vier Zahlensystemen umrechnen;
- Stellenwertverfahren, wiederholte Division und Bitgruppierung anwenden;
- ASCII, Unicode, Codepoint und UTF-8 unterscheiden;
- UTF-8-Bytefolgen einfacher Zeichen zuordnen;
- Paritätsbit und Prüfziffer berechnen und deren Grenzen bewerten.

## 2. Prüfungsminimum — 15 Minuten

1. Basis 2: `0–1`; Basis 8: `0–7`; Basis 10: `0–9`; Basis 16: `0–9, A–F`.
2. Stellenwert: Ziffer mal Basis hoch Position, von rechts beginnend mit Position 0.
3. Dezimal in eine andere Basis: wiederholt durch die Basis dividieren, Reste von unten nach oben lesen.
4. Dual↔Oktal: Bits von rechts in Dreiergruppen; Dual↔Hex: in Vierergruppen.
5. `45₁₀ = 101101₂ = 55₈ = 2D₁₆`.
6. ASCII ist eine 7-Bit-Zeichencodierung mit 128 Codepositionen.
7. Unicode ordnet Zeichen abstrakte Codepoints wie `U+20AC` zu; UTF-8 codiert sie als 1 bis 4 Bytes.
8. ASCII-Zeichen haben in UTF-8 dieselben Bytewerte von `00` bis `7F`.
9. Parität erkennt alle Fehler mit ungerader Anzahl gekippter Bits, aber nicht jeden Mehrbitfehler.
10. Eine Prüfziffer erkennt Fehler nach ihrem Algorithmus; sie beweist weder Echtheit noch Manipulationsfreiheit.

## 3. Zahlensysteme und Stellenwert

| System | Basis | Ziffern | typische Verwendung |
|---|---:|---|---|
| Dual | 2 | 0, 1 | Bits, Masken |
| Oktal | 8 | 0–7 | Unix-Rechte, kompakte Bitgruppen |
| Dezimal | 10 | 0–9 | Alltag und kaufmännische Werte |
| Hexadezimal | 16 | 0–9, A–F | Bytes, Adressen, Farben |

Beispiel `2D₁₆`:

```text
2 × 16¹ + 13 × 16⁰ = 32 + 13 = 45₁₀
```

Beispiel `101101₂`:

```text
1×2⁵ + 0×2⁴ + 1×2³ + 1×2² + 0×2¹ + 1×2⁰
= 32 + 8 + 4 + 1 = 45₁₀
```

## 4. Umrechnungsverfahren

### 4.1 Dezimal in eine Zielbasis

```text
45 : 2 = 22 Rest 1
22 : 2 = 11 Rest 0
11 : 2 =  5 Rest 1
 5 : 2 =  2 Rest 1
 2 : 2 =  1 Rest 0
 1 : 2 =  0 Rest 1
```

Reste von unten nach oben: `101101₂`.

### 4.2 Dual, Oktal und Hex durch Gruppierung

```text
Dual:  0010 1101 = 2D₁₆
Dual:  101 101   = 55₈
```

Links darf mit Nullen aufgefüllt werden. Eine Hexziffer entspricht vier Bits, eine Oktalziffer drei Bits.

### 4.3 Plausibilitätsprüfung

- letzte Dualziffer 0 bedeutet gerade Zahl;
- `n` Bits ohne Vorzeichen stellen `0` bis `2ⁿ−1` dar;
- zwei Hexziffern stellen ein Byte von `00` bis `FF` dar;
- Rückumrechnung muss den Ausgangswert liefern.

## 5. ASCII, Unicode und UTF-8

`Zeichensatz` beschreibt, welche Zeichen vorhanden sind. `Codepoint` ist die eindeutige Unicode-Nummer eines Zeichens. Eine `Zeichenkodierung` legt fest, wie diese Nummer als Bytes gespeichert oder übertragen wird.

| Zeichen | Unicode-Codepoint | UTF-8 hex | Bytes |
|---|---|---|---:|
| A | U+0041 | 41 | 1 |
| ä | U+00E4 | C3 A4 | 2 |
| € | U+20AC | E2 82 AC | 3 |
| 😀 | U+1F600 | F0 9F 98 80 | 4 |

UTF-8 ist selbstsynchronisierend und ASCII-kompatibel. Die Zahl der sichtbaren Zeichen ist nicht immer gleich der Zahl der Codepoints oder Bytes: kombinierende Zeichen und Emoji-Sequenzen sind mögliche Gegenbeispiele.

## 6. Prüfziffern, Parität und Anwendungsfall

### 6.1 Gerade und ungerade Parität

Bei gerader Parität wird das Paritätsbit so gewählt, dass die Gesamtzahl der Einsen gerade ist.

```text
Daten: 1011001 → vier Einsen → Paritätsbit 0
```

Bei ungerader Parität wäre das Paritätsbit `1`. Ein einzelner Bitfehler fällt auf. Kippen zwei Bits, kann die Parität unverändert bleiben. Parität lokalisiert oder korrigiert den Fehler nicht.

### 6.2 Gewichtete Modulo-10-Prüfziffer am EAN-13-Beispiel

Für die ersten zwölf Ziffern werden Positionen von links abwechselnd mit 1 und 3 gewichtet. Die Prüfziffer ergänzt die Summe zum nächsten Vielfachen von 10.

```text
Nutzteil: 400638133393
ungerade Positionen: 4+0+3+1+3+9 = 20
gerade Positionen:   (0+6+8+3+3+3)×3 = 69
Summe = 89
Prüfziffer = (10 − 89 mod 10) mod 10 = 1
EAN-13 = 4006381333931
```

Andere Kennnummern können andere Gewichte und Moduli nutzen. Der Algorithmus muss aus der Aufgabe oder Spezifikation stammen.

### 6.3 QR-Code, Barcode, RFID und NFC

Ein **Barcode** codiert Daten meist eindimensional in Strichen. Ein **QR-Code** ist ein zweidimensionaler Matrixcode und kann beispielsweise eine Kennung, Text oder eine URL enthalten. Seine Fehlerkorrektur kann begrenzte Verschmutzung oder Beschädigung ausgleichen; sie beweist weder, dass der Inhalt wahr ist, noch ersetzt sie eine kryptografische Signatur oder Prüfziffer.

Bei QR-Aufgaben zuerst Nutzinhalt und Einsatzzweck bestimmen, dann Lesbarkeit, Größe, Kontrast, Fehlerkorrektur und Sicherheitsrisiko bewerten. Vor dem Öffnen eines Links müssen Domain und Ziel geprüft werden.

**RFID** überträgt eine Kennung zwischen Tag und Lesegerät per Funk. **NFC** ist eine RFID-nahe Technik für sehr kurze Distanzen. Beide sind keine optischen Codes; Reichweite, Energieversorgung, Schreibbarkeit und Schutz gegen unbefugtes Auslesen hängen vom konkreten System ab.

## 7. Prüfungsformulierungen und typische Fallen

> Die Dezimalzahl 45 entspricht `2D` im Hexadezimalsystem, da `2 × 16 + 13 = 45` gilt.

> Unicode ordnet dem Eurozeichen den Codepoint U+20AC zu, während UTF-8 diesen Codepoint mit der Bytefolge E2 82 AC codiert.

> Die Paritätsprüfung erkennt den doppelten Bitfehler nicht sicher, weil sich die Anzahl der Einsen wieder um eine gerade Zahl ändern kann.

Typische Fallen:

- Basis oder Index der Ergebniszahl nicht angeben;
- Hexziffern `A–F` als Dezimalziffern lesen;
- Divisionsreste von oben nach unten lesen;
- Vierer- und Dreiergruppen von links statt vom niederwertigen rechten Ende bilden;
- Zeichen, Codepoint, Glyph und Byte verwechseln;
- UTF-8 pauschal als Ein-Byte-Code bezeichnen;
- Prüfziffer mit kryptografischer Integritätsprüfung gleichsetzen.

## 8. Selbsttest

1. Rechne `156₁₀` in Dual, Oktal und Hexadezimal um.
2. Rechne `11010110₂` in Dezimal und Hexadezimal um.
3. Erkläre den Unterschied zwischen Unicode und UTF-8.
4. Wie viele Bytes belegt `A€` in UTF-8?
5. Ergänze `1100101` für gerade Parität.
6. Bewerte, ob eine EAN-Prüfziffer absichtliche Manipulation verhindert.
7. Weshalb ist die Fehlerkorrektur eines QR-Codes kein Echtheitsnachweis?
8. Grenze QR-Code, RFID und NFC nach Übertragungsweg und typischer Distanz ab.

<details>
<summary>Lösungen anzeigen</summary>

1. `156₁₀ = 10011100₂ = 234₈ = 9C₁₆`.
2. `11010110₂ = 214₁₀ = D6₁₆`.
3. Unicode definiert unter anderem Codepoints; UTF-8 ist eine konkrete variable Bytecodierung dieser Codepoints.
4. `A` ein Byte, `€` drei Bytes, zusammen vier Bytes.
5. Vier Einsen sind bereits gerade, daher Paritätsbit `0`.
6. Nein. Sie erkennt bestimmte Eingabe- oder Übertragungsfehler, ist aber nicht geheim und nicht kryptografisch geschützt.
7. Sie rekonstruiert nur begrenzt beschädigte Codeelemente; Herkunft und Wahrheitsgehalt des Nutzinhalts werden dadurch nicht geprüft.
8. QR wird optisch gelesen. RFID nutzt Funk zwischen Tag und Leser; NFC arbeitet ebenfalls per Funk, typischerweise über sehr kurze Distanz.

</details>

## 9. Quellen und Abgleich

- Unicode Consortium: The Unicode Standard und UTF-8 FAQ.
- RFC 3629: UTF-8, a transformation format of ISO 10646.
- GS1 General Specifications für GTIN/EAN-Prüfziffern.
- WBS-Kursinhalt: Dual, Dezimal, Oktal, Hexadezimal, ASCII, Unicode, UTF-8, Prüfziffern und Parität; bestätigt am 11.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Werden negative Dualzahlen und Zweierkomplement in AP1 verlangt?
- Welche Prüfziffernverfahren außer EAN/GTIN wurden bei WBS geübt?
- Muss UTF-8 binär aus einem Codepoint konstruiert werden oder genügt die Begriffstrennung?
