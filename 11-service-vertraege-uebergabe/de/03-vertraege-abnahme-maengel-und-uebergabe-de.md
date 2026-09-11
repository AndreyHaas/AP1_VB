---
pruefung: AP1
thema: Verträge, Abnahme, Mängel und Übergabe
prioritaet: Abgleich
status: Entwurf
stand: 2026-09-11
sprache: Deutsch
gegenstueck: ../ru/03-vertraege-abnahme-maengel-und-uebergabe-ru.md
---

# Verträge, Abnahme, Mängel und Übergabe

## 1. Lernziele

Du kannst:

- Kauf-, Miet-, Dienst-, Werk- und Lizenzvertrag nach der geschuldeten Hauptleistung unterscheiden;
- gemischte IT-Verträge anhand ihres Inhalts statt ihrer Überschrift einordnen;
- Angebot, Auftrag, Leistungsbeschreibung und Abnahmekriterien verbinden;
- Übergabe, Inbetriebnahme und Abnahme voneinander abgrenzen;
- einen prüfbaren Abnahmeprozess und ein Abnahmeprotokoll planen;
- Mangel, Restpunkt, Änderungswunsch und Bedienfehler unterscheiden;
- Mängelrechte ohne unzulässige Pauschalaussagen einordnen;
- Gewährleistung/Mängelhaftung und Garantie abgrenzen;
- Lieferungs- und Zahlungsverzug fallbezogen prüfen;
- Dokumentation, Zugänge, Datenschutz und offene Risiken bei der Übergabe berücksichtigen.

## 2. Prüfungsminimum — 15 Minuten

1. Beim `Kaufvertrag` werden Sache und Kaufpreis geschuldet.
2. Beim `Mietvertrag` wird Gebrauch auf Zeit gegen Entgelt überlassen.
3. Beim `Dienstvertrag` wird die vereinbarte Tätigkeit, beim `Werkvertrag` ein bestimmter Erfolg geschuldet.
4. Ein `Lizenzvertrag` regelt Nutzungsrechte; die konkrete Einordnung hängt vom Inhalt ab.
5. `Übergabe` ist die tatsächliche Bereitstellung, `Abnahme` die rechtlich bedeutsame Billigung eines Werkes als im Wesentlichen vertragsgemäß.
6. Abnahmekriterien müssen vor dem Test messbar aus Anforderungen abgeleitet werden.
7. Ein Mangel ist eine Abweichung vom geschuldeten Soll; ein neuer Wunsch ist grundsätzlich ein Change.
8. Bei Mängeln ist häufig zuerst Nacherfüllung zu ermöglichen; weitere Rechte hängen von Voraussetzungen und Vertragstyp ab.
9. `Garantie` ist eine zusätzliche freiwillige Zusage, `Mängelhaftung` beruht auf Gesetz oder Vertrag.
10. Verzug nie nur aus einer verspäteten Kalenderanzeige ableiten: Fälligkeit, Mahnung oder Ausnahme, Leistungsmöglichkeit und Verantwortlichkeit prüfen.

> Der Fehler wird als Mangel dokumentiert, da das vereinbarte Abnahmekriterium nicht erfüllt ist; der Auftragnehmer erhält zunächst Gelegenheit zur Nacherfüllung.

## 3. Vertragstypen und Leistungsinhalt

| Vertragstyp | Typische Hauptleistung | IT-Beispiel |
|---|---|---|
| Kaufvertrag | Sache gegen Kaufpreis | Kauf von Notebooks |
| Mietvertrag | zeitweise Gebrauchsüberlassung gegen Miete | gemietete Hardware |
| Dienstvertrag | Tätigkeit, grundsätzlich kein bestimmter Erfolg | laufende Beratung nach Stunden |
| Werkvertrag | vereinbarter Erfolg/Werk gegen Vergütung | funktionsfähige Schnittstelle nach Kriterien |
| Lizenzvertrag | eingeräumte Nutzungsrechte und Bedingungen | Nutzungsrecht für Standardsoftware |

Ein IT-Projekt kann Elemente mehrerer Vertragstypen enthalten: Hardwarekauf, Softwarelizenz, Installation als Werkleistung und laufender Support als Dienstleistung. Entscheidend sind Leistungsinhalt, Erfolgsverantwortung und Vereinbarungen.

### 3.1 Unterlagen in einer Leistungskette

```text
Kundenbedarf
→ Anforderungen/Leistungsbeschreibung
→ Angebot und Vertrag
→ Umsetzung und interne Tests
→ Abnahmekriterien und Abnahmetest
→ Übergabe/Abnahme
→ Betrieb, Support und Mängelbearbeitung
```

Ein Abnahmetest darf nicht erstmals neue Anforderungen erfinden. Unklare oder widersprüchliche Kriterien werden vor der Abnahme geklärt und dokumentiert.

## 4. Übergabe, Abnahme, Mängel und Verzug

### 4.1 Begriffe abgrenzen

`Übergabe`: System, Gerät, Unterlagen oder Zugang werden dem Kunden tatsächlich bereitgestellt.

`Inbetriebnahme`: System wird technisch in den vorgesehenen Betrieb versetzt.

`Abnahme`: Im Werkvertragsrecht nimmt der Besteller das vertragsgemäß hergestellte Werk ab. Wegen unwesentlicher Mängel darf die Abnahme nach § 640 BGB nicht verweigert werden. Die konkrete Rechtswirkung muss im Einzelfall geprüft werden.

Diese Ereignisse können zusammenfallen, müssen es aber nicht. Ein System kann technisch laufen, obwohl die formelle Abnahme noch offen ist.

### 4.2 Abnahmetest

Ein gutes Kriterium enthält:

- Testgegenstand und Voraussetzung;
- Eingabe oder Handlung;
- erwartetes messbares Ergebnis;
- Toleranz oder Grenzwert;
- Nachweis und Verantwortlichen.

Beispiel:

```text
Kriterium: Anmeldung mit aktivem Domänenkonto
Voraussetzung: Client im Firmennetz, Konto freigeschaltet
Aktion: Benutzer meldet sich mit korrekten Daten an
Soll: Desktop erscheint innerhalb von 30 Sekunden, Richtlinien werden angewendet
Nachweis: Zeitmessung, Ereignisprotokoll, Testergebnis
```

### 4.3 Befund klassifizieren

| Befund | Einordnung | Vorgehen |
|---|---|---|
| vereinbartes Muss-Kriterium verfehlt | Mangel/Abweichung | dokumentieren, bewerten, Nacherfüllung planen |
| kleine bekannte Abweichung ohne wesentliche Nutzungsstörung | möglicher Restmangel | Frist und Verantwortlichen protokollieren |
| Funktion war nie vereinbart | Änderungswunsch | Change mit Aufwand, Risiko und Freigabe |
| Funktion korrekt, Nutzung falsch | Bedien-/Schulungsproblem | erklären, Dokumentation oder Einweisung verbessern |

### 4.4 Mängelrechte einordnen

Für ein mangelhaftes Werk nennt § 634 BGB unter seinen jeweiligen Voraussetzungen insbesondere:

- Nacherfüllung;
- Selbstvornahme und Aufwendungsersatz;
- Rücktritt oder Minderung;
- Schadensersatz oder Ersatz vergeblicher Aufwendungen.

Die Reihenfolge und Voraussetzungen dürfen nicht übersprungen werden. Bei Kaufverträgen gelten eigene Vorschriften, insbesondere §§ 437 ff. BGB. Bei beiderseitigem Handelsgeschäft kann zusätzlich die Untersuchungs- und Rügepflicht des § 377 HGB relevant sein.

### 4.5 Verzug prüfen

Prüfschema für einen typischen Fall:

1. Anspruch ist fällig.
2. Leistung wurde nicht rechtzeitig erbracht.
3. Eine erforderliche Mahnung liegt vor oder ist gesetzlich entbehrlich.
4. Der Schuldner hat die Verzögerung zu vertreten.
5. Folgen und weitere Schritte werden anhand von Vertrag und Gesetz geprüft.

Ein kalendermäßig bestimmter Termin kann eine Mahnung entbehrlich machen. Trotzdem ist nicht jede Terminverschiebung automatisch schuldhafter Verzug: Sachverhalt, Mitwirkung, höhere Gewalt und Vertragsklauseln beachten.

## 5. Anwendungsfall: Übergabe eines Arbeitsplatz-Rollouts

Ein Anbieter soll 25 Arbeitsplätze liefern, installieren und betriebsbereit übergeben. Vereinbart sind Verschlüsselung, Domänenanmeldung, Druckzugriff, dokumentierte Tests und Einweisung. Am Abnahmetag funktionieren 24 Geräte; bei einem Gerät fehlt der passende Netzwerktreiber. Der Kunde fordert zusätzlich eine nie vereinbarte Spezialsoftware.

### 5.1 Bewertung

```text
24 Geräte erfüllen Soll      → Ergebnisse protokollieren
1 Treiber fehlt              → Abweichung/Mangel, Ursache und Frist dokumentieren
neue Spezialsoftware         → Änderungswunsch, nicht als ursprünglicher Mangel behandeln
Gesamtabnahme                → Wesentlichkeit, Teilabnahme und Vertrag prüfen
```

### 5.2 Abnahmeprotokoll

Das Protokoll enthält mindestens:

- Projekt, Version, Ort und Datum;
- Beteiligte und Rollen;
- Vertrags-/Auftragsbezug;
- getestete Kriterien mit Soll, Ist und Ergebnis;
- Testumgebung und Nachweise;
- Mängel, Priorität, Frist und Verantwortlichen;
- Vorbehalte, Restpunkte und offene Changes;
- Ergebnis: abgenommen, unter Vorbehalt/mit Restpunkten oder nicht abgenommen;
- nächste Termine und Bestätigung der Beteiligten.

### 5.3 Sichere Übergabe

Zusätzlich zu Geräten gehören je nach Auftrag:

- Benutzer- und Betriebsdokumentation;
- Inventar-, Lizenz- und Konfigurationsnachweise;
- Test- und Sicherheitsprotokolle;
- Backup-/Restore- und Notfallinformationen;
- Supportkontakt, SLA und Eskalationsweg;
- getrennte sichere Übergabe initialer Geheimnisse;
- Einweisung und dokumentierte Lernkontrolle.

Passwörter und private Schlüssel gehören nicht ungeschützt in ein allgemeines Übergabeprotokoll.

## 6. Prüfungsformulierungen

> Es handelt sich hinsichtlich der funktionsfähigen Schnittstelle um eine werkvertraglich geprägte Leistung, da ein bestimmter prüfbarer Erfolg geschuldet wird.

> Die zusätzliche Spezialsoftware ist kein Mangel der ursprünglichen Leistung, weil sie nicht Bestandteil der vereinbarten Anforderungen war; sie ist als Change zu bewerten.

> Die Abnahmeentscheidung muss auf den vereinbarten Kriterien beruhen, damit Soll und Ist nachvollziehbar verglichen werden können.

> Der Lieferverzug ist anhand von Fälligkeit, Mahnung oder deren Entbehrlichkeit und Verantwortlichkeit zu prüfen; die bloße Verspätung genügt nicht für jede Rechtsfolge.

## 7. Typische Prüfungsfallen

- Jeden IT-Vertrag pauschal als Kaufvertrag behandeln.
- Dienst- und Werkvertrag nur nach Abrechnungsart unterscheiden.
- Übergabe, Inbetriebnahme und Abnahme gleichsetzen.
- Erst beim Test neue Anforderungen definieren.
- Einen Change als Mangel behandeln.
- Jeden kleinen Restpunkt automatisch als Abnahmehindernis werten.
- Sofort Rücktritt oder Schadensersatz fordern, ohne Voraussetzungen zu prüfen.
- Gewährleistung und Garantie gleichsetzen.
- § 377 HGB auf jeden privaten oder einseitigen Handelskauf anwenden.
- Verzug ohne Fälligkeit und Mahnung/Ausnahme behaupten.
- Zugangsdaten offen im Protokoll versenden.
- Abnahme ohne Version, Nachweis und Verantwortliche dokumentieren.

## 8. Selbsttest

1. Welche Hauptleistung unterscheidet Dienst- und Werkvertrag?
2. Nenne je ein IT-Beispiel für Kauf-, Miet- und Lizenzvertrag.
3. Warum kann ein IT-Vertrag gemischt sein?
4. Grenze Übergabe, Inbetriebnahme und Abnahme ab.
5. Welche fünf Bestandteile machen ein Abnahmekriterium prüfbar?
6. Ist eine nie vereinbarte Funktion ein Mangel?
7. Nenne vier Gruppen von Mängelrechten beim Werkvertrag.
8. Grenze Mängelhaftung und Garantie ab.
9. Welche Punkte prüfst du vor der Aussage „Verzug“?
10. Welche Besonderheit kann § 377 HGB im beiderseitigen Handelsgeschäft auslösen?
11. Bewerte den fehlenden Treiber und die zusätzliche Spezialsoftware im Fall.
12. Nenne acht Inhalte eines Abnahmeprotokolls.

<details>
<summary>Lösungen anzeigen</summary>

1. Dienstvertrag: Tätigkeit; Werkvertrag: bestimmter Erfolg.
2. Notebookkauf; Hardwaremiete; Software-Nutzungsrecht.
3. Weil Lieferung, Lizenz, Herstellung/Installation und Support unterschiedlichen Pflichten folgen können.
4. tatsächliche Bereitstellung; technischer Betriebsbeginn; Billigung des Werkes als im Wesentlichen vertragsgemäß.
5. Gegenstand, Voraussetzung, Aktion/Eingabe, messbares Soll/Toleranz, Nachweis/Verantwortlicher.
6. Grundsätzlich nein; sie ist zunächst als Änderungswunsch zu behandeln.
7. Nacherfüllung; Selbstvornahme/Aufwendungsersatz; Rücktritt/Minderung; Schadensersatz/vergebliche Aufwendungen.
8. gesetzliche/vertragliche Mängelrechte; freiwillige zusätzliche Zusage mit eigenen Bedingungen.
9. Fälligkeit, Nichterfüllung, Mahnung oder Ausnahme, Verantwortlichkeit sowie Vertrags-/Gesetzesfolgen.
10. Ware unverzüglich untersuchen und erkennbare Mängel unverzüglich rügen; genaue Voraussetzungen beachten.
11. Treiber: Abweichung/Mangel mit Frist; Spezialsoftware: Change.
12. Projekt/Version, Datum/Ort, Beteiligte, Auftragsbezug, Kriterien Soll/Ist, Nachweise, Mängel/Fristen, Ergebnis/Freigabe; weitere sinnvolle Angaben zählen.

</details>

## 9. Quellen und Abgleich

- [BGB § 433](https://www.gesetze-im-internet.de/bgb/__433.html) — Hauptpflichten beim Kaufvertrag.
- [BGB § 535](https://www.gesetze-im-internet.de/bgb/__535.html) — Hauptpflichten beim Mietvertrag.
- [BGB § 611](https://www.gesetze-im-internet.de/bgb/__611.html) — Dienstvertrag.
- [BGB §§ 631, 634 und 640](https://www.gesetze-im-internet.de/bgb/__631.html) — Werkvertrag, Mängelrechte und Abnahme; ergänzende Normen einzeln prüfen.
- [BGB § 286](https://www.gesetze-im-internet.de/bgb/__286.html) — Schuldnerverzug.
- [HGB § 377](https://www.gesetze-im-internet.de/hgb/__377.html) — Untersuchungs- und Rügepflicht im beiderseitigen Handelsgeschäft.
- [FIAusbV § 9](https://www.gesetze-im-internet.de/fiausbv/__9.html) — Einweisen, Leistung kontrollieren und protokollieren im AP1-Kontext.

Stand der Rechtsprüfung: 11.09.2026. Diese Lernübersicht ersetzt keine Rechtsberatung; im Prüfungsfall gelten Sachverhalt und vorgegebene Vertragsbedingungen.

## 10. Offene Prüfpunkte für den Unterricht

- Welche Vertragstypen und Rechtsfolgen verlangt der aktuelle WBS-Prüfungsumfang?
- Wie soll eine Abnahme mit unwesentlichen Restmängeln in WBS-Fällen formuliert werden?
- Welche Verzugsvoraussetzungen werden in den verwendeten Aufgaben als gegeben vorausgesetzt?
