---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Unkomprimierte Bilddateien und Kompression

## Lernziele

- Рассчитывать количество пикселей и несжатый объём растрового изображения.
- Переводить bit в Byte и Byte в MB/MiB.
- Различать уменьшение `um x %` и уменьшение `auf x %`.

## Формулы

```text
Pixelanzahl = Breite × Höhe

Datengröße in bit = Breite × Höhe × Farbtiefe pro Pixel

Dateigröße in Byte = Datengröße in bit ÷ 8
```

В простом экзаменационном расчёте служебные данные файла, Metadaten и Kompressionsstruktur не учитываются, если они отдельно не заданы.

## Beispiel: unkomprimiertes Bild

```text
Auflösung:  1 920 × 1 080 Pixel
Farbtiefe:  24 bit pro Pixel

Pixelanzahl:
1 920 × 1 080 = 2 073 600 Pixel

Datengröße:
2 073 600 × 24 bit = 49 766 400 bit

Dateigröße:
49 766 400 bit ÷ 8 = 6 220 800 Byte
6 220 800 Byte ÷ 1 000 000 = 6,2208 MB
```

Быстрый путь:

```text
24 bit = 3 Byte pro Pixel
2 073 600 × 3 Byte = 6 220 800 Byte
```

## Beispiel: Kompression

Размер 6,2208 MB уменьшается `um 75 %`.

```text
verbleibender Anteil = 100 % − 75 % = 25 % = 0,25
komprimierte Dateigröße = 6,2208 MB × 0,25 = 1,5552 MB
```

## IHK-Merksatz

> Nach einer Reduzierung um 75 Prozent verbleiben 25 Prozent der ursprünglichen Dateigröße.

## Typische Prüfungsfallen

```text
um 25 % reduziert  → 75 % verbleiben
auf 25 % reduziert → 25 % verbleiben
```

- `24 bit Farbtiefe` относится к одному Pixel, а не ко всему изображению.
- Для `MiB` делить на 1 048 576, для `MB` — на 1 000 000.
- При расчёте видео дополнительно учитываются Bilder pro Sekunde и Laufzeit.

## Selbsttest

Ein unkomprimiertes Bild hat 4 000 × 3 000 Pixel und 24 bit Farbtiefe. Berechne die Größe in MB. Danach wird die Datei um 60 % reduziert. Wie groß ist sie anschließend?

## Lösungen

```text
4 000 × 3 000 × 24 bit = 288 000 000 bit
288 000 000 bit ÷ 8 = 36 000 000 Byte = 36 MB
verbleibender Anteil = 40 % = 0,4
36 MB × 0,4 = 14,4 MB
```

## Offene Punkte / Korrekturen

- Keine.
