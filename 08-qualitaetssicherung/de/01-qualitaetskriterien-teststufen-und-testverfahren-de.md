---
pruefung: AP1
thema: Qualitätssicherung
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Deutsch
gegenstueck: ../ru/01-qualitaetskriterien-teststufen-und-testverfahren-ru.md
---

# Qualitätssicherung: Kriterien, Teststufen und Testverfahren

## 1. Lernziele

Du kannst:

- Qualität, Qualitätsmanagement, Qualitätssicherung und Qualitätskontrolle abgrenzen;
- messbare Qualitäts- und Abnahmekriterien aus Anforderungen ableiten;
- statische und dynamische Prüfungen unterscheiden;
- Komponenten-, Integrations-, System- und Abnahmetest zuordnen;
- funktionale und nichtfunktionale Testarten auswählen;
- Black-Box-, White-Box- und erfahrungsbasierte Verfahren unterscheiden;
- Äquivalenzklassen und Grenzwerte für Testdaten bilden;
- vollständige Testfälle, Fehlerberichte und Testprotokolle erstellen;
- Retest und Regressionstest korrekt einsetzen.

## 2. Prüfungsminimum — 15 Minuten

1. Qualität bedeutet Erfüllung festgelegter und vorausgesetzter Anforderungen, nicht maximale Ausstattung.
2. Qualitätssicherung wirkt planend und vorbeugend; Qualitätskontrolle prüft konkrete Ergebnisse.
3. `statisch`: ohne Programmausführung, etwa Review; `dynamisch`: durch Ausführung mit Testdaten.
4. Teststufen: Komponente → Integration → System → Abnahme.
5. Funktionstest prüft Funktionen; nichtfunktionale Tests prüfen etwa Leistung, Sicherheit oder Benutzbarkeit.
6. `Black Box` nutzt Ein-/Ausgaben und Spezifikation; `White Box` nutzt interne Struktur und Pfade.
7. Äquivalenzklassen fassen gleichartig behandelte Eingaben zusammen.
8. Grenzwertanalyse prüft Werte direkt an und neben Grenzen.
9. Ein Testfall braucht Voraussetzung, Eingabe/Schritte, erwartetes Ergebnis und tatsächliches Ergebnis.
10. `Retest` prüft die konkrete Fehlerkorrektur; `Regressionstest` sucht Nebenwirkungen in bereits funktionierenden Bereichen.

> Der Abnahmetest wird gegen vereinbarte Abnahmekriterien durchgeführt, weil nicht die technische Meinung des Entwicklers, sondern die nachweisbare Erfüllung der Anforderungen entscheidet.

## 3. Grundlagen

### 3.1 Qualität und Qualitätsarbeit

| Begriff | Zweck | Beispiel |
|---|---|---|
| Qualität | Grad der Anforderungserfüllung | Anmeldung dauert höchstens 3 Sekunden |
| Qualitätsmanagement (QM) | Ziele, Rollen und Prozesse steuern | Teststrategie und Verantwortliche festlegen |
| Qualitätssicherung (QS) | Vertrauen durch geplante, vorbeugende Maßnahmen schaffen | Reviewregeln, Testplanung, Standards |
| Qualitätskontrolle | konkretes Ergebnis prüfen | Messung der Anmeldezeit |

Ein Produkt kann technisch leistungsfähig und trotzdem ungeeignet sein, wenn es Kundenanforderungen, Datenschutz, Barrierefreiheit oder Betriebskosten verfehlt.

### 3.2 PDCA und Fehlerkosten

```text
Plan  → Qualitätsziele, Kriterien und Verfahren festlegen
Do    → Lösung entwickeln und Maßnahmen umsetzen
Check → prüfen, messen und Soll mit Ist vergleichen
Act   → Fehlerursachen beheben und Prozess verbessern
```

Früh gefundene Unklarheiten sind meist günstiger als Fehler nach Auslieferung. Ein Review der Anforderung „schnell“ kann verhindern, dass später ohne messbares Soll getestet wird.

### 3.3 Gute Qualitätskriterien

Ein Kriterium soll eindeutig, relevant und prüfbar sein.

```text
ungeeignet: Die Anmeldung ist schnell.
besser:      95 % der Anmeldungen sind bei 100 gleichzeitigen
             Benutzern innerhalb von 3 Sekunden erfolgreich.
```

Zum Kriterium gehören Messbedingung, Messgröße, Sollwert und erlaubte Abweichung. Funktionale Kriterien beschreiben, **was** das System leistet. Nichtfunktionale Kriterien beschreiben, **wie gut** oder unter welchen Bedingungen es arbeitet.

### 3.4 Ursachenanalyse, QM-Modelle und Wahrscheinlichkeit

Die **6-W-Fragen** strukturieren einen Fehler: Wer, was, wann, wo, wie und warum beziehungsweise welche Auswirkung? Ein **Ishikawa-Diagramm** sammelt mögliche Ursachen in Kategorien, zum Beispiel Mensch, Maschine, Methode, Material, Messung und Umwelt. Vermutungen werden anschließend mit Logs, Messwerten oder Tests überprüft; das Diagramm beweist keine Ursache.

ISO-9000-Familie, EFQM und Six Sigma sind verschiedene Qualitätsansätze. Für AP1 genügt ohne ausdrückliche Vertiefung: Anforderungen/Prozesse systematisch beherrschen, Ergebnisse messen, Ursachen reduzieren und kontinuierlich verbessern.

Einfache Häufigkeitsschätzung:

```text
Fehleranteil p = fehlerhafte Einheiten / geprüfte Einheiten
erwartete Fehlerzahl = Stückzahl × p
```

Beispiel: 8 Fehler bei 400 Prüfungen ergeben `p = 2 %`; bei unveränderten Bedingungen wären bei 1.000 Fällen ungefähr 20 Fehler zu erwarten. Das ist eine Schätzung, keine Garantie und keine Aussage über die Fehlerursache.

## 4. Teststufen, Testarten und Verfahren

### 4.1 Statisch und dynamisch

`Statische Prüfung` untersucht Arbeitsergebnisse ohne Ausführung:

- Review von Anforderungen, Code oder Dokumentation;
- Checkliste, Walkthrough oder Inspektion;
- statische Codeanalyse.

`Dynamischer Test` führt Software oder System aus und vergleicht Ist mit Soll.

Statische und dynamische Verfahren ergänzen sich. Ein Review kann fehlende Anforderungen finden; ein Laufzeittest kann tatsächliche Antwortzeiten messen.

### 4.2 Teststufen

| Teststufe | Prüfobjekt | typischer Fehler |
|---|---|---|
| Komponenten-/Unittest | einzelne Funktion oder Klasse | falsche Berechnung |
| Integrationstest | Schnittstellen mehrerer Komponenten | falsches Datenformat |
| Systemtest | vollständiges System gegen Systemanforderungen | Geschäftsprozess oder Leistung fehlerhaft |
| Abnahmetest | Lösung gegen Kunden- und Abnahmekriterien | vereinbarter Nutzen nicht erfüllt |

Die Stufe beschreibt das Prüfobjekt, nicht automatisch die ausführende Person. Ein Kunde kann am Abnahmetest mitwirken; Entwickler können vorbereitende Systemtests durchführen.

### 4.3 Funktionale und nichtfunktionale Testarten

- `Funktionstest`: Anmeldung, Berechnung, Speichern, Export.
- `Performancetest`: Antwortzeit, Durchsatz, Ressourcenverbrauch.
- `Lasttest`: Verhalten unter erwarteter oder steigender Last.
- `Sicherheitstest`: Berechtigungen, Fehlkonfigurationen, Schutzmechanismen.
- `Usabilitytest`: Verständlichkeit und effiziente Bedienung.
- `Barrierefreiheitstest`: Nutzung etwa mit Tastatur oder Screenreader.
- `Kompatibilitätstest`: unterstützte Geräte, Browser, Betriebssysteme.
- `Recovery-/Wiederherstellungstest`: Verhalten nach Ausfall und Restore.

### 4.4 Black Box, White Box und Erfahrung

| Ansatz | Grundlage | Beispiel |
|---|---|---|
| Black Box | Spezifikation und sichtbares Verhalten | Grenzwerte eines Eingabefelds |
| White Box | interne Struktur, Anweisungen und Verzweigungen | beide Zweige einer Bedingung ausführen |
| erfahrungsbasiert | Wissen über typische Fehler | Error Guessing bei leeren Feldern |

Black Box bedeutet nicht „planlos“. Testdaten werden systematisch aus Anforderungen abgeleitet. White Box beweist trotz hoher Pfadabdeckung nicht, dass alle Anforderungen richtig sind.

### 4.5 Äquivalenzklassen und Grenzwertanalyse

Anforderung: Eine zulässige Stückzahl liegt zwischen `1` und `100` einschließlich.

Äquivalenzklassen:

```text
ungültig: x < 1
gültig:   1 ≤ x ≤ 100
ungültig: x > 100
```

Repräsentanten können `0`, `50`, `101` sein. Grenzwertanalyse prüft zusätzlich die direkten Nachbarn:

```text
0 | 1 | 2     und     99 | 100 | 101
```

Wenn nur ganze Zahlen erlaubt sind, werden außerdem Dezimalwert, Text, Leerwert und extrem große Eingabe als relevante Klassen geprüft.

### 4.6 Retest und Regression

Nach einer Fehlerkorrektur:

1. `Retest/Bestätigungstest`: derselbe fehlerauslösende Fall muss nun bestehen.
2. `Regressionstest`: angrenzende und bereits funktionierende Bereiche werden erneut geprüft, weil die Änderung Nebenwirkungen haben kann.

Ein bestandener Retest ersetzt keinen angemessenen Regressionstest.

## 5. Anwendungsfall: Arbeitsplatz-Anmeldung testen

Anforderung:

> Bei 100 gleichzeitig aktiven Testbenutzern müssen mindestens 95 von 100 Anmeldungen innerhalb von 3 Sekunden erfolgreich sein. Nach fünf falschen Passworteingaben wird das Konto für 15 Minuten gesperrt.

### 5.1 Testfall für Leistung

| Feld | Inhalt |
|---|---|
| ID | PERF-LOGIN-01 |
| Voraussetzung | produktionsnahe Umgebung, 100 Testkonten, synchronisierte Zeit |
| Schritte | 100 gültige Anmeldungen gleichzeitig starten |
| Soll | mindestens 95 erfolgreich und jeweils ≤ 3 s |
| Ist | 92 erfolgreich ≤ 3 s, 8 zwischen 3,1 und 4,4 s |
| Status | nicht bestanden |

Berechnung:

```text
Erfolgsquote = 92 / 100 × 100 % = 92 %
Soll = mindestens 95 %
Abweichung = 92 % − 95 % = −3 Prozentpunkte
```

### 5.2 Grenztests für Kontosperre

```text
4 Fehlversuche → Konto noch nicht gesperrt
5 Fehlversuche → Konto für 15 Minuten gesperrt
6. Versuch     → Anmeldung trotz richtigem Passwort abgewiesen
nach 14:59 min → noch gesperrt
nach 15:00 min → Anmeldung wieder nach Regel möglich
```

### 5.3 Fehlerbericht

Ein brauchbarer Fehlerbericht enthält:

- ID, Titel, Umgebung und Version;
- nachvollziehbare Schritte und Testdaten;
- erwartetes und tatsächliches Ergebnis;
- Belege wie Zeitstempel oder Logauszug;
- Auswirkung/Schweregrad und sachlich begründete Priorität;
- Status und Verknüpfung zum betroffenen Testfall.

`Schweregrad` beschreibt die Auswirkung. `Priorität` beschreibt, wie dringend bearbeitet werden soll. Ein Schreibfehler auf der Startseite kann geringe Schwere, aber wegen Außenwirkung hohe Priorität haben.

## 6. Prüfungsformulierungen

> Die Anforderung wird messbar formuliert, indem Last, Messgröße, Grenzwert und Erfolgsquote festgelegt werden.

> Für die Stückzahl werden die Werte 0, 1, 2 sowie 99, 100 und 101 getestet, da Fehler besonders häufig direkt an Bereichsgrenzen auftreten.

> Nach der Korrektur wird zuerst ein Retest und anschließend ein Regressionstest durchgeführt, weil neben dem ursprünglichen Fehler auch unerwünschte Nebenwirkungen ausgeschlossen werden müssen.

> Der Testfall ist nicht bestanden, da nur 92 % statt der geforderten 95 % der Anmeldungen den Zeitgrenzwert einhalten.

## 7. Typische Prüfungsfallen

- Qualität mit möglichst vielen Funktionen gleichsetzen.
- QS und reine Endkontrolle gleichsetzen.
- „schnell“, „sicher“ oder „benutzerfreundlich“ ohne Messkriterium lassen.
- Teststufe und Testart verwechseln: Systemtest ist eine Stufe, Performancetest eine Art.
- Review als dynamischen Test bezeichnen.
- nur gültige Eingaben testen.
- bei Grenzwerten nur den Grenzwert, nicht seine Nachbarn prüfen.
- tatsächliches Ergebnis vor Testausführung erfinden.
- Retest und Regressionstest verwechseln.
- Schweregrad automatisch mit Bearbeitungspriorität gleichsetzen.
- aus „keine Fehler gefunden“ auf Fehlerfreiheit schließen.
- Prozent und Prozentpunkte verwechseln.

## 8. Selbsttest

1. Grenze QM, QS und Qualitätskontrolle ab.
2. Unterscheide statische und dynamische Prüfung mit je einem Beispiel.
3. Nenne die vier Teststufen in sinnvoller Reihenfolge.
4. Ordne zu: Antwortzeitmessung, Schnittstellenprüfung, Kundenfreigabe.
5. Erkläre Black Box und White Box.
6. Bilde Äquivalenzklassen für ein Alter von 18 bis 67 einschließlich.
7. Nenne Grenzwerte und Nachbarn für dieselbe Anforderung.
8. Welche Pflichtfelder braucht ein Testfall?
9. Grenze Retest und Regressionstest ab.
10. Berechne die Erfolgsquote bei 186 bestandenen von 200 Tests.
11. Begründe, warum 100 % Anweisungsabdeckung keine Fehlerfreiheit beweist.
12. Formuliere „Der Export ist schnell“ prüfbar um.

<details>
<summary>Lösungen anzeigen</summary>

1. QM steuert den Gesamtrahmen; QS plant vorbeugende Maßnahmen; Kontrolle prüft ein konkretes Ergebnis.
2. Statisch ohne Ausführung, etwa Review; dynamisch durch Ausführung, etwa Antwortzeitmessung.
3. Komponente, Integration, System, Abnahme.
4. Performancetest; Integrationstest; Abnahmetest.
5. Black Box leitet Tests aus Spezifikation und Verhalten ab; White Box aus interner Struktur und Pfaden.
6. `< 18` ungültig, `18–67` gültig, `> 67` ungültig.
7. `17, 18, 19, 66, 67, 68`.
8. ID, Voraussetzung, Schritte/Eingabe, Soll, Ist, Status; Beleg/Umgebung nach Bedarf.
9. Retest bestätigt die Korrektur; Regression prüft Nebenwirkungen.
10. `186 / 200 × 100 % = 93 %`.
11. Nicht ausgeführte Datenkombinationen, fehlende Anforderungen und ungeprüfte Qualitätsmerkmale können Fehler enthalten.
12. Zum Beispiel: „Eine PDF-Datei mit 100 Seiten wird unter definierter Last in höchstens 5 Sekunden erzeugt.“

</details>

## 9. Quellen und Abgleich

- [ISTQB CTFL v4.0](https://istqb.org/certifications/certified-tester-foundation-level-ctfl-v4-0/) — Testgrundlagen, Teststufen, statische Tests, Testverfahren und Fehlermanagement; offizieller Lehrplan v4.0.1 ist dort verlinkt.
- [ISO/IEC 25010:2023](https://www.iso.org/standard/78176.html) — Produktqualitätsmodell; Normtext ist kostenpflichtig, daher werden keine vollständigen Normanforderungen behauptet.
- [FIAusbV § 9](https://www.gesetze-im-internet.de/fiausbv/__9.html) — AP1 verlangt unter anderem Einrichtung, Test, Datenschutz, IT-Sicherheit, Qualität sowie Leistungskontrolle und Protokollierung.

## 10. Offene Prüfpunkte für den Unterricht

- Welche Begriffe für Teststufen und Testverfahren verwendet der aktuelle WBS-Aufgabensatz?
- Werden Äquivalenzklassen und Grenzwertanalyse rechnerisch oder nur begrifflich erwartet?
- Welche Felder verlangt die WBS-Vorlage im Test- und Fehlerprotokoll?
