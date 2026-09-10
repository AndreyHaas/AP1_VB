---
pruefung: AP1
thema: Systemtest, Fehlersuche und Leistungsprotokoll
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Deutsch
gegenstueck: ../ru/03-systemtest-fehlersuche-und-leistungsprotokoll-ru.md
---

# AP1: Systemtest, Fehlersuche und Leistungsprotokoll

Ein Test weist die Erfüllung einer Anforderung nach, Diagnose grenzt die Ursache einer Abweichung ein und ein Protokoll macht das Ergebnis reproduzierbar und prüfbar. Systematisches Vorgehen heißt: zuerst beobachten und messen, dann einen Faktor ändern und denselben Test wiederholen.

---

## 1. Lernziele

Nach dieser Einheit kannst du:

- Anforderungen in Abnahmekriterien und Testfälle überführen;
- Funktions-, Integrations-, Sicherheits-, Leistungs- und Regressionstests unterscheiden;
- Positiv-, Negativ- und Grenzwertfälle formulieren;
- Symptom, Ursache und Folge trennen;
- einen systematischen Diagnoseprozess anwenden;
- eine Baseline und vergleichbare Messwerte erheben;
- CPU, RAM, Datenträger, Netzwerk, Dienste und Logs untersuchen;
- sichere Windows- und Linux-Werkzeuge auswählen;
- gleichzeitige Änderungen mehrerer Faktoren vermeiden;
- Soll, Ist, Umgebung, Ergebnis und Abweichung dokumentieren;
- Fehlerbehebung, Workaround und Restabweichung unterscheiden;
- Freigabe oder Eskalation begründen.

---

## 2. Prüfungsminimum — 15 Minuten

1. Testfall: ID → Ziel → Voraussetzung → Eingabe/Schritte → Soll → Ist → Status → Nachweis.
2. Eine Anforderung muss messbar sein; „arbeitet schnell“ ist nicht testbar.
3. Positivtest prüft erlaubte, Negativtest unerlaubte Eingabe, Grenzwerttest die Grenze.
4. Diagnose: Fehlerbild → Scope → Änderungen → Messung → Hypothese → ein Test → Ergebnis → Dokumentation.
5. Symptom ist nicht Ursache.
6. 100 % CPU sind nicht automatisch ein Fehler; Wert, Workload und Dauer gehören zusammen.
7. Logs benötigen genaue Zeit, Quelle, Ereignis und Korrelation.
8. Nach einer Korrektur werden Ausgangstest und Regressionstest wiederholt.

Musterantwort:

> Zuerst wird das Fehlerbild reproduzierbar beschrieben und mit Zeitstempel protokolliert. Anschließend werden relevante Messwerte und Logs erfasst. Pro Versuch wird nur eine Hypothese geprüft, damit die Ursache eindeutig zugeordnet werden kann.

---

## 3. Prüfung, Test und Monitoring

| Methode | Zweck |
|---|---|
| Sicht-/Dokumentenprüfung | Vorhandensein, Zustand oder Konfiguration prüfen |
| Test | Bedingungen herstellen und Soll mit Ist vergleichen |
| Messung | quantitativen Wert ermitteln |
| Monitoring | Werte und Ereignisse über Zeit beobachten |
| Review | Dokument, Konzept oder Änderung bewerten |

Die aktivierte Firewall wird über Konfiguration geprüft; die Wirkung einer Regel braucht einen Netzwerk-Testfall.

---

## 4. Von der Anforderung zum Testfall

Unbestimmt:

> Der PC soll schnell starten.

Prüfbar:

> Nach einem vollständigen Herunterfahren erreicht der Client in drei Messläufen innerhalb von jeweils höchstens 45 Sekunden den Anmeldebildschirm. Gemessen wird vom Betätigen des Einschalters bis zur Eingabebereitschaft.

Zustand, Messpunkte, Grenzwert, Wiederholung und Methode sind festgelegt.

---

## 5. Aufbau eines Testfalls

| Feld | Inhalt |
|---|---|
| Test-ID | eindeutige Kennung |
| Bezug | Anforderung oder Ticket |
| Ziel | zu prüfendes Verhalten |
| Voraussetzungen | System, Daten, Rolle, Version |
| Eingabe/Schritte | reproduzierbarer Ablauf |
| Soll-Ergebnis | erwartetes Ergebnis |
| Ist-Ergebnis | tatsächliches Ergebnis |
| Status | bestanden/nicht bestanden/blockiert |
| Nachweis | Log, Messwert, Screenshot, Datei |
| Tester/Datum | Verantwortung und Zeit |

Ein Screenshot ohne Kontext, Zeit und Sollwert ist ein schwacher Nachweis.

---

## 6. Testarten

| Testart | Frage |
|---|---|
| Installationstest | Ist das Produkt installier- und startbar? |
| Funktionstest | Erfüllt die Funktion die Anforderung? |
| Integrationstest | Arbeiten Systeme und Schnittstellen zusammen? |
| Sicherheitstest | Wirken Rechte und Schutzmaßnahmen? |
| Leistungstest | Wird ein Messwert bei definierter Last erreicht? |
| Belastungstest | Wie verhält sich das System unter erwarteter/hoher Last? |
| Benutzbarkeitstest | Kann die Zielgruppe ihre Aufgabe ausführen? |
| Regressionstest | Funktioniert Bestehendes nach einer Änderung? |
| Wiederherstellungstest | Lassen sich Daten oder Dienst wiederherstellen? |

Ein Test kann mehrere Aspekte berühren; sein Ziel bleibt eindeutig.

---

## 7. Positiv-, Negativ- und Grenzwerttest

Beispiel Anmeldung:

- positiv: gültiger Benutzer und gültiges Passwort;
- negativ: gültiger Benutzer und falsches Passwort;
- Grenzwert: Fehlversuche unmittelbar vor und an der Sperrschwelle;
- Berechtigung: Nutzer ohne Rolle versucht Ressourcenzugriff.

Ein Negativtest ist bestanden, wenn das unzulässige Verhalten korrekt verhindert wird.

---

## 8. Testdaten

Testdaten:

- decken normale und extreme Werte ab;
- vermeiden unnötige echte personenbezogene Daten;
- sind gekennzeichnet;
- ermöglichen Wiederholung;
- werden nach Konzept entfernt;
- lösen keine echten Zahlungen oder Nachrichten aus.

Produktivdaten in einer Testumgebung erzeugen Datenschutz- und Sicherheitsrisiken.

---

## 9. Testumgebung

Für Repräsentativität:

- OS und Patchstand;
- Hardware und Ressourcen;
- Netzwerk und Latenz;
- Rollen und Policies;
- Datenvolumen;
- Schnittstellen;
- Sicherheitssoftware;
- Konfiguration.

Abweichungen zur Produktion werden dokumentiert und bei der Bewertung berücksichtigt.

---

## 10. Baseline

Eine Baseline ist die Ausgangsmessung vor einer Änderung.

Beispiele:

- Startzeit;
- CPU und RAM in Ruhe und Last;
- Datenträgerdurchsatz;
- Anwendungsantwortzeit;
- Netzwerklatenz;
- Logfehleranzahl.

Ohne Baseline ist eine behauptete Leistungsverbesserung nicht sauber belegt.

---

## 11. Reproduzierbarkeit

Vergleichbar bleiben:

- Testdaten;
- Startzustand;
- Hintergrundlast;
- Version;
- Netzwerk;
- Messpunkt;
- Dauer;
- Wiederholungszahl.

Ein Einzelwert kann zufällig sein. Mehrere Läufe und gegebenenfalls Mittelwert, Median und Streuung erhöhen Aussagekraft.

---

## 12. Symptom, Ursache und Folge

Beispiel:

- Symptom: Anmeldung dauert 90 Sekunden.
- Ursache: Client nutzt einen externen DNS-Resolver.
- Folge: Domänendienste werden nicht gefunden, Timeouts entstehen.

„Der Rechner ist langsam, weil das Netzwerk langsam ist“ ist ohne Messung nur eine Hypothese.

---

## 13. Diagnoseprozess

1. Fehlerbild genau erfassen.
2. Reproduzieren.
3. Scope bestimmen: Nutzer, Gerät, Standort oder alle.
4. Zeitpunkt und letzte Änderungen prüfen.
5. Grundvoraussetzungen kontrollieren.
6. Messwerte und Logs sammeln.
7. Hypothese formulieren.
8. Einen gezielten Test durchführen.
9. Ergebnis bewerten.
10. Ursache beheben oder eskalieren.
11. Ausgangs- und Regressionstest.
12. Dokumentieren.

---

## 14. Top-down, Bottom-up und Divide and Conquer

`Top-down`: von Anwendung zu unteren Schichten.  
`Bottom-up`: von physischer Grundlage nach oben.  
`Divide and Conquer`: in der Mitte prüfen und die Fehlerhälfte eingrenzen.

Beispiele:

- kein Link → bottom-up;
- nur eine Anwendung fehlerhaft → top-down;
- lange unbekannte Kette → divide and conquer.

---

## 15. Ein Faktor je Versuch

Wer gleichzeitig Kabel, Treiber, DNS und Dienst ändert, kennt auch nach Erfolg die Ursache nicht.

| Versuch | Änderung | Ergebnis | Schluss |
|---|---|---|---|
| 1 | Kabel A→B | Fehler bleibt | Kabel A nicht als Ursache bestätigt |
| 2 | DNS korrigiert | Fehler weg | Hypothese durch Retest bestätigen |

Jeder Versuch erhält Zeit, Änderung und Ergebnis.

---

## 16. Logs

Nützliche Felder:

- Zeitstempel und Zeitzone;
- Quelle und Host;
- Ereignis-ID;
- Schweregrad;
- Benutzer oder Prozess;
- Korrelations-ID;
- Meldung;
- Kontext davor und danach.

Ein Logfehler ist nicht automatisch die Ursache. Eine Zeitlinie hilft, das erste relevante Ereignis zu finden.

---

## 17. Datenschutz bei Logs

Logs können enthalten:

- Benutzernamen;
- IP-Adressen;
- Dateipfade;
- Suchanfragen;
- Tokens;
- fachliche Inhalte.

Erforderlich sind Zweck, minimaler Umfang, Berechtigungen, Aufbewahrung/Löschung, Schutz und Maskierung. Passwörter und Secrets gehören nicht ins Log.

---

## 18. CPU-Diagnose

Zu prüfen:

- Gesamtlast und einzelne Prozesse;
- Verteilung auf Kerne/Threads;
- Takt und Temperatur;
- Lastdauer;
- Ready-/Wait-Zeiten bei Virtualisierung;
- Hintergrundprozesse;
- Energieplan.

100 % CPU während eines beabsichtigten Builds können normal sein. 100 % im Leerlauf brauchen Untersuchung.

---

## 19. RAM-Diagnose

Kennzahlen:

- belegter und verfügbarer RAM;
- Verbrauch je Prozess;
- Commit oder virtueller Speicher;
- Swap-/Pagefile-Aktivität;
- Page Faults im Kontext;
- Entwicklung über Zeit;
- VM-/Containerzuweisung.

RAM-Mangel zeigt sich häufig durch Auslagerung und Datenträgerlast. Ein großer Cache kann normal sein und bei Bedarf freigegeben werden.

---

## 20. Datenträger-Diagnose

Zu prüfen:

- freier Speicher;
- aktive Zeit;
- Warteschlange;
- Latenz;
- Durchsatz und IOPS;
- Logfehler;
- Temperatur;
- SMART- oder Herstellerstatus;
- Kabel und Controller;
- verursachender Prozess.

Ein grüner SMART-Status garantiert keinen ausbleibenden plötzlichen Fehler. Backup bleibt nötig.

---

## 21. Netzwerk-Diagnose

1. Link und Medium.
2. IP-Adresse und Präfix.
3. Gateway.
4. lokaler Stack.
5. Ziel-IP.
6. DNS-Auflösung.
7. Route und Firewall.
8. Port und Dienst.
9. Anwendung.

Ping kann blockiert sein und beweist keine Anwendungsverfügbarkeit. Erfolgreicher Ping beweist ebenfalls nicht den benötigten TCP-Port.

---

## 22. Dienst- und Prozessdiagnose

Zu prüfen:

- Prozess-/Dienststatus;
- Starttyp;
- Abhängigkeiten;
- Konto und Rechte;
- Portbindung;
- Konfiguration;
- Logs;
- Ressourcen;
- letzte Änderung;
- Verhalten nach Neustart.

Wiederholtes Neustarten ohne Analyse kann Symptome beseitigen und Ursachenfindung erschweren.

---

## 23. Treiber- und Gerätefehler

1. Gerät und Hardware-ID.
2. Verbindung und Strom.
3. Gerätestatus und Fehlercode.
4. Treiberversion und Signatur.
5. OS- und Firmwarekompatibilität.
6. letzter funktionierender Stand.
7. Ereignisprotokoll.
8. Herstellerdiagnose.
9. kontrollierter Rollback und Test.

Zufällige Treiber-Updater sind keine kontrollierte Quelle.

---

## 24. Bootfehler

Mögliche Ebenen:

- kein Strom;
- kein POST;
- Gerät nicht gefunden;
- Bootloaderfehler;
- Kernel- oder Stopfehler;
- Dienst- oder Anmeldefehler;
- Benutzerprofil.

Meldung, Firmware, Bootgerät, letzte Änderung, Recoveryumgebung, Datenträgerstatus und Logs helfen bei der Eingrenzung. Vor reparierenden Änderungen wird gesichert.

---

## 25. Werkzeuge Windows

- Task-Manager;
- Ressourcenmonitor;
- Ereignisanzeige oder `Get-WinEvent`;
- Geräte-Manager;
- `systeminfo`;
- `ipconfig`;
- `ping`, `tracert`, `nslookup`;
- `netstat` oder `Get-NetTCPConnection`;
- `whoami`;
- `gpresult`;
- Performance Monitor.

Das Werkzeug folgt der Hypothese; es wird nicht als beliebige Liste abgearbeitet.

---

## 26. Werkzeuge Linux

- `ps`, `top` oder `htop`;
- `free`;
- `df`, `du`;
- `lsblk`;
- `ip`;
- `ss`;
- `ping`, `tracepath`, `dig`;
- `journalctl`;
- `systemctl status`;
- `dmesg` mit passenden Rechten;
- `id`, `getfacl`.

Last, Rechte und Datenschutz werden auch bei Diagnosebefehlen berücksichtigt.

---

## 27. Leistungstest

Festgelegt werden:

- Ziel und KPI;
- Testlast;
- Datenmenge;
- Aufwärmphase;
- Dauer;
- Wiederholungen;
- Messpunkt;
- Parallelität;
- Umgebung;
- Grenzwert.

Ein Durchschnitt kann seltene starke Verzögerungen verdecken. Ein Perzentil wie p95 darf verwendet werden, wenn seine Bedeutung erklärt wird.

---

## 28. Bottleneck

Ein Engpass begrenzt den aktuellen Workload.

Beispiel:

- CPU 35 %;
- RAM nahezu voll;
- Pagefile stark aktiv;
- SSD mit hoher aktiver Zeit;
- Anwendung reagiert verzögert.

Hypothese: RAM-Mangel verursacht Auslagerung. Zur Prüfung wird zeitweise RAM oder Last kontrolliert verändert und derselbe Test wiederholt.

Eine Einzelkennzahl genügt nicht; Messwerte werden korreliert.

---

## 29. Fehlerbehebung, Workaround und Eskalation

`Fehlerbehebung` beseitigt die Ursache.  
`Workaround` reduziert vorübergehend die Wirkung.  
`Eskalation` übergibt das Problem mit ausreichenden Informationen.

Eskalationspaket:

- Fehlerbild;
- geschäftliche Auswirkung;
- Scope und Priorität;
- Umgebung und Version;
- Zeitlinie;
- Reproduktionsschritte;
- Logs und Messwerte;
- ausgeführte Tests;
- Änderungen;
- Ansprechpartner.

---

## 30. Regression und Abschluss

Nach einer Korrektur:

1. Ausgangsfehler tritt nicht mehr auf.
2. Anforderung ist erfüllt.
3. Verwandte Funktionen bestehen Regressionstests.
4. Security wurde nicht geschwächt.
5. Monitoring bleibt stabil.
6. Dokumentation ist aktualisiert.
7. Workaround ist entfernt oder dokumentiert.
8. Abnahme oder Freigabe liegt vor.

---

## 31. Leistungs- und Testprotokoll

Mindestfelder:

- Auftrag oder Ticket;
- Gerät und System;
- Version und Konfiguration;
- Tester, Datum und Zeit;
- Test-ID;
- Voraussetzung;
- Soll;
- Ist;
- Messwerte mit Einheit;
- Status;
- Fehler und Abweichung;
- Maßnahme;
- Retest;
- Nachweis;
- Freigabe.

Secrets und unnötige personenbezogene Daten werden ausgeschlossen.

---

## 32. Vollständiger Praxisfall

Nach Ausrollen von 20 Clients dauert die Anmeldung 90 Sekunden; IP-Dienste sind erreichbar.

1. Testfall: Credential-Eingabe bis Desktopbereitschaft ≤45 s.
2. Scope: fünf neue Clients in einer OU.
3. Zeitstempel und Baseline eines funktionierenden Clients.
4. IP, DNS, Zeit und GPO-Ergebnis prüfen.
5. Befund: DNS zeigt auf öffentlichen Resolver.
6. Hypothese: AD-Dienste fehlen, Timeouts verzögern Anmeldung.
7. Ausschließlich DNS korrigieren.
8. Namensauflösung und Anmeldung dreimal wiederholen.
9. Ergebnisse: 32 s, 34 s und 33 s.
10. GPO und Ressourcen als Regression prüfen.
11. Ursache und Ergebnisse protokollieren.

> Die Ursache war die fehlerhafte DNS-Konfiguration. Nach der Zuweisung des vorgesehenen internen DNS-Servers lag die Anmeldezeit in drei Messungen zwischen 32 und 34 Sekunden und erfüllte den Grenzwert von 45 Sekunden.

---

## 33. Prüfungsalgorithmus

1. Soll und Anforderung.
2. Fehlerbild und Ist.
3. Umgebung, Scope und Zeit.
4. Reproduzieren.
5. Sichere Basisprüfungen.
6. Logs und Messwerte.
7. Hypothese.
8. Ein Test oder eine Änderung.
9. Retest und Regression.
10. Protokoll, Freigabe oder Eskalation.

---

## 34. Typische Prüfungsfallen

| Falle | Korrektur |
|---|---|
| „geht nicht“ als Fehlerbild | genaue Symptome, Zeit und Scope |
| Symptom ist Ursache | Hypothese messen |
| mehrere Änderungen gleichzeitig | ein Faktor |
| Ping beweist Anwendung | Port, Dienst und Funktion testen |
| 100 % CPU heißt defekte Hardware | Workload, Prozess, Dauer, Temperatur |
| ein Messwert genügt | gleiche Bedingungen und Wiederholung |
| Logfehler ist Ursache | Zeitlinie und Korrelation |
| Neustart ist Lösung | Ursache und Wiederauftreten prüfen |
| Fix ohne Regression | verbundene Funktionen testen |
| Screenshot ist vollständiges Protokoll | Soll, Ist, Umgebung und Nachweis |

---

## 35. Selbsttest

1. Trenne Test, Messung und Monitoring.
2. Mache „PC startet schnell“ messbar.
3. Nenne Felder eines Testfalls.
4. Was ist ein Integrationstest?
5. Was ist ein Regressionstest?
6. Wann ist ein Negativtest bestanden?
7. Welche Anforderungen gelten für Testdaten?
8. Was macht eine Testumgebung repräsentativ?
9. Wozu dient eine Baseline?
10. Was stellt Reproduzierbarkeit her?
11. Trenne Symptom, Ursache und Folge.
12. Nenne die Diagnoseschritte.
13. Wann wird bottom-up gearbeitet?
14. Warum nur ein Faktor?
15. Welche Felder sind in Logs wichtig?
16. Welche Datenschutzrisiken haben Logs?
17. Was wird bei einem CPU-Problem geprüft?
18. Welche Hinweise gibt es auf RAM-Mangel?
19. Warum garantiert SMART-grün nichts?
20. Warum reicht Ping nicht?
21. Was wird bei einem Dienst geprüft?
22. Wie wird ein Treiberproblem diagnostiziert?
23. Nenne Ebenen eines Bootfehlers.
24. Nenne vier Windows-Werkzeuge.
25. Nenne vier Linux-Werkzeuge.
26. Was wird für einen Leistungstest festgelegt?
27. Was bedeutet p95?
28. Trenne Fehlerbehebung und Workaround.
29. Was gehört in eine Eskalation?
30. Welche Schritte folgen nach einem Fix?

<details>
<summary>Lösungen anzeigen</summary>

1. Kontrolliertes Soll/Ist; quantitativer Wert; Beobachtung über Zeit.
2. Start- und Endpunkt, Zustand, Grenzwert und Wiederholungen festlegen.
3. ID, Bezug, Ziel, Voraussetzung, Schritte, Soll, Ist, Status, Nachweis, Datum.
4. Prüfung des Zusammenspiels von Komponenten oder Systemen.
5. Nachweis, dass bestehende Funktionen nach Änderung weiter funktionieren.
6. Wenn unzulässiges Verhalten korrekt verhindert wird.
7. Grenzen abdecken, kennzeichnen, reproduzierbar, datensparsam und löschbar.
8. Vergleichbare Version, Hardware, Netz, Rollen, Datenmenge und Security.
9. Vergleich des Zustands vor und nach einer Änderung.
10. Gleiche Daten, Zustand, Umgebung, Messpunkt, Dauer und Wiederholungen.
11. Beobachtung, zugrunde liegender Grund und Auswirkung.
12. Beschreibung, Scope, Änderung, Messung, Hypothese, Test, Fix, Retest, Doku.
13. Bei vermutlich physischer oder unterer Ursache.
14. Damit das Ergebnis einer Änderung zugeordnet werden kann.
15. Zeit, Quelle, ID, Schweregrad, Nutzer/Prozess, Korrelation und Kontext.
16. Namen, IP, Pfade, Inhalte, Tokens und zu lange Aufbewahrung.
17. Prozesse, Kerne, Takt, Temperatur, Dauer und Hintergrundlast.
18. Wenig verfügbarer RAM, Swap/Pagefile und hohe Datenträgeraktivität.
19. Es kann nicht jeden plötzlichen Ausfall vorhersagen.
20. ICMP und benötigter Port oder Dienst können unterschiedlichen Status haben.
21. Status, Starttyp, Abhängigkeiten, Konto, Port, Konfiguration, Logs und Ressourcen.
22. Hardware-ID, Verbindung, Fehlercode, Version/Signatur, Kompatibilität und Rollback.
23. Strom, POST, Gerät, Bootloader, Kernel, Dienst/Anmeldung und Profil.
24. Task-Manager, Ereignisanzeige, Geräte-Manager, ipconfig, nslookup oder gpresult.
25. ps/top, free, df/du, lsblk, ip/ss, journalctl oder systemctl.
26. KPI, Last, Daten, Warm-up, Dauer, Wiederholungen, Messpunkt und Grenzwert.
27. Der Wert, unter oder gleich dem 95 % der Messungen liegen.
28. Fix beseitigt Ursache; Workaround mindert vorübergehend die Wirkung.
29. Symptom, Auswirkung, Scope, Version, Zeitlinie, Schritte, Logs, Tests, Änderungen.
30. Ausgangstest, Regression, Security, Monitoring, Dokumentation und Freigabe.

</details>

---

## 36. Quellen und Abgleich

- [§ 9 FIAusbV](https://www.gesetze-im-internet.de/fiausbv/__9.html)
- [Microsoft Learn – Windows Client Troubleshooting](https://learn.microsoft.com/en-us/troubleshoot/windows-client/)
- [Microsoft Learn – Get-WinEvent](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.diagnostics/get-winevent)
- [systemd – journalctl](https://www.freedesktop.org/software/systemd/man/latest/journalctl.html)
- [BSI IT-Grundschutz-Kompendium](https://www.bsi.bund.de/grundschutz-kompendium)

Konkrete Befehle, Zähler und Grenzwerte hängen von Betriebssystemversion und Anforderung ab. Werte im Praxisfall sind Übungsdaten.

---

## 37. Offene Prüfpunkte für den Unterricht

- Welchen Aufbau eines Testfalls verlangt die WBS?
- Werden Teststufen oder nur Testarten erwartet?
- Gehören Äquivalenzklassen und Grenzwertanalyse hierher oder in Qualitätssicherung?
- Welche Windows- und Linux-Befehle sind Pflicht?
- Werden Mittelwert, Median oder Perzentile eingesetzt?
- Wie trennt die WBS Leistungs- und Belastungstest?
- Welche Felder sind im Leistungsprotokoll verpflichtend?
- Wann wird eskaliert?
- Wie wird die Abnahme nach einem Retest dokumentiert?
