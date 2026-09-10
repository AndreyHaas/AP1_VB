---
pruefung: AP1
thema: Softwarearten, Lizenzen, betriebliche Systeme und Updates
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Deutsch
gegenstueck: ../ru/04-softwarearten-lizenzen-betriebliche-systeme-und-updates-ru.md
---

# AP1: Softwarearten, Lizenzen, betriebliche Systeme und Updates

Software wird nicht nach Bekanntheit ausgewählt, sondern nach Anforderungen, Nutzungsrechten, Kompatibilität, Sicherheit und Gesamtkosten. Die Lizenz legt fest, was erlaubt ist; der Updateprozess sorgt für kontrollierte Änderungen am betriebenen System.

---

## 1. Lernziele

Nach dieser Einheit kannst du:

- Software nach Aufgabe und Entstehung einordnen;
- Standard- und Individualsoftware vergleichen;
- ERP, CRM, SCM, DMS und CMS erklären;
- proprietär/Open Source von kostenlos/kostenpflichtig trennen;
- Lizenz, Eigentum und Urheberrecht unterscheiden;
- Named User, Concurrent User, Device, Core, Subscription und Pay per Use vergleichen;
- Lizenzbedingungen statt Modellnamen bewerten;
- Lizenzkosten aus gegebenen Daten berechnen;
- Datenschutz, IT-Sicherheit, Schnittstellen und TCO berücksichtigen;
- Auswahl, Einführung, Update, Rollback und Dokumentation planen;
- überprüfbare Abnahmekriterien formulieren.

---

## 2. Prüfungsminimum — 15 Minuten

Merken:

1. `Systemsoftware` verwaltet das System; `Anwendungssoftware` löst eine Fachaufgabe.
2. `Standardsoftware` ist für viele Kunden vorgesehen; `Individualsoftware` wird für konkrete Anforderungen entwickelt oder wesentlich angepasst.
3. `Open Source` bedeutet zugänglicher Quellcode und Lizenzrechte, nicht automatisch „kostenlos und ohne Pflichten“.
4. Eine Lizenz erteilt `Nutzungsrechte`; das Urheberrecht wird nicht automatisch übertragen.
5. `Named User` ist einem Nutzer zugeordnet; `Concurrent User` begrenzt gleichzeitige Nutzung.
6. Auswahl: Muss-Kriterien → Rechte → Kompatibilität → Sicherheit → TCO → Test.
7. Update: Inventar → Bewertung → Test → Backup/Rollback → Freigabe → Rollout → Kontrolle → Dokumentation.
8. Ein ungetestetes Update ist riskant; ein nicht installiertes Sicherheitsupdate ist ebenfalls ein Risiko.

Musterantwort:

> Das Concurrent-User-Modell kann wirtschaftlich sein, da höchstens zwölf der vierzig Beschäftigten gleichzeitig arbeiten. Vor der Auswahl müssen jedoch Lizenzbedingungen, Spitzenlast, technische Zählweise, Ausfallszenario und Gesamtkosten geprüft werden.

---

## 3. Softwarearten nach Aufgabe

| Art | Aufgabe | Beispiele |
|---|---|---|
| Systemsoftware | Hardware und Basisdienste verwalten | Betriebssystem, Treiber, systemnahe Werkzeuge |
| Anwendungssoftware | Fach- oder Benutzeraufgabe lösen | Office, Browser, Buchhaltung, CAD |
| Entwicklungssoftware | Programme erstellen und testen | IDE, Compiler, Interpreter, Debugger, Versionsverwaltung |
| Middleware | Systeme und Dienste verbinden | Message Broker, Application Server, Datenbanktreiber |
| Utility | Wartung oder Diagnose | Backupclient, Monitoringagent, Archivierungswerkzeug |

Die Grenzen können sich überschneiden. Ein Datenbankmanagementsystem kann Plattform für Anwendungen sein; ein Browser ist Anwendung und Laufzeitumgebung.

---

## 4. Standardsoftware und Individualsoftware

| Kriterium | Standardsoftware | Individualsoftware |
|---|---|---|
| Zielgruppe | viele Kunden mit ähnlichen Aufgaben | konkreter Auftraggeber/Bedarf |
| Einführung | Konfiguration und begrenztes Customizing | Analyse, Entwicklung und Test |
| Anschaffung | meist geringere Anfangskosten | meist höhere Projektkosten |
| Anpassung | durch Produktfunktionen begrenzt | gezielte Umsetzung der Anforderungen |
| Update | Herstellerzyklus | eigene Verantwortung oder Vertrag |
| Abhängigkeit | Hersteller und Produktroadmap | Entwickler, Architektur und Wartbarkeit |

Nicht nur der Kaufpreis entscheidet. Prozessanpassung, Migration, Schulung, Schnittstellen, Wartung und Lebenszyklus gehören in die Bewertung.

---

## 5. Standardsoftware: Auswahl

1. Ausgangssituation und Zielgruppe beschreiben.
2. Fachliche und technische Anforderungen klassifizieren.
3. Muss-Kriterien festlegen.
4. Datenschutz, Security und Rechtsrahmen prüfen.
5. Hersteller- und Betriebsmodell bestimmen.
6. Schnittstellen und Datenmigration bewerten.
7. Lizenz- und Betriebskosten berechnen.
8. Pilot beziehungsweise Test durchführen.
9. Entscheidung und Abweichungen dokumentieren.

Eine Demo zeigt Produktfunktionen, beweist aber nicht den Betrieb mit realen Daten, Rollen und Lasten.

---

## 6. Individualsoftware: Wann ist sie sinnvoll?

Mögliche Gründe:

- einzigartiger Kernprozess;
- Standardprodukt verfehlt eine zwingende Anforderung;
- unverhältnismäßiges Customizing wäre nötig;
- eigener Wettbewerbsvorteil;
- Kontrolle über die Roadmap ist erforderlich;
- günstigere Lebenszykluskosten unter belegten Annahmen.

Risiken:

- Entwicklungs- und Testaufwand;
- Wissensabhängigkeit;
- Wartung und Security;
- Termin- und Budgetrisiko;
- Dokumentation;
- langfristige Kompatibilität.

`„Passt genau“` ist ein Ziel, das durch Abnahmekriterien und Tests nachgewiesen werden muss.

---

## 7. Betriebliche Anwendungssysteme

| System | Hauptzweck | Typische Daten/Prozesse |
|---|---|---|
| ERP | Ressourcen und Kernprozesse integrieren | Einkauf, Lager, Produktion, Finanzen, Personal |
| CRM | Kundenbeziehungen unterstützen | Kontakte, Aktivitäten, Angebote, Service |
| SCM | Lieferketten koordinieren | Bedarf, Lieferanten, Bestände, Transport |
| DMS | Dokumente verwalten | Ablage, Version, Metadaten, Freigabe |
| CMS | digitale Inhalte verwalten | Webseiten, Rollen, Veröffentlichungen |

Systeme können sich überschneiden und Daten austauschen. Entscheidend ist der unterstützte Prozess, nicht der Produktname.

---

## 8. ERP

Vorteile:

- gemeinsame Datenbasis;
- durchgängige Prozesse;
- weniger Doppelerfassung;
- Auswertung und Planung;
- Rechte und Protokollierung.

Risiken:

- aufwendige Einführung;
- mangelhafte Datenqualität;
- hohe Integrationsabhängigkeit;
- Berechtigungsfehler mit großer Wirkung;
- Migration und Schulung.

```text
Kundenauftrag → Materialbedarf → Lager/Bestellung
→ Lieferung → Rechnung → Buchung
```

---

## 9. CRM, SCM, DMS und CMS

`CRM` konzentriert sich auf Kontakte und Kundeninteraktionen.  
`SCM` unterstützt Material- und Informationsfluss der Lieferkette.  
`DMS` verwaltet Dokumente, Metadaten, Versionen und Freigaben.  
`CMS` organisiert Erstellung und Veröffentlichung von Inhalten.

> DMS und CMS sind nicht allgemein austauschbar. Anforderungen an Aufbewahrung, Versionierung, Workflow und Veröffentlichung unterscheiden sich.

---

## 10. Proprietär und Open Source

`Proprietäre Software`:

- Nutzung nach Vorgaben des Rechteinhabers;
- Quellcode meist nicht zugänglich;
- Support und Roadmap häufig beim Hersteller.

`Open-Source-Software`:

- Quellcode ist zugänglich;
- eine Lizenz gewährt bestimmte Rechte auf Nutzung, Änderung und Weitergabe;
- konkrete Pflichten hängen von Lizenz und Verwendung ab.

Unabhängige Fragen:

| Frage | Mögliche Antwort |
|---|---|
| Quellcode offen? | ja/nein |
| Lizenzpreis? | kostenlos/kostenpflichtig |
| Support? | intern, Community, Dienstleister, Hersteller |
| Betrieb? | lokal, Hosting, Cloud |

Open Source kann bezahlten Support besitzen; proprietäre Software kann ohne Lizenzpreis angeboten werden.

---

## 11. Permissive und Copyleft

`Permissive Lizenzen` erlauben meist breite Nutzung und Weitergabe, wenn Bedingungen wie Copyright- und Lizenzhinweise eingehalten werden.

`Copyleft-Lizenzen` können bei Weitergabe modifizierter oder verbundener Software verlangen, Quellcode bereitzustellen und bestimmte Lizenzbedingungen beizubehalten.

Dabei gilt:

- Lizenzen unterscheiden sich;
- interne Nutzung und Weitergabe können andere Folgen haben;
- Verbindung oder abgeleitetes Werk sind rechtliche und technische Fragen;
- Lizenzkompatibilität ist zu prüfen.

Die Aussage `„GPL verbietet kommerzielle Nutzung“` ist eine falsche Pauschalisierung.

---

## 12. Urheberrecht und Lizenz

Computerprogramme sind urheberrechtlich geschützt. Soweit das Gesetz keine Ausnahme vorsieht, bestimmt der Rechteinhaber die erlaubten Handlungen.

Zu trennen:

- `Urheberrecht` — rechtlicher Schutz des Werks;
- `Eigentum am Datenträger/Gerät` — Eigentum am körperlichen Gegenstand;
- `Lizenz/Nutzungsrecht` — erlaubter Nutzungsumfang.

Der Kauf eines Datenträgers oder Downloads überträgt nicht das Urheberrecht. §§ 69c und 69d UrhG regeln zustimmungsbedürftige Handlungen und bestimmte Ausnahmen für Berechtigte. Einzelfälle sind anhand Vertrag und Gesetz zu prüfen.

---

## 13. Lizenzmetriken

| Modell | Gemessen wird | Typischer Prüfpunkt |
|---|---|---|
| Named User | benannter Nutzer | persönliche oder tatsächliche Nutzung |
| Concurrent User | gleichzeitige Sitzungen/Nutzer | Spitzenlast und Zählweise |
| Device | Gerät | gemeinsame Nutzung und Ersatzgerät |
| Core/CPU | Prozessorressource | physische/virtuelle Kerne, Mindestlizenz |
| Subscription | Zeitraum von Recht/Service | Laufzeit, Verlängerung, Exit |
| Perpetual | dauerhaftes Recht nach Bedingungen | Wartung und Updates getrennt |
| Pay per Use | gemessene Nutzung | Einheit, Messung, Kostengrenze |
| OEM | Bindung an Lieferung/Hardware | Übertragbarkeit und Ersatz |

Der Anbieter kann eine Metrik speziell definieren. Der Name allein reicht nicht.

---

## 14. Named User gegen Concurrent User

Gegeben:

- 40 Beschäftigte;
- höchstens 12 gleichzeitig;
- Named User: 18 €/Monat;
- Concurrent User: 35 €/Monat;
- fiktive Übungswerte.

```text
Named User:
40 × 18 € × 12 = 8.640 € pro Jahr

Concurrent User:
12 × 35 € × 12 = 5.040 € pro Jahr

Differenz:
8.640 € - 5.040 € = 3.600 € pro Jahr
```

Die Entscheidung ist nur belastbar, wenn Vertrag, tatsächliche Spitzenlast, technische Zugriffe, Lizenzserverausfall, Wachstum und Administration berücksichtigt sind.

---

## 15. Subscription und Perpetual

Eine `Subscription` kann Nutzungsrecht, Updates, Support und Cloud-Dienste für einen Zeitraum umfassen. Nach Ende können Recht oder Funktion wegfallen.

`Perpetual` bezeichnet meist ein zeitlich unbeschränktes Recht für eine bestimmte Version. Daraus folgen nicht automatisch:

- unbegrenzte Updates;
- dauerhafter Support;
- neue Hauptversionen;
- Betrieb auf jeder zukünftigen Hardware oder jedem OS.

Verglichen wird über einen gleichen Betrachtungszeitraum mit TCO.

---

## 16. Lizenzinventar und Compliance

Abgeglichen werden:

1. `Entitlement` — erworbene Rechte;
2. `Deployment` — Installation oder Zuordnung;
3. `Usage` — tatsächliche Nutzung;
4. `Vertrag` — Grenzen, Laufzeit, Nachweise;
5. `Änderung` — neue Nutzer, VM, Hardware oder Version.

Typische Nachweise:

- Vertrag und Bestellung;
- Lizenzschlüssel oder Portalnachweis;
- Anzahl und Metrik;
- Zuordnung;
- Laufzeit und Kündigung;
- Wartung und Support;
- Änderungsprotokoll.

Eine nicht genutzte Installation kann je nach Bedingungen dennoch lizenzpflichtig sein.

---

## 17. Technische Anforderungen

Zu prüfen:

- Betriebssystem und Version;
- CPU-Architektur;
- RAM und Speicher;
- Treiber und Laufzeitumgebung;
- Browser;
- Datenbank;
- Netzwerk und Ports;
- Schnittstellen und API;
- Identitäten und Rechte;
- Backup;
- Management- und Securitykompatibilität.

Eine Mindestanforderung des Herstellers belegt nicht automatisch ausreichende Leistung für die konkrete Last.

---

## 18. Fachliche und nichtfunktionale Anforderungen

Funktional:

- Rechnung erzeugen;
- Kundendatensatz suchen;
- Bestellung freigeben;
- Datei exportieren.

Nichtfunktional:

- Antwortzeit;
- Verfügbarkeit;
- Bedienbarkeit;
- Skalierbarkeit;
- Wartbarkeit;
- Datenschutz und Sicherheit.

Eine Sicherheitsanforderung kann funktional sein, wenn sie ein Systemverhalten festlegt:

> Das System sperrt ein Konto nach fünf fehlgeschlagenen Anmeldeversuchen gemäß freigegebener Richtlinie.

---

## 19. Schnittstellen und Datenmigration

Vor der Auswahl:

- Quell- und Zieldatenmodell;
- Format und Zeichenkodierung;
- Pflichtfelder;
- Schlüssel und Dubletten;
- Datenqualität;
- API, Import und Export;
- Vollständigkeit;
- Rechte und Schutzbedarf;
- Testmigration;
- Rollback.

Ein technisch erfolgreicher Import beweist keine vollständige Migration.

> Alle 10.000 freigegebenen Kundensätze werden importiert; Anzahl, Pflichtfelder und Stichprobenwerte stimmen mit der Quelle überein, fehlerhafte Datensätze werden protokolliert.

---

## 20. Datenschutz und Softwareauswahl

Zu prüfen:

- Zweck und Datenkategorien;
- Rechtsgrundlage;
- Rollen und Auftragsverarbeitung;
- Speicherort und Drittlandbezug;
- Lösch- und Aufbewahrungsfunktionen;
- Berechtigungen;
- Protokollierung;
- Export und Betroffenenrechte;
- Verschlüsselung;
- Datenschutz durch Technikgestaltung und Voreinstellungen.

`„Server in Deutschland“` ist kein vollständiges Datenschutzkonzept.

---

## 21. Sicherheit

Mindestfragen:

- Updateversorgung und Lebenszyklus;
- bekannte Schwachstellen;
- sichere Standardkonfiguration;
- Authentifizierung und MFA;
- Rollen- und Rechtekonzept;
- Verschlüsselung;
- Logging;
- Backup und Export;
- Paketintegrität;
- Notfall- und Exitfähigkeit.

Ein Plugin oder Add-on besitzt eine eigene Angriffsfläche und gehört ebenfalls ins Inventar.

---

## 22. Softwarebereitstellung

1. Paket und Quelle autorisieren.
2. Hash/Signatur, Version und Hersteller prüfen.
3. Lizenz und Anforderungen prüfen.
4. Testgruppe bestimmen.
5. Konfiguration und Abhängigkeiten paketieren.
6. Pilot bereitstellen.
7. Funktion und Sicherheit testen.
8. In Gruppen oder Ringen ausrollen.
9. Überwachen und Support bereitstellen.
10. Version und Ergebnis dokumentieren.

Eine Installation aus einem beliebigen Downloadportal verschlechtert Kontrollierbarkeit und Sicherheit.

---

## 23. Updatearten

| Art | Zweck |
|---|---|
| Sicherheitsupdate | Schwachstelle beheben |
| Fehlerbehebung/Hotfix | konkreten Fehler korrigieren |
| Funktionsupdate | Funktionen ändern oder ergänzen |
| Hauptversion/Upgrade | Produkt wesentlich verändern |
| Signatur-/Definitionsupdate | Erkennung aktualisieren |
| Firmwareupdate | Software in Gerät oder Komponente ändern |

Herstellerbezeichnungen können abweichen; Inhalt und Auswirkung sind entscheidend.

---

## 24. Patch- und Änderungsprozess

1. Systeme und Versionen inventarisieren.
2. Meldung und Authentizität prüfen.
3. Kritikalität, Exposition und Auswirkung bewerten.
4. Abhängigkeiten und Kompatibilität prüfen.
5. Backup und Rollback vorbereiten.
6. Repräsentative Testumgebung verwenden.
7. Freigabe dokumentieren.
8. Gestuft verteilen.
9. Installation und Funktion kontrollieren.
10. Fehler behandeln und Abschluss dokumentieren.

Ein dringender Sicherheitsfall kann ein beschleunigtes Verfahren verlangen, aber keinen Verzicht auf Kontrolle.

---

## 25. Test, Rollback und Wartungsfenster

Zu testen:

- Installation und Deinstallation;
- Start und Kernfunktion;
- Datenzugriff;
- Schnittstellen;
- Rechte;
- Performance;
- Logs;
- Neustart;
- Kompatibilität mit Sicherheitssoftware.

Rollback kann Deinstallation, Rückkehr zur Paketversion, Restore, einen geeigneten kurzlebigen VM-Snapshot oder Umschalten auf die vorige Umgebung bedeuten. Ein Snapshot ersetzt kein langfristiges Backup.

---

## 26. TCO von Software

```text
Software-TCO =
Lizenz/Subscription
+ Einführung und Migration
+ Customizing
+ Infrastruktur/Cloud
+ Betrieb und Administration
+ Support und Wartung
+ Schulung
+ Ausfall
+ Exit/Datenexport
```

Eine Lizenzgebühr von null bedeutet nicht TCO von null.

---

## 27. Vollständiger Praxisfall

Ein Unternehmen wählt ein CRM für 40 Personen bei höchstens zwölf gleichzeitigen Nutzungen.

Muss-Kriterien:

- Rollen und MFA;
- Import von 10.000 Datensätzen;
- REST-API zum ERP;
- Lösch- und Exportfunktion;
- Support bis zum geplanten Enddatum;
- Antwortzeit gemäß Testfall;
- kontrollierbare Updates.

Vorgehen:

1. Muss-Kriterien beider Produkte prüfen.
2. Concurrent-Kosten berechnen und Spitzenlast testen.
3. Lizenzdefinition schriftlich bestätigen.
4. Testmigration mit Vollständigkeitskontrolle.
5. Rollen, Logging und Löschung testen.
6. Migration, Schulung, Betrieb und Exit in TCO aufnehmen.
7. Kernprozesse mit Pilotgruppe abnehmen.
8. Entscheidung dokumentieren.

> Produkt B wird gewählt, weil es alle Muss-Kriterien erfüllt und das Concurrent-Modell im gemessenen Spitzenprofil jährlich 3.600 € Lizenzkosten spart. Voraussetzung sind die vertragliche Bestätigung der Zählweise und ein Lasttest mit zwölf gleichzeitigen Sitzungen.

---

## 28. Prüfungsalgorithmus

1. Aufgabe und Zielgruppe bestimmen.
2. Softwareart und Prozessbezug nennen.
3. Muss-Kriterien formulieren.
4. Lizenzmetrik und Rechte prüfen.
5. Anzahl, Zeitraum und Kosten berechnen.
6. Schnittstellen, Migration, Datenschutz und Sicherheit prüfen.
7. Einführung/Update mit Test und Rollback planen.
8. TCO und qualitative Kriterien vergleichen.
9. Entscheidung mit Bedingung formulieren.

---

## 29. Typische Prüfungsformulierungen

> Open Source bezeichnet Software, deren Quellcode unter einer entsprechenden Lizenz zugänglich ist. Daraus folgt weder automatisch Kostenfreiheit noch die Abwesenheit von Lizenzpflichten.

> Die Lizenzkosten betragen 5.040 € pro Jahr, sofern zwölf Concurrent-Lizenzen alle gleichzeitigen Nutzungen einschließlich technischer Zugriffe abdecken.

> Das Update wird zunächst in einer repräsentativen Testgruppe installiert, da dadurch Kompatibilitätsfehler vor dem breiten Rollout erkannt und ein kontrollierter Rollback vorbereitet werden können.

---

## 30. Typische Prüfungsfallen

| Falle | Korrektur |
|---|---|
| Open Source ist gratis | Quelloffenheit, Preis und Bedingungen trennen |
| gekauft bedeutet Urheberrecht erworben | Nutzungsrecht und Eigentum trennen |
| Concurrent entspricht Mitarbeiterzahl | gleichzeitige Nutzung nach Vertrag |
| Perpetual bedeutet Updates für immer | Version, Wartung und Support prüfen |
| Standardsoftware ist immer billiger | Migration, Anpassung und TCO |
| ERP ist nur Buchhaltung | integrierte Kernprozesse |
| Update sofort auf alle Systeme | Test, Freigabe und gestufter Rollout |
| dringender Patch ohne Kontrolle | beschleunigen, aber testen und dokumentieren |
| Installation erfolgreich heißt Abnahme | Kernfunktion, Daten, Rechte und Last prüfen |
| Cloudanbieter verantwortet alles | Verantwortung bleibt geteilt |

---

## 31. Selbsttest

1. Trenne System- und Anwendungssoftware.
2. Was ist Middleware?
3. Vergleiche Standard- und Individualsoftware.
4. Nenne den Hauptzweck von ERP, CRM und SCM.
5. Warum bedeutet Open Source nicht kostenlos?
6. Wie unterscheiden sich permissive Lizenz und Copyleft allgemein?
7. Trenne Urheberrecht, Eigentum und Lizenz.
8. Was misst Named User?
9. Was misst Concurrent User?
10. Berechne beide Modelle aus Abschnitt 14.
11. Welche Bedingungen können das Rechenergebnis relativieren?
12. Wie unterscheiden sich Subscription und Perpetual?
13. Was gleicht ein Lizenzinventar ab?
14. Nenne vier technische Anforderungen.
15. Formuliere eine funktionale Sicherheitsanforderung.
16. Wie wird eine vollständige Migration geprüft?
17. Nenne fünf Datenschutzkriterien.
18. Nenne fünf Sicherheitskriterien.
19. Warum gehört ein Add-on ins Inventar?
20. Ordne die Schritte der Softwarebereitstellung.
21. Trenne Sicherheits- und Funktionsupdate.
22. Welche Schritte hat der Patchprozess?
23. Was wird nach einem Update getestet?
24. Warum ist ein Snapshot kein Backup?
25. Nenne fünf Bestandteile der Software-TCO.
26. Begründe ein Concurrent-Modell mit Bedingung.

<details>
<summary>Lösungen anzeigen</summary>

1. Systemsoftware verwaltet Basisressourcen; Anwendungssoftware löst Benutzeraufgaben.
2. Eine verbindende Schicht zwischen Anwendungen, Diensten oder Datenquellen.
3. Standardsoftware ist allgemein und konfigurierbar; Individualsoftware entsteht für konkreten Bedarf.
4. ERP integriert Ressourcen, CRM Kundenbeziehungen, SCM Lieferketten.
5. Preis, Support und Lizenzpflichten sind getrennte Fragen.
6. Permissiv hat meist geringere Weitergabepflichten; Copyleft kann Quellcode und gleiche Bedingungen verlangen.
7. Schutz des Werks; körperliches Eigentum; erlaubte Nutzung.
8. Einen vertraglich definierten benannten Nutzer.
9. Gleichzeitige Nutzungen oder Sitzungen nach Vertrag.
10. `8.640 €` und `5.040 €`; Differenz `3.600 €` jährlich.
11. Spitzenlast, Zählweise, technische Nutzer, Mindestmengen, Ausfall und Wachstum.
12. Subscription ist zeitgebunden; Perpetual bleibt meist für eine Version ohne automatische ewige Updates.
13. Rechte, Zuordnung, Nutzung, Vertrag und Änderungen.
14. OS, CPU, RAM, Speicher, Runtime, Browser, Ports oder API.
15. Etwa automatische Kontosperre nach freigegebener Richtlinie.
16. Anzahl, Pflichtfelder, Fehlerliste und Stichproben zwischen Quelle und Ziel vergleichen.
17. Zweck, Rechtsgrundlage, Ort, Rollen, Löschung, Export, Rechte oder Logging.
18. Updates, sichere Konfiguration, MFA, Rechte, Verschlüsselung, Logs oder Backup.
19. Es besitzt Code, Rechte, Version und eigene Schwachstellen.
20. Autorisieren → prüfen → paketieren → pilotieren → testen → freigeben → ausrollen → kontrollieren.
21. Das erste schließt eine Schwachstelle, das zweite ändert Funktionen.
22. Inventar, Bewertung, Kompatibilität, Backup/Rollback, Test, Freigabe, Rollout, Kontrolle, Doku.
23. Installation, Kernfunktion, Daten, Schnittstellen, Rechte, Performance, Logs und Neustart.
24. Er hängt von seiner Umgebung ab und ist keine unabhängige langfristige Kopie.
25. Lizenz, Migration, Customizing, Betrieb, Support, Schulung, Ausfall oder Exit.
26. Nutze die Musterformulierung aus Abschnitt 27.

</details>

---

## 32. Quellen und Abgleich

- [§ 9 FIAusbV](https://www.gesetze-im-internet.de/fiausbv/__9.html)
- [UrhG §§ 69a–69g – Computerprogramme](https://www.gesetze-im-internet.de/urhg/)
- [§ 69c UrhG – zustimmungsbedürftige Handlungen](https://www.gesetze-im-internet.de/urhg/__69c.html)
- [§ 69d UrhG – Ausnahmen](https://www.gesetze-im-internet.de/urhg/__69d.html)
- [Open Source Initiative – Open Source Definition](https://opensource.org/osd)
- [BSI – IT-Grundschutz-Kompendium](https://www.bsi.bund.de/grundschutz-kompendium)

Lizenzierung hängt von Vertrag, Produkt, Version, Betriebsmodell und Rechtslage ab. Kostenbeispiele sind fiktive Übungsdaten; die Darstellung ist keine Rechtsberatung.

---

## 33. Offene Prüfpunkte für den Unterricht

- Welche Softwarearten erwartet die WBS?
- Wie tief werden ERP, CRM, SCM, DMS und CMS verglichen?
- Welche Lizenzmodelle nutzt das Unterrichtsschema?
- Wie detailliert werden Open-Source-Lizenzen behandelt?
- Sind §§ 69c/69d UrhG oder nur der Grundsatz erforderlich?
- Werden Concurrent- und Subscription-Kosten berechnet?
- Welchen Patchprozess verwendet die WBS?
- Welche Herstellerbeispiele sind in der Prüfung erwünscht?
- Wo liegt die Grenze zu Cloud und IT-Sicherheit?
