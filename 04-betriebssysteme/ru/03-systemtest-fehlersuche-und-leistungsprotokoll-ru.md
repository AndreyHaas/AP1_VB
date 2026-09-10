---
pruefung: AP1
thema: Systemtest, Fehlersuche und Leistungsprotokoll
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/03-systemtest-fehlersuche-und-leistungsprotokoll-de.md
---

# AP1: Systemtest, Fehlersuche und Leistungsprotokoll

Тест доказывает выполнение требования, диагностика локализует причину отклонения, Protokoll делает результат воспроизводимым и проверяемым. Действовать нужно системно: сначала наблюдать и измерять, затем менять один фактор и повторять тот же тест.

---

## 1. Lernziele

После изучения главы нужно уметь:

- превращать Anforderung в Abnahmekriterium и Testfall;
- различать Funktions-, Integrations-, Sicherheits-, Leistungs- и Regressionstest;
- формулировать positive, negative и Grenzwertfälle;
- отделять Symptom, Ursache и Folge;
- применять систематический Diagnoseprozess;
- собирать Baseline и сравнимые Messwerte;
- анализировать CPU, RAM, Datenträger, Netzwerk, Dienste и Logs;
- выбирать безопасные Windows-/Linux-Werkzeuge;
- избегать одновременного изменения нескольких факторов;
- документировать Soll, Ist, Umgebung, Ergebnis и Abweichung;
- различать Fehlerbehebung, Workaround и bekannte Restabweichung;
- формулировать Freigabe или Eskalation.

---

## 2. Prüfungsminimum — 15 минут

1. Testfall: ID → Ziel → Voraussetzung → Eingabe/Schritte → Soll → Ist → Status → Nachweis.
2. Требование должно быть измеримым; «работает быстро» не тестируется.
3. Positive Test проверяет допустимое; negative — недопустимое; Grenzwerttest — границу.
4. Diagnose: Fehlerbild → Scope → Änderungen → Messung → Hypothese → один Test → Ergebnis → Dokumentation.
5. Symptom не равно Ursache.
6. CPU 100 % не всегда ошибка; значение оценивается относительно Workload и времени.
7. Логи требуют точной Zeit, Quelle, Ereignis и Korrelation.
8. После исправления повторяется исходный Test и добавляется Regressionstest.

Musterantwort:

> Zuerst wird das Fehlerbild reproduzierbar beschrieben und mit Zeitstempel protokolliert. Anschließend werden relevante Messwerte und Logs erfasst. Pro Versuch wird nur eine Hypothese geprüft, damit die Ursache eindeutig zugeordnet werden kann.

---

## 3. Prüfung, Test и Monitoring

| Methode | Zweck |
|---|---|
| Sicht-/Dokumentenprüfung | наличие, Zustand или Konfiguration проверить |
| Test | вызвать определённые условия и сравнить Soll/Ist |
| Messung | получить количественное значение |
| Monitoring | наблюдать Werte/Ereignisse во времени |
| Review | оценить документ, Konzept или Änderung |

Например, наличие активной Firewall можно проверить Konfiguration, а фактическое Regelverhalten — сетевым Testfall.

---

## 4. От Anforderung к Testfall

Неопределённо:

> Der PC soll schnell starten.

Проверяемо:

> Nach einem vollständigen Herunterfahren erreicht der Client in drei Messläufen innerhalb von jeweils höchstens 45 Sekunden den Anmeldebildschirm. Gemessen wird vom Betätigen des Einschalters bis zur Eingabebereitschaft.

Уточнены:

- Zustand;
- Start- и Endpunkt;
- Grenzwert;
- Wiederholung;
- Messmethode.

---

## 5. Aufbau eines Testfalls

| Feld | Inhalt |
|---|---|
| Test-ID | eindeutige Kennung |
| Bezug | Anforderung/Ticket |
| Ziel | проверяемое Verhalten |
| Voraussetzungen | System, Daten, Rolle, Version |
| Eingabe/Schritte | воспроизводимый Ablauf |
| Soll-Ergebnis | ожидаемый результат |
| Ist-Ergebnis | фактический результат |
| Status | bestanden/nicht bestanden/blockiert |
| Nachweis | Log, Messwert, Screenshot, Datei |
| Tester/Datum | ответственность и Zeit |

Screenshot без Kontext, Zeit и Sollwert — слабый Nachweis.

---

## 6. Testarten

| Testart | Frage |
|---|---|
| Installationstest | установилось/запускается? |
| Funktionstest | функция выполняет требование? |
| Integrationstest | взаимодействуют ли Systeme/Schnittstellen? |
| Sicherheitstest | Rechte и Schutzmaßnahmen действуют? |
| Leistungstest | достигается ли Messwert при заданной Last? |
| Belastungstest | поведение под erwarteter/hoher Last? |
| Benutzbarkeitstest | Zielgruppe может выполнить Aufgabe? |
| Regressionstest | старые функции после Änderung всё ещё работают? |
| Wiederherstellungstest | данные/сервис восстанавливаются? |

Один Test может покрывать несколько аспектов, но Ziel должен оставаться ясным.

---

## 7. Positiv-, Negativ- и Grenzwerttest

Пример Anmeldung:

- positiv: gültiger Benutzer + gültiges Passwort;
- negativ: gültiger Benutzer + falsches Passwort;
- Grenzwert: число Fehlversuche непосредственно до/при Sperrschwelle;
- Berechtigung: пользователь без роли пытается открыть ресурс.

Negative Test считается пройденным, если система правильно отклоняет недопустимое действие.

---

## 8. Testdaten

Тестовые данные должны:

- покрывать normale и extreme Werte;
- не раскрывать реальные personenbezogene Daten без необходимости;
- быть маркированными;
- обеспечивать повторяемость;
- очищаться по Konzept;
- не запускать реальные Zahlungen/Benachrichtigungen.

Produktivdaten в Testumgebung создают Datenschutz- и Sicherheitsrisiko.

---

## 9. Testumgebung

Репрезентативность:

- OS и Patchstand;
- Hardware/Ressourcen;
- Netzwerk/Latenz;
- Rollen и Policies;
- Datenvolumen;
- Schnittstellen;
- Securitysoftware;
- Konfiguration.

Полная идентичность не всегда возможна. Отклонения документируются и учитываются при Bewertung.

---

## 10. Baseline

Baseline — исходные измерения до Änderung.

Примеры:

- Startzeit;
- CPU/RAM в Ruhe и Last;
- Datenträgerdurchsatz;
- Anwendungsantwortzeit;
- Netzwerk-Latenz;
- Fehleranzahl в Log.

Без Baseline нельзя честно утверждать, что изменение улучшило Leistung.

---

## 11. Reproduzierbarkeit

Для сравнения одинаковы:

- Testdaten;
- Startzustand;
- Hintergrundlast;
- Version;
- Netzwerk;
- Messpunkt;
- Dauer;
- число Wiederholungen.

Единичный Messwert может быть Zufall. Полезны несколько прогонов и медиана/среднее вместе с разбросом, если это требуется.

---

## 12. Symptom, Ursache, Folge

Пример:

- Symptom: Anmeldung dauert 90 Sekunden.
- Ursache: DNS клиента указывает на внешний Resolver.
- Folge: Domänendienste не находятся, появляются Timeouts.

Не следует писать «медленный компьютер — причина медленная сеть». Это может быть только Hypothese.

---

## 13. Diagnoseprozess

1. Fehlerbild точно записать.
2. Воспроизвести.
3. Scope определить: один Nutzer, Gerät, Standort или все.
4. Zeitpunkt и letzte Änderungen.
5. базовые Voraussetzungen проверить.
6. Messwerte/Logs собрать.
7. Hypothese сформулировать.
8. один gezielter Test.
9. Ergebnis оценить.
10. Ursache beheben или eskalieren.
11. исходный и Regressionstest.
12. документировать.

---

## 14. Top-down, Bottom-up и Divide and Conquer

`Top-down`: от Anwendung к нижним слоям.  
`Bottom-up`: от физической основы вверх.  
`Divide and Conquer`: проверка Mitte, затем исключение половины.

Выбор зависит от Fehlerbild:

- Kabel/Link отсутствует → bottom-up;
- только одна Anwendung выдаёт ошибку → top-down;
- длинная цепочка неизвестна → divide and conquer.

---

## 15. Один Faktor за Versuch

Если одновременно:

- заменить кабель;
- обновить Treiber;
- изменить DNS;
- перезапустить Dienst,

то даже успешный результат не показывает Ursache.

Изменения фиксируются:

| Versuch | Änderung | Ergebnis | Schluss |
|---|---|---|---|
| 1 | Kabel A→B | Fehler bleibt | Kabel A не подтверждено как Ursache |
| 2 | DNS korrigiert | Fehler weg | Hypothese подтверждается повторным Test |

---

## 16. Logs

Полезные поля:

- Zeitstempel/Zeitzone;
- Quelle/Host;
- Ereignis-ID;
- Schweregrad;
- Benutzer/Prozess;
- Korrelations-ID;
- Meldung;
- Kontext до/после.

Ошибка в Log не всегда первопричина. Нужно строить Zeitlinie и искать первое релевантное Ereignis.

---

## 17. Datenschutz bei Logs

Logs могут содержать:

- Benutzernamen;
- IP-Adressen;
- Dateipfade;
- Suchanfragen;
- Tokens;
- fachliche Daten.

Нужны:

- Zweck;
- минимальный Umfang;
- Berechtigung;
- Aufbewahrung/Löschung;
- Schutz;
- Maskierung чувствительных Daten;
- keine Passwörter/Secrets.

---

## 18. CPU-Diagnose

Проверяется:

- Gesamtauslastung и einzelne Prozesse;
- Kern-/Threadverteilung;
- Takt и Temperatur;
- длительность Last;
- Ready/Wait-Zeiten в virtualisiertem Umfeld;
- Hintergrundprozesse;
- план электропитания.

100 % CPU во время рассчитанного Build может быть нормальным. 100 % в Leerlauf требует Ursache.

---

## 19. RAM-Diagnose

Показатели:

- belegter/verfügbarer RAM;
- процесс по Verbrauch;
- Commit/virtueller Speicher;
- Swap/Pagefile-Aktivität;
- Page Faults в контексте;
- Wachstum über Zeit;
- память VM/Container.

Нехватка RAM часто проявляется Datenträgeraktivität и задержками. Высокий Cache может быть нормальным и освобождаться при Bedarf.

---

## 20. Datenträger-Diagnose

Проверяются:

- freier Speicher;
- aktive Zeit;
- Warteschlange;
- Latenz;
- Durchsatz/IOPS;
- Fehler в Logs;
- Temperatur;
- SMART-/Herstellerstatus;
- Kabel/Controller;
- процесс с I/O.

SMART может предупреждать о некоторых проблемах, но «grün» не гарантирует отсутствие внезапного отказа. Backup остаётся необходимым.

---

## 21. Netzwerk-Diagnose

Порядок:

1. Link/Medium.
2. IP-Adresse/Präfix.
3. Gateway.
4. локальный Stack.
5. Ziel-IP.
6. DNS-Auflösung.
7. Route/Firewall.
8. Port/Dienst.
9. Anwendung.

Ping может быть заблокирован и не доказывает доступность Anwendung. Успешный Ping также не доказывает, что нужный TCP-Port работает.

---

## 22. Dienst- и Prozessdiagnose

Проверяются:

- запущен ли Prozess/Dienst;
- Starttyp;
- Abhängigkeiten;
- Konto/Rechte;
- Portbindung;
- Konfiguration;
- Logs;
- Ressourcen;
- letzte Änderung;
- Neustartverhalten.

Постоянный Restart без анализа может удалить симптомы и усложнить Ursachenfindung.

---

## 23. Treiber- и Gerätefehler

1. Gerät и Hardware-ID.
2. физическое соединение/питание.
3. Gerätestatus и Fehlercode.
4. Treiberversion/Signatur.
5. OS-/Firmwarekompatibilität.
6. letzter funktionierender Stand.
7. Ereignisprotokoll.
8. Herstellerdiagnose.
9. kontrollierter Rollback/Test.

Не использовать случайный Treiberupdater.

---

## 24. Bootfehler

Локализация:

- kein Strom;
- kein POST;
- Gerät не найдено;
- Bootloaderfehler;
- Kernel/Stopfehler;
- Dienst-/Anmeldefehler;
- Benutzerprofil.

Подход:

- Meldung точно записать;
- Firmware и Bootgerät;
- letzte Änderung;
- Recoveryumgebung;
- Datenträgerstatus;
- Logs;
- Backup перед reparierenden Änderungen.

---

## 25. Werkzeuge Windows

Read-only/Diagnose:

- Task-Manager;
- Ressourcenmonitor;
- Ereignisanzeige / `Get-WinEvent`;
- Geräte-Manager;
- `systeminfo`;
- `ipconfig`;
- `ping`, `tracert`, `nslookup`;
- `netstat`/`Get-NetTCPConnection`;
- `whoami`;
- `gpresult`;
- Performance Monitor.

Команда выбирается под Hypothese, а не запускается как случайный список.

---

## 26. Werkzeuge Linux

- `ps`, `top`/`htop`;
- `free`;
- `df`, `du`;
- `lsblk`;
- `ip`;
- `ss`;
- `ping`, `tracepath`, `dig`;
- `journalctl`;
- `systemctl status`;
- `dmesg` с подходящими правами;
- `id`, `getfacl`.

Перед `du`, поиском или Logausgabe учитываются Last, Rechte и Datenschutz.

---

## 27. Leistungstest

Определить:

- цель и KPI;
- Testlast;
- Datenmenge;
- Warm-up;
- Dauer;
- число Wiederholungen;
- Messpunkt;
- параллельность;
- Umgebung;
- Grenzwert.

Durchschnitt может скрывать редкие сильные задержки. При необходимости используют Perzentile, например p95, но их значение должно быть объяснено.

---

## 28. Bottleneck

Engpass — ресурс, ограничивающий текущий Workload.

Пример:

- CPU 35 %;
- RAM почти заполнена;
- Pagefile интенсивно используется;
- SSD высокая aktive Zeit;
- Anwendung задерживается.

Вероятная Hypothese: RAM-Mangel вызывает Auslagerung. Проверка — временно изменить RAM/Last и повторить тот же Test.

Нельзя выбирать Engpass по одной Kennzahl без Korrelation.

---

## 29. Fehlerbehebung, Workaround, Eskalation

`Fehlerbehebung` устраняет Ursache.  
`Workaround` временно уменьшает Wirkung.  
`Eskalation` передаёт проблему с достаточной Information.

Eskalationspaket:

- Fehlerbild;
- Business-Auswirkung;
- Scope/Priorität;
- Umgebung/Version;
- Zeitlinie;
- Reproduktionsschritte;
- Logs/Messwerte;
- выполненные Tests;
- Änderungen;
- Ansprechpartner.

---

## 30. Regression und Abschluss

После Fix:

1. исходный Fehler больше не проявляется.
2. требование выполнено.
3. связанные Funktionen проверены.
4. Security не ослаблена.
5. Monitoring стабильно.
6. документация обновлена.
7. временный Workaround удалён или зафиксирован.
8. Abnahme/Freigabe получена.

---

## 31. Leistungs- und Testprotokoll

Минимальные поля:

- Auftrag/Ticket;
- Gerät/System;
- Version/Konfiguration;
- Tester и Datum/Zeit;
- Test-ID;
- Voraussetzung;
- Soll;
- Ist;
- Messwerte с Einheit;
- Status;
- Fehler/Abweichung;
- Maßnahme;
- Retest;
- Nachweis;
- Freigabe.

Секреты и лишние personenbezogene Daten исключаются.

---

## 32. Vollständiger Praxisfall

После развёртывания 20 Clients пользователь жалуется: Anmeldung dauert 90 секунд; IP-Dienste доступны.

Диагностика:

1. Testfall: от Credential-Eingabe до Desktopbereitschaft ≤45 s.
2. Scope: 5 новых Clients, одна OU.
3. Zeitstempel и Baseline с исправного Client.
4. IP, DNS, Zeit и GPO-Ergebnis.
5. обнаружено: DNS указывает на публичный Resolver.
6. Hypothese: AD-Dienste не находятся, Timeouts задерживают Anmeldung.
7. только DNS исправляется.
8. `nslookup`/Dienstauflösung и Anmeldung повторяются трижды.
9. Zeiten: 32 s, 34 s, 33 s.
10. GPO и Ressourcen как Regression.
11. Protokoll и Ursache.

> Die Ursache war die fehlerhafte DNS-Konfiguration. Nach der Zuweisung des vorgesehenen internen DNS-Servers lag die Anmeldezeit in drei Messungen zwischen 32 und 34 Sekunden und erfüllte den Grenzwert von 45 Sekunden.

---

## 33. Prüfungsalgorithmus

1. Soll/Anforderung.
2. Fehlerbild/Ist.
3. Umgebung/Scope/Zeit.
4. reproduzieren.
5. безопасные Basisprüfungen.
6. Logs/Messwerte.
7. Hypothese.
8. один Test/Änderung.
9. Retest/Regression.
10. Protokoll/Freigabe или Eskalation.

---

## 34. Typische Prüfungsfallen

| Falle | Korrektur |
|---|---|
| «не работает» как Fehlerbild | точные Symptome, Zeit и Scope |
| Symptom = Ursache | Hypothese измерить |
| много изменений одновременно | один Faktor |
| Ping = Anwendung доступна | Port/Dienst/Funktion тестировать |
| 100 % CPU = Hardware defekt | Workload, Prozess, Dauer, Temperatur |
| ein Messwert reicht | повторение и одинаковые Bedingungen |
| Logfehler = первопричина | Zeitlinie/Korrelation |
| Neustart = Lösung | Ursache и Wiederauftreten проверить |
| Fix без Regression | связанные функции тестировать |
| Screenshot = vollständiges Protokoll | Soll/Ist/Umgebung/Nachweis |

---

## 35. Selbsttest

1. Различи Test, Messung и Monitoring.
2. Сделай измеримым «PC startet schnell».
3. Назови поля Testfall.
4. Что такое Integrationstest?
5. Что такое Regressionstest?
6. Когда negative Test пройден?
7. Какие требования к Testdaten?
8. Что делает Testumgebung репрезентативной?
9. Для чего Baseline?
10. Что обеспечивает Reproduzierbarkeit?
11. Различи Symptom, Ursache и Folge.
12. Назови Schritte Diagnoseprozess.
13. Когда использовать bottom-up?
14. Почему один Faktor?
15. Какие поля важны в Log?
16. Какие Datenschutzrisiken в Logs?
17. Что проверяется при CPU-Problem?
18. Признаки RAM-Mangel?
19. Почему SMART-grün не гарантия?
20. Почему Ping недостаточен?
21. Что проверять у Dienst?
22. Как диагностировать Treiber?
23. Назови Bootebenen.
24. Назови четыре Windows-Werkzeuge.
25. Назови четыре Linux-Werkzeuge.
26. Что задаётся для Leistungstest?
27. Что такое p95?
28. Различи Fix и Workaround.
29. Что входит в Eskalation?
30. Какие Schritte после Fix?

<details>
<summary>Показать решения</summary>

1. Контролируемое Soll/Ist; количественное значение; наблюдение во времени.
2. Указать Start/Endpunkt, Grenzwert, состояние и число прогонов.
3. ID, Bezug, Ziel, Voraussetzung, Schritte, Soll, Ist, Status, Nachweis, Datum.
4. Проверка взаимодействия компонентов/систем.
5. Проверка, что изменение не сломало прежние функции.
6. Когда недопустимое действие правильно отклонено.
7. Покрытие границ, маркировка, повторяемость, Datenschutz и очистка.
8. Схожие Version, Hardware, Netzwerk, Rollen, Datenvolumen и Security.
9. Сравнить Zustand до/после.
10. Одинаковые данные, состояние, окружение, Messpunkt, Dauer и Wiederholung.
11. Наблюдение; причина; последствие.
12. Описание, Scope, Änderungen, Messung, Hypothese, Test, Fix, Retest, Doku.
13. При вероятной физической/нижней Ursache.
14. Чтобы связать результат с конкретной Änderung.
15. Zeit, Quelle, ID, Schweregrad, Benutzer/Prozess, Korrelation и Kontext.
16. Namen, IP, Pfade, Inhalte, Tokens и слишком длинная Aufbewahrung.
17. Prozesse, Kerne, Takt, Temperatur, Dauer, Hintergrundlast.
18. мало verfügbar, Swap/Pagefile и hohe Diskaktivität.
19. Он не предсказывает каждый внезапный отказ.
20. ICMP может быть заблокирован, а нужный Port/Dienst — иметь иной статус.
21. Status, Starttyp, Abhängigkeiten, Konto, Port, Config, Logs, Ressourcen.
22. Hardware-ID, Verbindung, Fehlercode, Version/Signatur, Kompatibilität, Rollback.
23. Strom, POST, Gerät, Bootloader, Kernel, Dienst/Anmeldung, Profil.
24. Task-Manager, Ereignisanzeige, Geräte-Manager, ipconfig, nslookup, gpresult.
25. ps/top, free, df/du, lsblk, ip/ss, journalctl, systemctl.
26. KPI, Last, Daten, Warm-up, Dauer, Wiederholungen, Messpunkt, Grenzwert.
27. Значение, ниже или равно которому находится 95 % измерений.
28. Fix устраняет Ursache; Workaround временно уменьшает Wirkung.
29. Symptom, Auswirkung, Scope, Version, Zeitlinie, Schritte, Logs, Tests, Änderungen.
30. Ursprungstest, Regression, Security, Monitoring, Doku и Freigabe.

</details>

---

## 36. Quellen und Abgleich

- [§ 9 FIAusbV](https://www.gesetze-im-internet.de/fiausbv/__9.html)
- [Microsoft Learn – Windows Client troubleshooting](https://learn.microsoft.com/en-us/troubleshoot/windows-client/)
- [Microsoft Learn – Get-WinEvent](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.diagnostics/get-winevent)
- [systemd – journalctl](https://www.freedesktop.org/software/systemd/man/latest/journalctl.html)
- [BSI IT-Grundschutz-Kompendium](https://www.bsi.bund.de/grundschutz-kompendium)

Конкретные Befehle, Zähler и Grenzwerte зависят от Betriebssystemversion и Anforderungen. Значения Praxisfall — учебные.

---

## 37. Offene Prüfpunkte für den Unterricht

- Какой Aufbau Testfall требует WBS?
- Нужно ли знать Teststufen или только Testarten?
- Ожидаются ли Äquivalenzklassen и Grenzwertanalyse здесь или в QA?
- Какие Windows-/Linux-Befehle обязательны?
- Используются ли Mittelwert, Median или Perzentile?
- Как WBS отделяет Leistungs- от Belastungstest?
- Какие Felder обязательны в Leistungsprotokoll?
- Когда требуется Eskalation?
- Как оформляется Abnahme после Retest?
