---
pruefung: AP1
thema: Benutzer, Rechte, Dateisysteme, Domäne und Richtlinien
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/02-benutzer-rechte-dateisysteme-domaene-und-richtlinien-de.md
---

# AP1: Benutzer, Rechte, Dateisysteme, Domäne und Richtlinien

Benutzerkonto отвечает на вопрос «кто действует», Berechtigung — «что ему разрешено», Dateisystem — «как хранятся данные и Metadaten», Domäne и Richtlinien — «как эти правила централизованно управляются». Экзаменационный ответ должен показать не только выдачу доступа, но и минимальность, проверку и отзыв.

---

## 1. Lernziele

После изучения главы нужно уметь:

- различать Identifizierung, Authentifizierung и Autorisierung;
- объяснять локальные, доменные, Benutzer-, Gruppen-, Dienst- и Computerkonten;
- применять Least Privilege, Need to Know и RBAC;
- читать базовые ACL и Vererbung;
- вычислять Rechte в простых Share-/Dateisystemfällen;
- объяснять Linux-Rechte `rwx` и `chmod`;
- сравнивать FAT32, exFAT, NTFS, ext4 и APFS;
- отличать Rechte от Verschlüsselung;
- объяснять Arbeitsgruppe, Domäne, Domain Controller, OU и GPO;
- проверять DNS, Zeit и Berechtigung при Domain Join;
- выбирать безопасные Konsolenbefehle;
- проектировать Berechtigungskonzept и тесты.

---

## 2. Prüfungsminimum — 15 минут

1. Identifizierung = имя/идентификатор; Authentifizierung = доказательство; Autorisierung = проверка права.
2. Права выдаются Gruppen/Rollen, а не напрямую каждому Benutzer.
3. `Least Privilege` = только минимальные права на необходимое время.
4. ACL содержит Einträge для субъектов и разрешений.
5. Для Netzwerkfreigabe могут одновременно действовать Share- и Dateisystemrechte; фактический доступ ограничивается обеими Ebenen.
6. Linux: `r=4`, `w=2`, `x=1`; `chmod 750` = Besitzer `rwx`, Gruppe `r-x`, andere `---`.
7. FAT32 совместима, но не имеет современных ACL и ограничивает размер отдельного файла; NTFS/ext4 поддерживают права и Journaling.
8. Domain Join зависит от корректных DNS и Zeit; GPO централизует Einstellungen для Benutzer/Computer.

Musterantwort:

> Der Benutzer erhält den Zugriff über eine rollenbezogene Gruppe, weil dadurch Berechtigungen nachvollziehbar, einheitlich und beim Rollenwechsel leichter entziehbar sind. Direkte Einzelberechtigungen werden vermieden.

---

## 3. Identifizierung, Authentifizierung, Autorisierung

| Schritt | Frage | Beispiel |
|---|---|---|
| Identifizierung | Wer behauptest du zu sein? | Benutzername |
| Authentifizierung | Wie beweist du das? | Passwort + Token |
| Autorisierung | Was darfst du? | Leserecht auf Projektordner |
| Protokollierung | Was wurde getan? | Zugriff im Log |

Успешный Login не означает право на любой ресурс.

---

## 4. Kontotypen

| Konto | Zweck |
|---|---|
| Benutzerkonto | personengebundene Nutzung |
| Gruppenkonto/-objekt | объединение Berechtigungen |
| Dienstkonto | выполнение Dienst/Anwendung |
| Computerkonto | Identität управляемого устройства |
| lokales Konto | действует на одном System |
| Domänenkonto | zentral verwaltete Identität |
| Gastkonto | сильно ограниченный Sonderzugang |
| Administratorkonto | privilegierte Verwaltung |

Один человек может иметь обычное и отдельное Admin-Konto. Ежедневная работа под Admin увеличивает Schaden при ошибке или Kompromittierung.

---

## 5. Lebenszyklus eines Kontos

1. Antrag и Genehmigung.
2. Identität и Rolle проверить.
3. Konto создать.
4. Gruppen/Rechte назначить.
5. Erstzugang безопасно передать.
6. Nutzung и Änderungen протоколировать.
7. регулярно Rezertifizierung.
8. Rollewechsel своевременно обработать.
9. при Austritt sperren.
10. Daten/Verantwortung übergeben.
11. по правилам löschen/archivieren.

`Sperren` прекращает Nutzung быстро; `Löschen` может повлиять на Zuordnungen и Nachweise. Поэтому действия разделяются.

---

## 6. Least Privilege и Need to Know

`Least Privilege`:

> только минимально необходимые Rechte для задачи и срока.

`Need to Know`:

> доступ только к Informationen, реально нужным для роли.

Дополнительно:

- Separation of Duties;
- zeitlich begrenzte Rechte;
- Vier-Augen-Freigabe;
- регулярный Review;
- Notfallzugang с усиленным Logging.

---

## 7. RBAC

Role Based Access Control:

```text
Benutzer → Rolle/Gruppe → Berechtigung → Ressource
```

Преимущества:

- единообразие;
- проще On-/Offboarding;
- меньше Einzelrechte;
- bessere Prüfbarkeit;
- сравнение Soll-Rolle и Ist-Rechte.

Роль должна соответствовать Aufgabe, а не только должности по названию.

---

## 8. ACL

`Access Control List` содержит Access Control Entries:

- Subjekt (Benutzer/Gruppe);
- Recht;
- Allow/Deny;
- область;
- Vererbung.

Фактические Rechte могут зависеть от:

- членства в нескольких Gruppen;
- явных и унаследованных Einträge;
- Deny-Regeln;
- Eigentümer;
- Share-/Dateisystemkombination;
- Anwendung;
- Plattform.

Не переносить упрощённое правило одной ОС на все Systeme.

---

## 9. Vererbung

Права родительской папки могут наследоваться дочерними объектами.

Преимущества:

- меньше Administration;
- единообразие.

Риски:

- случайный широкий доступ;
- сложные Ausnahmen;
- неясный Ursprung.

Перед отключением Vererbung нужно определить, сохраняются ли унаследованные Einträge как явные или удаляются.

---

## 10. Effektive Rechte

Простой Windows-подобный пример:

- Gruppe `Projekt-Leser`: Lesen — Allow;
- Gruppe `Projekt-Team`: Ändern — Allow;
- Benutzer состоит в обеих Gruppen.

Результат обычно включает Ändern, потому что разрешения групп суммируются.

Если существует применимый явный Deny, он может ограничить Zugriff. Точный результат зависит от Plattform, Reihenfolge и Art des Eintrags; лучше избегать сложных индивидуальных Deny и использовать понятные Gruppen.

---

## 11. Freigabe- и Dateisystemrechte

При Netzwerkfreigabe проверяются две Ebenen:

1. Freigabeberechtigung;
2. локальная Dateisystem-ACL.

Пример:

- Share: Lesen;
- NTFS: Ändern.

Через сеть фактически доступно только Lesen, потому что Share ограничивает.

- Share: Ändern;
- NTFS: Lesen.

Фактически снова Lesen, потому что NTFS ограничивает.

Локальный доступ не проходит через Share-Ebene.

---

## 12. Linux-Grundrechte

Три Klassen:

- `u` — owner/user;
- `g` — group;
- `o` — others.

Три Rechte:

- `r` — read;
- `w` — write;
- `x` — execute.

Пример:

```text
-rwxr-x---  deploy.sh
```

Besitzer: `rwx`, Gruppe: `r-x`, andere: keine Rechte.

---

## 13. Numerische Schreibweise

```text
r = 4
w = 2
x = 1
```

`chmod 640 bericht.txt`:

```text
6 = rw-
4 = r--
0 = ---
```

`chmod 750 script.sh`:

```text
7 = rwx
5 = r-x
0 = ---
```

777 — не универсальное решение, а обычно чрезмерное право.

---

## 14. Rechte an Verzeichnissen

Для каталогов значение отличается:

- `r` — Namen/Inhalt auflisten;
- `w` — Einträge создать/удалить при наличии нужного доступа;
- `x` — каталог betreten/durchsuchen.

Можно знать имя файла, но не иметь права пройти через родительский каталог.

Удаление файла часто определяется правами на каталог, а не только на сам файл.

---

## 15. Eigentümer, Gruppe, umask и sudo

- `chown` меняет Eigentümer/Gruppe при наличии полномочий;
- `umask` ограничивает стандартные Rechte новых объектов;
- `sudo` позволяет контролируемо выполнить отдельную privilegierte Aktion;
- root имеет широкие Rechte и используется минимально.

`sudo` не делает команду безопасной. Zielpfad и Wirkung проверяются до выполнения.

---

## 16. Windows-Berechtigungen

Типичные NTFS-Rechte:

- Vollzugriff;
- Ändern;
- Lesen und Ausführen;
- Ordnerinhalt anzeigen;
- Lesen;
- Schreiben;
- spezielle Berechtigungen.

Практически создаются Gruppen:

- `Ressource-R`;
- `Ressource-RW`;
- при необходимости административная Rolle.

Benutzer входят в fachliche Gruppen, которые связываются с Ressourcengruppen.

---

## 17. Dateisystem: Aufgabe

Dateisystem организует:

- Dateien и Verzeichnisse;
- Namen;
- Speicherblöcke;
- Metadaten;
- Zeitstempel;
- Rechte;
- Journaling;
- иногда Kompression, Verschlüsselung, Snapshots.

Функции отличаются по Dateisystem и OS.

---

## 18. FAT32

Сильные стороны:

- широкая совместимость;
- простота;
- UEFI-/Wechselmedien-Szenarien.

Ограничения:

- keine moderne Datei-ACL;
- einzelne Datei klassisch kleiner als 4 GiB;
- kein modernes Journaling;
- не лучший выбор для Windows-Systemlaufwerk.

FAT32 может быть правильным для обменного носителя, но не для защищённой Mehrbenutzerablage.

---

## 19. exFAT

Преимущества:

- большие Dateien;
- хорошая совместимость Wechselmedien;
- проще, чем Systemdateisystem.

Ограничения:

- keine NTFS-ACL;
- возможности и Robustheit отличаются;
- Rechte/Metadaten могут потеряться между системами.

При обмене важнее совместимость, при внутреннем Betrieb — права и Zuverlässigkeit.

---

## 20. NTFS

Типичные функции:

- ACL;
- Journaling;
- große Dateien/Volumes;
- Kompression;
- Verschlüsselungsfunktionen;
- Quotas;
- Links и Metadaten.

NTFS подходит для Windows-System- и Datenlaufwerke, если необходимы Rechte и Management.

Journaling помогает консистентности Metadaten после сбоя, но не заменяет Backup.

---

## 21. ext4 и APFS

`ext4`:

- распространённое Linux-Dateisystem;
- Unix-Rechte/ACL;
- Journaling;
- пригодно для многих Server-/Desktopfälle.

`APFS`:

- современное Apple-Dateisystem;
- ориентировано на Flash/SSD;
- поддерживает функции Verschlüsselung и Snapshots.

Конкретная Unterstützung зависит от OS-Version и Werkzeug.

---

## 22. Journaling

Journal записывает geplante Änderungen, чтобы после сбоя восстановить konsistenten Zustand быстрее.

Он не гарантирует:

- отсутствие логической Fehler;
- защиту от Löschen;
- актуальный Backup;
- целостность каждой Nutzdatei.

> Journaling verbessert die Dateisystemkonsistenz; Backup ermöglicht die Wiederherstellung früherer Datenstände.

---

## 23. Rechte против Verschlüsselung

`Berechtigungen` контролируют Zugriff через работающую систему.

`Verschlüsselung` защищает Vertraulichkeit без ключа, например при Diebstahl Datenträger.

Они дополняют друг друга:

- авторизованный пользователь может удалить доступный зашифрованный файл;
- украденный незашифрованный Datenträger может обойти OS-Rechte;
- Backup и Recovery остаются отдельными задачами.

---

## 24. Arbeitsgruppe и Domäne

| Merkmal | Arbeitsgruppe | Domäne |
|---|---|---|
| Konten | локально на каждом Rechner | zentral в Verzeichnisdienst |
| Richtlinien | локально | zentral über GPO |
| Skalierung | kleine/dezentrale Umgebungen | управляемая Organisation |
| Anmeldung | lokales Konto | Domänenidentität |
| Verwaltung | повторяется | zentralisiert |

Domäne требует Infrastruktur, Betrieb, Security и Verfügbarkeit.

---

## 25. Active Directory-Grundbegriffe

| Begriff | Bedeutung |
|---|---|
| Domäne | административная и идентификационная Grenze |
| Domain Controller | предоставляет AD DS, Authentifizierung и Verzeichnis |
| Objekt | Benutzer, Gruppe, Computer и другие Einträge |
| OU | контейнер для Struktur, Delegation и GPO-Verknüpfung |
| GPO | набор Richtlinieneinstellungen |
| SYSVOL | распространение определённых Policy-/Skriptdaten |

OU — не просто папка. Её Struktur влияет на Delegation и GPO.

---

## 26. DNS и Zeit

AD DS использует DNS для поиска Dienste и Domain Controller.

Если IP-Ping работает, а Domain не находится, сначала проверяется:

- DNS-Server клиента;
- Namensauflösung;
- passende Records;
- Erreichbarkeit;
- Firewall.

Kerberos чувствителен к значительным Zeitabweichungen. Поэтому Zeitsynchronisation также является Voraussetzung.

---

## 27. Domain Join

1. Computername проверить.
2. IP, DNS и Zeit.
3. DC/Domäne erreichbar.
4. Berechtigung для Join.
5. richtige Domäne.
6. Computerobjekt/OU.
7. Neustart.
8. Domänenanmeldung.
9. GPO и Ressourcen.
10. Ergebnis dokumentieren.

Использовать публичный DNS вместо внутреннего AD-DNS — типичная причина ошибки.

---

## 28. Gruppenrichtlinien

GPO централизованно задаёт:

- Computer- и Benutzereinstellungen;
- Securityoptionen;
- Firewall;
- Energie;
- Skripte;
- Software/Policies;
- Laufwerkszuordnung;
- Einschränkungen.

GPO связываются с Site, Domäne или OU. Область определяется Link, Vererbung, Security Filtering и другими Mechanismen.

---

## 29. Computer- и Benutzerkonfiguration

`Computerkonfiguration` применяется к Gerät/System, обычно при Start и Aktualisierung.

`Benutzerkonfiguration` применяется к angemeldetem Benutzer, обычно при Anmeldung и Aktualisierung.

Пример:

- Firewallregel → Computer;
- persönliche Ordnerumleitung → Benutzer.

Не каждую настройку можно произвольно переместить между частями GPO.

---

## 30. Richtlinien testen

Проверяются:

- правильная OU;
- членство в Gruppen;
- применимые GPO;
- DNS/Netzwerk;
- Aktualisierung/Neustart/Anmeldung;
- Ergebnisbericht;
- Konflikte и Filter;
- Ereignisprotokoll.

Нельзя многократно менять GPO без фиксации Ausgangszustand и Wirkung.

---

## 31. Sichere Konsolenarbeit

Перед командой:

1. текущий Benutzer/Rechte;
2. System и Umgebung;
3. Arbeitsverzeichnis;
4. Quelle и Ziel;
5. Wildcards;
6. последствия;
7. Backup/Rollback.

Сначала использовать read-only команды.

Linux: `pwd`, `ls`, `id`, `getfacl`, `ip`, `ss`, `journalctl`.  
Windows: `whoami`, `dir`, `icacls`, `ipconfig`, `nslookup`, `gpresult`, `Get-WinEvent`.

---

## 32. Praxisfall: Projektfreigabe

Требование:

- Entwickler могут читать/изменять;
- Projektleitung читает;
- другие не имеют доступа;
- доступ выдаётся через Rollen;
- Audit ежеквартально.

Konzept:

1. Gruppen `Projekt-X-R` и `Projekt-X-RW`.
2. fachliche Gruppe Entwickler → `RW`.
3. Projektleitung → `R`.
4. keine direkten Benutzerrechte.
5. Vererbung на Projektordner проверить.
6. Freigabe и Dateisystem согласовать.
7. тестовые Konten для обеих ролей и Nichtberechtigter.
8. Lesen, Erstellen, Ändern, Löschen тестировать.
9. Ergebnis документировать.
10. Austritt/Rollenwechsel в Prozess.

---

## 33. Prüfungsalgorithmus

1. Subjekt, Ressource и Aktion.
2. Authentifizierung/Identität.
3. notwendige minimale Rechte.
4. Rolle/Gruppe.
5. Vererbung/ACL.
6. Share- и Dateisystemebene.
7. Dateisystemfähigkeit.
8. Domäne/DNS/Zeit/GPO.
9. Positive и negative Tests.
10. Dokumentation и Review.

---

## 34. Typische Prüfungsfallen

| Falle | Korrektur |
|---|---|
| Login = Zugriff auf alles | Autorisierung отдельно |
| Rechte напрямую пользователю | Gruppen/Rollen |
| 777 исправляет проблему | Least Privilege |
| `rwx` одинаково для Datei/Ordner | Bedeutung зависит от Objekttyp |
| Share `Ändern` всегда даёт Ändern | NTFS может ограничить |
| Journaling = Backup | разные задачи |
| Datenpartition = Backup | тот же Ausfallbereich |
| Domain Join при любом DNS | interner passender DNS |
| OU = обычная папка | Struktur для Delegation/GPO |
| Verschlüsselung заменяет Rechte | физическая Vertraulichkeit vs laufender Zugriff |

---

## 35. Selbsttest

1. Различи Identifizierung, Authentifizierung и Autorisierung.
2. Зачем отдельное Admin-Konto?
3. Назови этапы Kontolebenszyklus.
4. Что такое Least Privilege?
5. Что такое RBAC?
6. Из чего состоит ACL-Eintrag?
7. Какие факторы формируют effektive Rechte?
8. Что делает Vererbung?
9. Share=Lesen, NTFS=Ändern: что доступно через сеть?
10. Расшифруй `chmod 640`.
11. Расшифруй `chmod 750`.
12. Что означает `x` для каталога?
13. Почему 777 плохой стандарт?
14. Для чего `umask`?
15. Назови три NTFS-Rechte.
16. Что делает Dateisystem?
17. Назови ограничения FAT32.
18. Когда удобен exFAT?
19. Почему Journaling не Backup?
20. Чем Rechte отличаются от Verschlüsselung?
21. Сравни Arbeitsgruppe и Domäne.
22. Что такое OU и GPO?
23. Почему AD зависит от DNS?
24. Почему важна Zeit?
25. Назови Schritte Domain Join.
26. Чем Computer- от Benutzerkonfiguration?
27. Как тестировать GPO?
28. Какие проверки перед Konsolenbefehl?
29. Спроектируй группы для Praxisfall.

<details>
<summary>Показать решения</summary>

1. Объявление личности; доказательство; проверка разрешённого действия.
2. Чтобы привилегии использовались только для Administration и риск был меньше.
3. Antrag, Prüfung, Anlage, Rechte, Nutzung, Review, Rollenwechsel, Sperre, Übergabe, Löschung.
4. Минимальные необходимые права на нужный срок.
5. Rechte через роли/группы вместо Einzelzuweisung.
6. Subjekt, Recht, Allow/Deny, Bereich и Vererbung.
7. Gruppen, explizite/geerbte Einträge, Deny, Share, Dateisystem, Plattform.
8. Передаёт права дочерним объектам.
9. Lesen.
10. Besitzer `rw-`, Gruppe `r--`, andere `---`.
11. Besitzer `rwx`, Gruppe `r-x`, andere `---`.
12. Проход/доступ к объектам по известному имени.
13. Даёт всем чрезмерные права.
14. Ограничивает стандартные Rechte новых объектов.
15. Lesen, Schreiben, Ändern, Vollzugriff, spezielle Rechte.
16. Организует Dateien, Blöcke, Namen и Metadaten.
17. Keine moderne ACL, отдельный файл <4 GiB, kein modernes Journaling.
18. Для больших файлов на Wechselmedien с широкой совместимостью.
19. Journal восстанавливает Struktur, а не предыдущие данные.
20. Rechte контролируют OS-Zugriff; Verschlüsselung защищает без Schlüssel.
21. Локальные Konten/Verwaltung против центральных Identitäten/Richtlinien.
22. Struktur-/Delegationscontainer и набор Richtlinien.
23. Через DNS находятся Domänendienste и DC.
24. Kerberos, Zertifikate и Logs зависят от синхронизации.
25. Name, IP/DNS/Zeit, Erreichbarkeit, Rechte, Domäne/OU, Neustart, Test.
26. Для Gerät/System и для angemeldeter Person.
27. OU, Gruppen, Links/Filter, Aktualisierung, gpresult/Logs и фактическое Verhalten.
28. Identität, Rechner, Verzeichnis, Pfade, Wildcards, Wirkung, Rollback.
29. `Projekt-X-R` и `Projekt-X-RW`, fachliche Gruppen как Mitglieder, keine Einzelrechte.

</details>

---

## 36. Quellen und Abgleich

- [Microsoft Learn – Group Policy Overview](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/group-policy/group-policy-overview)
- [Microsoft Learn – DNS Concepts für AD DS](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/reviewing-dns-concepts)
- [Microsoft Learn – NTFS Overview](https://learn.microsoft.com/en-us/windows-server/storage/file-server/ntfs-overview)
- [The Open Group – chmod](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/chmod.html)
- [Linux man-pages – inode permissions](https://man7.org/linux/man-pages/man7/inode.7.html)

Конкретный Berechtigungsalgorithmus зависит от Betriebssystem, ACL-Modell и Zugriffspfad. Команды перед практикой сверяются с документацией используемой версии.

---

## 37. Offene Prüfpunkte für den Unterricht

- Какая терминология Identifizierung/Authentifizierung/Autorisierung используется WBS?
- Требуется ли AGDLP/AGUDLP?
- Насколько подробно рассчитываются Windows ACL?
- Нужны ли специальные Linux-Rechte?
- Какие Dateisystemgrenzen нужно знать численно?
- Ожидаются ли конкретные Domain-Join-Schritte?
- Нужно ли знать Reihenfolge обработки GPO?
- Какие Konsolenbefehle входят в Unterricht?
- Как должен выглядеть Berechtigungsprotokoll?
