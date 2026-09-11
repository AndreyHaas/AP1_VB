---
pruefung: AP1
thema: Einheiten, Datenmenge, Übertragungszeit und Bilddateien
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Deutsch
gegenstueck: ../ru/01-einheiten-datenmenge-uebertragungszeit-und-bilddateien-ru.md
---

# Einheiten, Datenmenge, Übertragungszeit und Bilddateien

## 1. Lernziele

Du kannst:

- bit und Byte sicher unterscheiden;
- dezimale und binäre Präfixe korrekt verwenden;
- Datenmenge, Datenrate und Zeit in kompatible Einheiten umrechnen;
- ideale und effektive Übertragungsdauer berechnen;
- Wirkungsgrad und vorgegebenen Overhead berücksichtigen;
- Datenrate oder übertragbare Datenmenge aus den übrigen Größen bestimmen;
- unkomprimierte Rasterbilder aus Auflösung und Farbtiefe berechnen;
- Reduzierung `um` und Reduzierung `auf` einen Prozentsatz unterscheiden;
- Zwischenergebnisse mit Einheiten dokumentieren und plausibilisieren;
- gemischte Transfer- und Bildaufgaben systematisch lösen.

## 2. Prüfungsminimum — 15 Minuten

1. `1 Byte = 8 bit`; `B` und `b` nicht verwechseln.
2. Dezimal: `1 MB = 1 000 000 B`; binär: `1 MiB = 1 048 576 B`.
3. Datenraten werden meist in `Mbit/s` oder `Gbit/s`, Dateigrößen meist in `MB` oder `GB` angegeben.
4. `Übertragungszeit = Datenmenge / Nutzdatenrate`.
5. Vor dem Teilen müssen Zähler und Nenner kompatible Einheiten besitzen.
6. `Nutzdatenrate = Bruttodatenrate × Wirkungsgrad`.
7. `um 20 % reduziert` bedeutet 80 % verbleiben; `auf 20 % reduziert` bedeutet 20 % verbleiben.
8. `Bildgröße in bit = Breite × Höhe × Farbtiefe je Pixel`.
9. Dateiheader, Metadaten und Kompression nur berücksichtigen, wenn die Aufgabe sie vorgibt.
10. Ein Ergebnis braucht Einheit, sinnvolle Rundung und Plausibilitätsprüfung.

> Vor der Berechnung werden Datenmenge und Datenübertragungsrate in zueinander passende Einheiten umgerechnet.

## 3. Einheiten und Grundformeln

### 3.1 bit, Byte und Präfixe

| Einheit | Wert |
|---|---:|
| 1 Byte | 8 bit |
| 1 kB | 1 000 B |
| 1 MB | 1 000 kB = 1 000 000 B |
| 1 GB | 1 000 MB = 1 000 000 000 B |
| 1 KiB | 1 024 B |
| 1 MiB | 1 024 KiB = 1 048 576 B |
| 1 GiB | 1 024 MiB = 1 073 741 824 B |

Die Aufgabenangabe entscheidet über das Einheitensystem. `GB` darf nicht stillschweigend wie `GiB` behandelt werden.

### 3.2 Dreieck der Übertragung

```text
Datenmenge D = Datenrate R × Zeit t
Datenrate R  = Datenmenge D / Zeit t
Zeit t       = Datenmenge D / Datenrate R
```

Einheitenprobe:

```text
MB / (MB/s) = s
Mbit / (Mbit/s) = s
```

### 3.3 Häufige Umrechnungen

```text
400 Mbit/s / 8 = 50 MB/s
25 MB/s × 8 = 200 Mbit/s
2,5 Gbit/s = 2 500 Mbit/s
120 s = 2 min
2 min 30 s = 150 s
```

## 4. Wirkungsgrad, Overhead und Bilddaten

### 4.1 Brutto und netto

Die Bruttodatenrate enthält nicht automatisch nur Nutzdaten. Ist ein Wirkungsgrad vorgegeben:

```text
R_nutz = R_brutto × η
t = D / R_nutz
```

Bei 20 % vorgegebenem Overhead verbleiben in einer vereinfachten Aufgabe 80 %:

```text
η = 1 − 0,20 = 0,80
```

Keinen eigenen pauschalen Overhead erfinden, wenn die Aufgabe eine ideale Übertragung verlangt.

### 4.2 Unkomprimiertes Rasterbild

```text
Pixelanzahl = Breite × Höhe
Datengröße_bit = Pixelanzahl × Farbtiefe_bit/Pixel
Datengröße_Byte = Datengröße_bit / 8
```

Die Farbtiefe gilt pro Pixel. Bei `24 bit/Pixel` kann direkt mit `3 Byte/Pixel` gerechnet werden.

### 4.3 Kompression und Reduktion

```text
um x % reduziert: Restfaktor = 1 − x/100
auf x % reduziert: Restfaktor = x/100
neue Größe = alte Größe × Restfaktor
```

Eine Kompressionsrate ist in Aufgaben nicht immer gleich definiert. Deshalb die im Text angegebene Definition verwenden.

### 4.4 Vereinfachte Videoabschätzung

Wenn keine Audio-, Header- oder Kompressionsdaten angegeben sind:

```text
Videogröße = Bildgröße je Frame × Frames/s × Laufzeit
```

Dies ist eine unkomprimierte Modellrechnung, keine realistische Codec-Prognose.

## 5. Anwendungsfälle und vollständige Rechnungen

### 5.1 Dateiübertragung mit Wirkungsgrad

Eine Datei mit `18 GB` wird über `600 Mbit/s` übertragen. Der vorgegebene Wirkungsgrad beträgt `75 %`.

```text
R_nutz = 600 Mbit/s × 0,75 = 450 Mbit/s
R_nutz = 450 / 8 = 56,25 MB/s
D = 18 GB = 18 000 MB
t = 18 000 MB / 56,25 MB/s = 320 s
320 s = 5 min 20 s
```

Plausibilität: Ideal wären `600/8 = 75 MB/s` und damit 240 s. Mit geringerem Wirkungsgrad muss das Ergebnis länger sein.

### 5.2 Unkomprimiertes Bild und Reduktion

Ein Bild hat `3 840 × 2 160 Pixel` und `24 bit/Pixel`.

```text
Pixel = 3 840 × 2 160 = 8 294 400
Größe = 8 294 400 × 24 bit = 199 065 600 bit
Größe = 199 065 600 / 8 = 24 883 200 B
Größe = 24,8832 MB
```

Die Datei wird `um 70 %` reduziert:

```text
Restfaktor = 0,30
neue Größe = 24,8832 MB × 0,30 = 7,46496 MB ≈ 7,46 MB
```

### 5.3 Gesuchte Mindestdatenrate

`4,5 GB` sollen ideal in höchstens `3 min` übertragen werden.

```text
D = 4,5 GB = 36 Gbit
t = 3 min = 180 s
R = 36 Gbit / 180 s = 0,2 Gbit/s = 200 Mbit/s
```

Das ist die mathematische Nutzdatenrate. Für eine reale Anschlusswahl wären Overhead und Reserve zusätzlich zu berücksichtigen.

## 6. Prüfungsformulierungen

> Die Nutzdatenrate beträgt 450 Mbit/s, da die Bruttodatenrate mit dem vorgegebenen Wirkungsgrad von 75 Prozent multipliziert wird.

> Die Übertragung dauert 320 Sekunden beziehungsweise 5 Minuten und 20 Sekunden, nachdem Datenmenge und Datenrate in kompatible Einheiten umgerechnet wurden.

> Nach einer Reduzierung um 70 Prozent verbleiben 30 Prozent der ursprünglichen Bildgröße.

> Die berechnete Mindestdatenrate ist ein Nutzdatenwert; für die Auswahl einer realen Verbindung sind Protokollanteile und Reserve zu berücksichtigen.

## 7. Typische Prüfungsfallen

- `b` und `B` verwechseln.
- Mbit/s direkt durch MB teilen.
- GB und GiB ohne Vorgabe mischen.
- Minuten nicht in Sekunden umrechnen.
- Wirkungsgrad als 75 statt 0,75 einsetzen.
- Overhead abziehen und danach zusätzlich durch einen Wirkungsgrad teilen.
- `um` und `auf` verwechseln.
- Farbtiefe einmal statt je Pixel verwenden.
- bei 24 bit/Pixel die Division durch 8 vergessen.
- Metadaten oder Kompression ohne Aufgabenangabe schätzen.
- Zwischenwerte zu früh runden.
- ein Ergebnis ohne Einheit oder Zeitraum angeben.

## 8. Selbsttest

1. Wie viele bit enthält ein Byte?
2. Grenze MB und MiB ab.
3. Wandle 320 Mbit/s in MB/s um.
4. Eine Datei mit 12 GB wird ideal mit 400 Mbit/s übertragen. Berechne die Zeit.
5. Berechne die Nutzdatenrate bei 1 Gbit/s und 82 % Wirkungsgrad.
6. Wie lange dauern 10 GB bei dieser Nutzdatenrate?
7. Berechne die Größe eines Bildes mit 1 920 × 1 080 Pixel und 32 bit/Pixel in MB.
8. Dieses Bild wird um 60 % reduziert. Wie groß ist es danach?
9. Erkläre den Unterschied zwischen `um 25 %` und `auf 25 %`.
10. Welche Nutzdatenrate braucht 9 GB in 6 Minuten?
11. Warum ist die unkomprimierte Videorechnung nur ein Modell?
12. Nenne drei Plausibilitätsprüfungen.

<details>
<summary>Lösungen anzeigen</summary>

1. 8 bit.
2. MB ist dezimal mit 1 000 000 B; MiB ist binär mit 1 048 576 B.
3. `320 / 8 = 40 MB/s`.
4. `12 000 MB / 50 MB/s = 240 s = 4 min`.
5. `1 000 × 0,82 = 820 Mbit/s = 102,5 MB/s`.
6. `10 000 / 102,5 ≈ 97,56 s ≈ 1 min 37,56 s`.
7. `1 920 × 1 080 × 32 / 8 = 8 294 400 B = 8,2944 MB`.
8. `8,2944 × 0,40 = 3,31776 MB ≈ 3,32 MB`.
9. 75 % verbleiben; 25 % verbleiben.
10. `9 GB = 72 Gbit`; `6 min = 360 s`; `72/360 = 0,2 Gbit/s = 200 Mbit/s`.
11. Reale Codecs, variable Bitraten, Audio, Metadaten und Container fehlen.
12. Einheitenprobe, Größenordnung, Vergleich mit Ideal-/Grenzwert; andere sinnvolle Prüfungen zählen.

</details>

## 9. Quellen und Abgleich

- [BIPM — SI Brochure](https://www.bipm.org/en/publications/si-brochure) — SI-Präfixe und Einheitenregeln.
- [IEC — Prefixes for binary multiples](https://www.iec.ch/prefixes-binary-multiples) — Ki, Mi und Gi für Zweierpotenzen.
- [FIAusbV § 9](https://www.gesetze-im-internet.de/fiausbv/__9.html) — praktische Auswahl, Einrichtung, Test und Leistungskontrolle im AP1-Kontext.

## 10. Offene Prüfpunkte für den Unterricht

- Welche Rundungsregel verlangt WBS bei Übertragungszeiten?
- Werden dezimale Einheiten angenommen, wenn eine Aufgabe nur `MB/GB` nennt?
- Welche Video- und Kompressionsmodelle stehen im aktuellen Prüfungskatalog?
