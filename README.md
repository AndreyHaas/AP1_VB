# IHK AP1-Prüfungsvorbereitung – FIAE

Углублённая двуязычная база подготовки к письменной части:

- `AP1 – Einrichten eines IT-gestützten Arbeitsplatzes`;
- Ausbildung: `Fachinformatiker/-in Anwendungsentwicklung`.

Целевая IHK: `IHK für München und Oberbayern`, Geschäftsstelle Ingolstadt. Учебный контекст: `WBS Training`.

Сейчас проект целенаправленно развивается только для AP1. Материалы для AP2, проектной работы, презентации и `Fachgespräch` будут добавляться позднее, после завершения ядра AP1. Отдельные папки для этих разделов пока не создаются.

## Быстрая навигация

- [AP1-Themenmatrix und Arbeitsreihenfolge](AP1-THEMENMATRIX.md)
- [Lernstand und Themenabdeckung](LERNSTAND.md)
- [Schreibstandard](00-organisation/SCHREIBSTANDARD.md)
- [Lernplan bis 28.09.2026](00-organisation/LERNPLAN-BIS-28-09.md)
- [Fachbegriffe DE–RU по всем главам](00-organisation/FACHBEGRIFFE-DE-RU.md)
- [Analyse alter AP1-Themen und Transfer](00-organisation/AP1-ALTFRAGEN-TRANSFER.md)
- [Quellen und Gültigkeit](00-organisation/QUELLEN.md)
- [Zuordnung der ursprünglichen TXT-Dateien](00-organisation/MIGRATION.md)

## Основной принцип

Каждая полностью переработанная учебная глава существует в двух самостоятельных вариантах:

```text
ru/<nummer>-<thema>-ru.md
    объяснение по-русски;
    немецкие Fachbegriffe и Musterantworten

de/<nummer>-<thema>-de.md
    полностью немецкая версия той же главы
```

Обе версии должны совпадать по охвату, структуре, примерам и заданиям. Немецкий файл не является сокращённым переводом русского.

Старые одноязычные или смешанные файлы временно сохраняются до их поэтапной переработки. Их наличие не означает, что соответствующая тема уже соответствует новому стандарту.

## Текущая структура проекта

```text
00-organisation/                         правила, источники и миграция
01-projektmanagement/                    проекты, SMART, Vorgehensmodelle, Netzplan
02-kundenbedarf-wirtschaftlichkeit/      Kundenbedarf, Angebote, Wirtschaftlichkeit
03-hardware-software/                    Hardware, Software, Lizenzen, Cloud
04-betriebssysteme/                      Systemeinrichtung, Dateisysteme, Rechte
05-netzwerktechnik/                      Netzwerkmodelle, IP, DNS, VLAN, Firewall и др.
06-programmierung-uml-datenbanken/       Pseudocode, UML, relationale Datenbanken
07-kuenstliche-intelligenz/              KI-Grundlagen и безопасное применение
08-qualitaetssicherung/                  Qualitätsmanagement и тестирование
09-it-sicherheit-datenschutz/            IT-Sicherheit, Kryptografie, DSGVO
10-backup/                               Backup-Arten, GVS, Medien, Restore
11-service-vertraege-uebergabe/          SLA, Support, Verträge, Abnahme
12-pruefungssimulationen/                две полные 90-минутные симуляции и раздельные решения
13-ap1-nachtraege/                       WBS-Nachträge и выявленные пробелы плана
90-ap2-zusatzwissen/                     изолированный материал вне ядра AP1
99-originale-txt/                        неизменённые исходные заметки
```

Файлы `AP1-THEMENMATRIX.md`, `LERNSTAND.md`, `CHANGELOG.md` и этот `README.md` находятся в корне проекта.

## Глубина главы

Полноценная глава должна содержать:

1. метаданные и статус;
2. `Lernziele`;
3. `Prüfungsminimum` для быстрого повторения;
4. основные понятия и причинно-следственные связи;
5. точные сравнения и разграничения;
6. практический сценарий, расчёт или модель;
7. немецкие `Prüfungsformulierungen`;
8. `Typische Prüfungsfallen`;
9. `Selbsttest` без видимых подсказок;
10. скрытые решения;
11. источники и открытые вопросы для WBS.

Количество строк не является целью само по себе. Глава должна позволять не только воспроизвести определение, но и применить материал в незнакомой практической ситуации и обосновать решение.

## Приоритеты

- `Kern` — подтверждённое ядро AP1.
- `Vertiefung` — материал, необходимый для уверенного применения ядра.
- `Abgleich` — полезная тема, точный объём которой нужно подтвердить по каталогу или с WBS.
- `AP2` — материал, сознательно вынесенный из активной подготовки к AP1.

## Текущий результат

По состоянию на `11.09.2026` подготовлены 52 самостоятельные пары RU/DE. Главы 44–52 исправляют пробелы первоначального плана: Unternehmen/Organisation, Zahlensysteme и Zeichenkodierung, Multimedia и Außenkamera, Elektrotechnik/USV, ITIL/ITSM, расширенную Handelskalkulation, QoS/VoIP, technisches Englisch, Remotezugriff, Shell и Diagnosebefehle. Глава 10 дополнительно расширена по USB-A/B/C, Mini-/Micro-USB, DisplayPort, HDMI, DVI, VGA и рабочим портам. Общий словарь связывает Fachbegriffe с главами.

В папке [Prüfungssimulationen](12-pruefungssimulationen/README.md) находятся две полные 90-минутные тренировки по 100 баллов с отдельными решениями: Rollout рабочих мест и проект уличных камер. Следующий этап — изучение глав по Lernplan, выполнение вариантов 26–27 сентября и целевая доработка личных ошибок.

## Статусы

- `Geplant` — тема определена, содержательного файла ещё нет.
- `In Arbeit` — материал существует, но создаётся или перерабатывается под новый стандарт.
- `Entwurf` — полный двуязычный учебный черновик готов.
- `Mit WBS abgeglichen` — замечания преподавателя внесены и датированы.
- `Prüfungsreif` — теория и задания уверенно выполняются без подсказки.

Статус файла описывает качество материала в репозитории, а не личное владение темой.

## Разграничение AP1 и AP2

- `SQL-Abfragen` и `RAID` не входят в ядро AP1 по Prüfungskatalog, применяемому к AP1 с весны 2025 года.
- Основы реляционных баз данных и простые `ER-Modelle` остаются в AP1.
- Материал вне подтверждённого ядра помечается `Vertiefung`, `Abgleich` или `AP2` и не вытесняет обязательные темы.
- Старые экзамены используются для тренировки формы заданий, но их тематическое содержание проверяется на актуальность.
- Платный `Prüfungskatalog` и замечания WBS имеют приоритет перед неофициальными списками тем.

## Рабочий процесс

1. Выбрать следующую пару файлов по `AP1-THEMENMATRIX.md`.
2. Изучить русскую версию и выписать немецкие термины.
3. Повторить тему по немецкой версии.
4. Выполнить `Selbsttest`, не раскрывая решения.
5. Сформулировать ответы полными немецкими предложениями.
6. Проверить выводы на занятии WBS.
7. Внести подтверждённые изменения отдельным commit и обновить статус.

## Git-рекомендация

Название commit должно описывать содержательное изменение:

```text
Vertiefe Netzplanberechnung und Pufferzeiten
Korrigiere Schlüsselverwendung bei digitaler Signatur
Ergänze WBS-Hinweis zu SMART-A
```

AP2 и подготовка к проектной и устной части будут добавлены позже без изменения текущего приоритета: сначала необходимо завершить и закрепить ядро AP1.
