# IHK AP1 Vorbereitung – Fachinformatiker Anwendungsentwicklung

Русско-немецкий конспект для подготовки к `Abschlussprüfung Teil 1 (AP1)` в экзаменационном разделе `Einrichten eines IT-gestützten Arbeitsplatzes`.

Целевая аудитория проекта: `Fachinformatiker/-in Anwendungsentwicklung`, IHK für München und Oberbayern. Письменная AP1 является общей для IT-Berufe; согласно § 9 FIAusbV на неё отводится 90 минут.

## Как устроен проект

- Каждый учебный вопрос хранится в отдельном Markdown-файле.
- Объяснения даны по-русски, а немецкие `Fachbegriffe`, определения и формулировки ответа — по-немецки.
- Ошибочные ответы из диалога не переносятся в основной конспект. Они могут использоваться только как разобранные `Prüfungsfallen`.
- Исходные TXT-файлы без исправлений лежат в `99-originale-txt/`.
- Текущий охват, приоритеты и пробелы отражены в `LERNSTAND.md`.

## Структура

```text
00-organisation/                         правила, источники, план
01-projektmanagement/                    проекты, SMART, Wasserfall, Scrum, Netzplan
02-kundenbedarf-wirtschaftlichkeit/      Bedarf, Angebote, Kosten, расчёты
03-hardware-software/                    компоненты, SSD/HDD, Softwarearten, Lizenzen
04-betriebssysteme/                      установка, Filesysteme, Rechte, команды
05-netzwerktechnik/                      OSI, IP, Subnetting, DNS, DHCP, VLAN и др.
06-programmierung-uml-datenbanken/        код, Pseudocode, UML, реляционные БД
07-kuenstliche-intelligenz/              KI-Grundlagen и безопасное применение
08-qualitaetssicherung/                  QM, тестирование, Testprotokoll
09-it-sicherheit-datenschutz/            безопасность, криптография, DSGVO
10-backup/                               Backup-Arten, GVS, Medien
11-service-vertraege-uebergabe/          SLA, Support, Verträge, Abnahme
90-ap2-zusatzwissen/                     материал, исключённый из AP1
99-originale-txt/                        неизменённые исходники
```

## Приоритеты

- `P1` — обязательное ядро AP1 по доступным официальным формулировкам и актуальному Prüfungskatalog.
- `P2` — важное расширение темы или частый экзаменационный контекст.
- `P3` — дополнительное знание; изучать после ядра.
- `Nicht AP1` — не тратить время в рамках текущего плана AP1.

## Статусы

- `Offen` — материала ещё нет или это только план.
- `Entwurf` — конспект создан, но требует повторения и проверки.
- `Wiederholen` — материал пройден, требуется закрепление.
- `Mit Lehrer geprüft` — исправления обсуждены на Prüfungsvorbereitung.
- `Prüfungsreif` — теория и задачи выполняются без подсказки.

## Важное разграничение AP1/AP2

Во второй редакции Prüfungskatalog, применяемой к AP1 с весны 2025 года, `SQL` и `RAID` отнесены исключительно к AP2. Поэтому:

- в AP1 изучаются основы `relationale Datenbanken`, но не SQL-запросы;
- RAID-конспекты сохранены в `90-ap2-zusatzwissen/`, а не в основном плане AP1;
- `Struktogramm` и `Programmablaufplan (PAP)` не включены в основной план;
- для AP1 используются `Pseudocode` и UML, включая `Aktivitätsdiagramm`;
- добавлены темы `KI-Unterstützung` и `KI-Software`.

## Рабочий процесс

1. Выбрать в `LERNSTAND.md` тему `P1` со статусом `Offen` или `Wiederholen`.
2. Прочитать объяснение и немецкие определения.
3. Закрыть раздел `Lösungen` и выполнить `Selbsttest` без подсказки.
4. Исправить ответ полным немецким предложением.
5. После занятия в WBS внести подтверждённые замечания в `Offene Punkte / Korrekturen` и обновить статус.

## Источники

См. [QUELLEN.md](QUELLEN.md). Полный детальный Prüfungskatalog распространяется через U-Form-Verlag; публичные обзоры не заменяют его. Если школа предоставит каталог или точную Themenliste, её следует добавить и провести построчную сверку.
