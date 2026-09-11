---
pruefung: AP1
thema: Kundenbedarf und Anforderungen
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Deutsch
gegenstueck: ../ru/01-kundenbedarf-und-anforderungen-ru.md
---

# AP1: Kundenbedarf und Anforderungen

Die Ermittlung des Kundenbedarfs steht am Anfang des AP1-Szenarios. Hardware und Software können weder bedarfsgerecht ausgewählt noch wirtschaftlich bewertet oder zuverlässig abgenommen werden, solange nicht geklärt ist, **welches Problem der Kunde lösen möchte und anhand welcher Kriterien er die Lösung akzeptiert**.

## 1. Lernziele

Nach der Bearbeitung dieses Kapitels solltest du:

- `Bedürfnis`, `Bedarf` und `Nachfrage` unterscheiden können;
- Ziele, Anwender, Randbedingungen und Stakeholder ermitteln können;
- eine geeignete `Erhebungstechnik` auswählen können;
- offene, geschlossene und klärende Fragen einsetzen können;
- `funktionale` und `nichtfunktionale Anforderungen` unterscheiden können;
- eindeutige und prüfbare Anforderungen formulieren können;
- eine Anforderung von einer vorschnell festgelegten Lösung unterscheiden können;
- Anforderungen priorisieren können;
- Kundenwünsche in `Abnahmekriterien` überführen können;
- Quelle, Priorität und Änderungen einer Anforderung dokumentieren können.

---

## 2. Prüfungsminimum — 15 Minuten

1. Bedürfnis ist ein empfundener Mangel, Bedarf ein konkretisierter und finanzierbarer Wunsch, Nachfrage dessen Auftreten am Markt.
2. Kundenbedarf beschreibt das gewünschte Ergebnis, nicht vorschnell ein Produkt.
3. Offene Fragen liefern Zusammenhänge; geschlossene Fragen bestätigen konkrete Fakten.
4. Funktionale Anforderungen beschreiben Funktionen, nichtfunktionale Anforderungen Qualitäten und Randbedingungen.
5. Muss-Kriterien schließen ungeeignete Lösungen aus; Kann-Kriterien differenzieren geeignete Alternativen.
6. Anforderungen müssen eindeutig, prüfbar, priorisiert und rückverfolgbar sein.
7. Stakeholder, Zielgruppe, Prozess, Ist-Zustand, Ziel und Grenzen werden vor der Lösung geklärt.
8. Ein Abnahmekriterium enthält Gegenstand, Bedingung und messbares Soll-Ergebnis.

> Die Anforderung ist nicht ausreichend prüfbar, da „schnell“ keinen Messwert und keine Lastbedingung enthält.

## 3. Bedürfnis, Bedarf und Nachfrage

Im wirtschaftlichen Zusammenhang werden die Begriffe wie folgt abgegrenzt:

| Begriff | Bedeutung | Beispiel |
|---|---|---|
| `Bedürfnis` | Allgemeiner Mangel oder Wunsch | Beschäftigte können außerhalb des Büros nur eingeschränkt arbeiten |
| `Bedarf` | Konkretisiertes Bedürfnis, für dessen Erfüllung Mittel vorhanden sind | Das Unternehmen plant die Beschaffung von 25 mobilen Arbeitsplätzen |
| `Nachfrage` | Der Bedarf wird am Markt als Kaufabsicht wirksam | Das Unternehmen fragt Angebote für 25 Notebooks an |

Klassische wirtschaftliche Merkhilfe:

```text
Bedürfnis + Kaufkraft = Bedarf
Bedarf + Kaufentschluss = Nachfrage
```

In IT-Aufgaben wird `Kundenbedarf` häufig weiter gefasst. Er umfasst Ziele, Aufgaben, Randbedingungen und Erwartungen des Kunden.

### Prüfungslogik

```text
Problem oder Bedürfnis
        ↓
Kundenbedarf ermitteln
        ↓
Anforderungen formulieren und priorisieren
        ↓
Lösungsvarianten vergleichen
        ↓
Lösung auswählen
        ↓
testen und abnehmen
```

Wer mit einem konkreten Produkt beginnt, ohne den Bedarf zu kennen, kann eine technisch gute, aber ungeeignete Lösung auswählen.

---

## 4. Zuerst Problem und Ziel, dann das Produkt

Die Aussage eines Kunden:

> „Wir brauchen schnellere Laptops.“

ist noch keine ausreichende Anforderung. Unterschiedliche Ursachen können dahinterstehen:

- zu wenig Arbeitsspeicher;
- langsamer Netzwerkzugriff;
- fehlerhaft konfigurierte Anwendung;
- unzureichende Serverleistung;
- alter Datenträger;
- zu viele Hintergrundprozesse;
- ungeeigneter Arbeitsablauf;
- subjektive Wahrnehmung ohne gemessenen Wert.

Vor einem Lösungsvorschlag ist zu klären:

1. Welche Aufgaben werden bearbeitet?
2. Wo tritt das Problem auf?
3. Wer ist davon betroffen?
4. Wie wird der aktuelle Zustand gemessen?
5. Welches Ergebnis gilt als ausreichend?
6. Welche Randbedingungen dürfen nicht verletzt werden?

> Eine Produktvorgabe ist noch keine vollständige Anforderung. Zuerst müssen Problem, Ziel, Nutzungskontext und Randbedingungen geklärt werden.

---

## 5. Stakeholder und Zielgruppen

Ein `Stakeholder` ist eine Person oder Gruppe, die eine Lösung beeinflusst, nutzt, bezahlt oder von ihren Folgen betroffen ist.

Typische Gruppen:

| Stakeholder | Interessen und benötigte Informationen |
|---|---|
| `Auftraggeber/Geschäftsleitung` | Nutzen, Kosten, Termine, Risiken, Wirtschaftlichkeit |
| `Anwender` | Arbeitsablauf, Bedienbarkeit, Geschwindigkeit, Barrierefreiheit |
| `IT-Administration` | Kompatibilität, Sicherheit, Verwaltung, Support, Schnittstellen |
| `Datenschutzbeauftragter` | Rechtsgrundlage, Datenminimierung, TOM, Löschung |
| `Informationssicherheitsbeauftragter` | Schutzbedarf, Bedrohungen, technische und organisatorische Maßnahmen |
| `Einkauf` | Anbieter, Konditionen, Lieferzeit, Gewährleistung |
| `Betriebsrat` | Interessen der Beschäftigten, insbesondere bei Überwachung oder Leistungsdaten |
| `Support` | Wartbarkeit, Diagnose, Ersatzteile, Dokumentation |

Ein Gespräch nur mit der Geschäftsleitung genügt häufig nicht. Sie kennt Budget und Unternehmensziel, aber nicht zwingend alle Einzelheiten der täglichen Arbeit.

### Zielgruppengerechte Kommunikation

Informationen werden an die Zielgruppe angepasst:

- Geschäftsleitung: Nutzen, Kosten, Risiken und Entscheidung;
- IT-Fachpersonal: Architektur, Protokolle, Schnittstellen und Betriebsbedingungen;
- Anwender: Tätigkeiten, verständliche Begriffe, Beispiele und Hilfe bei Fehlern;
- Personen mit Einschränkungen: zugängliches Format, ausreichender Kontrast sowie alternative Eingabe- und Wahrnehmungsmöglichkeiten.

Zielgruppengerechte Sprache darf wichtige Risiken nicht verschweigen. Ein Fachbegriff kann zuerst verständlich erklärt und anschließend präzise benannt werden.

---

## 6. Ablauf der Bedarfsermittlung

Ein praxisgerechter Ablauf:

### 6.1 Auftrag klären

- Wer ist Auftraggeber?
- Welches Ergebnis wird erwartet?
- Wo liegen die Grenzen der Untersuchung?
- Wer trifft die endgültige Entscheidung?
- Bis wann wird das Ergebnis benötigt?

### 6.2 Ist-Zustand erfassen

- vorhandene Geräte, Programme und Versionen;
- Arbeitsabläufe;
- Anzahl der Anwender und Arbeitsplätze;
- Leistung und auftretende Fehler;
- bestehende Verträge, Lizenzen und Standards;
- Netzwerk, Server und externe Abhängigkeiten;
- tatsächliche Kosten und Supportaufwand.

### 6.3 Soll-Zustand definieren

- Unternehmensziel;
- erwartete Funktionen;
- messbare Kennzahlen;
- Anforderungen an Sicherheit und Datenschutz;
- erwartete Verfügbarkeit;
- Bedienbarkeit und Barrierefreiheit;
- Termin und Budget.

### 6.4 Abweichung analysieren

```text
Soll-Zustand − Ist-Zustand = Handlungsbedarf
```

Die Differenz zwischen aktuellem und gewünschtem Zustand zeigt, was tatsächlich verändert werden muss.

### 6.5 Anforderungen dokumentieren

Jede Anforderung erhält eine Kennung, eine Quelle, eine Priorität und ein Prüfkriterium.

### 6.6 Abstimmen und freigeben

Die Beteiligten prüfen:

- Wurde der Bedarf richtig verstanden?
- Bestehen Widersprüche?
- Sind die Anforderungen realistisch?
- Wer genehmigt Änderungen?
- Welche Kriterien sind für die Abnahme verbindlich?

---

## 7. Erhebungstechniken

Die Methode wird passend zur Art der Information, zur Zahl der Beteiligten und zur verfügbaren Zeit gewählt.

| Methode | Geeigneter Einsatz | Stärke | Grenze |
|---|---|---|---|
| `Interview` | Einzelne Fachperson soll ausführlich Auskunft geben | Nachfragen und Ursachenanalyse sind möglich | Zeitaufwendig und möglicherweise subjektiv |
| `Workshop` | Mehrere Gruppen müssen ein gemeinsames Verständnis entwickeln | Konflikte werden früh sichtbar | Dominante Teilnehmer können das Ergebnis beeinflussen |
| `Beobachtung` | Tatsächlicher Ablauf weicht möglicherweise von Beschreibungen ab | Zeigt reale Arbeit und Umgehungslösungen | Beobachtung kann das Verhalten verändern |
| `Dokumentenanalyse` | Richtlinien, Verträge, Tickets oder Altdokumentation sind vorhanden | Liefert nachvollziehbare Ausgangsdaten | Unterlagen können veraltet sein |
| `Fragebogen` | Viele räumlich verteilte Anwender | Vergleichbare Antworten in kurzer Zeit | Rückfragen sind kaum möglich |
| `Prototyp/Mock-up` | Anforderungen an die Oberfläche sind noch unklar | Macht Vorstellungen sichtbar und erzeugt konkretes Feedback | Prototyp kann für ein fast fertiges Produkt gehalten werden |
| `Auswertung von Tickets/Kennzahlen` | Häufigkeit von Problemen und tatsächliche Last sollen ermittelt werden | Nutzt reale Betriebsdaten | Daten können unvollständig oder falsch kategorisiert sein |
| `Schnittstellenanalyse` | Die Lösung kommuniziert mit anderen Systemen | Deckt Formate, Protokolle und Abhängigkeiten auf | Erfasst nicht alle Bedürfnisse der Anwender |

Bei anspruchsvollen Aufgaben werden Methoden kombiniert. Eine Ticketauswertung zeigt beispielsweise die Häufigkeit von Fehlern, eine Beobachtung den tatsächlichen Ablauf und ein Workshop den abgestimmten Soll-Prozess.

---

## 8. Fragetechniken

### 8.1 Offene Fragen

Sie ermöglichen freie Antworten und decken bisher unbekannte Informationen auf.

> Welche Aufgaben bearbeiten Sie mit dem Gerät?

> Welche Probleme treten im aktuellen Ablauf auf?

> Woran würden Sie erkennen, dass die neue Lösung erfolgreich ist?

### 8.2 Geschlossene Fragen

Sie führen zu einer kurzen oder eindeutigen Antwort und eignen sich zum Bestätigen konkreter Angaben.

> Muss das Gerät über einen integrierten Mobilfunkzugang verfügen?

> Werden mehr als zwei externe Monitore angeschlossen?

Wer ausschließlich geschlossene Fragen stellt, übersieht leicht unbekannte Bedürfnisse.

### 8.3 Alternativfragen

Sie bieten eine begrenzte Auswahl:

> Soll die Anmeldung über Smartcard oder Authenticator-App erfolgen?

Sie sind sinnvoll, wenn die zulässigen Varianten bereits feststehen. Andernfalls beschränken sie die Lösung zu früh.

### 8.4 Skalierungsfragen

Sie helfen bei der Bewertung einer Ausprägung:

> Wie wichtig ist eine Akkulaufzeit von mindestens acht Stunden auf einer Skala von 1 bis 5?

Die Skala muss allen Beteiligten gleich erklärt werden.

### 8.5 Kontroll- und Rückfragen

Sie sichern das gemeinsame Verständnis:

> Habe ich Sie richtig verstanden, dass alle Geräte offline mindestens vier Stunden arbeitsfähig sein müssen?

### 8.6 Suggestivfragen

Sie lenken die befragte Person zu einer bestimmten Antwort:

> Sie möchten doch sicher das leistungsstärkste Modell, oder?

Suggestivfragen verfälschen die Bedarfsermittlung und sollten vermieden werden.

---

## 9. Aktives Zuhören

`Aktives Zuhören` verringert das Risiko falscher Annahmen.

Wesentliche Handlungen:

- die Person ausreden lassen;
- klärende Fragen stellen;
- in eigenen Worten wiedergeben — `paraphrasieren`;
- Ergebnisse zusammenfassen;
- Tatsachen und Interpretationen trennen;
- offene Punkte dokumentieren;
- das Gesprächsergebnis abschließend abstimmen.

Beispiel:

> Wenn ich Sie richtig verstanden habe, arbeiten 25 Außendienstmitarbeiter regelmäßig ohne Steckdose. Deshalb ist eine gemessene Akkulaufzeit von mindestens acht Stunden ein Muss-Kriterium. Ist das korrekt?

Ein allgemeiner Wunsch wird dadurch in einen Messwert, einen Nutzungskontext und eine Priorität überführt.

---

## 10. Arten von Anforderungen

### 10.1 Funktionale Anforderungen

Sie beschreiben, **was ein System leisten soll**.

> Das System muss Benutzern ermöglichen, Rechnungen als PDF zu exportieren.

### 10.2 Nichtfunktionale Anforderungen

Sie beschreiben die Qualität einer Funktion oder ihre Ausführungsbedingungen.

Typische Kategorien:

- `Performance` — Antwortzeit und Durchsatz;
- `Verfügbarkeit` — zulässige Ausfallzeit;
- `Sicherheit` — Authentisierung, Rechte und Verschlüsselung;
- `Benutzbarkeit` — verständliche und effiziente Bedienung;
- `Barrierefreiheit` — Nutzung durch Menschen mit Einschränkungen;
- `Kompatibilität` — Betriebssysteme, Formate und Schnittstellen;
- `Wartbarkeit` — Diagnose, Aktualisierung und Austausch;
- `Skalierbarkeit` — Wachstum von Anwenderzahl und Last;
- `Zuverlässigkeit` — Stabilität und Fehlerhäufigkeit;
- `Energieeffizienz` — Leistungsaufnahme und Energiesparzustände.

Sicherheitsanforderungen können funktional oder nichtfunktional sein. Eine automatische Kontosperre beschreibt beispielsweise ein Systemverhalten und ist funktional. Eine geforderte Verschlüsselungsstärke oder ein zulässiges Risikoniveau beschreibt dagegen eine Schutzqualität und ist in der Regel nichtfunktional.

Ungeeignete Formulierung:

> Die Anwendung muss schnell sein.

Prüfbare Formulierung:

> Die Suchergebnisse müssen bei 200 gleichzeitigen Benutzern in mindestens 95 Prozent der Anfragen innerhalb von zwei Sekunden angezeigt werden.

### 10.3 Randbedingungen

Randbedingungen begrenzen die möglichen Lösungen:

- maximales Budget;
- Einführungstermin;
- vorgeschriebene Betriebssystemversion;
- bestehender Rahmenvertrag;
- interner Sicherheitsstandard;
- vorhandener Platz oder Stromversorgung;
- rechtliche und lizenzrechtliche Vorgaben.

### 10.4 Übergangsanforderungen

Sie werden für den Wechsel vom alten zum neuen Zustand benötigt:

- Datenmigration;
- Schulung;
- Parallelbetrieb;
- Rollback;
- Außerbetriebnahme alter Geräte;
- vorübergehende Schnittstellen.

Nach dem Übergang können sie ihre Bedeutung verlieren, während der Einführung sind sie jedoch wesentlich.

---

## 11. Anforderung oder Lösung?

Eine gute Anforderung beschreibt möglichst das benötigte Ergebnis, ohne die Lösungswahl unbegründet einzuschränken.

Vorschnell festgelegte Lösung:

> Es müssen Notebooks des Modells X gekauft werden.

Mögliche Anforderung:

> Die Geräte müssen die freigegebene CAD-Anwendung mit den definierten Testdaten ohne kritische Fehler ausführen und mindestens acht Stunden mobilen Betrieb ermöglichen.

Ein konkretes Produkt darf als Randbedingung festgelegt werden, wenn dies nachvollziehbar begründet ist, zum Beispiel durch:

- Kompatibilität mit der vorhandenen Infrastruktur;
- einen Rahmenvertrag;
- einheitlichen Support;
- vorgeschriebene Zertifizierung;
- einen nachgewiesenen wirtschaftlichen Vorteil.

> Die Festlegung auf ein konkretes Produkt ist nur dann bedarfsgerecht, wenn sie aus einer nachvollziehbaren Anforderung oder Randbedingung folgt.

---

## 12. Qualitätsmerkmale guter Anforderungen

| Merkmal | Bedeutung | Prüffrage |
|---|---|---|
| `eindeutig` | Nur eine vernünftige Auslegung | Verstehen alle Beteiligten dasselbe? |
| `vollständig` | Notwendige Bedingungen und Ergebnis sind enthalten | Fehlt eine wichtige Randbedingung? |
| `widerspruchsfrei` | Kein Konflikt mit anderen Anforderungen | Können die Anforderungen gemeinsam erfüllt werden? |
| `notwendig` | Unterstützt ein tatsächliches Ziel | Was geschieht, wenn sie entfällt? |
| `realisierbar` | Technisch, wirtschaftlich und terminlich umsetzbar | Sind Mittel und Technik vorhanden? |
| `prüfbar` | Objektiver Test oder Nachweis ist möglich | Wie wird die Abnahme durchgeführt? |
| `priorisiert` | Bedeutung ist festgelegt | Was ist zwingend und was verschiebbar? |
| `atomar` | Beschreibt im Wesentlichen genau einen Bedarf | Lässt sie sich mit einer Entscheidung prüfen? |
| `nachverfolgbar` | Quelle und verknüpfte Elemente sind bekannt | Wer forderte sie und welcher Test prüft sie? |
| `verständlich` | Für die Adressaten geeignet | Verstehen Fachbereich und IT die Aussage? |

Wörter wie `schnell`, `modern`, `benutzerfreundlich`, `sicher` und `kostengünstig` sind ohne messbare Konkretisierung normalerweise nicht ausreichend.

---

## 13. Aufbau einer Anforderung

Praxistaugliche Vorlage:

```text
ID:
Titel:
Quelle/Stakeholder:
Anforderung:
Begründung/Ziel:
Priorität:
Akzeptanzkriterium:
Abhängigkeiten:
Status:
```

Beispiel:

| Feld | Inhalt |
|---|---|
| ID | NFA-07 |
| Titel | Akkulaufzeit |
| Quelle | Außendienstleitung |
| Anforderung | Jedes Notebook muss im standardisierten Office-Test mindestens acht Stunden ohne Netzteil arbeiten. |
| Begründung | Ganztägige Kundentermine ohne sicheren Zugang zu Steckdosen |
| Priorität | Muss |
| Akzeptanzkriterium | Test mit freigegebenem Image, WLAN aktiv, Bildschirmhelligkeit 60 %, Laufzeit ≥ 8 h |
| Abhängigkeit | Auswahl des Akkus und Energiesparprofils |
| Status | freigegeben |

Die Begründung hilft bei einer späteren Alternativenprüfung. Wird das Ziel auf andere Weise erreicht, kann sich die Umsetzung ändern, ohne dass der eigentliche Bedarf verloren geht.

---

## 14. Priorisierung

### 14.1 Muss, Soll und Kann

| Priorität | Bedeutung |
|---|---|
| `Muss` | Ohne Erfüllung wird die Lösung nicht abgenommen oder kann nicht genutzt werden |
| `Soll` | Hoher Nutzen; eine Abweichung muss begründet werden |
| `Kann` | Zusätzlicher Nutzen, der bei verfügbaren Ressourcen umgesetzt wird |

`Muss` bedeutet nicht nur, dass ein Kunde etwas besonders stark wünscht. Die Einstufung sollte objektiv begründet sein, beispielsweise durch Gesetz, Sicherheit, Kernprozess oder zwingende Schnittstelle.

### 14.2 MoSCoW

| Kategorie | Bedeutung |
|---|---|
| `Must have` | Für das vereinbarte Ergebnis zwingend |
| `Should have` | Wichtig, aber vorübergehend umgehbar |
| `Could have` | Wünschenswert, wenn Zeit und Budget ausreichen |
| `Won't have this time` | Bewusst nicht im aktuellen Umfang enthalten |

`Won't` bedeutet nicht „niemals“. Die Kategorie schützt den aktuellen Termin und das Budget vor unkontrolliertem `Scope Creep`.

### 14.3 Priorität und Angebotsvergleich

Zunächst werden die `Muss-Kriterien` geprüft. Ein Angebot, das ein Muss-Kriterium nicht erfüllt, kann unabhängig von seinem niedrigen Preis ausgeschlossen werden.

Die verbleibenden Angebote werden nach Preis sowie gewichteten `Soll- und Kann-Kriterien` verglichen, beispielsweise mit einer `Nutzwertanalyse`.

---

## 15. Lastenheft

Das `Lastenheft` beschreibt die Anforderungen des Auftraggebers: **Was wird benötigt und wofür?**

Typische Inhalte:

- Ausgangssituation;
- Ziel;
- Einsatzbereich;
- Stakeholder und Zielgruppen;
- funktionale Anforderungen;
- nichtfunktionale Anforderungen;
- verbindliche Randbedingungen;
- Lieferumfang und Abgrenzung;
- Abnahmekriterien;
- Termin und Budgetrahmen;
- Definitionen und Anlagen.

Das spätere `Pflichtenheft` des Auftragnehmers beschreibt, **wie** und **womit** die Anforderungen umgesetzt werden.

Bezeichnung und Detaillierungsgrad der Dokumente hängen von Organisation und Vertrag ab. Inhalt und Verantwortung sind wichtiger als eine unreflektierte Zuordnung zum Dokumentnamen.

---

## 16. Akzeptanzkriterien und Abnahme

Ein `Akzeptanzkriterium` legt eine beobachtbare Bedingung fest, unter der eine Anforderung als erfüllt gilt.

Ungeeignet:

> Der Rechner funktioniert zuverlässig.

Besser:

> Der Rechner durchläuft den festgelegten 60-minütigen Belastungstest ohne Absturz; im Ereignisprotokoll treten keine kritischen Fehler auf.

Ein gutes Kriterium enthält:

- Prüfobjekt;
- Ausgangsbedingungen;
- Handlung oder Last;
- erwartetes Ergebnis;
- messbare Grenze;
- bei Bedarf Prüfverfahren und Nachweis.

### Given-When-Then

Für Systemverhalten kann folgende Form verwendet werden:

```text
Gegeben sei ...
Wenn ...
Dann ...
```

Beispiel:

> Gegeben sei ein gesperrtes Benutzerkonto. Wenn sich der Benutzer mit dem korrekten Passwort anmeldet, dann wird der Zugriff verweigert und der Versuch protokolliert.

---

## 17. Anforderungsmatrix und Nachverfolgbarkeit

Eine einfache Matrix verbindet Anforderungen mit Quelle, Umsetzung und Test:

| ID | Quelle | Anforderung | Umsetzung | Testfall | Status |
|---|---|---|---|---|---|
| FR-01 | Buchhaltung | PDF-Export | Modul Export | T-01 | bestanden |
| NFA-02 | IT-Sicherheit | MFA | Identity Provider | T-07 | offen |
| NFA-03 | Außendienst | 8 h Akku | Gerät und Energieprofil | T-12 | bestanden |

Vorteile:

- fehlende Anforderungen werden erkennbar;
- eine Änderung lässt sich bis zu Tests und Dokumentation verfolgen;
- die Abnahme beruht auf vereinbarten Kriterien;
- die Folgen eines `Change Requests` lassen sich leichter einschätzen.

---

## 18. Umgang mit Änderungen und Konflikten

Anforderungen können miteinander konkurrieren:

- hohe Leistung gegen niedrigen Energieverbrauch;
- strenge Sicherheit gegen einfache Bedienung;
- niedriger Preis gegen lange Garantie;
- kurzer Termin gegen großen Leistungsumfang.

Vorgehen:

1. Konflikt ausdrücklich dokumentieren;
2. betroffene Stakeholder bestimmen;
3. Folgen für Zeit, Kosten, Qualität und Risiko bewerten;
4. Alternativen erarbeiten;
5. Entscheidung der zuständigen Stelle einholen;
6. Anforderungen, Planung und Tests aktualisieren.

Eine Anforderung darf nach ihrer Freigabe nicht unbemerkt verändert werden. Die Änderung durchläuft den vereinbarten `Änderungsprozess`.

---

## 19. Durchgängiges Praxisbeispiel

### Ausgangssituation

Ein Unternehmen möchte 25 Beschäftigte im Außendienst mit mobilen Arbeitsplätzen ausstatten. Die Leitung fordert „gute und sichere Notebooks“.

### Geeignete Rückfragen

1. Welche Anwendungen werden eingesetzt und welche Leistungsanforderungen haben sie?
2. Werden personenbezogene Kundendaten verarbeitet?
3. Wie lange wird ohne Stromanschluss gearbeitet?
4. Welche Betriebssysteme und Anwendungen sind freigegeben?
5. Welche Peripheriegeräte werden angeschlossen?
6. Wie erfolgt der Zugriff auf das Unternehmensnetz?
7. Welcher Budgetrahmen, Liefertermin und Nutzungszeitraum gelten?
8. Welche Anforderungen bestehen an Gewicht, Bildschirm und Barrierefreiheit?
9. Wie soll der Remote-Support erfolgen?
10. Woran wird eine erfolgreiche Abnahme erkannt?

### Vom Wunsch zu Anforderungen

| ID | Art | Anforderung | Priorität |
|---|---|---|---|
| FR-01 | funktional | Das Gerät muss einen verschlüsselten VPN-Zugang zum Unternehmensnetz ermöglichen. | Muss |
| NFA-01 | Sicherheit | Die lokale Systempartition muss vollständig verschlüsselt sein. | Muss |
| NFA-02 | Authentisierung | Der Fernzugriff muss mit zwei unterschiedlichen Faktoren abgesichert sein. | Muss |
| NFA-03 | Mobilität | Das Gesamtgewicht einschließlich Netzteil darf 1,8 kg nicht überschreiten. | Soll |
| NFA-04 | Laufzeit | Das Gerät muss im festgelegten Nutzungstest mindestens acht Stunden Akkulaufzeit erreichen. | Muss |
| RB-01 | Randbedingung | Pro Arbeitsplatz dürfen die Beschaffungskosten 1.600 Euro netto nicht überschreiten. | Muss |
| RB-02 | Termin | Alle abgenommenen Geräte müssen bis zum 30.11.2026 bereitstehen. | Muss |
| TR-01 | Übergang | Vor Übergabe müssen die vorhandenen Benutzerdaten nach Freigabe migriert werden. | Soll |

### Auswertung

Die Anforderungen ermöglichen:

- ungeeignete Angebote anhand der Muss-Kriterien auszuschließen;
- verbleibende Lösungen zu vergleichen;
- die Konfiguration zu planen;
- Testfälle abzuleiten;
- eine dokumentierte Abnahme durchzuführen.

---

## 20. Prüfungsformulierungen

### Offene Frage begründen

> Eine offene Frage ist geeignet, weil der Kunde seine Arbeitsabläufe und Probleme frei beschreiben kann und dadurch bisher unbekannte Anforderungen erkennbar werden.

### Funktional und nichtfunktional unterscheiden

> Die Exportfunktion ist eine funktionale Anforderung, weil sie beschreibt, was das System leisten soll. Die maximale Antwortzeit ist eine nichtfunktionale Anforderung, weil sie die Qualität der Ausführung festlegt.

### Unklare Anforderung verbessern

> Die Formulierung „Das System muss schnell sein“ ist nicht prüfbar. Stattdessen sollte eine maximale Antwortzeit unter einer definierten Last angegeben werden.

### Produktvorgabe bewerten

> Die Festlegung auf Modell X ist ohne weitere Begründung nicht bedarfsgerecht, weil sie mögliche Alternativen vor der Ermittlung der fachlichen und technischen Anforderungen ausschließt.

### Lastenheft erklären

> Das Lastenheft beschreibt aus Sicht des Auftraggebers, was benötigt wird und welche Ziele, Anforderungen und Randbedingungen einzuhalten sind.

### Muss-Kriterium anwenden

> Angebot B ist auszuschließen, weil es das Muss-Kriterium einer Akkulaufzeit von mindestens acht Stunden nicht erfüllt.

---

## 21. Typische Prüfungsfallen

1. Ein Kundenwunsch ist noch keine prüfbare Anforderung.
2. `Bedürfnis`, `Bedarf` und `Nachfrage` sind keine vollständigen Synonyme.
3. Ein konkretes Produkt darf nicht ohne Bedarfsanalyse als Lösung festgelegt werden.
4. Offene Fragen gewinnen Informationen; geschlossene Fragen bestätigen konkrete Angaben.
5. Eine `Suggestivfrage` verfälscht die Antwort.
6. `Funktional` bedeutet, dass eine Funktion beschrieben wird, nicht dass etwas „wichtig“ ist.
7. Leistung, Sicherheit und Verfügbarkeit sind normalerweise nichtfunktionale Anforderungen.
8. Eine Budgetgrenze ist eine `Randbedingung` und keine Systemfunktion.
9. `Muss` benötigt eine Begründung und bedeutet nicht nur einen starken Wunsch.
10. Ein niedriger Preis gleicht ein nicht erfülltes Muss-Kriterium nicht aus.
11. Das `Lastenheft` beschreibt das Geforderte, das `Pflichtenheft` die Umsetzung.
12. „Schnell“, „sicher“ und „benutzerfreundlich“ sind ohne Messgröße nicht prüfbar.
13. Eine Anforderung ohne Testfall lässt sich nur schwer zuverlässig abnehmen.
14. Eine Anforderungsänderung kann Planung, Kosten, Tests und Dokumentation beeinflussen.
15. Eine technisch richtige Aussage kann als Antwort ungeeignet sein, wenn sie die Zielgruppe nicht berücksichtigt.

---

## 22. Selbsttest

### A. Begriffe

1. Erkläre den Unterschied zwischen `Bedürfnis`, `Bedarf` und `Nachfrage`.
2. Nenne vier mögliche Stakeholder bei der Einführung eines neuen Arbeitsplatzes.
3. Worin unterscheidet sich eine offene von einer geschlossenen Frage?
4. Nenne drei `Erhebungstechniken` und jeweils einen Vorteil.
5. Worin unterscheidet sich eine funktionale von einer nichtfunktionalen Anforderung?

### B. Anforderungen verbessern

6. Verbessere die Anforderung: „Der Laptop muss leicht sein.“
7. Verbessere die Anforderung: „Die Anwendung muss sicher sein.“
8. Bewerte die Formulierung: „Es muss das Notebook SuperBook Z gekauft werden.“
9. Formuliere ein Akzeptanzkriterium für die automatische Bildschirmsperre.

### C. Fall

Ein neues Videokonferenzsystem ist für 40 Beschäftigte vorgesehen. Gefordert werden einfache Bedienung, Teilnahme externer Partner, Schutz dienstlicher Gespräche und Kosten von höchstens 12.000 Euro.

10. Formuliere zwei offene Rückfragen.
11. Formuliere zwei funktionale Anforderungen.
12. Formuliere drei nichtfunktionale Anforderungen.
13. Nenne ein Muss- und ein Soll-Kriterium mit Begründung.
14. Erkläre, wie eine der Anforderungen geprüft werden kann.

<details>
<summary>Lösungen anzeigen</summary>

1. Ein Bedürfnis ist ein allgemeiner Mangel oder Wunsch. Bedarf ist ein konkretisiertes, mit Mitteln hinterlegtes Bedürfnis. Nachfrage ist der am Markt wirksam werdende Bedarf.
2. Zum Beispiel: Auftraggeber, Anwender, IT-Administration, Einkauf, Datenschutzbeauftragter, Betriebsrat oder Support.
3. Eine offene Frage ermöglicht eine freie, ausführliche Antwort. Eine geschlossene Frage beschränkt die Antwort und eignet sich zum Bestätigen.
4. Zum Beispiel: Interview — Nachfragen; Beobachtung — tatsächlicher Ablauf; Workshop — Abstimmung mehrerer Gruppen.
5. Eine funktionale Anforderung beschreibt, was ein System tut. Eine nichtfunktionale Anforderung beschreibt, wie gut oder unter welchen Bedingungen es dies tut.
6. Zum Beispiel: `Das Gesamtgewicht des Notebooks einschließlich Netzteil darf 1,8 kg nicht überschreiten.`
7. Zum Beispiel: `Nach fünf aufeinanderfolgenden Fehlanmeldungen muss das Benutzerkonto für 15 Minuten gesperrt und das Ereignis protokolliert werden.`
8. Ohne eine begründete Randbedingung handelt es sich um eine vorschnelle Produktvorgabe.
9. Zum Beispiel: `Nach fünf Minuten ohne Benutzereingabe muss der Bildschirm automatisch gesperrt werden; eine erneute Nutzung ist erst nach erfolgreicher Authentisierung möglich.`
10. Zum Beispiel: `Wie arbeiten die Beschäftigten heute mit externen Partnern zusammen?` und `Welche Probleme treten bei aktuellen Besprechungen auf?`
11. Zum Beispiel: Konferenz planen; externe Teilnehmer über zeitlich begrenzten Link einladen.
12. Zum Beispiel: Transportverschlüsselung; eine definierte Aufgabe ohne Schulung in einer vorgegebenen Zeit ausführen; 40 gleichzeitige Teilnehmer unterstützen.
13. Muss: Verschlüsselung, weil dienstliche Informationen besprochen werden. Soll: Kalenderintegration, wenn ein vertretbarer Ersatzprozess besteht.
14. Zum Beispiel: Testkonferenz mit 40 Teilnehmern durchführen, Verbindungsdaten messen und Fehlerprotokoll anhand festgelegter Kriterien prüfen.

</details>

---

## 23. Quellen und Abgleich

- [FIAusbV § 9 – Prüfungsbereich von Teil 1](https://www.gesetze-im-internet.de/fiausbv/__9.html)
- [IREB CPRE – Downloads und Ressourcen](https://cpre.ireb.org/de/downloads-und-resources/downloads)
- [U-Form: Prüfungskatalog FIAE, gültig für AP1 ab Frühjahr 2025](https://www.u-form-shop.de/ihk-pruefungen/pruefungskataloge-abschlusspruefung/fachinformatiker-fachinformatikerin-anwendungsentwicklung-pruefungskatalog-fuer-die-ihk-abschlusspruefung-1)

Das Thema wird in der AP1 als Bestandteil eines praktischen Szenarios zur Auswahl und Einrichtung eines Arbeitsplatzes behandelt. Das formale Requirements Engineering dient hier der Vertiefung und besseren Begründung, nicht der vollständigen Wiedergabe eines CPRE-Lehrplans.

## 24. Offene Prüfpunkte für den Unterricht

- Verwendet WBS `Muss/Soll/Kann` oder `MoSCoW`?
- Wie grenzt die Lehrkraft `Bedarf` und `Anforderung` in Prüfungsaufgaben voneinander ab?
- Wird in der AP1 die vollständige Struktur eines `Lastenhefts` verlangt oder hauptsächlich die Abgrenzung zum `Pflichtenheft`?
- Welche Qualitätsmerkmale für Anforderungen erwartet WBS in Formulierungsaufgaben?
