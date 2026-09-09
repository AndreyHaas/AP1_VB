---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Schutzziele der Informationssicherheit

## CIA-Triade

`Vertraulichkeit`:

> Nur berechtigte Personen dürfen Informationen lesen oder auf sie zugreifen.

Beispiele für Maßnahmen: Verschlüsselung, Authentifizierung, Berechtigungen.

`Integrität`:

> Daten und Systeme dürfen nicht unbemerkt oder unberechtigt verändert werden.

Beispiele: Hashwerte, digitale Signaturen, Änderungsprotokolle, Berechtigungen.

`Verfügbarkeit`:

> Systeme und Daten müssen zum benötigten Zeitpunkt nutzbar sein.

Beispiele: Backup, Redundanz, USV, Monitoring, Notfallplanung.

## Weitere Schutzziele

`Authentizität`: Echtheit einer Identität, Nachricht oder Quelle ist überprüfbar.

`Zurechenbarkeit`: Eine Handlung kann einer bestimmten Identität zugeordnet werden.

`Nichtabstreitbarkeit`: Eine Handlung oder Erklärung kann später nicht glaubhaft abgestritten werden.

Не каждое средство обеспечивает цель полностью: например, Hashwert без защищённого эталона обнаруживает случайные изменения, но не доказывает автора.

## Beispielzuordnung

```text
Unbefugter liest Personalakte              → Vertraulichkeit
IBAN in Rechnung wird verändert            → Integrität
Server fällt aus                           → Verfügbarkeit
Anmeldung unter fremder Identität           → Authentizität
Unterzeichner bestreitet seine Signatur     → Nichtabstreitbarkeit
```

## IHK-Merksatz

> Die drei grundlegenden Schutzziele sind Vertraulichkeit, Integrität und Verfügbarkeit.

## Selbsttest

Ordne das wichtigste Schutzziel zu:

1. Eine Konfigurationsdatei wird unbemerkt manipuliert.
2. Ein Dienst ist wegen eines Stromausfalls nicht erreichbar.
3. Unberechtigte lesen Gehaltsdaten.

## Lösungen

```text
1. Integrität
2. Verfügbarkeit
3. Vertraulichkeit
```

## Offene Punkte / Korrekturen

- Schutzziele bei kombinierten Fällen immer begründen; mehrere Ziele können gleichzeitig betroffen sein.
