---
pruefung: AP1
thema: Multimedia, Sampling, Kompression, Raster, Vektor und Video
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Deutsch
gegenstueck: ../ru/04-multimedia-sampling-kompression-grafik-und-video-ru.md
---

# Multimedia, Sampling, Kompression, Raster, Vektor und Video

## 1. Lernziele

Du kannst:

- analoge und digitale Signale unterscheiden;
- Abtastrate, Auflösung, Farbtiefe, Bildrate und Bitrate erklären;
- unkomprimierte Bild- und Audiodaten berechnen;
- verlustfreie und verlustbehaftete Kompression passend auswählen;
- Raster- und Vektorgrafik bewerten;
- Kameraanforderungen in messbare Kriterien übersetzen;
- Netzwerk- und Speicherbedarf einer Videoaufzeichnung abschätzen.

## 2. Prüfungsminimum — 15 Minuten

1. Sampling misst ein analoges Signal in diskreten Zeitabständen.
2. Abtastrate in Hz = Messwerte je Sekunde; Bittiefe = mögliche Stufen je Messwert.
3. Idealisiert gilt nach dem Abtasttheorem: Abtastrate größer als das Doppelte der höchsten Signalfrequenz.
4. Rastergrafik besteht aus Pixeln; Vektorgrafik aus mathematisch beschriebenen Objekten.
5. Unkomprimiertes Bild: `Breite × Höhe × Farbtiefe`.
6. Unkomprimiertes Audio: `Abtastrate × Bittiefe × Kanäle × Zeit`.
7. Videodaten bei gegebener Bitrate: `Bitrate × Zeit`; für Bytes durch 8 teilen.
8. Verlustfrei: Original vollständig rekonstruierbar; verlustbehaftet: irrelevante oder weniger wichtige Information wird verworfen.
9. `Codec` codiert/decodiert; `Container` bündelt Streams und Metadaten.
10. Eine Kamera wird nicht nur nach „Megapixeln“, sondern nach Zweck, Bildrate, Licht, Optik, Netz, Speicher, Montage und Datenschutz gewählt.

## 3. Digitalisierung und Sampling

Ein analoges Signal ist zeit- und wertkontinuierlich. Bei der Digitalisierung erfolgen:

1. `Abtastung`: Messung in Zeitabständen;
2. `Quantisierung`: Zuordnung zu diskreten Wertestufen;
3. `Codierung`: Darstellung der Stufen als Bits.

Bei `16 bit` stehen theoretisch `2¹⁶ = 65 536` Quantisierungsstufen zur Verfügung. Eine höhere Abtastrate verbessert die zeitliche Auflösung; eine höhere Bittiefe verbessert die Wertauflösung. Beide erhöhen die Datenmenge.

`Aliasing` entsteht, wenn hohe Frequenzanteile als falsche niedrigere Frequenzen erscheinen. In realen Systemen werden ausreichende Abtastrate und ein Anti-Aliasing-Filter verwendet.

## 4. Raster, Vektor und Kompression

| Merkmal | Rastergrafik | Vektorgrafik |
|---|---|---|
| Aufbau | Pixelraster | Pfade, Kurven, Flächen |
| Skalierung | Vergrößerung kann pixelig werden | verlustfrei skalierbar |
| geeignet | Fotos, komplexe Farbverläufe | Logos, Symbole, technische Zeichnung |
| typische Formate | PNG, JPEG, WebP | SVG, AI, EPS |

Ein Dateiformat ist nicht automatisch immer verlustfrei oder verlustbehaftet; die konkrete Codierung und Einstellung sind entscheidend. JPEG ist typischerweise verlustbehaftet, PNG verlustfrei. SVG beschreibt Vektorobjekte, kann aber Rasterbilder einbetten.

### Kompressionsarten

- `verlustfrei`: ZIP, PNG oder FLAC ermöglichen die Rekonstruktion des Originals;
- `verlustbehaftet`: JPEG, AAC oder viele Videocodecs reduzieren Daten durch Informationsverlust;
- `intraframe`: Kompression innerhalb eines Einzelbilds;
- `interframe`: nutzt Ähnlichkeiten zwischen aufeinanderfolgenden Bildern.

## 5. Rechenmodelle

### 5.1 Bilddatei unkomprimiert

```text
3 840 × 2 160 Pixel × 24 bit/Pixel
= 199 065 600 bit
= 24 883 200 Byte
≈ 24,88 MB ≈ 23,73 MiB
```

Dateikopf, Metadaten und Zeilenauffüllung können hinzukommen.

### 5.2 Audio unkomprimiert

Stereo, 48 kHz, 16 bit, 60 Sekunden:

```text
48 000 1/s × 16 bit × 2 × 60 s
= 92 160 000 bit
= 11 520 000 Byte = 11,52 MB
```

### 5.3 Kompressionsrate

```text
Kompressionsfaktor = Größe unkomprimiert / Größe komprimiert
Ersparnis in % = (1 − komprimiert / unkomprimiert) × 100
```

Von 80 MB auf 20 MB: Faktor `4:1`, Ersparnis `75 %`.

## 6. Videokamera-Anwendungsfall

Für eine IP-Kamera müssen Anforderungen messbar formuliert werden:

| Parameter | Bedeutung und Prüffrage |
|---|---|
| Auflösung | Reicht die Pixelzahl für den Erkennungszweck? |
| Bildrate | Wie viele Bilder pro Sekunde sind für Bewegungen nötig? |
| Belichtungszeit | Werden schnelle Objekte scharf erfasst? |
| Sensor/Lichtempfindlichkeit | Funktioniert die Kamera bei wenig Licht und Gegenlicht? |
| Objektiv/Brennweite | Welche Blickwinkel und Entfernungen werden abgedeckt? |
| Codec und Bitrate | Welche Qualität, Bandbreite und Speicherlast entstehen? |
| Farbtiefe/Dynamikumfang | Sind helle und dunkle Bereiche unterscheidbar? |
| Schnittstelle | Ethernet, WLAN, USB oder proprietäre Verbindung? |
| Versorgung | PoE-Klasse, Netzteil, USV-Bedarf? |
| Umgebung | Schutzart, Betriebstemperatur, Feuchte, Heizung, Montage? |
| Datenschutz | Zweck, Rechtsgrundlage, Bereich, Speicherdauer, Zugriff? |

`Hz` bezeichnet Ereignisse je Sekunde. Bei Video wird die Aufnahme meist in `fps` angegeben; 25 fps bedeuten 25 Bilder pro Sekunde. Monitorfrequenz und Kamerabildrate sind verschiedene Größen, auch wenn beide zeitliche Frequenzen beschreiben.

### Außenkamera mit Gehäuseheizung

Eine für Innenräume geeignete Kamera wird nicht allein durch ein Dach zur Außenkamera. Zu prüfen sind mindestens:

- zulässiger Betriebstemperaturbereich von Kamera und Gehäuse;
- IP-Schutzart gegen Berührung, Fremdkörper und Wasser;
- Heizung, Thermostat und Maßnahmen gegen Kondensation oder Vereisung;
- gesamte Leistungsaufnahme im ungünstigsten Zustand;
- verfügbare PoE-Klasse oder Dimensionierung des Netzteils;
- UV-, Korrosions-, Wind- und Schlagfestigkeit entsprechend dem Einsatzort;
- abgedichtete Kabelzuführung und fachgerechter Potential-/Überspannungsschutz.

Beispiel: Kamera `9 W`, Heizung `18 W`, Reserve `20 %`:

```text
P_plan = (9 W + 18 W) × 1,20 = 32,4 W
```

Ein PoE-Port mit nur 15,4 W maximaler Ausgangsleistung reicht nicht. Entscheidend sind die tatsächlich am Endgerät verfügbare Leistung, Leitungslänge und Herstellerfreigabe. Die Heizung kann temperaturgesteuert sein; für die Auslegung zählt trotzdem der gleichzeitige Maximalfall.

### Speicher- und Bandbreitenrechnung

Vier Kameras senden je `6 Mbit/s`, täglich 12 Stunden, Aufbewahrung sieben Tage:

```text
Gesamtbitrate = 4 × 6 Mbit/s = 24 Mbit/s
Daten = 24 Mbit/s × 12 × 3 600 s × 7
= 7 257 600 Mbit
= 907 200 MB = 907,2 GB dezimal
```

Für die Planung kommen Protokolloverhead, variable Bitrate, Reserven, Dateisystem und Redundanz hinzu. Ein Praxistest mit repräsentativen Szenen ist belastbarer als ein theoretischer Maximalwert allein.

## 7. Prüfungsformulierungen und typische Fallen

> Die Vektorgrafik ist für das Logo geeignet, da sie ohne sichtbare Pixelbildung auf unterschiedliche Ausgabegrößen skaliert werden kann.

> Die höhere Bildrate verbessert die zeitliche Auflösung bewegter Szenen, erhöht bei sonst gleichen Parametern jedoch typischerweise Bandbreite und Speicherbedarf.

> Die Kamera wird über PoE versorgt, sofern Switch, Port, Kabel und Kamera die erforderliche Leistungsklasse unterstützen.

Typische Fallen:

- Pixelzahl, Bildrate, Abtastrate und Bitrate verwechseln;
- bit und Byte nicht umrechnen;
- Kanalzahl oder Aufnahmedauer vergessen;
- mit kB/MB rechnen, aber KiB/MiB ausgeben;
- Kompressionsfaktor und prozentuale Ersparnis gleichsetzen;
- Container und Codec verwechseln;
- Kamera nur nach Auflösung auswählen;
- Datenschutz und Aufbewahrungsdauer bei Videoüberwachung ignorieren.

## 8. Selbsttest

1. Grenze Abtastrate und Bittiefe ab.
2. Berechne die Größe eines unkomprimierten Bildes mit 1 920 × 1 080 Pixeln und 24 bit.
3. Berechne 30 Sekunden Mono-Audio bei 44,1 kHz und 16 bit.
4. Eine Datei schrumpft von 50 MB auf 10 MB. Bestimme Faktor und Ersparnis.
5. Nenne fünf Kriterien für eine Außenkamera.
6. Begründe Raster oder Vektor für ein Firmenlogo und ein Foto.

<details>
<summary>Lösungen anzeigen</summary>

1. Abtastrate ist die Zahl zeitlicher Messungen je Sekunde; Bittiefe bestimmt die Zahl der Wertestufen je Messung.
2. `1 920×1 080×24/8 = 6 220 800 Byte = 6,2208 MB` ohne Overhead.
3. `44 100×16×1×30/8 = 2 646 000 Byte = 2,646 MB`.
4. Faktor `5:1`, Ersparnis `80 %`.
5. Zum Beispiel Auflösung, Bildrate, Lichtempfindlichkeit, Objektiv, Schutzart, Temperatur, Bitrate, PoE und Datenschutz.
6. Logo: Vektor wegen Skalierung; Foto: Raster wegen komplexer Pixel- und Farbdetails.

</details>

## 9. Quellen und Abgleich

- ITU-T und ISO/IEC: Grundprinzipien digitaler Audio-/Videocodierung; Detailstandards bei Bedarf nachschlagen.
- W3C: SVG 2 und Web-Bildformate.
- BIBB-Umsetzungshilfe und WBS-Aufgaben zu Multimedia und Bilddateien.
- WBS-Kursinhalt Multimedia, Sampling, Kompression, Raster/Vektor und Videokamera; bestätigt am 11.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Welche konkreten Kameraangaben standen in der früheren AP1-Aufgabe?
- Welche Heizung, Schutzart, Mindesttemperatur und PoE-Leistung waren in der früheren Aufgabe angegeben?
- Werden Audio- und Videodaten mit vorgegebener Bitrate oder aus Rohparametern berechnet?
