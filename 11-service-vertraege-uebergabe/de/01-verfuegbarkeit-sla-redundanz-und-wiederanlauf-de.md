---
pruefung: AP1
thema: Verfügbarkeit und Wiederanlauf
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Deutsch
gegenstueck: ../ru/01-verfuegbarkeit-sla-redundanz-und-wiederanlauf-ru.md
---

# Verfügbarkeit, SLA, Redundanz und Wiederanlauf

## 1. Lernziele

Du kannst:

- Verfügbarkeit aus Betriebs- und Gesamtzeit berechnen;
- zulässige Ausfallzeit aus einem Prozentwert bestimmen;
- Messzeitraum, Servicezeit und Ausschlüsse eines SLA beachten;
- Reaktions-, Wiederherstellungs- und Lösungszeit unterscheiden;
- SPOF und geeignete Redundanzmaßnahmen erkennen;
- Verfügbarkeit serieller und paralleler Komponenten im Modell berechnen;
- Backup, Redundanz und Disaster Recovery abgrenzen;
- RTO, RPO, Wiederanlaufreihenfolge und Notbetrieb verbinden;
- einen Wiederanlauftest mit messbaren Kriterien planen.

## 2. Prüfungsminimum — 15 Minuten

1. `Verfügbarkeit = Betriebszeit / Gesamtzeit × 100 %`.
2. `Betriebszeit = Gesamtzeit − anrechenbare Ausfallzeit`.
3. `zulässige Ausfallzeit = Gesamtzeit × (1 − Verfügbarkeit dezimal)`.
4. 99,9 % bedeutet 0,1 % Nichtverfügbarkeit, nicht 0,1 Stunden.
5. SLA muss Messzeitraum, Servicezeit, Messpunkt, Ausfalldefinition und Wartungsfenster festlegen.
6. Reaktionszeit ist nicht automatisch Lösungszeit.
7. Redundanz beseitigt nur dann einen SPOF, wenn gemeinsame Abhängigkeiten mitbetrachtet werden.
8. Bei seriell benötigten unabhängigen Komponenten werden Verfügbarkeiten im Modell multipliziert.
9. Bei zwei vollständig redundanten unabhängigen Komponenten gilt `1 − (1 − A1) × (1 − A2)`.
10. Redundanz hält Betrieb aufrecht; Backup stellt Datenstände wieder her; Wiederanlauf braucht Plan und Tests.

> Die zugesagte Verfügbarkeit kann erst bewertet werden, wenn Servicezeit, Messzeitraum und anrechenbare Ausfälle eindeutig definiert sind.

## 3. Grundlagen und SLA

### 3.1 Verfügbarkeit berechnen

```text
A = Betriebszeit / Gesamtzeit × 100 %
Betriebszeit = Gesamtzeit − Ausfallzeit
```

Beispiel: 30 Tage Rund-um-die-Uhr-Service, 3 Stunden Ausfall.

```text
Gesamtzeit   = 30 × 24 h = 720 h
Betriebszeit = 720 h − 3 h = 717 h
A            = 717 / 720 × 100 % = 99,5833... % ≈ 99,58 %
```

### 3.2 Zulässige Ausfallzeit

Bei 30 Tagen und 99,9 %:

```text
Gesamtzeit = 30 × 24 × 60 min = 43 200 min
Nichtverfügbarkeit = 1 − 0,999 = 0,001
Ausfallzeit = 43 200 min × 0,001 = 43,2 min
```

Prozentwerte zuerst in Dezimalzahlen umwandeln. Bei `99,95 %` ist die Nichtverfügbarkeit `0,05 % = 0,0005`.

### 3.3 Inhalt eines SLA

Ein Service Level Agreement kann enthalten:

- Servicebeschreibung und Servicezeiten;
- Verfügbarkeit und Messzeitraum;
- Messpunkt, Datenquelle und Berechnung;
- geplante Wartung und ausgeschlossene Ereignisse;
- Prioritätsklassen, Reaktions- und Wiederherstellungsziele;
- Kommunikations- und Eskalationswege;
- Berichte, Review und Folgen bei Nichteinhaltung.

`Servicezeit` ist der Zeitraum, in dem die Zusage gilt. Ein Monatswert für 24×7 ist nicht mit einem Wert für Mo–Fr 08:00–18:00 direkt vergleichbar.

### 3.4 Zeitbegriffe

| Begriff | Bedeutung |
|---|---|
| Reaktionszeit | bis Annahme/qualifizierter Bearbeitungsbeginn |
| Wiederherstellungszeit | bis der Service wieder nutzbar ist |
| Lösungszeit | bis Ursache/Fehler dauerhaft behoben ist |
| RTO | angestrebte maximale Dauer bis Zielwiederherstellung |
| RPO | maximal tolerierter Datenverlust in Zeit |

Ein Workaround kann den Service wiederherstellen, obwohl die endgültige Problemlösung später erfolgt.

## 4. Redundanz und Wiederanlauf

### 4.1 SPOF und gemeinsame Ursachen

`Single Point of Failure (SPOF)`: Einzelkomponente, deren Ausfall den gesamten Dienst stoppt.

Mögliche Redundanz:

- zweites Netzteil und getrennte Stromzuführung;
- Servercluster/Failover;
- mehrere Netzwege und Switches;
- replizierte Dienste und Datenbanken;
- geografisch getrennte Standorte.

Zwei Server im selben Rack bleiben gegen Rackstrom, Brand oder Fehlkonfiguration gemeinsam anfällig. Redundanz braucht Unabhängigkeit, Umschaltmechanismus, Kapazität und Tests.

### 4.2 Serienmodell

Müssen zwei unabhängige Komponenten beide funktionieren:

```text
A_gesamt = A1 × A2
```

Beispiel Server und Switch mit je 99,9 %:

```text
A_gesamt = 0,999 × 0,999 = 0,998001 = 99,8001 %
```

Mehr notwendige Komponenten können die Gesamtverfügbarkeit senken.

### 4.3 Parallelmodell

Zwei unabhängige Komponenten sind vollständig redundant; eine genügt:

```text
A_parallel = 1 − (1 − A1) × (1 − A2)
```

Bei je 99 %:

```text
A_parallel = 1 − 0,01 × 0,01 = 0,9999 = 99,99 %
```

Das ist ein vereinfachtes Modell. Gemeinsame Ursachen, Umschaltfehler, Wartung und Abhängigkeiten können die reale Verfügbarkeit deutlich senken.

### 4.4 Backup, Redundanz und DR

```text
Redundanz        → Betrieb trotz Komponentenausfall
Backup           → Datenstand nach Verlust/Manipulation wiederherstellen
Disaster Recovery → Systeme, Daten, Reihenfolge, Personal und Standort wiederanlaufen lassen
```

Replikation kann beschädigte oder verschlüsselte Daten sofort mitübertragen. Deshalb ergänzt sie Backup, ersetzt es aber nicht.

### 4.5 Wiederanlaufplanung

Ein Plan enthält:

1. Auslösekriterien und Entscheidungsbefugnis;
2. Kontakte, Rollen und Kommunikationswege;
3. priorisierte Geschäftsprozesse und Abhängigkeiten;
4. RTO/RPO je Service;
5. Notbetrieb und Ersatzressourcen;
6. Restore- und Startreihenfolge;
7. technische/fachliche Prüf- und Freigabekriterien;
8. Rückkehr zum Normalbetrieb und Nachbereitung.

## 5. Anwendungsfall und Berechnung

Ein Kundenportal hat ein 24×7-SLA von `99,8 %` über einen 31-Tage-Monat. Es fällt 70 Minuten ungeplant aus. Geplante Wartung von 60 Minuten ist laut Vertrag ausgeschlossen.

### 5.1 Zulässige Zeit

```text
Gesamtzeit = 31 × 24 × 60 min = 44 640 min
zulässige Nichtverfügbarkeit = 1 − 0,998 = 0,002
zulässige Ausfallzeit = 44 640 × 0,002 = 89,28 min
```

Nur der ungeplante Ausfall wird nach dem gegebenen SLA angerechnet:

```text
70 min ≤ 89,28 min → Verfügbarkeitsziel eingehalten
Restbudget = 89,28 − 70 = 19,28 min
```

### 5.2 Tatsächliche SLA-Verfügbarkeit

```text
Betriebszeit = 44 640 − 70 = 44 570 min
A = 44 570 / 44 640 × 100 % ≈ 99,8432 %
```

### 5.3 Wiederanlaufreihenfolge

```text
1. Strom, Netz, DNS/Zeit und Identitätsdienst
2. Datenbank und konsistenter Datenstand
3. Anwendung/API
4. Webfrontend
5. Monitoring, Schnittstellen und fachlicher Funktionstest
6. Freigabe und Kundenkommunikation
```

Die konkrete Reihenfolge folgt Abhängigkeiten, nicht allein der Sichtbarkeit für Kunden.

## 6. Prüfungsformulierungen

> Die maximal zulässige Ausfallzeit beträgt 89,28 Minuten, da der Monat 44 640 Minuten umfasst und 0,2 % davon nicht verfügbar sein dürfen.

> Die geplante Wartung wird in dieser Rechnung nicht berücksichtigt, weil sie laut vorgegebenem SLA ausdrücklich von der Messung ausgeschlossen ist.

> Der zweite Server beseitigt den Single Point of Failure nur, wenn Stromversorgung, Netzwerk, Datenhaltung und Failover ebenfalls ausreichend unabhängig ausgelegt sind.

> Der Identitätsdienst wird vor dem Portal gestartet, da sich Benutzer ohne diese Abhängigkeit nicht an der Anwendung authentifizieren können.

## 7. Typische Prüfungsfallen

- Gesamtzeit, Betriebszeit und Ausfallzeit verwechseln.
- `99,9 %` als `0,1` statt `0,001` Restanteil rechnen.
- Stunden und Minuten ohne Umrechnung mischen.
- geplante Wartung ohne SLA-Angabe ein- oder ausschließen.
- Reaktionszeit als vollständige Lösung interpretieren.
- Prozentwert ohne Messzeitraum vergleichen.
- zwei Komponenten als unabhängig annehmen, obwohl gemeinsame Versorgung besteht.
- Serien- und Parallelformel vertauschen.
- Modellwert als reale Garantie behandeln.
- Replikation oder RAID als Backup ansehen.
- RTO und RPO verwechseln.
- Wiederanlauf ohne Abhängigkeiten und fachliche Freigabe planen.

## 8. Selbsttest

1. Nenne die Formel der Verfügbarkeit.
2. Berechne Verfügbarkeit bei 720 h Gesamt- und 2 h Ausfallzeit.
3. Berechne zulässige Ausfallzeit bei 28 Tagen 24×7 und 99,5 %.
4. Welche SLA-Angaben braucht eine faire Messung?
5. Grenze Reaktions-, Wiederherstellungs- und Lösungszeit ab.
6. Was ist ein SPOF?
7. Berechne zwei serielle Komponenten mit 99 % und 98 %.
8. Berechne zwei parallele unabhängige Komponenten mit je 98 %.
9. Warum ist reale Verfügbarkeit oft niedriger als das Parallelmodell?
10. Grenze Redundanz, Backup und Disaster Recovery ab.
11. Erkläre RTO und RPO.
12. Ordne eine sinnvolle Wiederanlaufreihenfolge für Portal, Datenbank und Identitätsdienst.

<details>
<summary>Lösungen anzeigen</summary>

1. Betriebszeit/Gesamtzeit × 100 %.
2. `(718 / 720) × 100 % ≈ 99,72 %`.
3. `28 × 24 = 672 h`; `672 × 0,005 = 3,36 h = 3 h 21,6 min`.
4. Servicezeit, Zeitraum, Messpunkt, Ausfalldefinition, Wartung/Ausschlüsse.
5. bis Bearbeitungsbeginn; bis Nutzbarkeit; bis dauerhafte Ursache behoben.
6. Einzelkomponente, deren Ausfall den Dienst stoppt.
7. `0,99 × 0,98 = 0,9702 = 97,02 %`.
8. `1 − 0,02 × 0,02 = 0,9996 = 99,96 %`.
9. gemeinsame Ursachen, Failover, Wartung, Software und Abhängigkeiten.
10. Betrieb fortsetzen; Daten wiederherstellen; gesamten Dienst geordnet wiederanlaufen.
11. Zeit bis Zielwiederherstellung; maximal tolerierter Datenverlust in Zeit.
12. Identitätsdienst, Datenbank, Portal; genaue Infrastrukturabhängigkeiten vorher prüfen.

</details>

## 9. Quellen und Abgleich

- [NIST SP 800-34 Rev. 1](https://csrc.nist.gov/pubs/sp/800/34/r1/upd1/final) — Business Impact Analysis, Wiederherstellungsprioritäten, Strategien, Plan und Tests.
- [BSI IT-Grundschutz-Kompendium](https://www.bsi.bund.de/grundschutz-kompendium) — aktuelle Anforderungen zu Verfügbarkeit, Notfallmanagement, Redundanz und Wiederherstellung.
- [FIAusbV § 9](https://www.gesetze-im-internet.de/fiausbv/__9.html) — Kontrolle und Protokollierung der erbrachten Leistung im AP1-Kontext.

## 10. Offene Prüfpunkte für den Unterricht

- Welche Rundungsregel verlangt WBS bei Ausfallzeiten?
- Werden Serien-/Parallelmodelle in AP1 gerechnet oder nur qualitativ bewertet?
- Welche Wartungsfenster-Konvention gilt in den verwendeten SLA-Aufgaben?
