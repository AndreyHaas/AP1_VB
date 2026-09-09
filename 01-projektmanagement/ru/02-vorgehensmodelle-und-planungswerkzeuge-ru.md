---
pruefung: AP1
thema: Projektmanagement
prioritaet: Kern
status: Entwurf
stand: 2026-09-09
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: 02-vorgehensmodelle-und-planungswerkzeuge-de.md
---

# AP1: Vorgehensmodelle и Planungswerkzeuge

Глава охватывает `Wasserfallmodell`, `Scrum`, `Projektstrukturplan (PSP)`, `Arbeitspakete`, `Gantt-Diagramm` и `Netzplan`. Цель — не просто запомнить определения, а уметь выбрать подход, прочитать план и выполнить расчёт сроков.

## 1. Lernziele

После изучения темы нужно уметь:

- сравнивать классический и agile-подход;
- объяснять преимущества, ограничения и область применения `Wasserfallmodell`;
- правильно называть Verantwortlichkeiten, Ereignisse, Artefakte и Commitments в `Scrum`;
- не приписывать Scrum роли и процессы, которых в официальном Scrum Framework нет;
- строить и читать `Projektstrukturplan`;
- отличать `PSP`, `Gantt-Diagramm` и `Netzplan`;
- рассчитывать `FAZ`, `FEZ`, `SAZ`, `SEZ`, `Gesamtpuffer` и `freier Puffer`;
- определять `kritischer Pfad` и оценивать последствия задержки.

---

## 2. Выбор Vorgehensmodell

`Vorgehensmodell` определяет, как организованы анализ, планирование, реализация, проверка и обратная связь.

Выбор зависит от:

- стабильности требований;
- технической и организационной неопределённости;
- стоимости поздних изменений;
- необходимости ранних промежуточных результатов;
- доступности заказчика и пользователей для обратной связи;
- требований к документации, безопасности и регулированию;
- размера и опыта команды.

Нет метода, который всегда лучше. На экзамене нужно связать выбор с условиями случая.

---

## 3. Wasserfallmodell

### 3.1 Принцип

`Wasserfallmodell` — преимущественно последовательный подход. Результат одной фазы служит основой следующей.

```text
Anforderungen
      ↓
Entwurf
      ↓
Implementierung
      ↓
Test
      ↓
Einführung und Betrieb
```

Названия и количество фаз могут отличаться. Важно понимать логику: сначала требования и проектирование, затем реализация и проверка.

### 3.2 Сильные стороны

- понятная последовательность и ответственность;
- подробное предварительное планирование;
- хорошо определённые документы и точки согласования;
- сроки и бюджет легче оценивать при стабильных требованиях;
- подходит, если изменения поздно обходятся особенно дорого.

### 3.3 Ограничения

- пользователи поздно получают работающее решение;
- ошибочные предположения могут обнаружиться только при тестировании;
- изменение утверждённых требований требует переработки планов и документов;
- при высокой неопределённости ранние оценки быстро устаревают;
- формальное завершение фазы не гарантирует правильности исходных требований.

### 3.4 Когда выбор можно обосновать

`Wasserfallmodell` подходит, если:

- требования известны, стабильны и проверяемы;
- технология хорошо изучена;
- результат должен пройти формальные согласования;
- заказчик не нуждается в частых промежуточных поставках;
- зависимости позволяют выполнить работу последовательно.

> Das Wasserfallmodell ist geeignet, weil die Anforderungen vollständig dokumentiert und während der Umsetzung voraussichtlich stabil sind.

---

## 4. Scrum

### 4.1 Основная идея

`Scrum` — лёгкий Framework для создания ценности при решении сложных задач. Работа выполняется `iterativ` и `inkrementell`.

- `iterativ`: подход и решение регулярно пересматриваются на основе опыта;
- `inkrementell`: продукт растёт пригодными к использованию частями;
- `empirisch`: решения принимаются на основе наблюдаемого результата.

Три Säulen der Empirie:

- `Transparenz` — состояние работы понятно участникам;
- `Überprüfung` — результат и прогресс регулярно проверяются;
- `Anpassung` — при отклонении способ работы или план изменяется.

Scrum опирается на ценности `Commitment, Fokus, Offenheit, Respekt und Mut`.

### 4.2 Scrum Team и Verantwortlichkeiten

В Scrum есть один `Scrum Team`, состоящий из:

| Verantwortlichkeit | Основная ответственность | Не следует путать |
|---|---|---|
| `Product Owner` | Максимизирует ценность продукта, формулирует и упорядочивает `Product Backlog`, обеспечивает прозрачность целей | Не комитет и не обычный секретарь требований |
| `Scrum Master` | Помогает правильно понимать и применять Scrum, устранять организационные препятствия и улучшать эффективность команды | Не начальник команды и не классический Projektleiter |
| `Developers` | Планируют работу Sprint, создают пригодный `Increment`, соблюдают `Definition of Done` и ежедневно адаптируют план | Это не только программисты; название относится ко всем создающим продукт |

`Product Owner` может делегировать отдельную работу, но остаётся ответственным за результат управления `Product Backlog`.

В официальном Scrum нет отдельной роли `Projektleiter`. Организация может иметь менеджеров вне Scrum Team, но их полномочия нельзя автоматически переносить внутрь Scrum.

### 4.3 Scrum Events

`Sprint` является контейнером для остальных событий. Его длительность — не более одного месяца; более короткие Sprints могут повысить частоту обратной связи.

| Ereignis | Назначение | Важное уточнение |
|---|---|---|
| `Sprint` | Создание ценного, пригодного Increment; работа для достижения `Sprint Goal` | Новый Sprint начинается сразу после предыдущего |
| `Sprint Planning` | Определить ценность Sprint, выбрать работу и спланировать её выполнение | Участвует весь Scrum Team |
| `Daily Scrum` | Developers проверяют прогресс к `Sprint Goal` и корректируют план | 15 минут; это не отчёт начальнику |
| `Sprint Review` | Вместе со Stakeholders проверить результат и адаптировать дальнейшее направление | Не только демонстрация и не Abnahmeprotokoll |
| `Sprint Retrospective` | Улучшить качество и эффективность совместной работы | Фокус на процессе, взаимодействии и методах |

Только `Product Owner` имеет право отменить Sprint, если `Sprint Goal` потеряла актуальность.

### 4.4 Artefakte и Commitments

| Artefakt | Содержание | Commitment |
|---|---|---|
| `Product Backlog` | Упорядоченный список необходимой работы над продуктом | `Product Goal` |
| `Sprint Backlog` | `Sprint Goal`, выбранные элементы Product Backlog и план их реализации | `Sprint Goal` |
| `Increment` | Конкретный шаг к Product Goal, соответствующий Definition of Done | `Definition of Done` |

Если работа не соответствует `Definition of Done`, она не считается частью пригодного Increment и не должна представляться как завершённая.

### 4.5 Когда Scrum можно обосновать

Scrum подходит, если:

- требования могут изменяться;
- заранее неизвестен лучший способ решения;
- нужна частая обратная связь пользователей;
- продукт можно создавать полезными частями;
- команда способна самостоятельно планировать выполнение работы.

> Scrum ist geeignet, weil die Anforderungen noch nicht vollständig feststehen und durch kurze Sprints regelmäßig nutzbare Ergebnisse sowie frühes Feedback entstehen.

### 4.6 Wasserfall и Scrum: сравнение

| Критерий | `Wasserfallmodell` | `Scrum` |
|---|---|---|
| Планирование | Значительная часть заранее | Постоянно уточняется |
| Требования | Желательно стабильные | Могут развиваться |
| Поставка результата | Часто ближе к завершению | Increment в каждом Sprint |
| Обратная связь | Реже и по фазам | Регулярно |
| Изменения | Формальный Änderungsprozess | Адаптация Product Backlog между Sprints |
| Управление работой | Фазовый проектный план | Самоуправляющийся Scrum Team |
| Подходящий контекст | Низкая неопределённость | Сложная задача и высокая неопределённость |

Даже при Scrum требования безопасности, защиты данных, бюджета и договоров не исчезают. Agile означает адаптивное управление, а не отсутствие планирования и документации.

---

## 5. Projektstrukturplan (PSP)

### 5.1 Назначение

`PSP` иерархически разбивает весь объём проекта на управляемые части. Он создаёт общую картину `Projektumfang` и основу для последующего планирования сроков, затрат, ресурсов и ответственности.

Нижний планируемый и контролируемый элемент — `Arbeitspaket`.

```text
Projekt: 20 Arbeitsplätze einrichten
├── 1 Planung
│   ├── 1.1 Anforderungen aufnehmen
│   └── 1.2 Lösung auswählen
├── 2 Beschaffung
│   ├── 2.1 Hardware bestellen
│   └── 2.2 Lizenzen beschaffen
├── 3 Umsetzung
│   ├── 3.1 Betriebssystem installieren
│   ├── 3.2 Software konfigurieren
│   └── 3.3 Domänenaufnahme
└── 4 Abschluss
    ├── 4.1 Systemtest
    └── 4.2 Einweisung und Abnahme
```

### 5.2 Варианты Gliederung

| Вид | Основа деления | Пример |
|---|---|---|
| `phasenorientiert` | Этапы проекта | Planung, Umsetzung, Test, Abschluss |
| `objektorientiert` | Части результата | Client, Server, Netzwerk, Dokumentation |
| `funktionsorientiert` | Виды деятельности | analysieren, beschaffen, installieren, testen |
| `gemischt` | Комбинация принципов | На верхнем уровне фазы, ниже объекты |

В пределах одного уровня следует по возможности применять один принцип деления, чтобы избежать пропусков и дублирования.

### 5.3 Требования к Arbeitspaket

Хорошее `Arbeitspaket` содержит:

- уникальный идентификатор;
- описание ожидаемого результата;
- ответственного;
- предполагаемые начало, окончание и длительность;
- трудозатраты и ресурсы;
- предшественников и зависимости;
- критерии завершения и приёмки.

Важно различать:

- `Dauer` — календарная продолжительность;
- `Aufwand` — объём труда, например 16 Personstunden.

Два сотрудника не всегда уменьшают Dauer вдвое: задача может быть неделимой, сотрудники требуют координации или зависят от одного ресурса.

---

## 6. Gantt-Diagramm

`Gantt-Diagramm` показывает задачи в виде полос на временной оси.

Обычно видны:

- начало и окончание;
- длительность;
- параллельность;
- последовательность;
- Milestones;
- иногда зависимости, прогресс и ресурсы.

Сильная сторона — наглядность календарного плана. Ограничение — при большом количестве задач логические зависимости и резервы могут быть менее понятны, чем в `Netzplan`.

`PSP` отвечает прежде всего: **что входит в проект?**  
`Gantt-Diagramm`: **когда выполняются задачи?**  
`Netzplan`: **какие зависимости, резервы и критический путь существуют?**

---

## 7. Netzplan

### 7.1 Основные обозначения

| Сокращение | Немецкий термин | Значение |
|---|---|---|
| `D` | `Dauer` | Продолжительность операции |
| `FAZ` | `frühester Anfangszeitpunkt` | Самое раннее возможное начало |
| `FEZ` | `frühester Endzeitpunkt` | Самое раннее возможное окончание |
| `SAZ` | `spätester Anfangszeitpunkt` | Самое позднее начало без задержки проекта |
| `SEZ` | `spätester Endzeitpunkt` | Самое позднее окончание без задержки проекта |
| `GP` | `Gesamtpuffer` | Максимальная задержка операции без сдвига проекта |
| `FP` | `freier Puffer` | Задержка без сдвига раннего начала непосредственного последователя |

В задачах обычно используется отсчёт от времени `0`. Если условие задаёт календарные даты или другой способ счёта, нужно следовать условию.

### 7.2 Vorwärtsrechnung

Для начальной операции:

```text
FAZ = 0
FEZ = FAZ + Dauer
```

Для операции с одним или несколькими предшественниками:

```text
FAZ = größter FEZ aller unmittelbaren Vorgänger
FEZ = FAZ + Dauer
```

Используется **наибольший** FEZ, потому что операция может начаться только после завершения всех обязательных предшественников.

### 7.3 Rückwärtsrechnung

Для конечной операции:

```text
SEZ = Projektdauer
SAZ = SEZ − Dauer
```

Для операции с одним или несколькими последователями:

```text
SEZ = kleinster SAZ aller unmittelbaren Nachfolger
SAZ = SEZ − Dauer
```

Используется **наименьший** SAZ, чтобы не задержать ни одного обязательного последователя.

### 7.4 Pufferzeiten

```text
Gesamtpuffer:
GP = SAZ − FAZ
GP = SEZ − FEZ

Freier Puffer:
FP = kleinster FAZ der unmittelbaren Nachfolger − FEZ
```

Для конечной операции свободный резерв в простых задачах можно рассчитать относительно срока завершения проекта.

Операции с `GP = 0` лежат на `kritischer Pfad`. Их задержка обычно сдвигает срок проекта, если её нельзя компенсировать другой мерой.

---

## 8. Полный пример Netzplan

### 8.1 Исходные данные

| Vorgang | Dauer | Unmittelbare Vorgänger |
|---|---:|---|
| A | 3 | – |
| B | 4 | A |
| C | 2 | A |
| D | 5 | B |
| E | 3 | B, C |
| F | 2 | D, E |

### 8.2 Vorwärtsrechnung

| Vorgang | Расчёт FAZ | FAZ | FEZ |
|---|---|---:|---:|
| A | Start | 0 | 3 |
| B | FEZ(A) | 3 | 7 |
| C | FEZ(A) | 3 | 5 |
| D | FEZ(B) | 7 | 12 |
| E | max(FEZ(B), FEZ(C)) = max(7, 5) | 7 | 10 |
| F | max(FEZ(D), FEZ(E)) = max(12, 10) | 12 | 14 |

`Projektdauer = 14 Zeiteinheiten`.

### 8.3 Rückwärtsrechnung

| Vorgang | Расчёт SEZ | SAZ | SEZ |
|---|---|---:|---:|
| F | Projektende | 12 | 14 |
| D | SAZ(F) | 7 | 12 |
| E | SAZ(F) | 9 | 12 |
| B | min(SAZ(D), SAZ(E)) = min(7, 9) | 3 | 7 |
| C | SAZ(E) | 7 | 9 |
| A | min(SAZ(B), SAZ(C)) = min(3, 7) | 0 | 3 |

### 8.4 Резервы и критический путь

| Vorgang | FAZ | FEZ | SAZ | SEZ | GP | FP |
|---|---:|---:|---:|---:|---:|---:|
| A | 0 | 3 | 0 | 3 | 0 | 0 |
| B | 3 | 7 | 3 | 7 | 0 | 0 |
| C | 3 | 5 | 7 | 9 | 4 | 2 |
| D | 7 | 12 | 7 | 12 | 0 | 0 |
| E | 7 | 10 | 9 | 12 | 2 | 2 |
| F | 12 | 14 | 12 | 14 | 0 | 0 |

`Kritischer Pfad: A → B → D → F`.

Почему у C `GP = 4`, но `FP = 2`:

- операция C может сдвинуться максимум на 4 единицы без изменения конца проекта;
- уже после 2 единиц задержки сдвинется раннее начало E;
- E сама имеет ещё 2 единицы общего резерва.

### 8.5 Проверка результата

- сумма длительностей критического пути: `3 + 4 + 5 + 2 = 14`;
- это совпадает с рассчитанной продолжительностью проекта;
- все операции критического пути имеют `GP = 0`.

---

## 9. Изменения и Steuerungsmaßnahmen

Если операция D задерживается на 2 единицы:

- D лежит на критическом пути;
- её `Gesamtpuffer = 0`;
- без компенсации F начнётся на 2 единицы позже;
- окончание проекта сдвинется с 14 до 16.

Возможные меры:

- проверить, можно ли выполнить часть работы параллельно — `Fast Tracking`;
- привлечь подходящие дополнительные ресурсы — `Crashing`;
- изменить объём или приоритеты;
- использовать техническую альтернативу;
- согласовать новый срок через `Änderungsprozess`.

Мера должна быть реалистичной. Добавление людей не помогает автоматически и может увеличить координационные затраты.

---

## 10. Prüfungsformulierungen

### Выбор Wasserfall

> Das Wasserfallmodell ist geeignet, weil die Anforderungen vollständig beschrieben, stabil und vor der Umsetzung formal freizugeben sind.

### Выбор Scrum

> Scrum ist geeignet, weil die Anforderungen noch nicht vollständig feststehen und regelmäßige Increments frühes Feedback der Anwender ermöglichen.

### Отличие инструментов

> Der Projektstrukturplan gliedert den vollständigen Projektumfang in Arbeitspakete. Das Gantt-Diagramm stellt deren zeitliche Lage dar. Der Netzplan zeigt zusätzlich logische Abhängigkeiten, Pufferzeiten und den kritischen Pfad.

### Критический путь

> Die Vorgänge A, B, D und F liegen auf dem kritischen Pfad, weil ihr Gesamtpuffer jeweils null beträgt. Eine Verzögerung dieser Vorgänge verschiebt ohne Gegenmaßnahme den Projektendtermin.

### Daily Scrum

> Das Daily Scrum dient den Developers zur Überprüfung des Fortschritts in Richtung Sprint Goal und zur Anpassung des Arbeitsplans. Es ist kein Statusbericht an einen Vorgesetzten.

---

## 11. Typische Prüfungsfallen

1. `Scrum Master` не является начальником команды.
2. `Product Owner` отвечает за ценность и Product Backlog, а не распределяет каждую техническую задачу.
3. `Daily Scrum` — не отчёт Projektleiter.
4. `Sprint Review` проверяет продукт и дальнейшее направление; `Sprint Retrospective` улучшает совместную работу.
5. `Increment` должно соответствовать `Definition of Done`.
6. `PSP` не показывает автоматически календарную последовательность.
7. В прямом проходе при нескольких предшественниках берётся **максимальный FEZ**.
8. В обратном проходе при нескольких последователях берётся **минимальный SAZ**.
9. `Gesamtpuffer` и `freier Puffer` — не одно и то же.
10. Критический путь может измениться после задержки или изменения длительностей.
11. Несколько критических путей возможны; это повышает риск задержки проекта.
12. `Aufwand` и `Dauer` нельзя считать синонимами.

---

## 12. Selbsttest

### A. Понимание

1. Назови два условия, при которых `Wasserfallmodell` можно обоснованно выбрать.
2. Чем отличаются `iterativ` и `inkrementell`?
3. Кто отвечает за упорядочивание `Product Backlog`?
4. Какой Commitment связан с `Increment`?
5. Чем `Sprint Review` отличается от `Sprint Retrospective`?
6. Какой вопрос прежде всего решает `PSP`, а какой — `Gantt-Diagramm`?

### B. Применение

Для проекта даны операции:

| Vorgang | Dauer | Vorgänger |
|---|---:|---|
| A | 2 | – |
| B | 5 | A |
| C | 4 | A |
| D | 3 | B, C |
| E | 2 | C |
| F | 1 | D, E |

7. Выполни прямой и обратный проход.
8. Рассчитай `GP` для каждой операции.
9. Определи критический путь и длительность проекта.
10. Оцени последствие задержки C на одну единицу.

<details>
<summary>Показать решения</summary>

1. Например: стабильные требования, знакомая технология, формальные точки согласования, низкая неопределённость.
2. `Iterativ` означает повторную проверку и улучшение подхода; `inkrementell` — добавление пригодных частей продукта.
3. `Product Owner`.
4. `Definition of Done`.
5. Review рассматривает результат продукта и адаптирует Product Backlog; Retrospective рассматривает и улучшает процесс работы Scrum Team.
6. PSP показывает, что входит в проект; Gantt показывает временное расположение задач.

Расчёт:

| Vorgang | FAZ | FEZ | SAZ | SEZ | GP |
|---|---:|---:|---:|---:|---:|
| A | 0 | 2 | 0 | 2 | 0 |
| B | 2 | 7 | 2 | 7 | 0 |
| C | 2 | 6 | 3 | 7 | 1 |
| D | 7 | 10 | 7 | 10 | 0 |
| E | 6 | 8 | 8 | 10 | 2 |
| F | 10 | 11 | 10 | 11 | 0 |

7. Значения приведены в таблице.
8. `GP`: A = 0, B = 0, C = 1, D = 0, E = 2, F = 0.
9. `Kritischer Pfad: A → B → D → F`; длительность 11 единиц.
10. C может задержаться на одну единицу без сдвига конца проекта, потому что `GP(C) = 1`. После этого её общий резерв будет исчерпан, а D сможет начаться как и прежде во время 7.

</details>

---

## 13. Quellen und Abgleich

- [The Scrum Guide, Ausgabe 2020](https://scrumguides.org/docs/scrumguide/v2020/2020-Scrum-Guide-German.pdf)
- [FIAusbV § 9](https://www.gesetze-im-internet.de/fiausbv/__9.html)
- [U-Form: Prüfungskatalog FIAE, gültig für AP1 ab Frühjahr 2025](https://www.u-form-shop.de/ihk-pruefungen/pruefungskataloge-abschlusspruefung/fachinformatiker-fachinformatikerin-anwendungsentwicklung-pruefungskatalog-fuer-die-ihk-abschlusspruefung-1)

Формулы Netzplan в этой главе используют Vorgangsknotennetz и начало отсчёта `0`. Если учебное задание применяет другую Konvention, нужно использовать заданную.

## 14. Offene Prüfpunkte für den Unterricht

- Какую графическую форму Netzplanknoten использует WBS?
- Начинается ли отсчёт в задачах преподавателя с `0` или с первого календарного дня?
- Требуется ли отдельно рассчитывать `freier Puffer` или только `Gesamtpuffer`?
- Использует ли преподаватель термин `Verantwortlichkeiten` из Scrum Guide или традиционное `Rollen`?
