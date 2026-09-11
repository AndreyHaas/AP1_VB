---
pruefung: AP1
thema: Multimedia, Sampling, Kompression, Raster, Vektor und Video
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/04-multimedia-sampling-kompression-grafik-und-video-de.md
---

# Multimedia, Sampling, Kompression, Raster, Vektor und Video

## 1. Lernziele

После изучения главы нужно уметь:

- различать analoge и digitale Signale;
- объяснять Abtastrate, Auflösung, Farbtiefe, Bildrate и Bitrate;
- рассчитывать несжатые Bild- и Audiodaten;
- выбирать verlustfreie или verlustbehaftete Kompression;
- сравнивать Raster- и Vektorgrafik;
- переводить требования к Kamera в измеримые критерии;
- оценивать Netzwerk- и Speicherbedarf видеозаписи.

## 2. Prüfungsminimum — 15 Minuten

1. Sampling измеряет аналоговый сигнал через дискретные интервалы времени.
2. Abtastrate в Hz = измерений в секунду; Bittiefe = число возможных уровней одного измерения.
3. В идеализированном виде Abtasttheorem требует частоту дискретизации выше удвоенной максимальной частоты сигнала.
4. Rastergrafik состоит из Pixel; Vektorgrafik — из математически описанных объектов.
5. Несжатое изображение: `Breite × Höhe × Farbtiefe`.
6. Несжатое аудио: `Abtastrate × Bittiefe × Kanäle × Zeit`.
7. Видео при заданной Bitrate: `Bitrate × Zeit`; для Bytes разделить на 8.
8. Verlustfrei: оригинал восстанавливается полностью; verlustbehaftet: часть информации отбрасывается.
9. `Codec` кодирует/декодирует; `Container` объединяет Streams и Metadaten.
10. Kamera выбирают не только по Megapixel, но и по задаче, Bildrate, Licht, Optik, Netz, Speicher, Montage и Datenschutz.

## 3. Digitalisierung и Sampling

Аналоговый сигнал непрерывен по времени и значению. Digitalisierung включает:

1. `Abtastung`: измерение через интервалы;
2. `Quantisierung`: отнесение к дискретному уровню;
3. `Codierung`: представление уровня битами.

При `16 bit` теоретически доступны `2¹⁶ = 65 536` Quantisierungsstufen. Более высокая Abtastrate улучшает временное разрешение, более высокая Bittiefe — разрешение значения. Обе увеличивают Datenmenge.

`Aliasing` означает, что высокие частоты отображаются ложными низкими. На практике используют достаточную Abtastrate и Anti-Aliasing-Filter.

## 4. Raster, Vektor и Kompression

| Merkmal | Rastergrafik | Vektorgrafik |
|---|---|---|
| Aufbau | Pixelraster | Pfade, Kurven, Flächen |
| Skalierung | увеличение даёт пикселизацию | масштабируется без потери |
| geeignet | Fotos, сложные Farbverläufe | Logos, Symbole, чертежи |
| typische Formate | PNG, JPEG, WebP | SVG, AI, EPS |

Формат не всегда автоматически определяет конкретный режим сжатия. JPEG обычно verlustbehaftet, PNG verlustfrei. SVG описывает векторные объекты, но может встраивать Rasterbilder.

### Kompressionsarten

- `verlustfrei`: ZIP, PNG, FLAC позволяют восстановить оригинал;
- `verlustbehaftet`: JPEG, AAC и многие Videocodecs уменьшают данные с потерями;
- `intraframe`: сжатие внутри одного кадра;
- `interframe`: использует сходство последовательных кадров.

## 5. Rechenmodelle

### 5.1 Bilddatei unkomprimiert

```text
3 840 × 2 160 Pixel × 24 bit/Pixel
= 199 065 600 bit
= 24 883 200 Byte
≈ 24,88 MB ≈ 23,73 MiB
```

Dateikopf, Metadaten и Zeilenauffüllung могут увеличить размер.

### 5.2 Audio unkomprimiert

Stereo, 48 kHz, 16 bit, 60 секунд:

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

С 80 MB до 20 MB: Faktor `4:1`, Ersparnis `75 %`.

## 6. Videokamera-Anwendungsfall

Требования к IP-Kamera должны быть измеримыми:

| Parameter | Bedeutung und Prüffrage |
|---|---|
| Auflösung | достаточно ли Pixel для цели распознавания? |
| Bildrate | сколько кадров нужно для движения? |
| Belichtungszeit | будут ли быстрые объекты резкими? |
| Sensor/Lichtempfindlichkeit | работает ли при слабом/контровом свете? |
| Objektiv/Brennweite | какой Blickwinkel и дистанция? |
| Codec und Bitrate | какое качество, Bandbreite и Speicherlast? |
| Farbtiefe/Dynamikumfang | различимы ли светлые и тёмные участки? |
| Schnittstelle | Ethernet, WLAN, USB или proprietary? |
| Versorgung | PoE-Klasse, Netzteil, USV-Bedarf? |
| Umgebung | Schutzart, Betriebstemperatur, Feuchte, Heizung, Montage? |
| Datenschutz | Zweck, Rechtsgrundlage, Bereich, Speicherdauer, Zugriff? |

`Hz` означает события в секунду. В видео запись указывают в `fps`: 25 fps — 25 кадров в секунду. Monitorfrequenz и Kamerabildrate — разные величины, хотя обе описывают частоту.

### Außenkamera с Gehäuseheizung

Камера для помещения не становится Außenkamera только из-за навеса. Нужно проверить:

- допустимый Betriebstemperaturbereich камеры и корпуса;
- IP-Schutzart от контакта, твёрдых частиц и воды;
- Heizung, Thermostat и защиту от Kondensation/Vereisung;
- общую Leistungsaufnahme в неблагоприятном режиме;
- доступную PoE-Klasse или мощность Netzteil;
- устойчивость к UV, Korrosion, Wind и Schlag по месту установки;
- герметичный Kabelzuführung и необходимый Überspannungsschutz.

Пример: Kamera `9 W`, Heizung `18 W`, Reserve `20 %`:

```text
P_plan = (9 W + 18 W) × 1,20 = 32,4 W
```

PoE-Port с максимальной Ausgangsleistung 15,4 W недостаточен. Важна реально доступная мощность у Endgerät с учётом Leitungslänge и Herstellerfreigabe. Heizung может включаться по температуре, но для расчёта нужен одновременный Maximalfall.

### Speicher- und Bandbreitenrechnung

Четыре камеры по `6 Mbit/s`, 12 часов в день, семь дней хранения:

```text
Gesamtbitrate = 4 × 6 Mbit/s = 24 Mbit/s
Daten = 24 Mbit/s × 12 × 3 600 s × 7
= 7 257 600 Mbit
= 907 200 MB = 907,2 GB dezimal
```

Для Planung добавляются Protokolloverhead, variable Bitrate, Reserve, Dateisystem и Redundanz. Тест с реальными сценами надёжнее одного теоретического максимума.

## 7. Prüfungsformulierungen и typische Fallen

> Die Vektorgrafik ist für das Logo geeignet, da sie ohne sichtbare Pixelbildung auf unterschiedliche Ausgabegrößen skaliert werden kann.

> Die höhere Bildrate verbessert die zeitliche Auflösung bewegter Szenen, erhöht bei sonst gleichen Parametern jedoch typischerweise Bandbreite und Speicherbedarf.

> Die Kamera wird über PoE versorgt, sofern Switch, Port, Kabel und Kamera die erforderliche Leistungsklasse unterstützen.

Типичные ошибки:

- путать Pixelzahl, Bildrate, Abtastrate и Bitrate;
- не переводить bit в Byte;
- забывать Kanäle или Aufnahmedauer;
- считать в kB/MB, но подписывать KiB/MiB;
- путать Kompressionsfaktor и Ersparnis;
- путать Container и Codec;
- выбирать Kamera только по Auflösung;
- игнорировать Datenschutz и Aufbewahrungsdauer.

## 8. Selbsttest

1. Различи Abtastrate и Bittiefe.
2. Рассчитай размер изображения 1 920 × 1 080 Pixel и 24 bit.
3. Рассчитай 30 секунд Mono-Audio 44,1 kHz, 16 bit.
4. Файл уменьшен с 50 MB до 10 MB. Найди Faktor и Ersparnis.
5. Назови пять критериев Außenkamera.
6. Обоснуй Raster или Vektor для Firmenlogo и Foto.

<details>
<summary>Lösungen anzeigen</summary>

1. Abtastrate — число временных измерений в секунду; Bittiefe — число уровней одного измерения.
2. `1 920×1 080×24/8 = 6 220 800 Byte = 6,2208 MB` без Overhead.
3. `44 100×16×1×30/8 = 2 646 000 Byte = 2,646 MB`.
4. Faktor `5:1`, Ersparnis `80 %`.
5. Например Auflösung, Bildrate, Lichtempfindlichkeit, Objektiv, Schutzart, Temperatur, Bitrate, PoE, Datenschutz.
6. Logo: Vektor из-за Skalierung; Foto: Raster из-за сложных Pixel- и Farbdetails.

</details>

## 9. Quellen und Abgleich

- ITU-T и ISO/IEC: принципы цифрового Audio-/Videocodierung.
- W3C: SVG 2 и Web-Bildformate.
- BIBB-Umsetzungshilfe и WBS-Aufgaben по Multimedia и Bilddateien.
- WBS-Kursinhalt Multimedia, Sampling, Kompression, Raster/Vektor и Videokamera; подтверждено 11.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Какие данные камеры были в прежней AP1-задаче?
- Какие Heizung, Schutzart, Mindesttemperatur и PoE-Leistung были указаны в прежней задаче?
- Считаются ли Audio/Video по заданной Bitrate или из Rohparameter?
