# IHK-Prüfungsvorbereitung FIAE

Углублённая двуязычная база подготовки для:

- `AP1 – Einrichten eines IT-gestützten Arbeitsplatzes`;
- `AP2 – Fachinformatiker/-in Anwendungsentwicklung`;
- `betriebliche Projektarbeit`;
- `Präsentation und Fachgespräch`.

Целевая IHK: `IHK für München und Oberbayern`. Учебный контекст: `WBS Training`.

## Основной принцип

Каждая учебная глава существует в двух самостоятельных вариантах:

```text
thema-ru.md  — объяснение по-русски, Fachbegriffe и Musterantworten по-немецки
thema-de.md  — полностью немецкая версия той же главы
```

Обе версии должны совпадать по охвату, структуре, примерам и заданиям. Немецкий файл не является сокращённым переводом русского.

## Структура проекта

```text
00-organisation/
    SCHREIBSTANDARD.md
    AP1-THEMENMATRIX.md
    QUELLEN.md

01-ap1/
    01-projektmanagement/
    02-kundenbedarf-kommunikation/
    03-wirtschaftlichkeit-beschaffung/
    04-hardware-software/
    05-systemeinrichtung/
    06-netzwerktechnik/
    07-programmierung-uml-datenbanken/
    08-kuenstliche-intelligenz/
    09-qualitaet-it-sicherheit/
    10-datenschutz/
    11-backup-verfuegbarkeit/
    12-service-vertraege-uebergabe/
    13-berechnungen/

02-ap2-fiae/
    später: Planen eines Softwareproduktes
    später: Entwicklung und Umsetzung von Algorithmen
    später: Wirtschafts- und Sozialkunde

03-projekt-und-muendliche-pruefung/
    später: Projektantrag
    später: Projektdokumentation
    später: Präsentation
    später: Fachgespräch

90-uebungen/
    thematische Aufgabenserien
    gemischte Fälle
    90-Minuten-Simulationen

99-originale-txt/
    unveränderte Ausgangsnotizen
```

## Глубина главы

Полноценная глава должна содержать:

1. метаданные и статус;
2. `Lernziele`;
3. основные понятия и причинно-следственные связи;
4. точные сравнения и разграничения;
5. практический сценарий, расчёт или схема;
6. немецкие `Prüfungsformulierungen`;
7. `Typische Prüfungsfallen`;
8. `Selbsttest` без подсказок;
9. скрытые решения;
10. источники и открытые вопросы для WBS.

Количество строк не является целью само по себе. Глава должна позволять не только узнать термин, но и применить его в незнакомой практической ситуации.

## Статусы

- `Geplant` — тема определена, содержательного файла ещё нет.
- `In Arbeit` — создаётся или существенно перерабатывается.
- `Entwurf` — полный учебный черновик готов.
- `Mit WBS abgeglichen` — замечания преподавателя внесены.
- `Prüfungsreif` — теория и задачи уверенно выполняются без подсказки.

## Разграничение AP1 и AP2

- `SQL-Abfragen` и `RAID` не входят в ядро AP1 по каталогу, действующему с весны 2025 года.
- Основы реляционных баз данных и простые `ER-Modelle` остаются в AP1.
- Материал, полезный для профессии, но не подтверждённый для AP1, помечается `Erweiterung/Abgleich erforderlich` и не вытесняет ядро.
- Старые экзамены используются для формы задач, но их тематическое содержание проверяется на актуальность.

## Рабочий процесс

1. Выбрать пару файлов со статусом `Entwurf`.
2. Прочитать русскую версию и выписать немецкие термины.
3. Повторить тему по немецкой версии.
4. Выполнить `Selbsttest` без открытия решений.
5. Сформулировать ответы полными немецкими предложениями.
6. После занятия WBS внести исправления отдельным commit.

## Git-рекомендация

Коммит должен описывать содержательное изменение:

```text
Vertiefe Netzplanberechnung und Pufferzeiten
Korrigiere Schlüsselverwendung bei digitaler Signatur
Ergänze WBS-Hinweis zu SMART-A
```

