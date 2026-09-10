---
pruefung: AP1
thema: Systemeinrichtung, UEFI, Partitionen, Betriebssystem und Treiber
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/01-systemeinrichtung-uefi-partitionen-betriebssystem-und-treiber-de.md
---

# AP1: Systemeinrichtung, UEFI, Partitionen, Betriebssystem und Treiber

Systemeinrichtung — это управляемый процесс от требований до Abnahme. Хорошая установка не заканчивается загрузкой рабочего стола: Hardware, Firmware, Partitionierung, Betriebssystem, Treiber, Updates, Sicherheit, Netzwerk и Fachanwendungen должны работать вместе и быть задокументированы.

---

## 1. Lernziele

После изучения главы нужно уметь:

- объяснять основные задачи Betriebssystem;
- различать Prozess и Thread;
- описывать Bootkette от Firmware до OS;
- различать BIOS и UEFI;
- объяснять Secure Boot и TPM без преувеличений;
- различать Datenträger, Partition, Volume и Dateisystem;
- выбирать GPT/MBR и Partitionierung по сценарию;
- планировать ручную, image- и unattended-Installation;
- безопасно работать с Installationsmedium;
- устанавливать и проверять Treiber и Updates;
- планировать Verschlüsselung и Recovery;
- выполнять Migration, Pilot, Test, Rollback и Dokumentation.

---

## 2. Prüfungsminimum — 15 минут

1. Betriebssystem управляет Prozessen, Speicher, Dateien, Geräten, Benutzern и Netzwerk.
2. UEFI — современный Firmware-Standard; Secure Boot проверяет доверенную Bootkette, но не шифрует Daten.
3. `Partition` — область Datenträger; `Dateisystem` организует Daten внутри Volume.
4. GPT обычно используется с UEFI и современными системами; конкретная совместимость проверяется.
5. Перед установкой: Bedarf, Kompatibilität, Backup, Lizenz, Installationsmedium, Netzwerk и Rollback.
6. После установки: Treiber → Updates → Sicherheit → Anwendungen → Tests → Protokoll.
7. Treiber из неизвестного источника — Sicherheitsrisiko.
8. Шифрование без проверенного Recovery-Schlüssel может превратить сбой в потерю данных.

Musterantwort:

> Vor der Neuinstallation werden die benötigten Daten gesichert und die Wiederherstellung geprüft. Anschließend werden Firmwaremodus, Datenträgerziel und Installationsmedium eindeutig kontrolliert, damit weder ein inkompatibles System noch ein unbeabsichtigter Datenverlust entsteht.

---

## 3. Aufgaben eines Betriebssystems

- Prozess- и Threadverwaltung;
- Speicherverwaltung;
- Datei- и Datenträgerverwaltung;
- Geräteverwaltung через Treiber;
- Benutzer- и Rechteverwaltung;
- Netzwerkfunktionen;
- Sicherheitsmechanismen;
- Benutzeroberfläche;
- Schnittstellen für Anwendungen;
- Protokollierung и Fehlerbehandlung.

Betriebssystem распределяет ограниченные Ressourcen и изолирует процессы настолько, насколько позволяет Architektur и Konfiguration.

---

## 4. Prozess и Thread

`Prozess` — выполняющийся экземпляр программы с собственным Adressraum и Ressourcen.

`Thread` — Ausführungsstrang внутри процесса; несколько Threads могут совместно использовать Speicher процесса.

`Multitasking` позволяет ОС чередовать выполнение. При präemptivem Multitasking Scheduler выделяет CPU-Zeit.

Ошибка одного Thread может повлиять на весь Prozess, потому что Threads разделяют Ressourcen.

---

## 5. Bootkette

Упрощённо:

```text
Einschalten
→ Firmware initialisiert Hardware
→ Bootgerät auswählen
→ Bootloader starten
→ Kernel laden
→ Treiber und Dienste starten
→ Anmeldung
```

Для диагностики важно определить Ebene, на которой Boot прерывается.

---

## 6. BIOS и UEFI

Классический BIOS — историческая Firmware-Schnittstelle. UEFI предоставляет современную определённую Schnittstelle между Plattform-Firmware и Betriebssystem.

Типичные UEFI-Funktionen:

- UEFI-Bootmanager;
- GPT-Unterstützung;
- Secure Boot;
- Firmware-Setup;
- Geräteinitialisierung;
- Schnittstellen для Bootloader.

UEFI само по себе не гарантирует включённый Secure Boot или безопасную Konfiguration.

---

## 7. POST и Firmwareeinstellungen

При старте Firmware проверяет и инициализирует Hardware.

Проверяются:

- CPU и RAM;
- Speichergeräte;
- Bootreihenfolge;
- UEFI/Legacy-Modus;
- Secure Boot;
- TPM;
- Virtualisierung;
- Datum/Zeit;
- Controller-Modus;
- Firmwareversion.

Изменение случайной настройки «для теста» может сделать System unbootable. Сначала документируется Ausgangszustand.

---

## 8. Secure Boot

Secure Boot проверяет digitale Signaturen доверенных компонентов Bootkette и помогает предотвратить запуск неподписанного/изменённого Bootcodes.

Он не:

- шифрует пользовательские Daten;
- заменяет Updates;
- проверяет каждую Anwendung;
- предотвращает все Malware;
- заменяет MFA.

Нужны совместимые Firmware, Schlüssel, Bootloader и OS.

---

## 9. TPM

`Trusted Platform Module` предоставляет защищённые криптографические функции и измерения состояния Plattform.

Применения:

- защита Schlüssel;
- измеренный Boot;
- поддержка Geräteverschlüsselung;
- Geräteidentität.

TPM не является Backup ключа. Recovery-Information должна храниться контролируемо отдельно.

---

## 10. Datenträger, Partition, Volume, Dateisystem

| Begriff | Bedeutung |
|---|---|
| Datenträger | физический/логический Speicher |
| Partition | определённая область Datenträger |
| Volume | доступный логический Speicherbereich |
| Dateisystem | Struktur для Dateien, Verzeichnisse, Metadaten |
| Mountpoint/Laufwerk | точка доступа в OS |

Различия важны: Formatieren создаёт Dateisystem, Partitionieren изменяет Aufteilung Datenträger.

---

## 11. GPT и MBR

`GPT`:

- современная Partitionstabelle;
- обычно используется с UEFI;
- поддерживает больше и крупнее разделов;
- хранит дополнительные Strukturinformationen.

`MBR`:

- legacy Partitionstabelle и Bootcode;
- используется для старых совместимых Szenarien;
- имеет более жёсткие Grenzen.

Выбор зависит от Firmwaremodus, OS, Bootanforderung и Kompatibilität. Не следует переключать схему без Backup.

---

## 12. Partitionierungsplanung

Возможные Bereiche:

- EFI System Partition;
- Betriebssystem;
- Recovery;
- Nutzdaten;
- отдельный Bereich для специальных Anforderungen.

Отдельный Datenbereich может облегчить переустановку и управление, но не является Backup: отказ одного Datenträger может уничтожить все Partitionen.

Размеры выводятся из:

- OS и Anwendungen;
- Updates;
- Nutzdaten;
- temporäre Daten;
- Wachstum;
- Recovery;
- Reserve.

---

## 13. Dateisystemauswahl

Критерии:

- Betriebssystem;
- права/ACL;
- Journaling;
- максимальные Datei-/Volumegrößen;
- Verschlüsselung;
- Kompatibilität других систем;
- Performance и Workload;
- Robustheit;
- Backupwerkzeuge.

Подробное сравнение NTFS, exFAT, FAT32, ext4 и APFS — в главе 14.

---

## 14. Installationsarten

| Art | Einsatz |
|---|---|
| manuell | единичный Rechner, Test, Sonderfall |
| Image-basiert | одинаковые Systeme из geprüfter Vorlage |
| unbeaufsichtigt | автоматизированная Installation через Antwortdatei/Management |
| In-place Upgrade | сохранение Anwendungen/Daten при поддерживаемом Upgrade |
| Neuinstallation | чистая Installation с Migration |

Для многих рабочих мест ручная повторная установка увеличивает Fehler и Aufwand. Image/Automation требуют тщательного Test и Pflege.

---

## 15. Installationsmedium

Проверяются:

- официальный источник;
- Version и Edition;
- Architektur;
- Integrität/Signatur;
- актуальность;
- Bootmodus;
- Schreibschutz;
- безопасное хранение;
- Dokumentation.

Случайный ISO из Drittportal нельзя считать доверенным.

---

## 16. Vorbereitung

Checklist:

1. Projektauftrag/Änderungsfreigabe.
2. Gerät и Nutzer identifizieren.
3. Hardware- и OS-Kompatibilität.
4. Daten и Anwendungen inventarisieren.
5. Backup с Restoreprüfung.
6. Lizenz/Activation.
7. Netzwerk, Proxy, Zeit и DNS.
8. Treiber и Firmware.
9. Konten/Rollen.
10. Verschlüsselung и Recovery.
11. Testfälle/Abnahmekriterien.
12. Rollback и Termin.

---

## 17. Datensicherung vor Änderung

Backup должно включать всё необходимое:

- Nutzdaten;
- lokale Datenbanken;
- Browser-/Anwendungsprofile;
- Zertifikate и Schlüssel;
- Konfiguration;
- Lizenzinformationen;
- Sondertreiber;
- список Anwendungen.

Только факт создания Kopie недостаточен. Нужно проверить Lesbarkeit и Wiederherstellbarkeit на подходящей Stichprobe.

---

## 18. Installationsablauf

1. Gerät и Ziel-Datenträger ещё раз сверить.
2. Firmwaremodus и Bootmedium выбрать.
3. Partitionstabelle/Partitionen создать.
4. OS установить.
5. базовые Sprache/Zeit/Netzwerk настроить.
6. Hersteller-Treiber установить.
7. Updates до freigegebenem Stand.
8. Sicherheitsbaseline применить.
9. Benutzer, Domäne и Richtlinien.
10. freigegebene Software.
11. Datenmigration.
12. Test и Dokumentation.

---

## 19. Treiber

Treiber соединяет Betriebssystem и Gerät.

Проверяются:

- Hardware-ID;
- OS-Version/Architektur;
- Herstellerquelle;
- digitale Signatur;
- Abhängigkeiten;
- Firmware-Kompatibilität;
- Release Notes;
- Rollbackmöglichkeit.

Устройство, показанное как `unbekannt`, диагностируется по Hardware-ID, а не установкой случайных Driverpakete.

---

## 20. Reihenfolge der Treiber

Универсального порядка нет, но практически сначала обеспечивают Basiskomponenten:

- Chipsatz/Systemgeräte;
- Speicher-/Controller;
- Netzwerk;
- Grafik;
- Audio;
- Peripherie;
- Managementagent.

Производитель может задавать другую Reihenfolge. После установки проверяются Gerätestatus, Ereignisprotokoll и Funktion.

---

## 21. Updates

После Installation:

- OS-Updates;
- Sicherheitsupdates;
- Treiberupdates по Freigabe;
- Firmware при Bedarf;
- Signatur-/Definitionsupdates;
- Anwendungspatches.

Не каждый самый новый Treiber автоматически лучший для предприятия. Требуется freigegebene, поддерживаемая и протестированная версия.

---

## 22. Lizenzierung и Aktivierung

Нужно:

- правильная Edition;
- допустимый Lizenzkanal;
- Zuordnung Gerät/Nutzer;
- Aktivierung;
- Nachweis;
- объём Virtualisierungs-/Mehrfachnutzung;
- срок и Wartung.

Технически активированная Software не обязательно лицензионно корректна; и наоборот, право может существовать до завершения Activation.

---

## 23. Basis-Konfiguration

- eindeutiger Computername;
- Datum, Zeit и Zeitzone;
- Sprache/Region;
- Netzwerkprofil;
- DNS и Proxy;
- Energieoptionen;
- Updatequelle;
- Logging;
- Remotezugriff только при Bedarf;
- Inventarisierung;
- Managementsystem.

Неверное время может нарушить Zertifikate, Kerberos и Logs.

---

## 24. Domänenaufnahme

Перед Join:

- имя Rechner уникально;
- IP-Konfiguration корректна;
- клиент использует предусмотренный DNS;
- Zeit синхронизирована;
- Domänencontroller erreichbar;
- Berechtigung для Join определена;
- OU/Ziel и Richtlinien известны;
- lokales Notfallkonto контролируется.

Подробно — глава 14.

---

## 25. Sicherheitsbaseline

Возможные меры:

- поддерживаемая Version;
- minimale Anwendungen/Dienste;
- Firewall;
- Festplattenverschlüsselung;
- Secure Boot/TPM;
- Least Privilege;
- MFA, где применимо;
- Bildschirmsperre;
- Update- и Malware-Schutz;
- Logging;
- deaktivierte unsichere Protokolle;
- kontrollierte externe Medien.

Baseline должна быть утверждена и тестироваться, а не копироваться без контекста.

---

## 26. Geräteverschlüsselung и Recovery

До включения:

1. TPM/Secure-Boot-Zustand проверить.
2. Datenbackup.
3. Recovery-Schlüssel безопасно сохранить.
4. Zugriff и Verantwortlichkeit определить.
5. Verschlüsselung aktivieren.
6. Status контролировать.
7. Recovery-Prozess тестировать организационно.

Firmware- или Hardwareänderung может вызвать Recovery-Abfrage.

---

## 27. Anwendungsinstallation

Только:

- freigegebene Quelle;
- проверенная Version;
- passende Lizenz;
- необходимые Abhängigkeiten;
- минимальные Rechte;
- dokumentierte Konfiguration.

Неиспользуемые Anwendungen увеличивают Patchaufwand и Angriffsfläche.

---

## 28. Datenmigration

Порядок:

1. Quelle фиксировать.
2. Daten klassifizieren.
3. Backup.
4. Zielstruktur/Rechte подготовить.
5. Testmigration.
6. Anzahl, Größe, Hash/Stichprobe или fachliche Werte сравнить.
7. Fehlerliste обработать.
8. Nutzerabnahme.
9. старую Kopie хранить/удалять по Konzept.

---

## 29. Pilot и Rollout

Для 20 одинаковых рабочих мест:

1. Referenzgerät.
2. Installation и vollständiger Test.
3. Pilotgruppe с реальными Rollen.
4. замечания исправить.
5. Image/Paket versionieren.
6. Rollout малыми Wellen.
7. Monitoring.
8. Abschlussprotokoll.

Так ошибка не распространяется сразу на все Systeme.

---

## 30. Abnahme und Dokumentation

Документируются:

- Gerät/Seriennummer/Inventarnummer;
- OS, Build и Patchstand;
- Firmware/UEFI-Zustand;
- Partitionen и Verschlüsselung;
- Treiber;
- Anwendungen/Lizenzen;
- Netzwerk/Domäne;
- Richtlinien;
- Testfälle Soll/Ist;
- Abweichungen;
- Übergabe и Abnahme.

Пароли и Recovery-Schlüssel не помещаются в обычный открытый Protokoll.

---

## 31. Vollständiger Praxisfall

Задача: 20 новых FIAE-Arbeitsplätze.

Muss:

- утверждённая OS-Version;
- два VM;
- Domänenaufnahme;
- Laufwerksverschlüsselung;
- IDE и Werkzeuge;
- два Monitore;
- отсутствие kritische Fehler;
- документированный Test.

Решение:

1. Hardware и OS-Mindest-/Workloadbedarf сверить.
2. Backup/Migrationsbedarf по пользователю.
3. UEFI, Secure Boot и TPM проверить.
4. GPT и Partitionierung по Standard.
5. Referenzsystem из подписанного Medium.
6. Treiber, Updates, Baseline, Anwendungen.
7. Domäne, Richtlinien, Daten.
8. Funktions-, Sicherheits- и Leistungstest.
9. Pilot с двумя Nutzern.
10. gestufter Rollout и Protokoll.

> Bis zum 25.09.2026 werden 20 Arbeitsplätze nach der freigegebenen Referenzkonfiguration eingerichtet, in die Domäne aufgenommen und gemäß Testprotokoll ohne kritische Fehler abgenommen.

---

## 32. Prüfungsalgorithmus

1. Bedarf и Ausgangszustand.
2. Backup/Restore.
3. Kompatibilität/Lizenz.
4. Firmware/Bootmodus.
5. Ziel-Datenträger/Partitionen.
6. OS/Treiber/Updates.
7. Security/Netzwerk/Domäne.
8. Anwendungen/Daten.
9. Test/Pilot.
10. Dokumentation/Abnahme/Rollback.

---

## 33. Typische Prüfungsfallen

| Falle | Korrektur |
|---|---|
| UEFI = Betriebssystem | Firmware-Schnittstelle |
| Secure Boot = Verschlüsselung | Signaturprüfung der Bootkette |
| Partition = Dateisystem | Bereich против Organisationsstruktur |
| отдельный Datenbereich = Backup | тот же носитель может отказать |
| Installationmedium из любого источника | Herstellerquelle/Integrität |
| neuester Treiber = bester | Freigabe и Kompatibilität |
| Aktivierung = Lizenznachweis | technische и rechtliche Ebene |
| Backup gemacht = Daten sicher | Restoreprüfung |
| Desktop startet = Abnahme | Funktionen, Sicherheit, Last |
| Recovery-Schlüssel на том же Gerät | getrennte sichere Aufbewahrung |

---

## 34. Selbsttest

1. Назови пять задач Betriebssystem.
2. Чем Prozess отличается от Thread?
3. Опиши Bootkette.
4. Что такое UEFI?
5. Что делает Secure Boot и чего не делает?
6. Для чего TPM?
7. Различи Datenträger, Partition, Volume и Dateisystem.
8. Когда обычно используется GPT?
9. Почему отдельная Datenpartition не Backup?
10. Назови четыре Installationsarten.
11. Что проверить у Installationsmedium?
12. Какие данные сохранить перед Neuinstallation?
13. Почему требуется Restoreprüfung?
14. Назови этапы Installation.
15. Как выбрать Treiber?
16. Почему не всегда нужен самый новый Treiber?
17. Различи Aktivierung и Lizenzierung.
18. Почему Zeit важна?
19. Что проверить перед Domänenaufnahme?
20. Назови пять Baseline-Maßnahmen.
21. Как подготовить Verschlüsselung?
22. Почему лишняя Software опасна?
23. Как проверить Migration?
24. Зачем Pilot?
25. Что входит в Systemprotokoll?

<details>
<summary>Показать решения</summary>

1. Prozesse, Speicher, Dateien, Geräte, Nutzer/Rechte, Netzwerk, Security.
2. Prozess имеет собственные Ressourcen; Threads делят Ressourcen процесса.
3. Firmware → Bootgerät → Bootloader → Kernel → Treiber/Dienste → Anmeldung.
4. Стандарт Schnittstelle между Plattform-Firmware и OS.
5. Проверяет доверенные Bootkomponenten; не шифрует Daten и не заменяет Updates.
6. Защита Schlüssel, измеренный Boot, Geräteidentität.
7. Носитель; область; логический доступный Bereich; структура данных.
8. В современных UEFI-Systemen при поддержке OS.
9. Все разделы теряются при отказе носителя.
10. Manuell, Image, unbeaufsichtigt, In-place, Neuinstallation.
11. Quelle, Version, Edition, Architektur, Signatur/Hash, Bootmodus.
12. Nutzdaten, Profile, lokale DB, Zertifikate, Keys, Config, Lizenzen, Treiberliste.
13. Только восстановление доказывает пригодность Kopie.
14. Ziel prüfen, partitionieren, OS, Treiber, Updates, Baseline, Domäne, Software, Daten, Tests.
15. Hardware-ID, OS, Architektur, Hersteller, Signatur, Release Notes и Rollback.
16. Новая версия может быть непроверенной или несовместимой.
17. Activation — технический Prozess; Lizenz — правомерное Nutzungsrecht.
18. Zertifikate, Kerberos и Logs зависят от корректного времени.
19. Name, IP, DNS, Zeit, Erreichbarkeit, Rechte, OU.
20. Firewall, Verschlüsselung, Least Privilege, Updates, Sperre, Logging.
21. Backup, Recovery-Schlüssel, Verantwortlichkeit, Aktivierung, Statuskontrolle.
22. Увеличивает Angriffsfläche и Patchaufwand.
23. Anzahl/Größe, Fehlerliste и Stichproben/Hashes Quelle-Ziel.
24. Выявляет ошибки до массового Rollout.
25. Inventar, OS/Patch, Firmware, Partitionen, Treiber, Apps, Domäne и Testergebnisse.

</details>

---

## 35. Quellen und Abgleich

- [§ 9 FIAusbV](https://www.gesetze-im-internet.de/fiausbv/__9.html)
- [UEFI Forum – Specifications](https://uefi.org/specifications)
- [Microsoft – Windows 11 Systemanforderungen](https://www.microsoft.com/windows/windows-11-specifications)
- [Microsoft Learn – Windows Deployment](https://learn.microsoft.com/en-us/windows/deployment/)
- [BSI IT-Grundschutz-Kompendium](https://www.bsi.bund.de/grundschutz-kompendium)

Версии и требования производителей меняются. Конкретные Installationsschritte проверяются по документации выбранной ОС и Freigabestandard организации.

---

## 36. Offene Prüfpunkte für den Unterricht

- Какие Betriebssystemaufgaben ожидает WBS?
- Насколько подробно нужны Prozess и Thread?
- Проверяются ли GPT/MBR-Grenzen численно?
- Нужно ли рисовать Partitionierung?
- Какие UEFI-/Secure-Boot-Schritte используются в лаборатории?
- Требуется ли конкретный Windows-/Linux-Ablauf?
- Какие Treiberdiagnose-Tools ожидаются?
- Как документируется Recovery-Schlüssel в WBS?
- Какой Aufbau имеет Abnahmeprotokoll?
