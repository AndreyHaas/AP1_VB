---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Schutzobjekt, Bedrohung, Schwachstelle und Risiko

## Begriffe

`Schutzobjekt`:

> Etwas, das geschützt werden muss, zum Beispiel Daten, Anwendung, IT-System, Raum oder Kommunikationsverbindung.

`Bedrohung`:

> Mögliche Ursache eines unerwünschten Schadens, zum Beispiel Angreifer, Feuer, Stromausfall oder Fehlbedienung.

`Schwachstelle`:

> Eine Sicherheitslücke oder Eigenschaft, die von einer Bedrohung ausgenutzt werden kann.

`Angriff`:

> Gezielter Versuch, eine Schwachstelle auszunutzen.

`Risiko`:

> Kombination aus Eintrittswahrscheinlichkeit und Schadensausmaß.

Учебная формула:

```text
Risiko = Eintrittswahrscheinlichkeit × Schadensausmaß
```

Реальная оценка может быть качественной, например `niedrig/mittel/hoch`, а не обязательно числовой.

`Schutzmaßnahme` снижает Eintrittswahrscheinlichkeit, Schadensausmaß или оба параметра.

## Beispiel

```text
Schutzobjekt:      Kundendaten und Webanwendung
Bedrohung:         Angreifer aus dem Internet
Schwachstelle:     bekannte Lücke in veralteter Bibliothek
Angriff:           Ausnutzung der Lücke
Schaden:           unberechtigter Zugriff auf Kundendaten
Schutzziel:        Vertraulichkeit
Schutzmaßnahme:    Patch installieren oder Bibliothek ersetzen
```

## Typische Prüfungsfallen

- `Angreifer` — Bedrohung; `Ausnutzung der Lücke` — Angriff.
- `veraltete Bibliothek` слишком неточно: важно назвать известную Schwachstelle.
- Schaden и Risiko не одно и то же: Risiko учитывает ещё вероятность.

## Selbsttest

Ein unverschlüsseltes Notebook mit Kundendaten wird im Zug benutzt. Bestimme Schutzobjekt, Bedrohung, Schwachstelle, möglichen Schaden und zwei Maßnahmen.

## Lösungen

Возможный ответ:

```text
Schutzobjekt: Kundendaten
Bedrohung: Diebstahl oder Einsicht durch Unbefugte
Schwachstelle: fehlende Datenträgerverschlüsselung und Nutzung in öffentlicher Umgebung
Schaden: Offenlegung personenbezogener Daten
Maßnahmen: Festplattenverschlüsselung, Sichtschutz, sichere Aufbewahrung
```

## Offene Punkte / Korrekturen

- Числовую Risikomatrix добавить вместе с Schutzbedarfsanalyse.
