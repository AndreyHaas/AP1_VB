# AP1: анализ прошлых заданий и перенос в подготовку

Stand: 11.09.2026.

## 1. Что анализировалось

Публично доступные материалы не дают права воспроизводить полные защищённые экзаменационные листы. Поэтому здесь используются:

- официальная рамка § 9 FIAusbV;
- действующий Prüfungskatalog с применением для AP1 с Frühjahr 2025;
- официально продаваемые U-Form Altprüfungen и Prüfungstrainer как указатель на формат;
- публичный вторичный обзор тем десяти AP1-сессий от Herbst 2021 до Frühjahr 2026;
- открытые Erfahrungsberichte только как непроверенные сигналы, а не как нормативный источник;
- подтверждённые пользователем WBS-Kursinhalte.

Важно: частота в прошлых экзаменах не гарантирует будущую задачу. Она используется для расстановки тренировочного приоритета, но не для `Lernen auf Lücke`.

## 2. Что действительно повторяется

По публичному вторичному разбору десяти AP1-сессий тематические кластеры встречались так:

| Кластер | Сессий из 10 | Вывод для подготовки |
|---|---:|---|
| Hardware | 10 | обязательно уметь выбирать, сравнивать и проверять совместимость |
| Netzwerktechnik | 9 | обязательно конфигурация, адресация, диагностика и сервисы |
| Softwareentwicklung | 9 | код читать, трассировать, объяснять и находить ошибки |
| Wirtschaftlichkeit | 9 | минимум один уверенный расчётный блок плюс решение |
| IT-Sicherheit | 8 | Schutzbedarf, Maßnahmen, Identitäten, Kryptografie, Angriff |
| Projektmanagement | 8 | планы, зависимости, требования, изменения и обоснование |
| Kundenberatung/Präsentieren | 7 | целевая группа, объяснение, документирование, обратная связь |
| Datenbanken | 6 | ERM, Schlüssel и Datenmodell без возвращения SQL в текущее AP1-ядро |
| Datenschutz | 6 | Zweck, Rechtsgrundlage, Grundsätze, TOM и Betroffenenrechte |
| Angebotsvergleich | 5 | Muss-Kriterien, Nutzwertanalyse, Kosten и nachvollziehbare Entscheidung |
| Multimedia | 5 | Dateigröße, Format, Kompression, Kamera-/Ausgabeparameter |
| Märkte und Bedarfe | 4 | Marktform, Bedarf, Zielgruppe, Wertschöpfung |
| Verträge | 3 | Vertragsart, Abnahme, Mangel и Vertragsstörung |

Это подтверждает приоритет не отдельных «любимых тем», а комбинированных ситуаций: устройство или услуга выбирается, рассчитывается, настраивается, защищается, тестируется и объясняется клиенту.

## 3. Сигналы последних экзаменов после смены каталога

| Сессия | Публично отмеченные типы задач | Что переносим |
|---|---|---|
| Frühjahr 2025 | Englisch, Peripherieanschlüsse, Protokolle, WLAN, Subnetting, Redundanz, Schutz, Schreibtischtest, KI | Port-/Protokollmatrix, Englisch-Extraktion, Netz-/Security-Fall, Code-Trace |
| Herbst 2025 | Change, Prozessanalyse, Aktivitätsdiagramm, Netzwerkkonfiguration, Leistungs-/Dateigröße, Preisnachlass/Rechnung, Code/Pseudocode, Datenbank, KI | два Zeichnen/Modellieren-блока под временем, полная Rechnung, Change/Rollout, Rechenmix |
| Frühjahr 2026 | Change, Rollout, Netzplan, IPv4/IPv6, Netzwerkkonfiguration, ERM/Klassendiagramm, Schreibtischtest, Stromkosten, Passwort, Vertragsstörungen, Daisy Chaining | Netzwerkdiagnose, Diagrammwahl, расчёт с единицами, Vertragsfall, Monitor-/Portkette |

Самый полезный перенос — не угадывание темы следующего экзамена, а умение решать семь повторяющихся типов действий:

1. `auswählen und begründen` — выбрать по Muss-Kriterien и доказать соответствие;
2. `berechnen und bewerten` — формула, единицы, результат, Plausibilität, решение;
3. `konfigurieren und prüfen` — заданная конфигурация, тест, Soll/Ist, протокол;
4. `Fehler eingrenzen` — от физического уровня к приложению, без прыжков;
5. `modellieren` — подобрать правильный вид диаграммы и соблюдать нотацию;
6. `Schutzmaßnahme ableiten` — Wert, Risiko, Maßnahme, Restrisiko;
7. `adressatengerecht erklären` — полный немецкий ответ с причиной и эффектом.

## 4. Что перенесено в базу

| Исторический сигнал | Глава/файл | Реализованный навык |
|---|---|---|
| USB, Monitoranschlüsse, RJ45, Peripherie | Kapitel 10, расширено 11.09 | A/B/C, Mini/Micro, USB-Standard против Bauform, DP/HDMI/DVI/VGA, Adapter, Daisy Chain |
| Kamera/Multimedia/Dateigröße | Kapitel 47 | Sampling, Raster/Vektor, Codec, Bitrate, наружная камера с Heizung, PoE и Speicher |
| ping и Netzwerkkonfiguration | Kapitel 52 | различия ping/tracert/ipconfig/nslookup/netstat/arp/route и ступенчатая Fehlersuche |
| ASCII/Zweierpotenzen/Einheiten | Kapitel 46 | Dual/Oktal/Dezimal/Hex, ASCII, Unicode, UTF-8, Prüfziffer, Parität |
| Leistungsaufnahme/Stromkosten | Kapitel 43 и 48 | W/kWh, Wirk-/Scheinleistung, Leistungsfaktor, Wirkungsgrad, USV |
| Marktformen | Kapitel 44 | Marktform, Käufer-/Verkäufermarkt, Wertschöpfung, Rechtsform, Marketing |
| Handelskalkulation/Preisnachlass/Rechnung | Kapitel 50 | полная схема, Rückwärts-/Differenz-, Vor-/Nachkalkulation, Rechnungsprüfung |
| Change/Rollout/Prozess | Kapitel 45 и 49 | Teamphasen, Stakeholder, Pilot, Rollout, ITIL Change Enablement |
| Servicequalität | Kapitel 40 и 49 | ITSM/ITIL, Incident/Problem/Request/Change, SLA/OLA |
| NAS/SAN и Redundanz | Kapitel 39 и 49 | SPOF, NAS-Pfade, USV, Monitoring, Backup-Abgrenzung |
| Englisch/Remotearbeit/Shell | Kapitel 52 | английский текст, RDP/SSH/VPN, PowerShell/Bash, sichere Diagnose |
| Vertragsstörungen | Kapitel 41 и 50 | Nicht-/Spät-/Schlecht-/Falsch-/Minderlieferung и Voraussetzungen |

## 5. Что сознательно не переносится обратно в AP1

Публичные обзоры старых сессий содержат темы, которые новый каталог с Frühjahr 2025 перенёс или удалил из AP1. Поэтому:

- `SQL-Abfragen` остаются вне активного AP1-ядра;
- `RAID-Level und RAID-Kapazitätsrechnung` остаются в `90-ap2-zusatzwissen/`;
- `Struktogramm` и `Programmablaufplan` не возвращаются в основной план;
- вместо этого тренируются актуальные UML-, BPMN-, ER- и Codeverständnis-Aufgaben.

Старые задания по этим темам можно использовать только для общей техники решения, но не как аргумент для изменения текущего AP1-плана.

## 6. Минимальный набор тренировочных форматов

Перед экзаменом база должна содержать не только теорию, но и следующие задания:

| Формат | Минимум |
|---|---:|
| 90-minütige Gesamtsimulation | 2 полных варианта |
| Hardware-/Port-Auswahlfall | 2 случая, один с несколькими ограничениями |
| Netzwerk-Fehlersuche | 3 цепочки, включая DNS и Dienst/Port |
| gemischte Rechnung | 4 набора: Kosten, Daten, Strom/USV, Handelskalkulation |
| Diagramm/Modell | UML, BPMN, ERM и Netzplan минимум по одному |
| Code/Schreibtischtest | 3 задачи с ошибкой или Grenzfall |
| Sicherheit/Datenschutz | 3 случая с Begründung и Restrisiko |
| Fachbegriffe unter Zeitdruck | ежедневный Active-Recall по общему словарю |

## 7. Источники и надёжность

- [§ 9 FIAusbV — официальный Prüfungsbereich](https://www.gesetze-im-internet.de/fiausbv/__9.html)
- [IHK Hannover — Prüfungskataloge IT-Berufe и изменение с Frühjahr 2025](https://www.ihk.de/hannover/hauptnavigation/ausbildung-und-weiterbildung/ausbildung/ausbildung-a-z/neuordnungen/pruefungskataloge-it-berufe-6438900)
- [U-Form — действующий Prüfungskatalog AP1](https://www.u-form-shop.de/ihk-pruefungen/pruefungskataloge-abschlusspruefung/fachinformatiker-fachinformatikerin-anwendungsentwicklung-pruefungskatalog-fuer-die-ihk-abschlusspruefung-1)
- [IT-Berufe-Podcast — публичная статистика тем AP1 2021–2026](https://it-berufe-podcast.de/vorbereitung-auf-die-ihk-abschlusspruefung-der-it-berufe/themen-der-schriftlichen-ihk-pruefungen-der-it-berufe/) — вторичный источник, применён только для частот и исторических сигналов.
- WBS-Kursinhalte пользователя — первичный источник для реально пройденной программы; подтверждены в переписке 11.09.2026.

## 8. Вывод

Старый план был недостаточен: он хорошо покрывал крупные технические кластеры, но пропускал несколько реально преподававшихся и исторически встречавшихся типов задач. После пакета глав 44–52 исправляются пробелы по Zahlensysteme/Encoding, Multimedia/Kamera, USV, ITIL, полной Handelskalkulation, QoS/VoIP, Unternehmen/Organisation и рабочей диагностике.

Следующий обязательный этап после контентного пакета — две 90-минутные симуляции, построенные на повторяющихся действиях из раздела 3, а не на копировании старых экзаменов.
