---
pruefung: AP1
thema: Softwarearten, Lizenzen, betriebliche Systeme und Updates
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/04-softwarearten-lizenzen-betriebliche-systeme-und-updates-de.md
---

# AP1: Softwarearten, Lizenzen, betriebliche Systeme und Updates

Software выбирают не по известности продукта, а по требованиям, правам использования, совместимости, безопасности и совокупным затратам. Лицензия определяет, что разрешено, а Updateprozess обеспечивает контролируемое изменение уже установленной системы.

---

## 1. Lernziele

После изучения главы нужно уметь:

- классифицировать Software по назначению и способу создания;
- различать Standardsoftware и Individualsoftware;
- объяснять ERP, CRM, SCM, DMS и CMS;
- отделять proprietär/Open Source от kostenlos/kostenpflichtig;
- различать Lizenz, Eigentum и Urheberrecht;
- сравнивать Named User, Concurrent User, Device, Core, Subscription и Pay per Use;
- читать Lizenzbedingungen вместо догадок по названию модели;
- рассчитывать Lizenzkosten по заданным данным;
- учитывать Datenschutz, IT-Sicherheit, Schnittstellen и TCO;
- планировать Auswahl, Einführung, Update, Rollback и Dokumentation;
- формулировать проверяемые Abnahmekriterien.

---

## 2. Prüfungsminimum — 15 минут

Запомнить:

1. `Systemsoftware` управляет системой; `Anwendungssoftware` решает Fachaufgabe.
2. `Standardsoftware` используется многими клиентами; `Individualsoftware` создаётся или существенно адаптируется под конкретные требования.
3. `Open Source` означает доступный исходный код и лицензионные права, но не автоматически «бесплатно и без условий».
4. Лицензия предоставляет `Nutzungsrechte`; Urheberrecht автоматически не передаётся.
5. `Named User` привязан к пользователю, `Concurrent User` ограничивает одновременное использование.
6. Перед выбором: Muss-Kriterien → права → совместимость → безопасность → TCO → тест.
7. Update: Inventar → Bewertung → Test → Backup/Rollback → Freigabe → Rollout → Kontrolle → Dokumentation.
8. Обновление без теста рискованно; отказ от Sicherheitsupdate тоже является риском.

Мини-ответ:

> Das Concurrent-User-Modell kann wirtschaftlich sein, da höchstens zwölf der vierzig Beschäftigten gleichzeitig arbeiten. Vor der Auswahl müssen jedoch Lizenzbedingungen, Spitzenlast, technische Zählweise, Ausfallszenario und Gesamtkosten geprüft werden.

---

## 3. Softwarearten nach Aufgabe

| Art | Aufgabe | Beispiele |
|---|---|---|
| Systemsoftware | аппаратные ресурсы и базовые Dienste | Betriebssystem, Treiber, systemnahe Werkzeuge |
| Anwendungssoftware | Fach- или Benutzeraufgabe | Office, Browser, Buchhaltung, CAD |
| Entwicklungssoftware | создание и тестирование программ | IDE, Compiler, Interpreter, Debugger, Versionsverwaltung |
| Middleware | соединение систем и Dienste | Message Broker, Application Server, Datenbanktreiber |
| Utility | обслуживание или диагностика | Backupclient, Monitoringagent, Archivierungswerkzeug |

Границы могут пересекаться. Datenbankmanagementsystem может быть платформой для Anwendungen, а Browser — Anwendungssoftware и Laufzeitumgebung.

---

## 4. Standardsoftware и Individualsoftware

| Kriterium | Standardsoftware | Individualsoftware |
|---|---|---|
| Zielgruppe | много клиентов со схожими задачами | конкретный Auftraggeber/Bedarf |
| Einführung | Konfiguration и ограниченное Customizing | Analyse, Entwicklung, Test |
| Anschaffung | обычно ниже начальные затраты | обычно выше Projektkosten |
| Anpassung | ограничена функциями продукта | целевая реализация требований |
| Update | Herstellerzyklus | собственная ответственность/договор |
| Abhängigkeit | Hersteller и Produktroadmap | разработчик, Architektur и Wartbarkeit |

Решение нельзя принимать только по Kaufpreis. Учитываются Prozessanpassung, Migration, Schulung, Schnittstellen, Wartung и Lebenszyklus.

---

## 5. Standardsoftware: Auswahl

Порядок:

1. Ausgangssituation и Zielgruppe описать.
2. Fachliche и technische Anforderungen классифицировать.
3. Muss-Kriterien выделить.
4. Datenschutz, Security и Rechtsrahmen проверить.
5. Hersteller- и Betriebsmodell определить.
6. Schnittstellen и Datenmigration оценить.
7. Lizenz- и Betriebskosten рассчитать.
8. Pilot/Test durchführen.
9. Entscheidung и Abweichungen документировать.

Demo показывает возможности продукта, но не доказывает работу с реальными Daten, Rollen и Last.

---

## 6. Individualsoftware: когда оправдана

Возможные причины:

- уникальный Kernprozess;
- Standardsoftware не выполняет обязательное требование;
- интеграция требует непропорционального Customizing;
- собственный Wettbewerbsvorteil;
- полный контроль над Roadmap необходим;
- Lebenszykluskosten ниже при подтверждённых предпосылках.

Риски:

- Entwicklungs- и Testaufwand;
- Wissensabhängigkeit;
- Wartung и Security;
- Termin- и Budgetrisiko;
- документация;
- дальнейшая совместимость.

`Individualsoftware passt genau` — только цель. Это должно быть подтверждено Abnahmekriterien и Tests.

---

## 7. Betriebliche Anwendungssysteme

| System | Hauptzweck | Typische Daten/Prozesse |
|---|---|---|
| ERP | интегрирует ресурсы и Kernprozesse | Einkauf, Lager, Produktion, Finanzen, Personal |
| CRM | поддерживает Kundenbeziehungen | Kontakte, Aktivitäten, Angebote, Service |
| SCM | координирует Lieferkette | Bedarf, Lieferanten, Bestände, Transport |
| DMS | управляет документами | Ablage, Version, Metadaten, Freigabe |
| CMS | управляет цифровым Content | Webseiten, Rollen, Veröffentlichungen |

Системы могут пересекаться и обмениваться данными. Название продукта не доказывает принадлежность — решающая роль процесса.

---

## 8. ERP

Преимущества:

- единая Datenbasis;
- сквозные Prozesse;
- меньше doppelte Erfassung;
- отчёты и Planung;
- Rechte и Protokollierung.

Риски:

- сложная Einführung;
- Datenqualität;
- высокая Integrationsabhängigkeit;
- Berechtigungsfehler имеют широкий эффект;
- миграция и Schulung.

Пример Prozesskette:

```text
Kundenauftrag → Materialbedarf → Lager/Bestellung
→ Lieferung → Rechnung → Buchung
```

---

## 9. CRM, SCM, DMS и CMS

`CRM` концентрируется на контактах и взаимодействиях с Kunden.  
`SCM` охватывает Material- и Informationsfluss по Lieferkette.  
`DMS` управляет документами, Metadaten, Versionen и Freigaben.  
`CMS` организует создание и публикацию Content.

Типичная ловушка:

> DMS и CMS не являются универсально взаимозаменяемыми. Требования к Aufbewahrung, Versionierung, Workflow и Veröffentlichung различаются.

---

## 10. Proprietär и Open Source

`Proprietäre Software`:

- использование по условиям Rechteinhaber;
- Quellcode обычно недоступен;
- поддержка и Roadmap часто у производителя.

`Open-Source-Software`:

- Quellcode доступен;
- лицензия предоставляет определённые права на Nutzung, Änderung и Weitergabe;
- конкретные Pflichten зависят от лицензии и ситуации.

Независимые оси:

| Frage | Mögliche Antwort |
|---|---|
| Quellcode offen? | ja/nein |
| Lizenzpreis? | kostenlos/kostenpflichtig |
| Support? | intern, Community, Dienstleister, Hersteller |
| Betrieb? | lokal, Hosting, Cloud |

Open Source может иметь платный Support; proprietäre Software может быть бесплатной по цене.

---

## 11. Permissive и Copyleft

`Permissive Lizenzen` обычно допускают широкое использование и распространение при выполнении условий, например сохранении Copyright- и Lizenzhinweise.

`Copyleft-Lizenzen` могут при Weitergabe модифицированной или связанной Software требовать предоставления исходного кода и лицензирование на определённых условиях.

Но:

- условия разных лицензий отличаются;
- внутреннее использование и Weitergabe могут иметь разные последствия;
- Verbindung/Abgeleitetes Werk — юридический и технический вопрос;
- Lizenzkompatibilität нужно проверять.

Нельзя писать: `GPL verbietet kommerzielle Nutzung` — это неверное обобщение.

---

## 12. Urheberrecht и Lizenz

Computerprogramme защищаются Urheberrecht. Rechteinhaber определяет, какие действия разрешены, если закон не устанавливает исключение.

Различать:

- `Urheberrecht` — правовая охрана произведения;
- `Eigentum am Datenträger/Gerät` — владение физическим объектом;
- `Lizenz/Nutzungsrecht` — разрешённый объём использования.

Покупка носителя или Download не означает приобретение Urheberrecht.

§§ 69c и 69d UrhG регулируют охраняемые действия и отдельные исключения для правомерного пользователя. Конкретный лицензионный случай проверяется по договору и закону.

---

## 13. Lizenzmetriken

| Modell | Gemessen wird | Typischer Prüfpunkt |
|---|---|---|
| Named User | именованный пользователь | личное или фактическое использование |
| Concurrent User | одновременные сессии/пользователи | Spitzenlast и Zählweise |
| Device | устройство | совместное использование и Ersatzgerät |
| Core/CPU | процессорные ресурсы | физические/виртуальные Kerne, Mindestlizenz |
| Subscription | период права/сервиса | Laufzeit, Verlängerung, Exit |
| Perpetual | бессрочное право по условиям | Wartung/Updates отдельно |
| Pay per Use | фактическое использование | Einheit, Messung, Kostengrenze |
| OEM | связь с поставкой/Hardware | Übertragbarkeit и Ersatz |

Название модели недостаточно: Lieferant может определять метрику иначе.

---

## 14. Named User против Concurrent User

Дано:

- 40 Beschäftigte;
- максимум 12 одновременно;
- Named User: 18 €/месяц;
- Concurrent User: 35 €/месяц;
- данные вымышлены.

Named User:

```text
40 × 18 € × 12 = 8.640 € pro Jahr
```

Concurrent User:

```text
12 × 35 € × 12 = 5.040 € pro Jahr
```

Разница:

```text
8.640 € - 5.040 € = 3.600 € pro Jahr
```

Но решение допустимо, только если:

- условия разрешают 40 известных пользователей;
- 12 покрывают реальную Spitzenlast;
- правила для Hintergrundzugriffe понятны;
- отказ Lizenzserver не блокирует процесс;
- рост и Adminaufwand учтены.

---

## 15. Subscription и Perpetual

`Subscription` может включать:

- Nutzungsrecht на срок;
- Updates;
- Support;
- Cloud-Dienste.

После прекращения право или функциональность могут закончиться.

`Perpetual` обычно означает бессрочное право на определённую версию, но не автоматически:

- бессрочные Updates;
- Support;
- новые Hauptversionen;
- Betrieb на любой Hardware/OS.

Сравнение выполняется для одинакового Betrachtungszeitraum через TCO.

---

## 16. Lizenzinventar и Compliance

Нужно сопоставлять:

1. `Entitlement` — какие права куплены;
2. `Deployment` — что установлено/назначено;
3. `Usage` — что и кем реально используется;
4. `Vertrag` — ограничения, сроки, Nachweise;
5. `Änderung` — новые Nutzer, VM, Hardware, Version.

Типичные документы:

- Vertrag/Bestellung;
- Lizenzschlüssel или Portalnachweis;
- Anzahl и Metrik;
- Zuordnung;
- Laufzeit/Kündigung;
- Wartung/Support;
- Änderungsprotokoll.

Неиспользуемая Installation может по условиям всё равно требовать Lizenz.

---

## 17. Technische Anforderungen

Проверяются:

- Betriebssystem и Version;
- CPU-Architektur;
- RAM и Speicher;
- Treiber/Laufzeitumgebung;
- Browser;
- Datenbank;
- Netzwerk и Ports;
- Schnittstellen/API;
- идентификация и Rechte;
- резервное копирование;
- совместимость с Management и Security.

Mindestanforderung производителя означает возможность эксплуатации, но не достаточную производительность для конкретной Last.

---

## 18. Fachliche и nichtfunktionale Anforderungen

`Funktional`:

- Rechnung erzeugen;
- Kundendatensatz suchen;
- Bestellung freigeben;
- Datei exportieren.

`Nichtfunktional`:

- Antwortzeit;
- Verfügbarkeit;
- Bedienbarkeit;
- Skalierbarkeit;
- Wartbarkeit;
- Datenschutz и Sicherheit.

Security-Anforderung может быть функциональной, если описывает поведение:

> Das System sperrt ein Konto nach fünf fehlgeschlagenen Anmeldeversuchen gemäß freigegebener Richtlinie.

---

## 19. Schnittstellen и Datenmigration

До выбора:

- Quell- и Ziel-Datenmodell;
- Format и Zeichencodierung;
- Pflichtfelder;
- Schlüssel и Dubletten;
- Datenqualität;
- API/Import/Export;
- Vollständigkeit;
- Rechte и Schutzbedarf;
- Testmigration;
- Rollback.

Успешный Import без Vergleich der Datensätze не доказывает vollständige Migration.

Abnahmekriterium:

> Alle 10.000 freigegebenen Kundensätze werden importiert; Anzahl, Pflichtfelder und Stichprobenwerte stimmen mit der Quelle überein, fehlerhafte Datensätze werden protokolliert.

---

## 20. Datenschutz и Softwareauswahl

Проверяются:

- Zweck и Datenkategorien;
- Rechtsgrundlage;
- Rollen и Auftragsverarbeitung;
- Speicherort и Drittlandbezug;
- Lösch- и Aufbewahrungsfunktionen;
- Berechtigungen;
- Protokollierung;
- Export и Betroffenenrechte;
- Verschlüsselung;
- Datenschutz by Design/Default.

`Server in Deutschland` не является единственным и достаточным Datenschutzkriterium.

---

## 21. Sicherheit

Минимальные вопросы:

- Herstellerupdate и Lebenszyklus;
- bekannte Schwachstellen;
- sichere Standardkonfiguration;
- Authentifizierung/MFA;
- Rollen- и Rechtekonzept;
- Verschlüsselung;
- Logging;
- Backup/Export;
- Integrität пакетов;
- Notfall- и Exitfähigkeit.

Плагин или Add-on имеет собственную Angriffsfläche и также входит в Inventar.

---

## 22. Softwarebereitstellung

Контролируемый Ablauf:

1. Paket/Quelle авторизовать.
2. Hash/Signatur, Version и Hersteller проверить.
3. Lizenz и Anforderungen проверить.
4. Testgruppe определить.
5. конфигурацию и Abhängigkeiten пакетировать.
6. Pilot развернуть.
7. функционально и безопасно тестировать.
8. Rollout по Gruppen/Ringen.
9. Monitoring и Support.
10. Version и Ergebnis документировать.

Пользовательская Installation с случайного Downloadportal нарушает управляемость и может увеличить Risiko.

---

## 23. Updatearten

| Art | Zweck |
|---|---|
| Sicherheitsupdate | устраняет Schwachstelle |
| Fehlerbehebung/Hotfix | исправляет конкретную ошибку |
| Funktionsupdate | изменяет или добавляет Funktionen |
| Hauptversion/Upgrade | существенное изменение продукта |
| Signatur-/Definitionsupdate | обновляет Erkennung, например Malware |
| Firmwareupdate | изменяет software в Gerät/Komponente |

Названия производителя могут отличаться. Решающим является Inhalt и Auswirkung.

---

## 24. Patch- und Änderungsprozess

1. Systeme и Versionen inventarisieren.
2. Meldung и Authentizität prüfen.
3. Kritikalität, Exposition и Auswirkung bewerten.
4. Abhängigkeiten и Kompatibilität prüfen.
5. Backup/Rollback vorbereiten.
6. репрезентативную Testumgebung использовать.
7. Freigabe dokumentieren.
8. stufenweise verteilen.
9. Installation и Funktion kontrollировать.
10. Fehler behandeln и Abschluss dokumentieren.

Срочный Sicherheitsfall может требовать ускоренного Prozess, но не отсутствия Kontrolle.

---

## 25. Test, Rollback и Wartungsfenster

Test должен включать:

- Installation/Deinstallation;
- Start и Kernfunktion;
- Datenzugriff;
- Schnittstellen;
- Rechte;
- Performance;
- Logs;
- Reboot;
- совместимость с Securitysoftware.

Rollback может означать:

- Deinstallation;
- возврат Paketversion;
- Restore из Backup;
- VM-Snapshot в подходящем кратком сценарии;
- Umschalten на предыдущую Umgebung.

Snapshot не заменяет долговременный Backup.

---

## 26. TCO software

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

Нулевая Lizenzgebühr не означает нулевой TCO.

---

## 27. Vollständiger Praxisfall

Компания выбирает CRM для 40 пользователей, максимум 12 одновременно.

Muss:

- Rollen и MFA;
- импорт 10.000 Datensätze;
- REST-API к ERP;
- Lösch- и Exportfunktion;
- поддержка до конца планового срока;
- Antwortzeit по Testfall;
- возможность kontrollierter Updates.

Решение:

1. оба продукта проверяются по Muss;
2. Concurrent-Kosten рассчитываются, но Spitzenlast тестируется;
3. Lizenzdefinition письменно подтверждается;
4. Testmigration с Vollständigkeitsprüfung;
5. Rollen, Logging и Löschung проверяются;
6. TCO включает Migration, Schulung, Betrieb и Exit;
7. Pilotgruppe принимает Kernprozesse;
8. решение документируется.

> Produkt B wird gewählt, weil es alle Muss-Kriterien erfüllt und das Concurrent-Modell im gemessenen Spitzenprofil jährlich 3.600 € Lizenzkosten spart. Voraussetzung sind die vertragliche Bestätigung der Zählweise und ein Lasttest mit zwölf gleichzeitigen Sitzungen.

---

## 28. Prüfungsalgorithmus

1. Aufgabe и Zielgruppe определить.
2. Softwareart и Prozesszuordnung назвать.
3. Muss-Kriterien сформировать.
4. Lizenzmetrik и Rechte проверить.
5. Anzahl, Zeitraum и Kosten рассчитать.
6. Schnittstellen, Migration, Datenschutz и Sicherheit prüfen.
7. Einführung/Update с Test и Rollback планировать.
8. TCO и qualitative Kriterien сравнить.
9. решение с условием сформулировать.

---

## 29. Typische Prüfungsformulierungen

> Open Source bezeichnet Software, deren Quellcode unter einer entsprechenden Lizenz zugänglich ist. Daraus folgt weder automatisch Kostenfreiheit noch die Abwesenheit von Lizenzpflichten.

> Die Lizenzkosten betragen 5.040 € pro Jahr, sofern zwölf Concurrent-Lizenzen alle gleichzeitigen Nutzungen einschließlich technischer Zugriffe abdecken.

> Das Update wird zunächst in einer repräsentativen Testgruppe installiert, da dadurch Kompatibilitätsfehler vor dem breiten Rollout erkannt und ein kontrollierter Rollback vorbereitet werden können.

---

## 30. Typische Prüfungsfallen

| Falle | Korrektur |
|---|---|
| Open Source = gratis | Quelloffenheit, Preis и Bedingungen разделить |
| gekauft = Urheberrecht erworben | Nutzungsrecht от Eigentum отличать |
| Concurrent = количество Mitarbeiter | одновременная Nutzung по Vertrag |
| Perpetual = Updates навсегда | Version, Wartung и Support проверить |
| Standardsoftware всегда дешевле | Migration, Anpassung и TCO |
| ERP = только Buchhaltung | интегрированные Kernprozesse |
| Update сразу на все Systeme | Test, Freigabe, gestufter Rollout |
| срочный Patch без контроля | ускорить, но тестировать и документировать |
| Installation erfolgreich = Abnahme | Kernfunktion, Daten, Rechte, Last |
| Cloudanbieter отвечает за всё | Verantwortung распределена |

---

## 31. Selbsttest

1. Различи System- и Anwendungssoftware.
2. Что такое Middleware?
3. Сравни Standard- и Individualsoftware.
4. Назови Hauptzweck ERP, CRM и SCM.
5. Почему Open Source не означает бесплатно?
6. Чем permissive отличается от Copyleft в общем виде?
7. Различи Urheberrecht, Eigentum и Lizenz.
8. Что измеряет Named User?
9. Что измеряет Concurrent User?
10. Рассчитай обе модели из раздела 14.
11. Какие условия могут изменить вывод расчёта?
12. Чем Subscription отличается от Perpetual?
13. Что сопоставляет Lizenzinventar?
14. Назови четыре technische Anforderungen.
15. Дай функциональное Security-Anforderung.
16. Как проверить vollständige Migration?
17. Назови пять Datenschutzkriterien.
18. Назови пять Sicherheitskriterien.
19. Почему Add-on входит в Inventar?
20. Расставь этапы Softwarebereitstellung.
21. Различи Sicherheitsupdate и Funktionsupdate.
22. Какие Schritte имеет Patchprozess?
23. Что тестируется после Update?
24. Почему Snapshot не Backup?
25. Назови пять частей Software-TCO.
26. Сформулируй выбор Concurrent-Modell с условием.

<details>
<summary>Показать решения</summary>

1. Systemsoftware управляет базовыми ресурсами; Anwendungssoftware решает пользовательскую задачу.
2. Соединяющий слой между Anwendungen, Diensten или Datenquellen.
3. Standardsoftware общая и конфигурируется; Individualsoftware создаётся/адаптируется для конкретного Bedarf.
4. ERP — интеграция ресурсов; CRM — Kundenbeziehungen; SCM — Lieferkette.
5. Цена, Support и лицензионные обязанности — отдельные вопросы.
6. Permissive обычно имеет менее ограничительные Weitergabepflichten; Copyleft может потребовать предоставления кода и тех же условий.
7. Охрана произведения; физическое владение; разрешённое использование.
8. Закреплённого пользователя по договорному определению.
9. Максимум одновременных Nutzungen/Sitzungen по договору.
10. `8.640 €` и `5.040 €`; разница `3.600 €` в год.
11. Spitzenlast, Zählweise, Mindestmenge, технические Nutzer, Ausfall и рост.
12. Subscription ограничен сроком; Perpetual обычно остаётся для определённой версии, но без автоматических вечных Updates.
13. Rechte, Installation/Zuordnung, Usage, Vertrag и Änderungen.
14. OS, CPU, RAM, Speicher, Runtime, Browser, Ports, API.
15. Например автоматическая Kontosperre по Richtlinie.
16. Anzahl, Pflichtfelder, Fehlerliste и Stichproben Quelle/Ziel сравнить.
17. Zweck, Rechtsgrundlage, Datenort, Rollen/AVV, Löschung, Export, Rechte, Logging.
18. Updates, sichere Konfiguration, MFA, Rechte, Verschlüsselung, Logs, Backup.
19. Он содержит код, права, Version и собственные Schwachstellen.
20. Autorisieren → prüfen → paketieren → pilotieren → testen → freigeben → gestuft ausrollen → kontrollieren.
21. Первое устраняет Schwachstelle, второе добавляет/меняет Funktion.
22. Inventar, Bewertung, Kompatibilität, Backup/Rollback, Test, Freigabe, Rollout, Kontrolle, Doku.
23. Installation, Kernfunktion, Daten, Schnittstellen, Rechte, Performance, Logs и Reboot.
24. Он зависит от исходной Umgebung и не является независимой долговременной Kopie.
25. Lizenz, Migration, Customizing, Betrieb, Support, Schulung, Ausfall, Exit.
26. Используй готовую Prüfungsformulierung из раздела 27.

</details>

---

## 32. Quellen und Abgleich

- [§ 9 FIAusbV](https://www.gesetze-im-internet.de/fiausbv/__9.html)
- [UrhG §§ 69a–69g – Computerprogramme](https://www.gesetze-im-internet.de/urhg/)
- [§ 69c UrhG – zustimmungsbedürftige Handlungen](https://www.gesetze-im-internet.de/urhg/__69c.html)
- [§ 69d UrhG – Ausnahmen](https://www.gesetze-im-internet.de/urhg/__69d.html)
- [Open Source Initiative – Open Source Definition](https://opensource.org/osd)
- [BSI – IT-Grundschutz-Kompendium](https://www.bsi.bund.de/grundschutz-kompendium)

Лицензирование зависит от конкретного договора, продукта, Version, Betriebsmodell и Rechtslage. Примеры стоимости — вымышленные учебные данные, а материал не заменяет Rechtsberatung.

---

## 33. Offene Prüfpunkte für den Unterricht

- Какие Softwarearten ожидает WBS?
- Требуется ли подробное сравнение ERP/CRM/SCM/DMS/CMS?
- Какие Lizenzmodelle названы в учебной схеме?
- Насколько глубоко рассматриваются Open-Source-Lizenzen?
- Нужны ли §§ 69c/69d UrhG или только общий принцип?
- Рассчитываются ли Concurrent- и Subscription-Kosten?
- Какой Patchprozess использует WBS?
- Какие Herstellerbeispiele допустимы на Prüfung?
- Где проходит граница с Cloud и IT-Sicherheit?
