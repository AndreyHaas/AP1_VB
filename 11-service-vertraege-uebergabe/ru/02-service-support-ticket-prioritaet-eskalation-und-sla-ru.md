---
pruefung: AP1
thema: Service und Support
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Russisch
gegenstueck: ../de/02-service-support-ticket-prioritaet-eskalation-und-sla-de.md
---

# Сервис и поддержка: Ticket, приоритет, эскалация и SLA

## 1. Lernziele

Ты умеешь:

- различать Incident, Service Request, Problem и Change;
- создавать полное и экономное по данным Ticket;
- отдельно оценивать Auswirkung и Dringlichkeit;
- применять заданную Prioritätsmatrix и обосновывать результат;
- выбирать First, Second и Third Level Support;
- выполнять функциональную и иерархическую эскалацию;
- контролировать Reaktions-, Wiederherstellungs- и Lösungszeit из SLA;
- понятно информировать пользователей и управлять ожиданиями;
- завершать Ticket, сохранять знания и улучшать процесс;
- направлять Security- и Datenschutzvorfälle в специальный процесс.

## 2. Prüfungsminimum — 15 Minuten

1. `Incident`: неплановое прерывание или ухудшение IT-сервиса.
2. `Service Request`: стандартный запрос пользователя, например разрешённое ПО или информация.
3. `Problem`: основная причина одного или нескольких Incidents; анализ может идти после восстановления.
4. `Change`: контролируемое изменение сервиса или инфраструктуры.
5. Приоритет часто выводят из Auswirkung и Dringlichkeit по заданной матрице.
6. Supportlevel описывает компетенцию и ответственность, не приоритет.
7. Funktionale Eskalation передаёт компетентнее; hierarchische подключает руководство/решение.
8. Reaktionszeit не заканчивается автоматически решением.
9. Ticket фиксирует факты, время, меры, коммуникацию, результат и доказательства.
10. Incident закрывают после проверки, информирования и полноценного Abschluss.

> Das Ticket erhält Priorität 1, da ein geschäftskritischer Service für alle Standorte ausgefallen ist und kein Workaround zur Verfügung steht.

## 3. Prozesse und Ticketqualität

### 3.1 Incident, Request, Problem и Change

| Понятие | Цель | Пример |
|---|---|---|
| Incident | быстро вернуть нормальный сервис | Druckdienst не работает |
| Service Request | предоставить стандартную услугу | установить разрешённое ПО |
| Problem | устранить причину и повторы | повторяющаяся ошибка Druckspooler |
| Change | оценённо и разрешённо изменить | обновить Druckserver |

Workaround восстанавливает сервис, не обязательно устраняя основную причину. Из Problemanalyse может следовать Change.

### 3.2 Поля Ticket

Хороший Ticket содержит:

- уникальный ID, время создания и канал;
- сообщившего и необходимый контакт;
- сервис, устройство, место и охват;
- наблюдаемое поведение без преждевременного диагноза;
- начало, воспроизводимость и последнее рабочее состояние;
- Auswirkung, Dringlichkeit и приоритет;
- Status, Verantwortlicher и SLA-Zeitmarken;
- шаги, результаты, Logs/Fehlercodes и Workaround;
- коммуникацию, эскалацию, решение и Abschlussbestätigung.

Вносить только необходимые персональные данные. Пароли, Private Keys и лишние полные записи не помещаются в Ticket.

### 3.3 Хорошее описание

```text
плохо:  „Internet kaputt, dringend!“
лучше:  „Seit 09:12 erreichen 24 Benutzer am Standort Nord
         keine externen HTTPS-Ziele. Interne Anwendungen und
         DNS-Auflösung funktionieren. Kein Workaround bekannt.“
```

Факты помогают классификации и диагностике. Предположения маркируются как Hypothese.

## 4. Priorität, Supportlevel und Eskalation

### 4.1 Auswirkung и Dringlichkeit

`Auswirkung`: сколько людей, площадок, сервисов и процессов затронуто и насколько тяжело?

`Dringlichkeit`: как быстро нужно действовать до последствий или окончания окна?

Пример матрицы:

| Auswirkung \ Dringlichkeit | hoch | mittel | niedrig |
|---|---:|---:|---:|
| hoch | P1 | P2 | P3 |
| mittel | P2 | P3 | P4 |
| niedrig | P3 | P4 | P4 |

Матрица специфична для организации. В задаче применяют заданную; исключения документируют.

### 4.2 Supportlevel

```text
First Level  → приём, уточнение, Standarddiagnose, известные решения
Second Level → глубокий Fachanalyse и специальные системы
Third Level  → разработка, производитель или высшая экспертиза
```

First Level не означает «неважный». Хороший приём, диагностика, общение и известное решение сокращают общее время.

### 4.3 Виды эскалации

`funktionale Eskalation`: не хватает компетенции, прав или инструмента → Fachstelle.

`hierarchische Eskalation`: риск SLA/бизнеса, конфликт ресурсов или приоритета → руководство/Serviceverantwortung.

`zeitbasierte Eskalation`: заранее заданный момент перед SLA-Verletzung запускает эскалацию.

Эскалация — плановый механизм управления. Ticket передают с контекстом, выполненными шагами и ясным вопросом.

### 4.4 Контроль SLA

| Время | Старт | Конец |
|---|---|---|
| Reaktionszeit | квалифицированный Eingang | подтверждённый Beginn по SLA |
| Wiederherstellungszeit | Incidentbeginn/-meldung по определению | сервис пригоден/Workaround принят |
| Lösungszeit | заданный старт | причина устранена постоянно |

Паузы, Servicezeiten и ожидание учитывают только по правилу SLA. `Warten auf Benutzer` не останавливает часы автоматически.

## 5. Anwendungsfall: отказ центрального входа

В 08:05 несколько площадок сообщают: никто не входит в Warenwirtschaftssystem. Затронуты 180 человек, Versand начинается 09:00, обхода нет. SLA: P1-Reaktion 15 минут, Wiederherstellung 2 часа.

### 5.1 Классификация

```text
Typ:           Incident
Auswirkung:    hoch — несколько площадок, критичный процесс
Dringlichkeit: hoch — Versand начнётся менее чем через час
Priorität:     P1 по примеру
```

### 5.2 Обработка

1. Создать Ticket/Major Incident, зафиксировать время.
2. Проверить охват, последние изменения, Monitoring/Logs.
3. Тестировать Identitätsdienst, Netzwerk, DNS/Zeit и зависимости.
4. Разделить координацию, технику и коммуникацию по ролям.
5. Рано функционально эскалировать; при риске SLA/бизнеса — иерархически.
6. Оценить безопасный Workaround, не обходить защиту без проверки.
7. Давать согласованный статус каждые 30 минут.
8. Восстановить, выполнить Funktions- и Negativtests.
9. Сообщить пользователям, вести причину как Problem, закрыть Ticket.

### 5.3 Проверка времени

```text
Eingang:               08:05
Bearbeitung bestätigt: 08:16
Reaktionszeit:         11 min → Ziel 15 min eingehalten
Wiederherstellung:     09:42
Dauer:                 1 h 37 min → Ziel 2 h eingehalten
```

Постоянную причину можно позже убрать через Problem и kontrollierten Change.

### 5.4 Критерии Abschluss

- сервис и затронутая группа работают;
- Monitoring стабилен;
- Workaround и Restrisiko известны;
- Nutzer/Service Owner проинформированы;
- документация и время полны;
- Folgeproblem, Change или Security-Incident связан;
- Abschlusscode и понятное решение записаны.

## 6. Prüfungsformulierungen

> Die Störung wird als Incident klassifiziert, da ein zuvor verfügbarer Service ungeplant nicht mehr genutzt werden kann.

> Die Priorität ergibt sich aus hoher Auswirkung und hoher Dringlichkeit, weil mehrere Standorte betroffen sind und der Versandprozess unmittelbar bevorsteht.

> Das Ticket wird funktional an den Second Level eskaliert, da für die Analyse des zentralen Identitätsdienstes spezialisierte Berechtigungen und Kenntnisse erforderlich sind.

> Die Reaktionszeit wurde eingehalten, weil zwischen Eingang um 08:05 und bestätigtem Bearbeitungsbeginn um 08:16 nur elf Minuten liegen.

## 7. Typische Prüfungsfallen

- Путать Incident и Service Request.
- Анализировать причину, пока критичный сервис не восстановлен.
- Приравнивать Problem к Incident.
- Давать приоритет по громкости или должности заявителя.
- Не обосновывать Auswirkung и Dringlichkeit.
- Считать Supportlevel приоритетами.
- Эскалировать без выполненных шагов.
- Путать Reaktionszeit с решением.
- Останавливать SLA-Uhr без Vertragsregel.
- Писать пароли и лишние персональные данные.
- Применять небезопасный Workaround без риска/Freigabe.
- Закрывать сразу после вмешательства без теста и сообщения.

## 8. Selbsttest

1. Различи Incident, Service Request, Problem и Change.
2. Назови восемь полей Ticket.
3. Различи Auswirkung и Dringlichkeit.
4. Определи приоритет: высокая Auswirkung, средняя Dringlichkeit.
5. Задачи First, Second и Third Level?
6. Различи funktionale и hierarchische Eskalation.
7. Что такое zeitbasierte Eskalation?
8. Различи три SLA-времени.
9. Рассчитай Reaktionszeit с 13:47 до 14:05.
10. Почему пароль не должен быть в Ticket?
11. Назови шесть критериев завершения.
12. Оцени: «Workaround всегда устраняет Problem».

<details>
<summary>Lösungen anzeigen</summary>

1. нарушение; стандартный запрос; основная причина; контролируемое изменение.
2. ID, время, контакт, сервис/охват, описание, приоритетные факторы, Status/Owner, шаги, общение, решение; достаточно восьми.
3. ширина/тяжесть; временное давление.
4. P2.
5. приём/стандарт; Fachanalyse; производитель/разработка/специалисты.
6. к компетенции; к руководству/решению.
7. эскалация при временном пороге до SLA-Verletzung.
8. до начала; до пригодности; до постоянного устранения.
9. 18 минут.
10. раскрытие секрета, лишнее хранение, широкий доступ и копии протоколов.
11. функция, Monitoring, риск/Workaround, информация, документация, Folgeprozess, Abschlusscode; достаточно шести.
12. Неверно; сервис восстановлен, но причина может остаться.

</details>

## 9. Quellen und Abgleich

- [BIBB – Umsetzungshilfe Fachinformatiker/Fachinformatikerin](https://www.bibb.de/dienst/publikationen/de/16661) — контекст Service, Störung, Kommunikation и Dokumentation.
- [BSI IT-Grundschutz-Kompendium](https://www.bsi.bund.de/grundschutz-kompendium) — требования к Störungs-/Sicherheitsvorfällen, Protokollierung и Betrieb.
- [FIAusbV § 9](https://www.gesetze-im-internet.de/fiausbv/__9.html) — Kundenunterweisung, Leistungskontrolle и Protokollierung в AP1.

## 10. Offene Prüfpunkte für den Unterricht

- Какую Prioritätsmatrix и SLA-Uhrregeln использует WBS?
- Нужны ли термины Major Incident и Problem Management?
- Какие Ticketpflichtfelder требует WBS-Vorlage?
