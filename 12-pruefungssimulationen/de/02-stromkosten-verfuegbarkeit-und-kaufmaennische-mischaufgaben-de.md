---
pruefung: AP1
thema: Stromkosten, Verfügbarkeit und kaufmännische Mischaufgaben
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Deutsch
gegenstueck: ../ru/02-stromkosten-verfuegbarkeit-und-kaufmaennische-mischaufgaben-ru.md
---

# Stromkosten, Verfügbarkeit und kaufmännische Mischaufgaben

## 1. Lernziele

Du kannst:

- Leistung, Energie und Stromkosten mit mehreren Betriebszuständen berechnen;
- Einsparung und einfache Amortisationsdauer bestimmen;
- Verfügbarkeit und zulässige Ausfallzeit aus Servicezeiten berechnen;
- Netto, Umsatzsteuer und Brutto fallbezogen unterscheiden;
- Rabatt, Skonto und Bezugskosten in richtiger Reihenfolge anwenden;
- Bezugspreis und TCO voneinander abgrenzen;
- Break-even, Amortisation und Nutzwert passend zur Fragestellung auswählen;
- mehrstufige Aufgaben in Teilprobleme, Einheiten und Zeiträume zerlegen;
- Ergebnisse durch Gegenrechnung und Größenordnung prüfen;
- eine Entscheidung mit Zahl, Einheit, Annahme und Begründung formulieren.

## 2. Prüfungsminimum — 15 Minuten

1. `Energie (kWh) = Leistung (kW) × Zeit (h)`.
2. `Stromkosten = Energie × Preis je kWh`.
3. Betriebszustände einzeln berechnen und erst danach addieren.
4. `Verfügbarkeit = Betriebszeit / Gesamtzeit × 100 %`.
5. `zulässige Ausfallzeit = Gesamtzeit × Nichtverfügbarkeitsanteil`.
6. Prozente als Dezimalzahl einsetzen: `0,3 % = 0,003`.
7. Bezugskalkulation: Listenpreis − Rabatt = Zieleinkaufspreis; − Skonto = Bareinkaufspreis; + Bezugskosten = Bezugspreis.
8. Umsatzsteuer nur einbeziehen, wenn Aufgabe und Perspektive dies verlangen.
9. Bezugspreis ist nicht automatisch TCO; Betrieb, Support, Personal und Aussonderung können hinzukommen.
10. Erst Rechenfrage und Zeitraum klären, dann Formel wählen und am Ende begründen.

> Das wirtschaftlich geeignete Angebot wird nicht allein nach dem Listenpreis, sondern nach Muss-Kriterien, vergleichbaren Gesamtkosten und relevantem Nutzen bewertet.

## 3. Formelwerkzeug

### 3.1 Energie und Kosten

```text
P_kW = P_W / 1 000
E_kWh = Anzahl × P_kW × Zeit_h
Kosten = E_kWh × Preis_€/kWh
```

Bei mehreren Zuständen:

```text
E_gesamt = E_aktiv + E_idle + E_standby + ...
```

Der Netzteil-Nennwert ist nicht automatisch die tatsächliche durchschnittliche Leistungsaufnahme.

### 3.2 Verfügbarkeit

```text
A = (Gesamtzeit − anrechenbare Ausfallzeit) / Gesamtzeit × 100 %
t_ausfall,zulässig = Gesamtzeit × (1 − A_ziel,dezimale Zahl)
```

Nur die im SLA definierte Servicezeit und die anrechenbaren Ausfälle verwenden.

### 3.3 Bezugskalkulation

```text
Listeneinkaufspreis
− Lieferrabatt
= Zieleinkaufspreis
− Lieferskonto
= Bareinkaufspreis
+ Bezugskosten
= Bezugspreis
```

Rabatt und Skonto werden nacheinander von ihrer jeweiligen Basis berechnet, nicht beide vom Listenpreis.

### 3.4 Weitere Entscheidungsgrößen

```text
TCO = einmalige Kosten + laufende Kosten des Vergleichszeitraums
Amortisationsdauer = Investition / jährlicher Rückfluss
Stückdeckungsbeitrag = Preis − variable Stückkosten
Break-even-Menge = Fixkosten / Stückdeckungsbeitrag
Teilnutzwert = Gewicht × Bewertung
```

Jede Formel beantwortet eine andere Frage. Punkte einer Nutzwertanalyse werden nicht kommentarlos mit Euro addiert.

## 4. Strategie für Mischaufgaben

### 4.1 Sechs Schritte

1. Gesucht, Perspektive und Zeitraum markieren.
2. Gegebene Werte mit Einheiten notieren.
3. Teilaufgaben und Abhängigkeiten ordnen.
4. Alle Einheiten und Prozente umrechnen.
5. Mit ungerundeten Zwischenergebnissen rechnen.
6. Ergebnis, Einheit, Rundung, Plausibilität und Aussage ergänzen.

### 4.2 Plausibilitätskontrollen

- Mehr Betriebszeit muss bei gleicher Leistung mehr Energie ergeben.
- Ein Rabatt muss den Preis senken.
- 99,9 % Verfügbarkeit erlaubt weniger Ausfall als 99 % im gleichen Zeitraum.
- Wirkungsgrad unter 100 % verlängert die Übertragungszeit.
- Eine Stückzahl am Break-even wird bei nicht ganzzahligem Ergebnis aufgerundet.
- Zwei Alternativen müssen denselben Zeitraum und Leistungsumfang verwenden.

### 4.3 Netto oder Brutto

Unternehmen vergleichen bei Vorsteuerabzugsberechtigung typischerweise Nettobeträge. Privatkunden tragen grundsätzlich den Bruttopreis. In einer Prüfungsaufgabe ist die angegebene Perspektive entscheidend; einen Steuersatz nicht erfinden.

```text
Brutto = Netto × (1 + Umsatzsteuersatz)
Netto = Brutto / (1 + Umsatzsteuersatz)
```

## 5. Integrierter Anwendungsfall

Ein Betrieb beschafft 30 Clients. Angebotsdaten und Nutzung:

- Listenpreis je Gerät: `960 € netto`;
- Rabatt: `10 %`, Skonto: `2 %`;
- einmalige Fracht: `650 €`;
- Installation: `1,5 h` je Gerät zu `72 €/h`;
- aktiver Betrieb: `65 W`, `7 h` an 220 Arbeitstagen;
- Idle: `12 W`, `1 h` an 220 Arbeitstagen;
- Standby: `1,5 W` in den übrigen Stunden;
- Strompreis: `0,34 €/kWh`;
- Support im ersten Jahr: `900 €`.

### 5.1 Bezugspreis

```text
Listeneinkaufspreis = 30 × 960 € = 28 800 €
Rabatt              = 28 800 € × 0,10 = 2 880 €
Zieleinkaufspreis   = 25 920 €
Skonto              = 25 920 € × 0,02 = 518,40 €
Bareinkaufspreis    = 25 401,60 €
Bezugspreis         = 25 401,60 € + 650 € = 26 051,60 €
```

### 5.2 Jahresenergie

Aktiv und Idle an Arbeitstagen:

```text
E_aktiv = 30 × 0,065 kW × 7 h × 220 = 3 003 kWh
E_idle  = 30 × 0,012 kW × 1 h × 220 = 79,2 kWh
```

Standby: 16 Stunden an 220 Arbeitstagen sowie 24 Stunden an 145 übrigen Tagen.

```text
E_standby,Arbeitstage = 30 × 0,0015 × 16 × 220 = 158,4 kWh
E_standby,übrige Tage = 30 × 0,0015 × 24 × 145 = 156,6 kWh
E_gesamt = 3 003 + 79,2 + 158,4 + 156,6 = 3 397,2 kWh
Stromkosten = 3 397,2 × 0,34 € = 1 155,048 € ≈ 1 155,05 €
```

### 5.3 TCO des ersten Jahres

```text
Installation = 30 × 1,5 h × 72 €/h = 3 240 €
TCO_Jahr1 = 26 051,60 + 3 240 + 1 155,05 + 900
TCO_Jahr1 = 31 346,65 €
```

Der Bezugspreis enthält hier Geräte und Fracht; Installation, Energie und Support erweitern ihn zum gegebenen TCO-Modell.

### 5.4 Verfügbarkeitskontrolle

Ein Supportservice gilt an 22 Arbeitstagen je 10 Stunden. Ziel: `99,7 %`. Zwei anrechenbare Ausfälle dauern 18 und 24 Minuten.

```text
Gesamtzeit = 22 × 10 h = 220 h = 13 200 min
zulässig = 13 200 × (1 − 0,997) = 39,6 min
tatsächlich = 18 + 24 = 42 min
42 min > 39,6 min → Ziel um 2,4 min verfehlt
A_ist = (13 200 − 42) / 13 200 × 100 % ≈ 99,6818 %
```

## 6. Prüfungsformulierungen

> Der Bezugspreis beträgt 26 051,60 Euro netto, da Rabatt und Skonto nacheinander abgezogen und die Fracht anschließend addiert werden.

> Die jährlichen Stromkosten betragen unter dem vorgegebenen Nutzungsprofil rund 1 155,05 Euro.

> Das Verfügbarkeitsziel wurde verfehlt, weil 42 anrechenbare Ausfallminuten das zulässige Budget von 39,6 Minuten um 2,4 Minuten überschreiten.

> Der reine Bezugspreis reicht für die Entscheidung nicht aus, da Installation, Energie und Support im betrachteten Zeitraum weitere Kosten verursachen.

## 7. Typische Prüfungsfallen

- Watt und Kilowatt ohne Division durch 1 000 verwenden.
- Leistung in kW mit Minuten statt Stunden multiplizieren.
- Anzahl der Geräte oder Betriebstage vergessen.
- Betriebszustände zeitlich überlappen lassen.
- Netzteil-Nennleistung als Messwert behandeln.
- Verfügbarkeitsziel als Ausfallanteil einsetzen.
- Monatszeit 24×7 nutzen, obwohl SLA nur Servicezeiten nennt.
- Rabatt und Skonto beide vom Listenpreis berechnen.
- Bezugskosten vor Skonto addieren, obwohl das Schema etwas anderes vorgibt.
- Netto und Brutto ohne Perspektive mischen.
- Bezugspreis als vollständige TCO ausgeben.
- Amortisation, Break-even und TCO als austauschbar behandeln.
- Zwischenergebnisse zu früh runden.
- eine Entscheidung ohne qualitative Muss-Kriterien treffen.

## 8. Selbsttest

1. Grenze Leistung und Energie ab.
2. Berechne Energie und Kosten für 8 Geräte mit 120 W, 6 h an 200 Tagen und 0,30 €/kWh.
3. Welche Ausfallzeit erlaubt 99,9 % in 30 Tagen 24×7?
4. Berechne die tatsächliche Verfügbarkeit bei 720 h Gesamtzeit und 2 h Ausfall.
5. Nenne die Reihenfolge der Bezugskalkulation.
6. Listenpreis 12 000 €, 5 % Rabatt, 2 % Skonto und 300 € Fracht: Bezugspreis?
7. Warum ist der Bezugspreis keine TCO?
8. Investition 4 800 €, jährliche Einsparung 1 200 €: einfache Amortisationsdauer?
9. Fixkosten 18 000 €, Preis 150 €, variable Kosten 90 €: Break-even-Menge?
10. Wann sind Netto- und wann Bruttowerte typischerweise relevant?
11. Prüfe, ob im integrierten Fall alle Tagesstunden vollständig und überschneidungsfrei erfasst sind.
12. Nenne vier Plausibilitätsprüfungen für Mischaufgaben.

<details>
<summary>Lösungen anzeigen</summary>

1. Leistung ist Energie pro Zeit in W/kW; Energie ist Leistung mal Zeit in Wh/kWh.
2. `8 × 0,12 × 6 × 200 = 1 152 kWh`; `1 152 × 0,30 = 345,60 €`.
3. `30 × 24 × 60 × 0,001 = 43,2 min`.
4. `718/720 × 100 % ≈ 99,72 %`.
5. Liste − Rabatt = Ziel; − Skonto = Bar; + Bezugskosten = Bezugspreis.
6. `12 000 − 600 = 11 400`; `−228 = 11 172`; `+300 = 11 472 €`.
7. Laufende und weitere einmalige Kosten wie Installation, Energie, Support und Entsorgung können fehlen.
8. `4 800/1 200 = 4 Jahre`.
9. `18 000/(150−90) = 300 Stück`.
10. Unternehmen mit Vorsteuerabzug typischerweise netto; Endverbraucher typischerweise brutto; Aufgabenangabe entscheidet.
11. Arbeitstag: 7 h aktiv + 1 h Idle + 16 h Standby = 24 h; übriger Tag: 24 h Standby.
12. Einheit, Zeitraum, Größenordnung, Richtung der Prozentwirkung, Gegenrechnung; vier genügen.

</details>

## 9. Quellen und Abgleich

- [BIPM — SI Brochure](https://www.bipm.org/en/publications/si-brochure) — SI-Einheiten und Präfixe für Leistung, Energie und Zeit.
- [Umsatzsteuergesetz](https://www.gesetze-im-internet.de/ustg_1980/) — Primärquelle für Umsatzsteuer; in Aufgaben gilt der vorgegebene Steuersatz und Sachverhalt.
- [FIAusbV § 9](https://www.gesetze-im-internet.de/fiausbv/__9.html) — Wirtschaftlichkeit, Auswahl, Einrichtung, Kontrolle und Protokollierung im AP1-Prüfungsbereich.
- [BIBB — Umsetzungshilfe Fachinformatiker/-in](https://www.bibb.de/dienst/publikationen/de/16661) — berufliche Einordnung von Wirtschaftlichkeit und Kundenauftrag.

## 10. Offene Prüfpunkte für den Unterricht

- Welche Bezugskalkulationsbegriffe und Rundungsregeln verwendet WBS?
- Welche kaufmännischen Formeln gehören laut aktuellem Katalog sicher zu AP1?
- Werden Strom-Betriebsprofile in WBS-Aufgaben als 365 Tage oder nur Arbeitstage modelliert?
