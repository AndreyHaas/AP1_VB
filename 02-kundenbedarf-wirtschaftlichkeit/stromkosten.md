---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Leistung, Energieverbrauch und Stromkosten

## Lernziele

- `Leistung` в W/kW и `Energie` в Wh/kWh не путать.
- Рассчитывать Energieverbrauch за день, месяц или год.
- Учитывать количество устройств, время работы и Strompreis.

## Формулы

```text
Gesamtleistung = Anzahl der Geräte × Leistung pro Gerät

Leistung in kW = Leistung in W ÷ 1 000

Energieverbrauch in kWh = Leistung in kW × Zeit in h

Stromkosten = Energieverbrauch in kWh × Strompreis in Euro/kWh
```

## Beispiel

```text
12 Arbeitsplatzrechner
150 W pro Rechner
8 h pro Arbeitstag
20 Arbeitstage pro Monat
0,32 Euro/kWh
```

```text
Gesamtleistung:
12 × 150 W = 1 800 W = 1,8 kW

Energieverbrauch pro Tag:
1,8 kW × 8 h = 14,4 kWh

Energieverbrauch pro Monat:
14,4 kWh × 20 = 288 kWh

Stromkosten pro Monat:
288 kWh × 0,32 Euro/kWh = 92,16 Euro
```

## IHK-Merksatz

> Kilowatt beschreibt die Leistung. Kilowattstunden beschreiben die verbrauchte Energie.

## Typische Prüfungsfallen

- После умножения `kW × h` результат имеет единицу `kWh`, а не kW.
- `Standby-Leistung`, PUE или разные Betriebszeiten учитывать только при наличии в условии.
- Проверить, относится ли указанная мощность к одному устройству или ко всей установке.
- При годовом расчёте не использовать 365 дней, если заданы только Arbeitstage.

## Selbsttest

15 Monitore benötigen jeweils 40 W und laufen an 220 Arbeitstagen jeweils 7 Stunden. Der Strompreis beträgt 0,35 Euro/kWh. Berechne den jährlichen Energieverbrauch und die jährlichen Stromkosten.

## Lösungen

```text
15 × 40 W = 600 W = 0,6 kW
0,6 kW × 7 h × 220 = 924 kWh
924 kWh × 0,35 Euro/kWh = 323,40 Euro
```

## Offene Punkte / Korrekturen

- Keine.
