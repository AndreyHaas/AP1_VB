---
pruefung: AP1
thema: Systemeinrichtung, UEFI, Partitionen, Betriebssystem und Treiber
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Deutsch
gegenstueck: ../ru/01-systemeinrichtung-uefi-partitionen-betriebssystem-und-treiber-ru.md
---

# AP1: Systemeinrichtung, UEFI, Partitionen, Betriebssystem und Treiber

Systemeinrichtung ist ein kontrollierter Prozess von der Anforderung bis zur Abnahme. Eine gute Installation endet nicht mit dem sichtbaren Desktop: Hardware, Firmware, Partitionierung, Betriebssystem, Treiber, Updates, Sicherheit, Netzwerk und Fachanwendungen müssen gemeinsam funktionieren und dokumentiert sein.

---

## 1. Lernziele

Nach dieser Einheit kannst du:

- Kernaufgaben eines Betriebssystems erklären;
- Prozess und Thread unterscheiden;
- die Bootkette von der Firmware bis zum OS beschreiben;
- BIOS und UEFI unterscheiden;
- Secure Boot und TPM ohne Übertreibung erklären;
- Datenträger, Partition, Volume und Dateisystem trennen;
- GPT/MBR und Partitionierung szenariobezogen auswählen;
- manuelle, imagebasierte und unbeaufsichtigte Installation planen;
- Installationsmedien sicher einsetzen;
- Treiber und Updates installieren und prüfen;
- Verschlüsselung und Wiederherstellung planen;
- Migration, Pilot, Test, Rollback und Dokumentation durchführen.

---

## 2. Prüfungsminimum — 15 Minuten

1. Das Betriebssystem verwaltet Prozesse, Speicher, Dateien, Geräte, Benutzer und Netzwerk.
2. UEFI ist ein moderner Firmwarestandard. Secure Boot prüft eine vertrauenswürdige Bootkette, verschlüsselt aber keine Daten.
3. Eine `Partition` ist ein Bereich des Datenträgers; das `Dateisystem` organisiert Daten in einem Volume.
4. GPT wird üblicherweise mit UEFI und modernen Systemen eingesetzt; konkrete Kompatibilität wird geprüft.
5. Vor Installation: Bedarf, Kompatibilität, Backup, Lizenz, Medium, Netzwerk und Rollback.
6. Nach Installation: Treiber → Updates → Sicherheit → Anwendungen → Tests → Protokoll.
7. Treiber aus unbekannter Quelle sind ein Sicherheitsrisiko.
8. Verschlüsselung ohne geprüften Recovery-Schlüssel kann einen Fehler zum Datenverlust machen.

Musterantwort:

> Vor der Neuinstallation werden die benötigten Daten gesichert und die Wiederherstellung geprüft. Anschließend werden Firmwaremodus, Datenträgerziel und Installationsmedium eindeutig kontrolliert, damit weder ein inkompatibles System noch ein unbeabsichtigter Datenverlust entsteht.

---

## 3. Aufgaben eines Betriebssystems

- Prozess- und Threadverwaltung;
- Speicherverwaltung;
- Datei- und Datenträgerverwaltung;
- Geräteverwaltung über Treiber;
- Benutzer- und Rechteverwaltung;
- Netzwerkfunktionen;
- Sicherheitsmechanismen;
- Benutzeroberfläche;
- Schnittstellen für Anwendungen;
- Protokollierung und Fehlerbehandlung.

Das Betriebssystem verteilt begrenzte Ressourcen und trennt Prozesse im Rahmen seiner Architektur und Konfiguration.

---

## 4. Prozess und Thread

Ein `Prozess` ist eine laufende Programminstanz mit eigenem Adressraum und Ressourcen.

Ein `Thread` ist ein Ausführungsstrang innerhalb eines Prozesses. Mehrere Threads können Speicher und weitere Prozessressourcen teilen.

Beim präemptiven Multitasking weist der Scheduler Prozessorzeit zu. Ein Fehler in einem Thread kann den ganzen Prozess betreffen, weil Threads Ressourcen teilen.

---

## 5. Bootkette

```text
Einschalten
→ Firmware initialisiert Hardware
→ Bootgerät auswählen
→ Bootloader starten
→ Kernel laden
→ Treiber und Dienste starten
→ Anmeldung
```

Für die Diagnose wird festgestellt, auf welcher Ebene der Start abbricht.

---

## 6. BIOS und UEFI

Das klassische BIOS ist eine historische Firmware-Schnittstelle. UEFI definiert eine moderne Schnittstelle zwischen Plattform-Firmware und Betriebssystem.

Typische UEFI-Funktionen:

- UEFI-Bootmanager;
- GPT-Unterstützung;
- Secure Boot;
- Firmware-Setup;
- Geräteinitialisierung;
- Schnittstellen für Bootloader.

UEFI allein garantiert weder aktiviertes Secure Boot noch eine sichere Konfiguration.

---

## 7. POST und Firmwareeinstellungen

Beim Start prüft und initialisiert die Firmware Hardware.

Zu kontrollieren:

- CPU und RAM;
- Speichergeräte;
- Bootreihenfolge;
- UEFI-/Legacy-Modus;
- Secure Boot;
- TPM;
- Virtualisierung;
- Datum und Uhrzeit;
- Controllermodus;
- Firmwareversion.

Vor Änderungen wird der Ausgangszustand dokumentiert. Eine beliebige Teständerung kann das System unbootbar machen.

---

## 8. Secure Boot

Secure Boot prüft digitale Signaturen vertrauenswürdiger Komponenten der Bootkette und erschwert den Start manipulierten Bootcodes.

Secure Boot:

- verschlüsselt keine Nutzerdaten;
- ersetzt keine Updates;
- prüft nicht jede Anwendung;
- verhindert nicht jede Schadsoftware;
- ersetzt keine MFA.

Firmware, Schlüssel, Bootloader und OS müssen zusammenpassen.

---

## 9. TPM

Ein `Trusted Platform Module` stellt geschützte kryptografische Funktionen und Plattformmessungen bereit.

Anwendungen:

- Schlüssel schützen;
- Bootzustand messen;
- Geräteverschlüsselung unterstützen;
- Geräteidentität unterstützen.

Das TPM ist keine Sicherung des Recovery-Schlüssels. Wiederherstellungsinformationen werden kontrolliert getrennt verwahrt.

---

## 10. Datenträger, Partition, Volume, Dateisystem

| Begriff | Bedeutung |
|---|---|
| Datenträger | physischer oder logischer Speicher |
| Partition | definierter Bereich eines Datenträgers |
| Volume | für das OS nutzbarer logischer Bereich |
| Dateisystem | Struktur für Dateien, Verzeichnisse und Metadaten |
| Mountpoint/Laufwerk | Zugriffspunkt im Betriebssystem |

Formatieren legt ein Dateisystem an; Partitionieren verändert die Aufteilung.

---

## 11. GPT und MBR

`GPT`:

- moderne Partitionstabelle;
- üblicherweise mit UEFI;
- unterstützt mehr und größere Partitionen;
- besitzt zusätzliche Strukturinformationen.

`MBR`:

- Legacy-Partitionstabelle und Bootcode;
- für ältere kompatible Szenarien;
- besitzt engere Grenzen.

Die Wahl hängt von Firmwaremodus, OS, Bootanforderung und Kompatibilität ab. Vor einer Umstellung ist ein Backup erforderlich.

---

## 12. Partitionierungsplanung

Mögliche Bereiche:

- EFI-Systempartition;
- Betriebssystem;
- Recovery;
- Nutzdaten;
- gesonderter Bereich für besondere Anforderungen.

Eine separate Datenpartition kann Neuinstallation und Verwaltung erleichtern, ist aber kein Backup. Beim Ausfall eines Datenträgers können alle Partitionen verloren gehen.

Größen folgen aus OS, Anwendungen, Updates, Nutzdaten, temporären Daten, Wachstum, Recovery und Reserve.

---

## 13. Dateisystemauswahl

Kriterien:

- Betriebssystem;
- Rechte und ACL;
- Journaling;
- maximale Datei- und Volumegröße;
- Verschlüsselung;
- Kompatibilität mit anderen Systemen;
- Performance und Workload;
- Robustheit;
- Backupwerkzeuge.

NTFS, exFAT, FAT32, ext4 und APFS werden in Kapitel 14 vertieft.

---

## 14. Installationsarten

| Art | Einsatz |
|---|---|
| manuell | einzelner Rechner, Test, Sonderfall |
| imagebasiert | gleichartige Systeme aus geprüfter Vorlage |
| unbeaufsichtigt | automatisierte Installation mit Antwortdatei/Management |
| In-place Upgrade | Anwendungen und Daten bei unterstütztem Upgrade erhalten |
| Neuinstallation | saubere Installation mit Migration |

Bei vielen Arbeitsplätzen erhöht manuelle Wiederholung Aufwand und Fehler. Image und Automation benötigen sorgfältigen Test und Pflege.

---

## 15. Installationsmedium

Zu prüfen:

- offizielle Quelle;
- Version und Edition;
- Architektur;
- Integrität oder Signatur;
- Aktualität;
- Bootmodus;
- Schreibschutz;
- sichere Aufbewahrung;
- Dokumentation.

Ein ISO aus einem beliebigen Drittportal ist nicht vertrauenswürdig.

---

## 16. Vorbereitung

1. Projektauftrag oder Änderungsfreigabe.
2. Gerät und Nutzer identifizieren.
3. Hardware- und OS-Kompatibilität.
4. Daten und Anwendungen inventarisieren.
5. Backup mit Restoreprüfung.
6. Lizenz und Aktivierung.
7. Netzwerk, Proxy, Zeit und DNS.
8. Treiber und Firmware.
9. Konten und Rollen.
10. Verschlüsselung und Recovery.
11. Testfälle und Abnahmekriterien.
12. Rollback und Termin.

---

## 17. Datensicherung vor Änderung

Zu sichern sind je nach Bedarf:

- Nutzdaten;
- lokale Datenbanken;
- Browser- und Anwendungsprofile;
- Zertifikate und Schlüssel;
- Konfiguration;
- Lizenzinformationen;
- Sondertreiber;
- Anwendungsliste.

Die Kopie allein genügt nicht. Lesbarkeit und Wiederherstellung werden stichprobenartig geprüft.

---

## 18. Installationsablauf

1. Gerät und Zieldatenträger erneut abgleichen.
2. Firmwaremodus und Bootmedium wählen.
3. Partitionstabelle und Partitionen anlegen.
4. OS installieren.
5. Sprache, Zeit und Netzwerk grundlegend konfigurieren.
6. Herstellertreiber installieren.
7. Updates bis zum freigegebenen Stand.
8. Sicherheitsbaseline anwenden.
9. Benutzer, Domäne und Richtlinien.
10. Freigegebene Software.
11. Datenmigration.
12. Test und Dokumentation.

---

## 19. Treiber

Ein Treiber verbindet Betriebssystem und Gerät.

Zu prüfen:

- Hardware-ID;
- OS-Version und Architektur;
- Herstellerquelle;
- digitale Signatur;
- Abhängigkeiten;
- Firmwarekompatibilität;
- Release Notes;
- Rollbackmöglichkeit.

Ein unbekanntes Gerät wird anhand der Hardware-ID untersucht, nicht mit zufälligen Treiberpaketen.

---

## 20. Reihenfolge der Treiber

Es gibt keine universelle Reihenfolge. Praktisch werden häufig zuerst Basiskomponenten eingerichtet:

- Chipsatz und Systemgeräte;
- Speichercontroller;
- Netzwerk;
- Grafik;
- Audio;
- Peripherie;
- Managementagent.

Herstellervorgaben können abweichen. Danach werden Gerätestatus, Ereignisprotokoll und Funktion geprüft.

---

## 21. Updates

Nach Installation:

- OS- und Sicherheitsupdates;
- freigegebene Treiberupdates;
- Firmware bei Bedarf;
- Signatur- oder Definitionsupdates;
- Anwendungspatches.

Der neueste Treiber ist nicht automatisch die beste Unternehmensversion. Er muss freigegeben, unterstützt und getestet sein.

---

## 22. Lizenzierung und Aktivierung

Zu klären:

- richtige Edition;
- zulässiger Lizenzkanal;
- Zuordnung zu Gerät oder Nutzer;
- Aktivierung;
- Nachweis;
- Virtualisierungs- und Mehrfachnutzung;
- Laufzeit und Wartung.

Technische Aktivierung beweist keine korrekte Lizenzierung. Umgekehrt kann ein Nutzungsrecht vor Abschluss der Aktivierung bestehen.

---

## 23. Basiskonfiguration

- eindeutiger Computername;
- Datum, Zeit und Zeitzone;
- Sprache und Region;
- Netzwerkprofil;
- DNS und Proxy;
- Energieoptionen;
- Updatequelle;
- Logging;
- Remotezugriff nur bei Bedarf;
- Inventarisierung;
- Managementsystem.

Falsche Zeit kann Zertifikate, Kerberos und Protokolle beeinträchtigen.

---

## 24. Domänenaufnahme

Vor dem Beitritt:

- eindeutiger Rechnername;
- korrekte IP-Konfiguration;
- vorgesehener DNS-Server;
- synchronisierte Zeit;
- erreichbarer Domänencontroller;
- definierte Join-Berechtigung;
- bekannte Ziel-OU und Richtlinien;
- kontrolliertes lokales Notfallkonto.

Kapitel 14 behandelt die Domäne ausführlich.

---

## 25. Sicherheitsbaseline

Mögliche Maßnahmen:

- unterstützte Version;
- minimale Anwendungen und Dienste;
- Firewall;
- Laufwerksverschlüsselung;
- Secure Boot und TPM;
- Least Privilege;
- MFA, soweit passend;
- Bildschirmsperre;
- Update- und Schadsoftwareschutz;
- Logging;
- deaktivierte unsichere Protokolle;
- kontrollierte Wechselmedien.

Eine Baseline muss freigegeben und getestet sein.

---

## 26. Geräteverschlüsselung und Recovery

1. TPM- und Secure-Boot-Zustand prüfen.
2. Daten sichern.
3. Recovery-Schlüssel sicher hinterlegen.
4. Zugriffsberechtigung und Verantwortung festlegen.
5. Verschlüsselung aktivieren.
6. Status kontrollieren.
7. Recoveryprozess organisatorisch testen.

Firmware- oder Hardwareänderungen können eine Recovery-Abfrage auslösen.

---

## 27. Anwendungsinstallation

Verwendet werden:

- freigegebene Quelle;
- geprüfte Version;
- passende Lizenz;
- erforderliche Abhängigkeiten;
- minimale Rechte;
- dokumentierte Konfiguration.

Unnötige Anwendungen erhöhen Angriffsfläche und Patchaufwand.

---

## 28. Datenmigration

1. Quelle festhalten.
2. Daten klassifizieren.
3. Backup erstellen.
4. Zielstruktur und Rechte vorbereiten.
5. Testmigration durchführen.
6. Anzahl, Größe, Hash/Stichprobe oder fachliche Werte vergleichen.
7. Fehlerliste bearbeiten.
8. Nutzerabnahme einholen.
9. Altkopie nach Konzept aufbewahren oder löschen.

---

## 29. Pilot und Rollout

Für 20 gleichartige Arbeitsplätze:

1. Referenzgerät.
2. Vollständige Installation und Test.
3. Pilotgruppe mit realen Rollen.
4. Feststellungen korrigieren.
5. Image/Paket versionieren.
6. Rollout in kleinen Wellen.
7. Monitoring.
8. Abschlussprotokoll.

So wird ein Fehler nicht sofort auf alle Systeme verteilt.

---

## 30. Abnahme und Dokumentation

Zu dokumentieren:

- Gerät, Serien- und Inventarnummer;
- OS, Build und Patchstand;
- Firmware- und UEFI-Zustand;
- Partitionen und Verschlüsselung;
- Treiber;
- Anwendungen und Lizenzen;
- Netzwerk und Domäne;
- Richtlinien;
- Testfälle mit Soll/Ist;
- Abweichungen;
- Übergabe und Abnahme.

Passwörter und Recovery-Schlüssel gehören nicht in ein allgemein zugängliches Protokoll.

---

## 31. Vollständiger Praxisfall

Aufgabe: 20 neue FIAE-Arbeitsplätze.

Muss-Kriterien:

- freigegebene OS-Version;
- zwei VM;
- Domänenaufnahme;
- Laufwerksverschlüsselung;
- IDE und Werkzeuge;
- zwei Monitore;
- keine kritischen Fehler;
- dokumentierter Test.

Vorgehen:

1. Hardware und OS-/Workloadbedarf vergleichen.
2. Backup und Migration je Nutzer klären.
3. UEFI, Secure Boot und TPM prüfen.
4. GPT und Partitionierung nach Standard.
5. Referenzsystem aus signiertem Medium.
6. Treiber, Updates, Baseline und Anwendungen.
7. Domäne, Richtlinien und Daten.
8. Funktions-, Sicherheits- und Leistungstest.
9. Pilot mit zwei Nutzern.
10. Gestufter Rollout und Protokoll.

> Bis zum 25.09.2026 werden 20 Arbeitsplätze nach der freigegebenen Referenzkonfiguration eingerichtet, in die Domäne aufgenommen und gemäß Testprotokoll ohne kritische Fehler abgenommen.

---

## 32. Prüfungsalgorithmus

1. Bedarf und Ausgangszustand.
2. Backup und Restore.
3. Kompatibilität und Lizenz.
4. Firmware und Bootmodus.
5. Zieldatenträger und Partitionen.
6. OS, Treiber und Updates.
7. Security, Netzwerk und Domäne.
8. Anwendungen und Daten.
9. Test und Pilot.
10. Dokumentation, Abnahme und Rollback.

---

## 33. Typische Prüfungsfallen

| Falle | Korrektur |
|---|---|
| UEFI ist Betriebssystem | Firmware-Schnittstelle |
| Secure Boot ist Verschlüsselung | Signaturprüfung der Bootkette |
| Partition ist Dateisystem | Bereich und Organisationsstruktur trennen |
| Datenpartition ist Backup | gleicher Datenträger kann ausfallen |
| Installationsmedium beliebiger Herkunft | Herstellerquelle und Integrität |
| neuester Treiber ist bester | Freigabe und Kompatibilität |
| Aktivierung ist Lizenznachweis | technische und rechtliche Ebene |
| Backup erstellt heißt Daten sicher | Restoreprüfung |
| Desktop startet heißt Abnahme | Funktion, Sicherheit und Last |
| Recovery-Schlüssel auf demselben Gerät | getrennte sichere Aufbewahrung |

---

## 34. Selbsttest

1. Nenne fünf Aufgaben eines Betriebssystems.
2. Wie unterscheiden sich Prozess und Thread?
3. Beschreibe die Bootkette.
4. Was ist UEFI?
5. Was leistet Secure Boot und was nicht?
6. Wozu dient ein TPM?
7. Trenne Datenträger, Partition, Volume und Dateisystem.
8. Wann wird GPT üblicherweise eingesetzt?
9. Warum ist eine Datenpartition kein Backup?
10. Nenne vier Installationsarten.
11. Was wird am Installationsmedium geprüft?
12. Welche Daten sind vor Neuinstallation zu sichern?
13. Warum ist eine Restoreprüfung nötig?
14. Nenne die Installationsschritte.
15. Wie wird ein Treiber ausgewählt?
16. Warum ist der neueste Treiber nicht immer passend?
17. Trenne Aktivierung und Lizenzierung.
18. Warum ist die Zeitkonfiguration wichtig?
19. Was wird vor der Domänenaufnahme geprüft?
20. Nenne fünf Baseline-Maßnahmen.
21. Wie wird Verschlüsselung vorbereitet?
22. Warum ist unnötige Software riskant?
23. Wie wird eine Migration geprüft?
24. Wozu dient ein Pilot?
25. Was gehört ins Systemprotokoll?

<details>
<summary>Lösungen anzeigen</summary>

1. Prozesse, Speicher, Dateien, Geräte, Nutzer/Rechte, Netzwerk und Security.
2. Prozess besitzt Ressourcen; Threads teilen Prozessressourcen.
3. Firmware → Bootgerät → Bootloader → Kernel → Treiber/Dienste → Anmeldung.
4. Standardisierte Schnittstelle zwischen Plattform-Firmware und Betriebssystem.
5. Prüft Bootsignaturen; verschlüsselt keine Daten und ersetzt keine Updates.
6. Schlüssel schützen, Bootzustand messen und Geräteidentität unterstützen.
7. Speicher; Bereich; nutzbarer logischer Bereich; Organisationsstruktur.
8. Bei modernen UEFI-Systemen mit unterstütztem Betriebssystem.
9. Beim Ausfall des Datenträgers gehen alle Partitionen verloren.
10. Manuell, imagebasiert, unbeaufsichtigt, In-place und Neuinstallation.
11. Quelle, Version, Edition, Architektur, Integrität und Bootmodus.
12. Nutzdaten, Profile, Datenbanken, Zertifikate, Schlüssel, Konfiguration, Lizenzen.
13. Erst Wiederherstellung belegt die Nutzbarkeit der Kopie.
14. Ziel, Partitionen, OS, Treiber, Updates, Baseline, Domäne, Apps, Daten, Test.
15. Hardware-ID, OS, Architektur, Hersteller, Signatur, Hinweise und Rollback.
16. Eine neue Version kann ungeprüft oder inkompatibel sein.
17. Aktivierung ist technisch; Lizenz ist das rechtliche Nutzungsrecht.
18. Zertifikate, Kerberos und Protokolle benötigen korrekte Zeit.
19. Name, IP, DNS, Zeit, Erreichbarkeit, Rechte und OU.
20. Firewall, Verschlüsselung, Least Privilege, Updates, Sperre und Logging.
21. Backup, Recovery-Schlüssel, Verantwortung, Aktivierung und Kontrolle.
22. Sie vergrößert Angriffsfläche und Patchaufwand.
23. Anzahl/Größe, Fehlerliste und Stichproben beziehungsweise Hashes vergleichen.
24. Fehler vor dem breiten Rollout erkennen.
25. Inventar, OS/Patch, Firmware, Partitionen, Treiber, Apps, Domäne und Tests.

</details>

---

## 35. Quellen und Abgleich

- [§ 9 FIAusbV](https://www.gesetze-im-internet.de/fiausbv/__9.html)
- [UEFI Forum – Specifications](https://uefi.org/specifications)
- [Microsoft – Windows 11 Systemanforderungen](https://www.microsoft.com/windows/windows-11-specifications)
- [Microsoft Learn – Windows Deployment](https://learn.microsoft.com/en-us/windows/deployment/)
- [BSI IT-Grundschutz-Kompendium](https://www.bsi.bund.de/grundschutz-kompendium)

Herstellerversionen und Anforderungen ändern sich. Konkrete Installationsschritte werden mit der Dokumentation des Betriebssystems und dem freigegebenen Unternehmensstandard abgeglichen.

---

## 36. Offene Prüfpunkte für den Unterricht

- Welche Betriebssystemaufgaben erwartet die WBS?
- Wie tief werden Prozess und Thread geprüft?
- Werden GPT-/MBR-Grenzen numerisch verlangt?
- Muss eine Partitionierung gezeichnet werden?
- Welche UEFI-/Secure-Boot-Schritte nutzt das Labor?
- Wird ein konkreter Windows- oder Linuxablauf erwartet?
- Welche Treiberdiagnosewerkzeuge sind wichtig?
- Wie dokumentiert die WBS Recovery-Schlüssel?
- Welchen Aufbau hat das Abnahmeprotokoll?
