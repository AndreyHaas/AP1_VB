---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Verfügbarkeit und Service Level Agreement

## Verfügbarkeit berechnen

```text
Verfügbarkeit = Betriebszeit / Gesamtzeit × 100 %

Betriebszeit = Gesamtzeit − Ausfallzeit
```

Beispiel:

```text
Gesamtzeit:   30 × 24 h = 720 h
Ausfallzeit:  3 h
Betriebszeit: 717 h

Verfügbarkeit:
717 / 720 × 100 % = 99,5833 % ≈ 99,58 %
```

## Zulässige Ausfallzeit

```text
Ausfallzeit = Gesamtzeit × (1 − Verfügbarkeit als Dezimalzahl)
```

Bei 30 Tagen und 99,9 %:

```text
Gesamtzeit = 30 × 24 × 60 = 43 200 min
Nichtverfügbarkeit = 1 − 0,999 = 0,001
Ausfallzeit = 43 200 min × 0,001 = 43,2 min
```

## SLA

Ein `Service Level Agreement` beschreibt messbare Leistungszusagen, zum Beispiel:

```text
Servicezeiten
Verfügbarkeit
Prioritätsklassen
Reaktionszeit
Wiederherstellungs- oder Lösungszeit
Messverfahren und Berichte
Eskalationswege
Folgen bei Nichteinhaltung
```

`Reaktionszeit` ist die Zeit bis zur bestätigten Aufnahme/Bearbeitung, nicht automatisch bis zur vollständigen Lösung.

Bei Verfügbarkeitsrechnungen muss klar sein, ob Wartungsfenster, Servicezeiten oder ausgeschlossene Ereignisse in die Gesamtzeit eingehen.

## IHK-Merksatz

> Die im SLA zugesagte Verfügbarkeit kann nur bewertet werden, wenn Messzeitraum, Servicezeit und Definition der Ausfallzeit eindeutig festgelegt sind.

## Selbsttest

Ein Service ist in einem 28-Tage-Zeitraum rund um die Uhr verfügbar. Das SLA garantiert 99,5 %. Berechne die maximal zulässige Ausfallzeit in Stunden und Minuten.

## Lösungen

```text
28 × 24 = 672 h
1 − 0,995 = 0,005
672 h × 0,005 = 3,36 h
0,36 h × 60 = 21,6 min
Ergebnis: 3 h 21,6 min
```

## Offene Punkte / Korrekturen

- RPO/RTO sind nicht Teil dieses Kernfiles; erst nach Bestätigung durch WBS ergänzen.
