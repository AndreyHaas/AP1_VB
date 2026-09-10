---
pruefung: AP1
thema: Künstliche Intelligenz
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Deutsch
gegenstueck: ../ru/01-ki-grundlagen-einsatz-bewertung-risiken-und-datenschutz-ru.md
---

# KI: Grundlagen, Einsatz, Bewertung, Risiken und Datenschutz

## 1. Lernziele

Du kannst:

- KI, maschinelles Lernen und generative KI unterscheiden;
- Training, Inferenz, Modell, Prompt und Ausgabe erklären;
- geeignete betriebliche Anwendungsfälle auswählen;
- Nutzen, Qualität, Kosten, Datenschutz und Informationssicherheit bewerten;
- Halluzination, Bias, Automation Bias, Datenabfluss und Prompt Injection erkennen;
- einen kontrollierten KI-Einsatz mit menschlicher Prüfung planen;
- den risikobasierten Ansatz des EU AI Act auf Grundniveau einordnen.

## 2. Prüfungsminimum — 15 Minuten

1. KI ist ein Oberbegriff; maschinelles Lernen erzeugt Modelle aus Daten; generative KI erstellt neue Inhalte.
2. Training passt Modellparameter an; Inferenz verarbeitet neue Eingaben mit einem trainierten Modell.
3. KI-Ausgabe ist ein Ergebnis/Vorschlag, kein Beweis für sachliche Richtigkeit.
4. `Halluzination`: plausible, aber falsche oder unbelegte Ausgabe.
5. `Bias`: systematische Verzerrung durch Daten, Modell, Messung oder Nutzung.
6. Nur freigegebene Systeme und zulässige, minimierte Daten verwenden.
7. Vertrauliche oder personenbezogene Daten nicht ungeprüft in externe KI-Dienste eingeben.
8. Kritische Ergebnisse fachlich prüfen, Quellen verifizieren und Freigabe dokumentieren.
9. AI Act und DSGVO können gleichzeitig gelten; der konkrete Anwendungsfall entscheidet.
10. Menschliche Aufsicht muss wirksam sein und darf nicht nur formal bestehen.

> Die KI-Ausgabe wird vor der Kundenkommunikation fachlich geprüft, da ein sprachlich plausibler Text falsche Tatsachen oder ungeeignete Handlungsempfehlungen enthalten kann.

## 3. Grundlagen

### 3.1 Begriffe

| Begriff | Bedeutung | Beispiel |
|---|---|---|
| KI-System | verarbeitet Eingaben und erzeugt Ausgaben für Ziele | Klassifikation, Empfehlung |
| maschinelles Lernen | lernt Muster/Parameter aus Daten | Spamklassifikation |
| generative KI | erzeugt neue Inhalte | Text, Bild, Code |
| Modell | gelernte mathematische/technische Repräsentation | Sprachmodell |
| Trainingsdaten | Daten zur Anpassung des Modells | markierte Tickets |
| Inferenz | Anwendung des trainierten Modells | neues Ticket klassifizieren |
| Prompt | Eingabe/Anweisung an generatives Modell | „Fasse das Ticket zusammen“ |

Nicht jede Automatisierung ist KI. Eine feste `if/else`-Regel kann sinnvoll sein, ist aber kein gelerntes Modell.

### 3.2 Lernarten auf Grundniveau

- `überwachtes Lernen`: Beispiele enthalten Zielwerte/Labels; etwa Ticketkategorie.
- `unüberwachtes Lernen`: sucht Strukturen ohne vorgegebene Zielklasse; etwa Gruppierung ähnlicher Fälle.
- `bestärkendes Lernen`: ein Agent lernt durch Rückmeldungen/Belohnungen in einer Umgebung.
- `generatives Modell`: erzeugt neue Daten entsprechend gelernter Muster.

Diese Kategorien können in Systemen kombiniert sein. Ein Chatbot ist nicht automatisch nur eine einzige Lernart.

### 3.3 Training und Inferenz

```text
Daten → Aufbereitung → Training → Modell → Evaluation → Freigabe
                                                |
Neue Eingabe → Vorverarbeitung → Inferenz → Ausgabe → menschliche/technische Kontrolle
```

Eine gute Trainingsmetrik garantiert keine gute Produktion. Datenverteilung, Eingaben und Zweck können sich ändern (`Drift`).

### 3.4 Deterministisch und probabilistisch

Klassische Regeln liefern bei gleichen Eingaben gewöhnlich reproduzierbare Ergebnisse. Generative Modelle können abhängig von Parametern und Systemversion variieren. Deshalb müssen Akzeptanzkriterien auf Ergebnisqualität statt auf exakt gleichen Wortlaut zielen.

## 4. Nutzen, Qualität und Risiken

### 4.1 Geeignete Einsatzfelder

- Supporttickets vorsortieren;
- Texte zusammenfassen oder übersetzen;
- Entwürfe für Dokumentation erstellen;
- Code- und Testfallvorschläge erzeugen;
- Anomalien priorisieren;
- Wissenssuche mit Quellen unterstützen;
- Barrierefreiheit durch alternative Formulierungen unterstützen.

Hohe Eignung besteht bei klarer Aufgabe, prüfbarem Ergebnis, beherrschbarem Fehler und geeigneten Daten. Geringere Eignung besteht bei nicht rückholbaren Entscheidungen über Menschen ohne wirksame Kontrolle.

### 4.2 Qualitätsbewertung

| Kriterium | Frage |
|---|---|
| Richtigkeit | stimmt das Ergebnis fachlich? |
| Vollständigkeit | fehlen wichtige Angaben? |
| Relevanz | beantwortet es die Aufgabe? |
| Robustheit | bleibt Qualität bei Varianten stabil? |
| Fairness | werden Gruppen systematisch benachteiligt? |
| Nachvollziehbarkeit | sind Quelle, Version und Prüfung dokumentiert? |
| Sicherheit | widersteht der Prozess Manipulation und Datenabfluss? |
| Wirtschaftlichkeit | übersteigt der Nutzen Gesamtaufwand und Risiko? |

Für eine Klassifikation können Precision und Recall gegensätzliche Fehlerwirkungen sichtbar machen. Die passende Metrik folgt dem Schaden eines False Positive beziehungsweise False Negative.

### 4.3 Typische Risiken

`Halluzination`: erfundene Fakten, Quellen oder Funktionen.

`Bias`: verzerrte Daten oder Prozessannahmen führen zu systematischen Nachteilen.

`Automation Bias`: Menschen übernehmen den Vorschlag, weil er automatisch erzeugt wurde.

`Prompt Injection`: fremder Inhalt versucht, Systemanweisungen zu überschreiben oder Daten offenzulegen.

`Datenabfluss`: Prompts, Uploads, Logs oder Ausgaben enthalten Geheimnisse/personenbezogene Daten.

`Unsicherer Code`: erzeugter Code enthält Schwachstellen, falsche Abhängigkeiten oder Lizenzprobleme.

`Drift`: reale Daten oder Anforderungen verändern sich, während das Modell gleich bleibt.

### 4.4 Maßnahmen

1. Zweck, Eigentümer und Risikoklasse bestimmen.
2. Daten klassifizieren, minimieren und Rechtsgrundlage/Freigabe prüfen.
3. Anbieter, Speicherort, Aufbewahrung, Training mit Eingaben und Vertragslage prüfen.
4. repräsentative Testfälle und Mindestqualität definieren.
5. Rollen, Berechtigungen und technische Schnittstellen begrenzen.
6. Quellen oder Referenzdaten bereitstellen, wenn Verifikation nötig ist.
7. menschliche Prüfung und Eskalation für kritische Fälle festlegen.
8. Versionen, Eingaben soweit zulässig, Ergebnisse, Fehler und Freigaben protokollieren.
9. Betrieb überwachen, Drift/Incidents behandeln und Abschaltmöglichkeit vorsehen.

## 5. Recht, Datenschutz und Anwendungsfall

### 5.1 DSGVO

Bei personenbezogenen Daten sind unter anderem zu prüfen:

- Zweck und Rechtsgrundlage;
- Datenminimierung und Transparenz;
- Rollen von Verantwortlichem und Auftragsverarbeiter;
- Empfänger, Drittlandtransfer und Aufbewahrung;
- technische und organisatorische Maßnahmen;
- Betroffenenrechte;
- Datenschutz-Folgenabschätzung bei voraussichtlich hohem Risiko;
- Grenzen automatisierter Einzelentscheidungen.

Pseudonymisierung reduziert Risiken, macht Daten aber nicht automatisch anonym. Auch ein „internes“ KI-System kann personenbezogene Daten verarbeiten.

### 5.2 EU AI Act — Stand 10.09.2026

Der AI Act nutzt einen risikobasierten Ansatz:

- verbotene Praktiken;
- Hochrisiko-Anwendungen mit besonderen Pflichten;
- Transparenzpflichten für bestimmte Systeme/Inhalte;
- minimale oder geringe Risiken;
- zusätzliche Regeln für General-Purpose-AI-Modelle.

Der konkrete Zweck und die Rolle (`Provider`, `Deployer` usw.) bestimmen Pflichten. Nach der offiziellen EU-Übersicht gilt der AI Act grundsätzlich seit 02.08.2026; einzelne Bereiche haben abweichende Übergangsfristen. AI-Literacy-Pflichten und wesentliche Verbote gelten bereits seit 02.02.2025, GPAI-Regeln seit 02.08.2025. Die Einordnung muss gegen die jeweils aktuelle Rechtslage geprüft werden.

AI Act ersetzt weder DSGVO noch Urheber-, Arbeits- oder Sicherheitsrecht.

### 5.3 Anwendungsfall: Ticketassistent

Ein Unternehmen will Kundentickets zusammenfassen, kategorisieren und Antwortentwürfe erzeugen.

Risiken:

- Tickets enthalten Namen, Vertrags- und technische Zugangsdaten;
- falsche Kategorie verzögert kritische Störung;
- Antwortentwurf erfindet Vertragszusage;
- manipulierte Tickettexte enthalten Prompt Injection;
- Beschäftigte übernehmen Vorschläge ungeprüft.

Kontrollierter Entwurf:

1. Zugangsdaten/Secrets vor Verarbeitung blockieren; Daten minimieren.
2. freigegebenen Dienst und Vertrag/Verarbeitung prüfen.
3. Kategorien und Eskalationsregeln fest definieren.
4. kritische Tickets niemals allein durch KI herunterpriorisieren.
5. Entwürfe deutlich markieren und vor Versand durch Mitarbeitende freigeben.
6. Wissensquellen versionieren und Zitate/Belege verlangen.
7. Qualität getrennt nach Kategorie messen; False Negatives kritischer Fälle beobachten.
8. Feedback, Incidents, Kosten und Modelländerungen überwachen.

Beispielkennzahlen:

```text
200 Testtickets
170 korrekt kategorisiert
Genauigkeit = 170 / 200 × 100 % = 85 %
```

85 % allein reicht nicht zur Freigabe. Wenn alle zehn Sicherheitsvorfälle falsch eingestuft wurden, ist das System trotz guter Gesamtgenauigkeit ungeeignet.

## 6. Prüfungsformulierungen

> Training bezeichnet die Anpassung eines Modells anhand von Daten, während bei der Inferenz das trainierte Modell neue Eingaben verarbeitet.

> Personenbezogene Kundendaten werden minimiert und nur in einem freigegebenen System verarbeitet, da sowohl Zweck, Rechtsgrundlage als auch Schutzmaßnahmen eingehalten werden müssen.

> Die Gesamtgenauigkeit genügt nicht als Qualitätsnachweis, weil besonders schädliche Fehler in einer kleinen, aber kritischen Ticketklasse verborgen bleiben können.

> Eine menschliche Freigabe bleibt erforderlich, da generative KI plausible, aber sachlich falsche oder rechtlich unzulässige Aussagen erzeugen kann.

## 7. Typische Prüfungsfallen

- KI, ML und generative KI gleichsetzen.
- Training und Inferenz verwechseln.
- flüssige Sprache als Wahrheitsbeweis ansehen.
- nur Genauigkeit, nicht Fehlerfolgen einzelner Klassen bewerten.
- personenbezogene Daten mit „öffentlich auffindbar“ automatisch als frei nutzbar behandeln.
- Pseudonymisierung mit Anonymisierung verwechseln.
- menschliche Kontrolle behaupten, obwohl Mitarbeitende weder Zeit noch Befugnis zur Korrektur haben.
- Prompt Injection als normalen Benutzerwunsch behandeln.
- Anbieterangabe „kein Training“ mit vollständiger Datenschutzkonformität gleichsetzen.
- KI-Ausgabe oder generierten Code ungeprüft übernehmen.
- AI Act als Ersatz für DSGVO ansehen.
- zeitabhängige AI-Act-Fristen ohne Stand-Datum nennen.

## 8. Selbsttest

1. Unterscheide KI, ML und generative KI.
2. Unterscheide Training und Inferenz.
3. Was ist eine Halluzination?
4. Was bedeutet Automation Bias?
5. Nenne vier geeignete betriebliche Einsatzfelder.
6. Warum reicht Gesamtgenauigkeit allein nicht?
7. Nenne vier Datenschutzprüfungen vor Nutzung externer KI.
8. Wie kann Prompt Injection in einem Kundenticket wirken?
9. Entwirf drei Kontrollen für KI-generierten Code.
10. Ordne den AI Act auf Grundniveau risikobasiert ein.
11. Berechne die Genauigkeit bei 450 korrekten von 500 Fällen.
12. Bewerte: „Menschliche Kontrolle löst jedes KI-Risiko.“

<details>
<summary>Lösungen anzeigen</summary>

1. KI Oberbegriff; ML lernt Muster aus Daten; generative KI erzeugt neue Inhalte.
2. Training passt Modell an; Inferenz wendet es auf neue Eingaben an.
3. Plausible, aber falsche oder unbelegte Ausgabe.
4. Menschen vertrauen automatischen Vorschlägen zu stark.
5. Klassifikation, Zusammenfassung, Entwurf, Übersetzung, Testideen oder Suche; vier genügen.
6. Kritische Klassen können viele schädliche Fehler enthalten, obwohl die Mehrheit stimmt.
7. Zweck/Rechtsgrundlage, Minimierung, Anbieter/AVV, Speicherort/Transfer, Aufbewahrung, TOM, Rechte; vier genügen.
8. Fremdinhalt versucht, Anweisungen zu überschreiben, Geheimnisse abzufragen oder Werkzeugaktionen auszulösen.
9. Review, Tests/Sicherheitsanalyse, Abhängigkeiten/Lizenzen prüfen, isoliert ausführen; drei genügen.
10. Verbote, Hochrisiko, Transparenz, geringe/minimale Risiken und GPAI-Regeln je nach Zweck/Rolle.
11. `450 / 500 × 100 % = 90 %`.
12. Falsch; Kontrolle muss kompetent, unabhängig, rechtzeitig und technisch wirksam sein, Restrisiken bleiben.

</details>

## 9. Quellen und Abgleich

- [EU-Kommission: AI Act und Anwendungstermine](https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai) — aktuelle offizielle Übersicht, Stand der Kapitelprüfung 10.09.2026.
- [Verordnung (EU) 2024/1689](https://eur-lex.europa.eu/eli/reg/2024/1689/oj) — Primärtext des AI Act; Änderungen und Übergangsrecht zusätzlich prüfen.
- [DSGVO](https://eur-lex.europa.eu/eli/reg/2016/679/oj) — Primärquelle zum Datenschutz.
- [NIST AI Risk Management Framework](https://www.nist.gov/itl/ai-risk-management-framework) — freiwilliger risikobasierter Rahmen; AI RMF 1.0 befindet sich laut NIST in Überarbeitung.

## 10. Offene Prüfpunkte für den Unterricht

- Welche KI-Begriffe und konkreten Fälle verlangt der aktuelle WBS-Aufgabensatz?
- Wird der AI Act nur begrifflich oder mit Rollen/Risikoklassen geprüft?
- Welche Datenschutz-Fälle sollen ohne juristische Detailprüfung gelöst werden?
