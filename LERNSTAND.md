# Lernstand und Themenabdeckung

Stand: 09.09.2026.

Статус отражает только наличие и качество файлов в этом проекте, а не личное владение темой.

Критерии статусов:

- `Geplant` — тема определена, но содержательный файл ещё не создан;
- `In Arbeit` — старый материал существует, но ещё не приведён к полному двуязычному стандарту;
- `Entwurf` — полная пара RU/DE подготовлена;
- `Mit WBS abgeglichen` — замечания преподавателя внесены;
- `Prüfungsreif` — материал проверен, а задания уверенно выполняются без подсказки.

## Активное ядро AP1

| Themenblock | Priorität | Исходный материал | Статус проекта | Следующий шаг |
|---|---|---|---|---|
| Projektmanagement: Grundlagen, SMART, Phasen | Kern | новый материал | Entwurf | Selbsttest и Fälle повторить с WBS |
| Projektmanagement: Vorgehensmodelle und Planungswerkzeuge | Kern | частичный MD | Entwurf | Aufgabenserien zu Netzplan und Risikobewertung |
| Kundenbedarf und Anforderungen | Kern | новая двуязычная глава | Entwurf | Formulierungen и Fallaufgaben повторить с WBS |
| Angebotsvergleich und Nutzwertanalyse | Kern | частичный MD | In Arbeit | двуязычно переработать и практически рассчитать |
| Wirtschaftlichkeit und Beschaffung | Kern | частично | In Arbeit | TCO, Amortisation, Break-even и Beschaffungsprozess углубить |
| Hardwareauswahl | Kern | частично | In Arbeit | Schnittstellen, Kompatibilität и BIOS/UEFI углубить |
| Software, Lizenzen und Barrierefreiheit | Kern | частично | In Arbeit | Lizenzfälle и barrierefreie Oberflächen переработать |
| Betriebssysteme und Systemeinrichtung | Kern | частично | In Arbeit | Installation, Domänenaufnahme, Rechte и Diagnose углубить |
| Netzwerktechnik | Kern | много | In Arbeit | материал преобразовать в двуязычные тематические пары |
| Programmiergrundlagen und Pseudocode | Kern | частично | In Arbeit | Codefehler и Schreibtischtests без подсказки |
| UML und Oberflächenentwurf | Kern | частично | In Arbeit | UML-Zeichenaufgaben и UI-Ergonomie углубить |
| Relationale Datenbanken ohne SQL | Kern | частично | In Arbeit | ER-Modelle самостоятельно строить и проверять |
| KI-Unterstützung und KI-Software | Kern | частично | In Arbeit | объём сверить с WBS и актуальным Prüfungskatalog |
| Qualitätssicherung | Kern | частично | In Arbeit | Grenzwertanalyse, Äquivalenzklassen и Testfälle углубить |
| IT-Sicherheit und Kryptografie | Kern | много | In Arbeit | объединить разрозненные главы в глубокие RU/DE-пары |
| Datenschutz und DSGVO | Kern | много | In Arbeit | Informationspflichten, Löschkonzept и Fälle углубить |
| Backup und Wiederherstellung | Kern | частично | In Arbeit | Medien, Restore-Test, Aufbewahrung и 3-2-1-Regel дополнить |
| Service und Support | Kern | частично | In Arbeit | Ticket, Priorität, Eskalation и SLA углубить |
| Verträge, Abnahme und Übergabe | Abgleich | частично | In Arbeit | Verzug, Mängelrechte и Abnahmefälle сверить с WBS |
| Prüfungssimulationen | Kern | нет | Geplant | создавать после покрытия и повторения основных глав |

## Материал вне активного ядра AP1

| Thema | Einordnung | Zustand | Vorgehen |
|---|---|---|---|
| RAID-Level und Kapazitätsrechnung | AP2 | `90-ap2-zusatzwissen/raid.md` vorhanden | До начала AP2 не углублять |
| SQL-Abfragen | AP2 | отдельный файл не создан | До начала AP2 не создавать |

Официальное публичное сообщение об обновлённом Prüfungskatalog относит SQL и RAID исключительно к AP2. Основы реляционных баз данных без SQL остаются в текущем плане AP1.

## Текущий результат миграции

Полностью новому углублённому двуязычному стандарту сейчас соответствуют три пары:

1. `Projektgrundlagen, SMART und Projektphasen`;
2. `Vorgehensmodelle und Planungswerkzeuge`;
3. `Kundenbedarf und Anforderungen`.

Остальные Markdown-файлы являются полезным исходным материалом, но ещё не считаются завершёнными главами нового формата.

## Самые крупные пробелы перед Prüfungsvorbereitung

1. Последовательная миграция старых смешанных файлов в пары `ru/` и `de/`.
2. Серии расчётных задач по `Netzplan`, Wirtschaftlichkeit и Subnetting.
3. Разбор незнакомого Quellcode и `Schreibtischtest` без подсказки.
4. Самостоятельное построение UML- и ER-Modelle.
5. Практическая Systemeinrichtung: Domäne, Rechte, Filesysteme и диагностика.
6. Смешанные Fälle по Datenschutz, Security, SLA и Abnahme.
7. Полные 90-минутные Prüfungssimulationen.

## Порядок заполнения

1. Закрывать главы с приоритетом `Kern` в порядке `AP1-THEMENMATRIX.md`.
2. После каждой готовой пары обновлять матрицу и этот файл.
3. Темы `Vertiefung` и `Abgleich` добавлять только после необходимого ядра соответствующего раздела.
4. AP2 не должен отнимать время, пока AP1 не покрыта и не закреплена практическими заданиями.
