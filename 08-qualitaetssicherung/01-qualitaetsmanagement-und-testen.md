---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Qualitätsmanagement und Testen

## Qualität

Qualität ist der Grad, in dem festgelegte und vorausgesetzte Anforderungen erfüllt werden. „Hochwertig“ bedeutet nicht automatisch teuer oder maximal ausgestattet, sondern passend zum Bedarf.

`Qualitätsmanagement (QM)` organisiert Ziele, Verantwortlichkeiten und Prozesse.

`Qualitätssicherung (QS)` umfasst geplante Maßnahmen, die Vertrauen in die Anforderungserfüllung schaffen.

`Qualitätskontrolle` prüft konkrete Ergebnisse.

## PDCA

```text
Plan  → Ziel, Soll-Zustand und Maßnahmen festlegen
Do    → Maßnahmen umsetzen
Check → Ergebnisse messen und mit Soll vergleichen
Act   → Abweichungen korrigieren und Standard verbessern
```

## Teststufen

```text
Unit-/Komponententest → einzelne Einheit
Integrationstest      → Zusammenspiel mehrerer Einheiten
Systemtest            → gesamtes System gegen Anforderungen
Abnahmetest           → Auftraggeber prüft Abnahmekriterien
```

Weitere Testarten:

```text
Funktionstest
Last-/Performancetest
Sicherheitstest
Regressionstest
Usability-/Barrierefreiheitstest
```

## Black Box und White Box

`Black-Box-Test`: Test aus Sicht von Ein-/Ausgaben ohne Kenntnis des internen Codes.

`White-Box-Test`: Test orientiert sich an interner Struktur, Pfaden oder Bedingungen.

## Testfall

Ein guter Testfall enthält:

```text
Testfall-ID
Voraussetzungen
Eingabedaten und Schritte
erwartetes Ergebnis (Soll)
tatsächliches Ergebnis (Ist)
Status bestanden/nicht bestanden
Datum und Prüfer
Abweichung/Fehlernummer
```

## Testprotokoll für Arbeitsplatz

Nach Einrichtung prüfen:

- Hardware wird erkannt und arbeitet fehlerfrei;
- Betriebssystem, Treiber und Updates;
- Netzwerk, DNS, Domäne und notwendige Dienste;
- Benutzerrechte und Sicherheitsvorgaben;
- installierte Software und Lizenzen;
- Peripherie, Barrierefreiheit und Performance;
- Backup/Restore oder Datenübernahme, wenn beauftragt;
- Dokumentation und Abnahmebedingungen.

## Soll-Ist-Vergleich

```text
Soll → Anforderung/Planwert
Ist  → gemessener tatsächlicher Wert
Abweichung = Ist − Soll oder fachliche Differenz
```

Abweichungen werden bewertet, behoben, erneut getestet und nachvollziehbar dokumentiert.

## Selbsttest

Für die Anforderung „Anmeldung innerhalb von höchstens 3 Sekunden bei 100 gleichzeitigen Benutzern“ formuliere einen Testfall mit Soll-Ergebnis.

## Lösungen

Mögliche Lösung:

```text
Voraussetzung: Testsystem mit 100 simulierten gleichzeitigen Benutzern
Aktion: gültige Anmeldungen gleichzeitig auslösen
Messung: Antwortzeit jeder Anmeldung
Soll: definierter Erfolgsanteil/alle Anmeldungen ≤ 3 s, keine Fehler
Ist: Messergebnis eintragen
```

## Offene Punkte / Korrekturen

- Grenzwertanalyse und Äquivalenzklassen als eigene Aufgabenserie ergänzen.
