---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Datenmengen und Übertragungszeiten

## Lernziele

- `bit` и `Byte` различать по обозначению и назначению.
- Переводить Datenmenge и Datenübertragungsrate в совместимые единицы.
- Рассчитывать идеальную и реальную Übertragungsdauer.
- Учитывать `Wirkungsgrad` или `Overhead`, если они даны.

## Основы

```text
1 Byte = 8 bit
b = bit
B = Byte

1 kB = 1 000 B
1 MB = 1 000 000 B
1 GB = 1 000 000 000 B
```

Если в задаче указаны `KiB`, `MiB`, `GiB`, используются степени двойки:

```text
1 KiB = 1 024 B
1 MiB = 1 024 KiB
1 GiB = 1 024 MiB
```

Не смешивать `GB` и `GiB`, если условие явно задаёт систему единиц.

## Формулы

```text
Übertragungsdauer = Datenmenge / Datenübertragungsrate

Nutzdatenrate = Bruttodatenrate × Wirkungsgrad

Wirkungsgrad = Nutzdatenrate / Bruttodatenrate
```

Проценты перед вычислением переводятся в Dezimalzahl:

```text
80 % = 0,8
```

## Beispiel 1: ideale Übertragung

```text
Dateigröße:              12 GB = 12 000 MB
Datenübertragungsrate:   400 Mbit/s ÷ 8 = 50 MB/s

Übertragungsdauer:
12 000 MB ÷ 50 MB/s = 240 s = 4 min
```

Проверка единиц:

```text
MB ÷ (MB/s) = s
```

## Beispiel 2: mit Wirkungsgrad

```text
Dateigröße:          20 GB
Bruttodatenrate:     400 Mbit/s
Wirkungsgrad:        80 %

Nutzdatenrate:
400 Mbit/s × 0,8 = 320 Mbit/s
320 Mbit/s ÷ 8 = 40 MB/s

Übertragungsdauer:
20 000 MB ÷ 40 MB/s = 500 s
500 s = 8 min 20 s
```

## IHK-Merksätze

> Vor der Berechnung müssen Datenmenge und Datenübertragungsrate in zueinander passende Einheiten umgerechnet werden.

> Die Nutzdatenrate ist wegen des Protokoll-Overheads in der Regel kleiner als die Bruttodatenrate.

## Typische Prüfungsfallen

- `Mbit/s` не равно `MB/s`; делить или умножать на 8.
- `um 20 % reduziert` означает, что остаётся 80 %.
- `auf 20 % reduziert` означает, что остаётся 20 %.
- Не учитывать Wirkungsgrad, если задача просит идеальное время и не даёт Overhead.
- Не округлять промежуточные результаты без необходимости.

## Selbsttest

Eine Datei ist 9 GB groß. Die Bruttodatenrate beträgt 300 Mbit/s, der Wirkungsgrad 80 %.

1. Berechne die Nutzdatenrate in Mbit/s und MB/s.
2. Berechne die Übertragungsdauer in Sekunden.
3. Gib das Ergebnis in Minuten und Sekunden an.

## Lösungen

```text
300 Mbit/s × 0,8 = 240 Mbit/s
240 Mbit/s ÷ 8 = 30 MB/s
9 000 MB ÷ 30 MB/s = 300 s
300 s = 5 min
```

## Offene Punkte / Korrekturen

- Mit WBS klären, ob in Aufgaben standardmäßig dezimale Einheiten gelten oder die Einheit jeweils ausdrücklich angegeben wird.
