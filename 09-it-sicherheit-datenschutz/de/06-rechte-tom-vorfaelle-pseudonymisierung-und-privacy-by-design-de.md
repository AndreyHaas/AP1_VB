---
pruefung: AP1
thema: Datenschutzmaßnahmen und Betroffenenrechte
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Deutsch
gegenstueck: ../ru/06-rechte-tom-vorfaelle-pseudonymisierung-und-privacy-by-design-ru.md
---

# Datenschutz: Rechte, TOM, Vorfälle, Pseudonymisierung und Privacy by Design

## 1. Lernziele

Du kannst:

- wichtige Betroffenenrechte unterscheiden und situationsbezogen anwenden;
- Widerruf, Widerspruch, Löschung und Einschränkung abgrenzen;
- technische und organisatorische Maßnahmen risikobasiert auswählen;
- Zutritts-, Zugangs-, Zugriffs-, Übertragungs-, Eingabe- und Verfügbarkeitskontrolle unterscheiden;
- eine Datenschutzverletzung erkennen, eindämmen, dokumentieren und eskalieren;
- Meldewege und Risikoschwellen nach Art. 33/34 DSGVO erklären;
- Pseudonymisierung und Anonymisierung zuverlässig trennen;
- Privacy by Design und Privacy by Default in Systemanforderungen übersetzen;
- die Wirksamkeit von TOM testen und nachweisen.

## 2. Prüfungsminimum — 15 Minuten

1. Rechte umfassen Information, Auskunft, Berichtigung, Löschung, Einschränkung, Datenübertragbarkeit, Widerspruch, Widerruf, Beschwerde und Schutz bei bestimmten automatisierten Entscheidungen.
2. Rechte sind nicht absolut; Identität, Voraussetzungen und gesetzliche Ausnahmen werden geprüft.
3. Anträge werden grundsätzlich unverzüglich und regelmäßig innerhalb eines Monats bearbeitet; zulässige Verlängerung muss mit Gründen mitgeteilt werden.
4. TOM müssen dem Risiko angemessen sein und ihre Wirksamkeit regelmäßig geprüft werden.
5. Zutritt = Raum, Zugang = IT-System, Zugriff = Daten/Funktionen.
6. Datenschutzverletzung kann Verlust, Vernichtung, Veränderung, Offenlegung oder unbefugten Zugang betreffen.
7. Auftragsverarbeiter informiert Verantwortlichen unverzüglich; dieser dokumentiert jeden Vorfall.
8. Risiko → Behörde grundsätzlich möglichst binnen 72 Stunden; hohes Risiko → zusätzlich Betroffene unverzüglich, soweit keine Ausnahme greift.
9. Pseudonymisierte Daten bleiben personenbezogen; echte anonymisierte Daten sind mit vernünftigen Mitteln keiner Person mehr zuordenbar.
10. Design baut Datenschutz in Architektur/Lebenszyklus ein; Default setzt datenschutzfreundliche Ausgangswerte.

> Der Vorfall wird unabhängig von einer möglichen Meldepflicht intern dokumentiert, damit Bewertung, Maßnahmen und Entscheidung nachgewiesen werden können.

## 3. Betroffenenrechte und TOM

### 3.1 Rechte im Überblick

| Recht | Zweck | Beispiel |
|---|---|---|
| Information | transparente Hinweise bei Erhebung/Verarbeitung | Datenschutzhinweis |
| Auskunft | erfahren, ob und welche Daten verarbeitet werden | Kopie und Verarbeitungsangaben |
| Berichtigung | falsche/unvollständige Daten korrigieren | Adresse ändern |
| Löschung | Daten bei erfüllten Voraussetzungen entfernen | Zweck entfallen |
| Einschränkung | Verarbeitung vorübergehend begrenzen | Richtigkeit wird geprüft |
| Datenübertragbarkeit | bestimmte bereitgestellte Daten strukturiert erhalten/übermitteln | Anbieterwechsel |
| Widerspruch | gegen bestimmte Verarbeitungen vorgehen | Direktwerbung |
| Widerruf | Einwilligung für Zukunft zurücknehmen | Newsletter |
| Beschwerde | Aufsichtsbehörde anrufen | vermuteter Rechtsverstoß |
| automatisierte Entscheidung | Schutz bei bestimmten ausschließlich automatisierten Entscheidungen | erhebliche Vertragswirkung |

Vor Erfüllung darf eine angemessene Identitätsprüfung nötig sein. Es dürfen dafür aber nicht ohne Grund noch mehr Daten gesammelt werden.

### 3.2 Widerruf, Widerspruch und Löschung

```text
Widerruf    → betrifft eine Einwilligung; Wirkung für die Zukunft
Widerspruch → richtet sich gegen bestimmte andere Verarbeitungen
Löschung    → entfernt Daten, wenn Voraussetzungen erfüllt und keine Ausnahme gilt
Einschränkung → Daten bleiben, Verarbeitung wird begrenzt
```

Eine gesetzliche Aufbewahrungspflicht kann sofortige Löschung verhindern. Dann werden Daten für unzulässige andere Zwecke gesperrt und nach Fristablauf gelöscht.

### 3.3 TOM nach Art. 32

Auswahl berücksichtigt Risiko, Stand der Technik, Implementierungskosten sowie Art, Umfang, Umstände und Zwecke. Art. 32 nennt unter anderem:

- Pseudonymisierung und Verschlüsselung;
- dauerhafte Vertraulichkeit, Integrität, Verfügbarkeit und Belastbarkeit;
- zeitnahe Wiederherstellbarkeit nach Zwischenfall;
- Verfahren zur regelmäßigen Prüfung und Bewertung der Wirksamkeit.

### 3.4 Klassische Kontrollbegriffe

| Kontrolle | schützt | Beispiel |
|---|---|---|
| Zutrittskontrolle | physische Räume | Karte am Serverraum |
| Zugangskontrolle | Nutzung von Systemen | MFA, Kontosperre |
| Zugriffskontrolle | konkrete Daten/Funktionen | RBAC, Least Privilege |
| Weitergabe-/Übertragungskontrolle | Datenübermittlung | TLS, Empfängerprüfung, Protokoll |
| Eingabekontrolle | Nachvollziehbarkeit von Änderungen | Audit-Log mit Nutzer/Zeit |
| Verfügbarkeitskontrolle | Ausfall und Verlust | Backup, Redundanz, Restore-Test |
| Trennungsgebot | Zwecke/Mandanten | logische Mandantentrennung |

Diese Begriffe sind eine verbreitete Systematik, nicht der wörtliche Aufbau von Art. 32. In Prüfungsantworten Maßnahme, Risiko und Schutzwirkung verbinden.

## 4. Datenschutzverletzung, Pseudonymisierung und Privacy

### 4.1 Was ist eine Datenschutzverletzung?

Eine Sicherheitsverletzung führt unbeabsichtigt oder unrechtmäßig zur Vernichtung, zum Verlust, zur Veränderung, zur unbefugten Offenlegung oder zum unbefugten Zugang zu personenbezogenen Daten.

Beispiele:

- E-Mail mit Personaldaten an falschen Empfänger;
- verlorener unverschlüsselter Datenträger;
- Ransomware macht Patientendaten unzugänglich;
- unbefugte Änderung eines Kundendatensatzes;
- öffentliche Cloudfreigabe einer Datenbank.

### 4.2 Reaktionsablauf

1. Sicherheit und weitere Schäden eindämmen, Beweise erhalten.
2. Verantwortliche interne Rollen sofort informieren.
3. Art, Umfang, Daten, Betroffene und Folgen feststellen.
4. bestehende Schutzmaßnahmen und Identifizierbarkeit bewerten.
5. Risiko für Rechte und Freiheiten bestimmen.
6. Entscheidung, Gründe, Fakten und Maßnahmen dokumentieren.
7. erforderliche Meldungen fristgerecht veranlassen.
8. Ursachen beheben, Betroffene unterstützen und Wirksamkeit prüfen.

```text
Auftragsverarbeiter → unverzüglich Verantwortlichen informieren
kein voraussichtliches Risiko → dokumentieren, regelmäßig keine Behördenmeldung
Risiko → Aufsichtsbehörde möglichst binnen 72 Stunden ab Bekanntwerden
hohes Risiko → zusätzlich Betroffene unverzüglich, soweit keine Ausnahme
```

Fehlen nach 72 Stunden Informationen, kann eine schrittweise Meldung erfolgen; Verzögerung ist zu begründen. Die Frist ist kein Grund, die Eindämmung aufzuschieben.

### 4.3 Pseudonymisierung und Anonymisierung

`Pseudonymisierung`: direkte Kennzeichen werden ersetzt; mit getrennten Zusatzinformationen ist Zuordnung wieder möglich. Die DSGVO gilt weiter.

`Anonymisierung`: Zuordnung ist unter Berücksichtigung vernünftigerweise einsetzbarer Mittel nicht mehr möglich. Nur dann fehlt der Personenbezug.

```text
Name → Studien-ID; Schlüssel getrennt vorhanden → pseudonymisiert
Name gelöscht, aber eindeutige E-Mail bleibt      → nicht anonym
stark aggregierte Statistik ohne Rückschluss      → kann anonym sein
```

Kleine Gruppen, seltene Merkmale und externe Datensätze erhöhen das Re-Identifizierungsrisiko.

### 4.4 Privacy by Design und Default

`Privacy by Design`: Datenschutz schon in Planung, Architektur, Entwicklung, Betrieb und Löschung integrieren.

`Privacy by Default`: ohne aktive Änderung nur die für den Zweck notwendigen Daten, Zugriffe, Sichtbarkeit und Aufbewahrung aktivieren.

Beispiele:

- rollenbasierten Zugriff und Löschlauf als Produktanforderung bauen;
- Profil standardmäßig nicht öffentlich setzen;
- Standortzugriff standardmäßig deaktivieren;
- Protokolle minimieren und Aufbewahrung technisch begrenzen;
- Testdaten pseudonymisieren und Produktionsdaten vermeiden.

## 5. Anwendungsfall: Fehlversand einer Personalliste

Eine unverschlüsselte Tabelle mit Namen, Privatadressen, Gehältern und Fehlzeiten von 120 Beschäftigten wird an einen externen falschen Empfänger gesendet. Dieser bestätigt nach 40 Minuten die Löschung.

### 5.1 Bewertung

```text
Art:       Vertraulichkeitsverletzung
Daten:     Identitäts-, Kontakt-, Gehalts- und möglicherweise Gesundheitsbezug
Umfang:    120 Beschäftigte
Schutz:    unverschlüsselt; Empfänger hatte Zugriff
Folgen:    finanzielle/soziale Nachteile, Bloßstellung, Missbrauch
Minderung: bestätigte Löschung senkt Risiko, beseitigt Nachweis-/Kopierunsicherheit nicht automatisch
```

Ein Risiko ist wahrscheinlich; wegen Sensibilität und Umfang muss auch hohes Risiko ernsthaft geprüft werden. Die konkrete Meldungsentscheidung trifft der Verantwortliche anhand dokumentierter Fakten, nicht der Absender allein.

### 5.2 Sofortmaßnahmen und TOM

- Empfänger über bekannten Kanal zur Nichtnutzung/Löschung auffordern und Bestätigung sichern;
- Datenschutz-, Sicherheits- und Verantwortlichenprozess aktivieren;
- Übermittlungslogs und Dateiversion bewahren;
- Behörden-/Betroffenenmeldung bewerten und vorbereiten;
- Empfängerauswahl, Warnhinweis und Freigabeprozess verbessern;
- sensible Exporte verschlüsseln und Empfänger getrennt verifizieren;
- Datenexport minimieren, DLP/Schutzkennzeichnung passend einsetzen;
- Wirksamkeit mit Fehlversand-Testfällen prüfen.

### 5.3 Privacy-Anforderung

> Der Export enthält standardmäßig nur Name und Personalnummer; Gehalt und Fehlzeiten werden nur nach zusätzlicher rollenbasierter Auswahl und dokumentierter Freigabe aufgenommen.

Das verbindet Default, Datenminimierung, Zugriffskontrolle und Nachweisbarkeit.

## 6. Prüfungsformulierungen

> Der Widerruf beendet die auf Einwilligung beruhende Verarbeitung für die Zukunft, berührt jedoch nicht automatisch die Rechtmäßigkeit der bisherigen Verarbeitung.

> Die Pseudonymisierung hebt den Personenbezug nicht auf, weil die Zuordnung mithilfe der getrennten Zusatzinformationen weiterhin möglich ist.

> Die Aufsichtsbehörde wird bei bestehendem Risiko möglichst binnen 72 Stunden informiert; bei voraussichtlich hohem Risiko werden grundsätzlich zusätzlich die betroffenen Personen unverzüglich benachrichtigt.

> Die Wirksamkeit der Zugriffskontrolle wird durch Positiv- und Negativtests geprüft, da eine dokumentierte Rollenmatrix allein keine korrekte technische Umsetzung beweist.

## 7. Typische Prüfungsfallen

- Betroffenenrechte als ausnahmslos und ohne Identitätsprüfung darstellen.
- Widerruf und Widerspruch gleichsetzen.
- Löschung trotz gesetzlicher Aufbewahrung pauschal sofort zusagen.
- Zutritt, Zugang und Zugriff verwechseln.
- TOM als feste, für jedes Unternehmen gleiche Checkliste behandeln.
- nur Vertraulichkeitsverletzungen als Datenschutzvorfall ansehen.
- 72 Stunden als Frist des Auftragsverarbeiters oder der Betroffenenmeldung ausgeben.
- Meldung an Betroffene bei jedem kleinen Vorfall behaupten.
- bestätigte Löschung automatisch als „kein Risiko“ werten.
- Pseudonymisierung mit Anonymisierung gleichsetzen.
- nur den Namen löschen und Anonymität behaupten.
- Privacy by Default mit einer optionalen Einstellung tief im Menü verwechseln.

## 8. Selbsttest

1. Nenne acht Betroffenenrechte.
2. Grenze Widerruf und Widerspruch ab.
3. Welche Regelfrist gilt für die Bearbeitung eines Betroffenenantrags?
4. Nenne vier in Art. 32 ausdrücklich erkennbare Maßnahmenziele.
5. Ordne Serverraumkarte, MFA, Rollenrecht und Audit-Log zu.
6. Definiere eine Datenschutzverletzung.
7. Wer meldet wem zuerst, wenn ein Hoster den Vorfall entdeckt?
8. Wann werden Behörde und Betroffene informiert?
9. Grenze Pseudonymisierung und Anonymisierung ab.
10. Erkläre Privacy by Design und Default.
11. Nenne vier Sofortmaßnahmen beim Fehlversand.
12. Warum ist ein Restore-Test eine datenschutzrelevante TOM?

<details>
<summary>Lösungen anzeigen</summary>

1. Information, Auskunft, Berichtigung, Löschung, Einschränkung, Übertragbarkeit, Widerspruch, Widerruf, Beschwerde, Schutz bei automatisierten Entscheidungen; acht genügen.
2. Widerruf beendet Einwilligung für Zukunft; Widerspruch richtet sich gegen bestimmte andere Grundlagen/Verarbeitungen.
3. grundsätzlich unverzüglich und regelmäßig ein Monat; Verlängerung unter Voraussetzungen mit Mitteilung.
4. Pseudonymisierung/Verschlüsselung, dauerhafte CIA/Belastbarkeit, Wiederherstellbarkeit, regelmäßige Wirksamkeitsprüfung.
5. Zutritt, Zugang, Zugriff, Eingabekontrolle.
6. Sicherheitsverletzung mit Vernichtung, Verlust, Änderung, Offenlegung oder unbefugtem Zugang personenbezogener Daten.
7. Auftragsverarbeiter informiert Verantwortlichen unverzüglich.
8. Risiko: Behörde möglichst binnen 72 Stunden; hohes Risiko: grundsätzlich zusätzlich Betroffene unverzüglich.
9. Zuordnung mit Zusatzwissen möglich und DSGVO gilt; mit vernünftigen Mitteln keine Zuordnung mehr.
10. in Architektur/Lebenszyklus einbauen; datenschutzfreundliche Voreinstellung.
11. eindämmen, intern melden, Fakten/Logs sichern, Risiko bewerten, Empfänger kontaktieren, Meldungen vorbereiten; vier genügen.
12. Sie prüft die tatsächliche zeitnahe Wiederherstellbarkeit und Verfügbarkeit nach Zwischenfall.

</details>

## 9. Quellen und Abgleich

- [DSGVO – Primärtext](https://eur-lex.europa.eu/eli/reg/2016/679/oj) — insbesondere Art. 12–22, 25, 32–34; Stand 11.09.2026.
- [EDPB Guidelines 9/2022 zur Meldung von Datenschutzverletzungen](https://www.edpb.europa.eu/our-work-tools/our-documents/guidelines/guidelines-92022-personal-data-breach-notification-under_en) — offizielle europäische Auslegung mit Fallbeispielen.
- [BfDI – Betroffenenrechte](https://www.bfdi.bund.de/DE/Buerger/Inhalte/Allgemein/Datenschutz/Betroffenenrechte.html) — amtliche Übersicht für Betroffene.

## 10. Offene Prüfpunkte für den Unterricht

- Welche klassischen TOM-Kontrollbegriffe verlangt die WBS-Lösungstabelle?
- Sollen Verlängerung und Ausnahmen der Monatsfrist detailliert gelernt werden?
- Welche Datenschutzvorfälle werden im Kurs als hohes Risiko bewertet?
