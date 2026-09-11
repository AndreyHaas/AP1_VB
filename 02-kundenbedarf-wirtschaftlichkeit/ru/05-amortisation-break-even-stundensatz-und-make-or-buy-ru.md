---
pruefung: AP1
thema: Amortisation, Break-even, Stundensatz und Make-or-Buy
prioritaet: Vertiefung
status: Entwurf
stand: 2026-09-11
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/05-amortisation-break-even-stundensatz-und-make-or-buy-de.md
---

# AP1: Amortisation, Break-even, Stundensatz und Make-or-Buy

Экономический расчёт полезен только тогда, когда его формула отвечает на поставленный вопрос. `Amortisation` показывает время возврата вложений, `Break-even` — границу между убытком и прибылью, `Deckungsbeitrag` — вклад единицы в покрытие постоянных затрат, а `Stundensatz` — стоимость или цену одного продуктивного часа. Эти показатели нельзя взаимозаменять.

Главная идея:

> Сначала определяется вопрос решения, затем релевантные денежные потоки, период и единицы. После расчёта результат проверяется на допущения, ограничения, качество, риск и доступные ресурсы.

---

## 1. Lernziele

После изучения главы нужно уметь:

- различать `Umsatz`, `variable Kosten`, `Fixkosten`, `Deckungsbeitrag` и `Gewinn`;
- рассчитывать Stückdeckungsbeitrag и Gesamtdeckungsbeitrag;
- определять `Break-even-Menge` и `Break-even-Umsatz`;
- рассчитывать необходимое количество для заданной прибыли;
- интерпретировать Gewinnschwelle, а не только подставлять числа;
- выбирать правильный метод при нескольких продуктах или ограниченной мощности;
- сравнивать `Make` и `Buy` по релевантным затратам;
- учитывать качество, Know-how, Datenschutz, зависимость и мощность;
- различать `sunk costs`, релевантные и альтернативные затраты;
- объяснять цель и ограничения `Amortisationsrechnung`;
- рассчитывать статическую Amortisationsdauer при равномерном Rückfluss;
- определять окупаемость при неравномерных денежных потоках;
- не смешивать Gewinn, Abschreibung, Einsparung и Zahlungsüberschuss без основания;
- сравнивать Kauf, Miete и Leasing на одинаковом периоде;
- рассчитывать внутренний Kostenstundensatz и внешний Verrechnungssatz;
- определять реалистичные produktive Stunden;
- различать Gewinnzuschlag и Gewinnmarge;
- связывать результаты с TCO и Nutzwertanalyse из предыдущей главы;
- формулировать проверяемую рекомендацию с оговорками.

---

## 2. Prüfungsminimum — 15 Minuten

1. Deckungsbeitrag je Stück `= Preis − variable Stückkosten`.
2. Break-even-Menge `= Fixkosten / Stückdeckungsbeitrag`; необходимое нецелое Stückzahl округляется вверх.
3. Простая Amortisationsdauer `= Investition / равномерный Rückfluss`.
4. При неравномерных Rückflüsse периоды накапливаются.
5. Kostenstundensatz использует продуктивные verrechenbare Stunden, а не всё присутствие.
6. Gewinnzuschlag считается от Kosten, Gewinnmarge — от Erlös.
7. Make-or-Buy учитывает релевантные будущие Kosten, Kapazität, Qualität, Know-how, Risiko, Abhängigkeit.
8. Sunk Costs уже возникли и обычно не влияют на будущее решение.

> Die Fremdvergabe ist trotz höherer Stückkosten geeignet, wenn der interne Kapazitätsengpass sonst einen größeren entgangenen Deckungsbeitrag verursacht.

## 3. Экзаменационная рамка и статус Vertiefung

§ 9 `FIAusbV` требует выбирать аппаратное и программное обеспечение и инициировать закупку. `Ausbildungsrahmenplan` требует оценивать IT-системы по `Leistungsfähigkeit` и `Wirtschaftlichkeit`, получать и оценивать предложения и сравнивать условия.

Это надёжно обосновывает экономическую оценку решения. Однако из общей публичной формулировки нельзя вывести, что на каждой AP1 обязательно проверяются все методы этой главы.

Поэтому:

- `Amortisation`, `Break-even`, `Deckungsbeitrag` и `Stundensatz` изучаются как продвинутая расчётная подготовка;
- точную глубину нужно сверить с действующим `Prüfungskatalog` и WBS;
- методы особенно полезны для смешанных практических задач;
- они также создают основу для будущей проектной Wirtschaftlichkeitsbetrachtung;
- эта глава не переносит работу проекта в отдельный раздел AP2.

Глава 06 уже рассмотрела Bezugspreis, TCO и Nutzwertanalyse. Здесь не нужно заново считать Rabatt и Skonto, если они уже включены в исходную инвестицию.

---

## 4. Как выбрать правильный метод

| Entscheidungsfrage | Подходящий метод |
|---|---|
| Сколько общих затрат возникнет за три года? | TCO |
| Какая альтернатива лучше выполняет качественные критерии? | Nutzwertanalyse |
| При каком количестве исчезает убыток? | Break-even-Analyse |
| Какой вклад даёт одна проданная единица? | Stückdeckungsbeitrag |
| Через сколько лет вернутся вложения? | Amortisationsrechnung |
| Производить самим или покупать снаружи? | Make-or-Buy-Vergleich |
| Сколько должен стоить продуктивный час? | Stundensatzkalkulation |
| Какая прибыль относится к вложенному капиталу? | Rentabilitätsrechnung |

Неправильный метод может дать математически точное, но бесполезное число.

Пример:

> Сравнить трёхлетние общие затраты нельзя одной Amortisationsdauer. Она показывает скорость возврата инвестиции, но не полный объём затрат и не качественную пользу.

---

## 5. Обозначения и единицы

В задачах удобно заранее выписать обозначения:

| Zeichen | Bedeutung | Einheit |
|---|---|---|
| `p` | цена продажи за единицу | €/Stück |
| `k_v` | переменные затраты на единицу | €/Stück |
| `K_f` | постоянные затраты периода | €/Periode |
| `x` | количество | Stück/Periode |
| `U` | Umsatz | €/Periode |
| `DB` | Deckungsbeitrag | € |
| `G` | Gewinn | €/Periode |
| `I_0` | первоначальная инвестиция | € |
| `R` | ежегодный Rückfluss | €/Jahr |
| `t_A` | Amortisationsdauer | Jahre |
| `h_p` | produktive Stunden | h/Jahr |

Единицы должны относиться к одному периоду.

Нельзя складывать:

```text
monatliche Kosten + jährlicher Umsatz
```

пока значения не приведены к одному периоду.

---

## 6. Umsatz, Kosten и Gewinn

Для одного продукта:

```text
Umsatz U = Preis p × Menge x
Variable Gesamtkosten K_v = variable Stückkosten k_v × Menge x
Gesamtkosten K = Fixkosten K_f + variable Gesamtkosten K_v
Gewinn G = Umsatz U − Gesamtkosten K
```

То есть:

```text
G = p × x − (K_f + k_v × x)
```

Если `G < 0`, имеется Verlust. Если `G = 0`, достигнут Break-even. Если `G > 0`, имеется Gewinn.

Термин `Umsatz` не означает Gewinn: из выручки ещё нужно покрыть переменные и постоянные затраты.

---

## 7. Fixkosten и variable Kosten в модели

### Fixkosten

Не зависят от количества внутри рассматриваемого диапазона:

- аренда;
- годовой Basis-Support;
- фиксированная разработка;
- серверная Grundgebühr;
- амортизационные или капитальные затраты в модели периода.

### Variable Kosten

Изменяются с количеством:

- Material je Gerät;
- Lizenz je Benutzer;
- Versand je Einheit;
- Transaktionsgebühr;
- переменная рабочая нагрузка на заказ.

### Gültigkeitsbereich

Fixkosten являются постоянными только в релевантном диапазоне.

Пример:

> До 500 клиентов достаточно одного сервера. Начиная с 501 клиента нужен второй сервер. В точке 501 возникает Sprungfixkosten.

Линейная Break-even-формула без корректировки не отображает такой скачок.

---

## 8. Stückdeckungsbeitrag

`Stückdeckungsbeitrag` показывает, какая сумма после покрытия переменных затрат одной единицы остаётся для покрытия Fixkosten и затем прибыли.

```text
db = Verkaufspreis p − variable Stückkosten k_v
```

Пример:

```text
p = 1.200 €
k_v = 720 €
db = 1.200 € − 720 € = 480 € je Stück
```

Интерпретация:

> Каждое дополнительно проданное и выполненное устройство в рамках модели вносит 480 € в покрытие Fixkosten. После полного покрытия Fixkosten этот вклад увеличивает прибыль.

Если `db ≤ 0`, увеличение количества не покрывает Fixkosten в линейной модели. Тогда цена или переменные затраты требуют пересмотра.

---

## 9. Gesamtdeckungsbeitrag и Betriebsergebnis

```text
Gesamtdeckungsbeitrag DB = Stückdeckungsbeitrag db × Menge x
Betriebsergebnis G = Gesamtdeckungsbeitrag DB − Fixkosten K_f
```

Для 260 единиц:

```text
DB = 480 € × 260 = 124.800 €
G = 124.800 € − 96.000 € = 28.800 €
```

Проверка через полную формулу:

```text
U = 1.200 € × 260 = 312.000 €
K_v = 720 € × 260 = 187.200 €
G = 312.000 € − 187.200 € − 96.000 € = 28.800 €
```

Оба пути должны дать одинаковый результат.

---

## 10. Break-even-Point

`Break-even-Point`, `Gewinnschwelle` или `Kostendeckungspunkt` — количество или Umsatz, при котором:

```text
Umsatz = Gesamtkosten
Gewinn = 0
Gesamtdeckungsbeitrag = Fixkosten
```

Ниже Break-even линейная модель показывает Verlust. Выше — Gewinn.

Break-even не означает:

- возврат первоначальной инвестиции во времени;
- положительный денежный поток в каждый момент;
- высокую прибыль;
- наличие достаточной ликвидности;
- выполнение качественных требований.

Это граница результата за определённый период и для заданных допущений.

---

## 11. Break-even-Menge

Из условия `Gewinn = 0`:

```text
p × x − k_v × x − K_f = 0
(p − k_v) × x = K_f
x_BE = K_f / (p − k_v)
x_BE = K_f / db
```

Пример:

```text
K_f = 96.000 € pro Jahr
db = 480 € je Stück
x_BE = 96.000 € / 480 € = 200 Stück
```

Если результат составляет 200,2 единицы, физически обычно требуется округлить вверх:

```text
201 Stück
```

Округление вниз оставило бы предприятие ниже Gewinnschwelle.

---

## 12. Полный Break-even-Praxisfall

Компания конфигурирует и продаёт IT-Appliances.

Дано:

- Verkaufspreis: 1 200 € за штуку;
- variable Hardware-, Lizenz- и Rolloutkosten: 720 € за штуку;
- jährliche Fixkosten: 96 000 €;
- ожидаемое количество: 260 штук.

### 12. Stückdeckungsbeitrag

```text
db = 1.200 € − 720 € = 480 €
```

### 12. Break-even-Menge

```text
x_BE = 96.000 € / 480 € = 200 Stück
```

### 12. Ergebnis bei 260 Stück

```text
DB = 260 × 480 € = 124.800 €
G = 124.800 € − 96.000 € = 28.800 €
```

### 12. Sicherheitsabstand

```text
260 − 200 = 60 Stück
```

Количество может снизиться на 60 штук до достижения Gewinnschwelle.

В процентах от планового количества:

```text
60 / 260 × 100 % = 23,08 %
```

---

## 13. Absatzmenge для Zielgewinn

Если требуется определённая прибыль:

```text
x = (Fixkosten + Zielgewinn) / Stückdeckungsbeitrag
```

Для Zielgewinn 24 000 €:

```text
x = (96.000 € + 24.000 €) / 480 €
x = 120.000 € / 480 €
x = 250 Stück
```

Проверка:

```text
250 × 480 € − 96.000 € = 24.000 €
```

При дробном результате количество обычно округляется вверх, если продаются только целые единицы.

---

## 14. Break-even-Umsatz

`Deckungsbeitragsquote`:

```text
DB-Quote = Stückdeckungsbeitrag / Verkaufspreis
```

В примере:

```text
DB-Quote = 480 € / 1.200 € = 0,40 = 40 %
```

Break-even-Umsatz:

```text
U_BE = Fixkosten / DB-Quote
U_BE = 96.000 € / 0,40
U_BE = 240.000 €
```

Проверка:

```text
200 Stück × 1.200 € = 240.000 €
```

При расчёте Quote нельзя использовать Prozentzahl 40 вместо Dezimalzahl 0,40.

---

## 15. Графическая интерпретация

В классической диаграмме:

- x-Achse: Absatzmenge;
- y-Achse: Kosten и Erlöse;
- Fixkostenlinie: горизонтальная;
- Gesamtkostenlinie: начинается с Fixkosten и растёт на `k_v` за единицу;
- Umsatzlinie: начинается в нуле и растёт на `p` за единицу;
- пересечение Umsatz- и Gesamtkostenlinie: Break-even.

До пересечения:

```text
Gesamtkosten > Umsatz
```

После пересечения:

```text
Umsatz > Gesamtkosten
```

Если `p ≤ k_v`, Umsatzlinie не может устойчиво обогнать Gesamtkostenlinie в простой линейной модели.

---

## 16. Предпосылки простой Break-even-Analyse

Простая модель предполагает:

- постоянную цену за единицу;
- постоянные переменные затраты на единицу;
- неизменные Fixkosten;
- произведённое количество равно проданному;
- один продукт или постоянную структуру ассортимента;
- отсутствие ограничений мощности до рассматриваемого количества;
- один общий период;
- достаточно надёжный прогноз Absatz.

В реальности возможны:

- Mengenrabatte;
- Überstundenzuschläge;
- Sprungfixkosten;
- изменение цены;
- возвраты;
- сезонность;
- несколько тарифов;
- ограниченная мощность.

Следовательно, результат нужно называть результатом модели, а не гарантией.

---

## 17. Несколько продуктов

Если компания продаёт несколько продуктов с разными Deckungsbeiträgen, простой расчёт:

```text
Fixkosten / Deckungsbeitrag одного продукта
```

не описывает общий Break-even.

Возможны:

- отдельный расчёт по продуктам, если их Fixkosten разделимы;
- использование взвешенного среднего Deckungsbeitrag при стабильном Absatzmix;
- программная Szenarioanalyse;
- оптимизация по ограничивающему фактору.

Пример Absatzmix:

> На две Basic-Lizenzen приходится одна Premium-Lizenz.

Тогда можно сформировать «пакет» 2:1 и рассчитывать Deckungsbeitrag этого пакета. Если Mix меняется, меняется и Break-even.

---

## 18. Ограничивающий фактор

Если ограничен ресурс, нужно сравнивать не только DB je Stück, но и DB je Engpasseinheit.

```text
relativer Deckungsbeitrag =
Stückdeckungsbeitrag / benötigte Engpasseinheiten
```

Пример:

| Leistung | db je Auftrag | Adminzeit | db je Adminstunde |
|---|---:|---:|---:|
| Standard-Rollout | 300 € | 5 h | 60 €/h |
| Spezial-Rollout | 420 € | 10 h | 42 €/h |

При дефиците Adminzeit стандартный Rollout создаёт больший вклад на час, хотя DB je Auftrag у Spezial-Rollout выше.

Нельзя применять этот приоритет, если существуют договорные обязательства, стратегические цели или другие ограничения, которые задача требует учитывать.

---

## 19. Make-or-Buy: основной вопрос

`Make-or-Buy` сравнивает:

- `Make`: Eigenfertigung, Eigenentwicklung или собственная эксплуатация;
- `Buy`: Fremdbezug продукта или услуги.

Примеры в IT:

- собственная разработка приложения или SaaS;
- собственный Helpdesk или Managed Service;
- локальная Infrastruktur или Cloud-Service;
- внутренний Rollout или Dienstleister;
- собственная Backup-Plattform или внешний сервис.

Это не только ценовой вопрос. Решение затрагивает:

- стратегическое Know-how;
- контроль;
- Datenschutz;
- Informationssicherheit;
- Skalierbarkeit;
- время;
- качество;
- зависимость;
- обратимость;
- доступную мощность.

---

## 20. Make-or-Buy-Kostenvergleich

Пример:

### Make

```text
K_Make(x) = 8.000 € + 65 € × x
```

Где 8 000 € — разовая Einrichtung/Tooling, 65 €/h — релевантные переменные внутренние затраты.

### Buy

```text
K_Buy(x) = 105 € × x
```

Точка безразличия:

```text
8.000 € + 65 €x = 105 €x
8.000 € = 40 €x
x = 200 Stunden
```

Результат:

- ниже 200 часов Buy дешевле;
- при 200 часах затраты равны;
- выше 200 часов Make дешевле;
- это верно только в заданном диапазоне и при достаточной внутренней мощности.

---

## 21. Make-or-Buy при 320 часах

```text
K_Make(320) = 8.000 € + 65 € × 320
K_Make(320) = 28.800 €

K_Buy(320) = 105 € × 320
K_Buy(320) = 33.600 €

Differenz = 33.600 € − 28.800 € = 4.800 €
```

Чисто по релевантным затратам Make дешевле на 4 800 €.

Полное обоснование:

> Bei einem Umfang von 320 Stunden verursacht Make nach dem vorgegebenen Modell Kosten von 28.800 €, während Buy 33.600 € kostet. Make ist damit rechnerisch um 4.800 € günstiger. Die Eigenleistung ist jedoch nur vorzuziehen, wenn die erforderliche Kapazität, Kompetenz und termingerechte Umsetzung intern gesichert sind und keine höherwertige alternative Verwendung der Ressourcen verdrängt wird.

---

## 22. Релевантные затраты и sunk costs

Для решения учитываются затраты, которые различаются между альтернативами и возникают в будущем из-за решения.

### Entscheidungsrelevante Kosten

- дополнительные Personalkosten;
- новая лицензия;
- внешняя цена;
- предотвращаемая Wartung;
- дополнительные инфраструктурные затраты;
- реально высвобождаемые ресурсы.

### Sunk Costs

`Sunk Costs` уже возникли и не меняются из-за текущего решения.

Пример:

> 12 000 € уже потрачены на отменённый прототип. Эта сумма не должна автоматически заставлять продолжать невыгодное решение.

### Осторожно с Fixkosten

Если зарплата сотрудника продолжает выплачиваться в обоих вариантах и свободное время нельзя использовать иначе, она может не изменять краткосрочный денежный выбор. Но для долгосрочной Vollkostenrechnung, Capacity Planning или ценообразования персональные затраты могут быть релевантны.

Нужно назвать перспективу и горизонт.

---

## 23. Opportunitätskosten

`Opportunitätskosten` — упущенная выгода лучшей отвергнутой альтернативы.

Пример:

- внутренняя команда может выполнить миграцию;
- тогда она не выпустит оплачиваемую функцию;
- упущенный Deckungsbeitrag функции составляет 9 000 €.

Даже если прямые внутренние выплаты не меняются, занятая мощность имеет экономическую ценность.

В учебной задаче Opportunitätskosten учитываются, если:

- они заданы;
- их можно обоснованно определить;
- требуется экономическое, а не только бухгалтерское решение.

Не следует придумывать произвольный Betrag без данных.

---

## 24. Качественные Make-or-Buy-Kriterien

| Kriterium | Frage |
|---|---|
| Kernkompetenz | Нужно ли сохранить знание внутри? |
| Kapazität | Есть ли реальные свободные специалисты? |
| Termin | Какая альтернатива надёжно соблюдает срок? |
| Qualität | Кто обеспечивает требуемый уровень и доказательства? |
| Datenschutz | Может ли внешний поставщик законно и безопасно обрабатывать данные? |
| IT-Sicherheit | Как контролируются доступы, секреты и Lieferkette? |
| Abhängigkeit | Возникает ли Vendor Lock-in? |
| Skalierung | Какая альтернатива адаптируется к объёму? |
| Reversibilität | Можно ли сменить решение и экспортировать данные? |
| Haftung/SLA | Какие договорные гарантии и реакции на сбой существуют? |

Цена может быть частью TCO, а качественные критерии — частью Nutzwertanalyse. Итоговое решение объединяет методы, но не смешивает единицы.

---

## 25. Amortisation: смысл

`Amortisationsdauer` показывает время, за которое первоначальная инвестиция покрывается связанными с ней Rückflüsse.

Главный вопрос:

> Через какой период накопленный возврат сравняется с первоначальным вложением?

Чем короче срок:

- тем раньше возвращается капитал;
- тем меньше период неопределённости;
- но не обязательно тем выше общая прибыль или Nutzen.

Amortisation не равна:

- Break-even-Menge;
- TCO;
- Rentabilität;
- сроку бухгалтерской Abschreibung;
- техническому сроку жизни.

---

## 26. Статическая Amortisationsformel

При равномерном ежегодном Rückfluss:

```text
Amortisationsdauer t_A =
Anfangsinvestition I_0 / jährlicher Rückfluss R
```

Если задача задаёт jährliche Einsparung и zusätzliche Betriebskosten:

```text
R = jährliche Einsparung − zusätzliche jährliche Auszahlungen
```

Пример:

```text
I_0 = 48.000 €
jährliche Einsparung = 22.000 €
zusätzliche Betriebsauszahlungen = 6.000 €
R = 16.000 € pro Jahr
t_A = 48.000 € / 16.000 € = 3 Jahre
```

Ответ:

> Die Investition amortisiert sich unter den angegebenen konstanten Annahmen nach drei Jahren.

---

## 27. Rückfluss, Gewinn, Einsparung и Abschreibung

Здесь часто встречается главная ошибка.

В зависимости от учебной схемы:

```text
Rückfluss = Gewinn + Abschreibung
```

может использоваться, если дан бухгалтерский Gewinn после Abschreibung и требуется приблизить денежный Rückfluss.

Для проекта экономии может быть задано:

```text
Rückfluss = vermiedene Auszahlungen − zusätzliche Auszahlungen
```

Нельзя автоматически:

- делить инвестицию на Umsatz;
- считать весь Gewinn денежным потоком;
- одновременно включать Kaufpreis и Abschreibung как два оттока;
- заменять заданный Rückfluss словом Einsparung;
- добавлять Abschreibung, если задача уже дала cashflow.

Правило:

> Сначала определить, что именно означает каждая заданная величина в условии.

---

## 28. Полный Amortisations-Praxisfall

Компания рассматривает автоматизацию обработки Tickets.

Дано:

- Einführung и Lizenzerwerb: 48 000 €;
- экономия рабочего времени: 1 100 часов в год;
- релевантная стоимость часа: 20 €;
- дополнительный Betrieb и Support: 6 000 € в год;
- равномерный эффект;
- временная стоимость денег не учитывается.

### 28. Bruttoeinsparung

```text
1.100 h × 20 €/h = 22.000 € pro Jahr
```

### 28. Netto-Rückfluss

```text
22.000 € − 6.000 € = 16.000 € pro Jahr
```

### 28. Amortisationsdauer

```text
48.000 € / 16.000 € = 3 Jahre
```

### 28. Интерпретация

Результат действителен, только если:

- 1 100 часов действительно экономятся;
- высвобождённое время создаёт экономическую пользу;
- ставка 20 €/h релевантна;
- Betriebskosten не растут;
- система используется достаточно долго;
- крупные последующие инвестиции отсутствуют.

---

## 29. Неравномерные Rückflüsse

Если ежегодные Rückflüsse различаются, простое деление на среднее может скрыть временную структуру. Используется кумуляция.

Пример:

| Jahr | Rückfluss | kumuliert |
|---:|---:|---:|
| 0 | −65 000 € | −65 000 € |
| 1 | +18 000 € | −47 000 € |
| 2 | +24 000 € | −23 000 € |
| 3 | +28 000 € | +5 000 € |
| 4 | +16 000 € | +21 000 € |

Окупаемость наступает в третьем году.

До начала третьего года остаётся:

```text
65.000 € − 18.000 € − 24.000 € = 23.000 €
```

Если Rückfluss третьего года распределяется равномерно:

```text
23.000 € / 28.000 € = 0,8214 Jahre
t_A ≈ 2,82 Jahre
```

Интерполяция внутри года — допущение. Если платежи поступают только в конце года, нельзя утверждать, что инвестиция окупилась через 2,82 года.

---

## 30. Grenzen der Amortisationsrechnung

Простая статическая Amortisationsrechnung:

- игнорирует денежные потоки после окупаемости;
- обычно не учитывает Zeitwert des Geldes;
- не измеряет общую прибыль;
- не оценивает качество;
- зависит от прогноза Rückflüsse;
- может стимулировать слишком короткий горизонт;
- не заменяет анализ рисков;
- не доказывает наличие ликвидности.

Пример:

- Projekt A окупается за 2 года и затем приносит мало;
- Projekt B окупается за 3 года и затем создаёт значительно больше выгоды.

По одной Amortisationsdauer A выглядит лучше, но в полном жизненном цикле B может быть выгоднее.

---

## 31. Rentabilität и ROI

Упрощённая формула:

```text
Rentabilität = Gewinn / eingesetztes Kapital × 100 %
```

Пример:

```text
durchschnittlicher Jahresgewinn = 12.000 €
eingesetztes Kapital = 48.000 €
Rentabilität = 12.000 € / 48.000 € × 100 % = 25 %
```

Но возможны разные базы:

- Anfangskapital;
- durchschnittlich gebundenes Kapital;
- Gesamtkapital;
- Eigenkapital;
- Investmentkosten;
- definierter ROI.

Если задача задаёт формулу, её нужно применять. Если нет — базу следует назвать.

Rentabilität 25 % не означает окупаемость ровно четыре года, если Gewinn и Rückfluss определены по-разному.

---

## 32. Kauf, Miete и Leasing

### Kauf

- покупатель обычно получает собственность;
- высокий начальный Geldabfluss;
- возможен Restwert;
- риск устаревания и утилизации лежит у владельца;
- свобода использования зависит от лицензий и договора.

### Miete

- временное использование за плату;
- собственность обычно остаётся у арендодателя;
- возможна более высокая гибкость;
- обслуживание может быть включено;
- длительное использование может оказаться дороже.

### Leasing

- долгосрочное предоставление пользования на договорных условиях;
- возможны Sonderzahlung, Laufzeit, Raten и Rückgabebedingungen;
- собственность не переходит автоматически;
- последствия зависят от конкретного договора;
- досрочный выход может быть ограничен или дорог.

Нельзя утверждать, что Leasing всегда дешевле, всегда выгоднее по налогам или всегда заканчивается покупкой.

---

## 33. Сравнение Kauf, Miete и Leasing

Сравнивается одинаковый период — 36 месяцев — и одинаковая Leistungsanforderung. Все суммы Netto, Zeitwert des Geldes не учитывается.

### Kauf

```text
Kaufpreis                 36.000 €
Einrichtung                2.000 €
Wartung 3 × 2.400 €        7.200 €
Restwert                  −6.000 €
Gesamtkosten              39.200 €
```

### Miete

```text
Bereitstellung               800 €
36 × 1.150 €              41.400 €
Rückgabe                     500 €
Gesamtkosten              42.700 €
```

### Leasing

```text
Sonderzahlung              3.000 €
36 × 950 €                34.200 €
Wartung 3 × 1.200 €        3.600 €
Rückgabe                     600 €
Gesamtkosten              41.400 €
```

В этой упрощённой модели Kauf дешевле:

- на 2 200 € по сравнению с Leasing;
- на 3 500 € по сравнению с Miete.

Но решение также зависит от ликвидности, риска устаревания, гибкости, Serviceumfang и надёжности Restwert.

---

## 34. Ловушки Kauf/Miete/Leasing

Для корректного сравнения нужно проверить:

- одинаковый Zeitraum;
- одинаковое количество и качество;
- включённые услуги;
- Wartung и Versicherung;
- Sonderzahlungen;
- Gebühren;
- Liefer- и Rückgabekosten;
- Restwert или Kaufoption;
- Kilometer-, Nutzungs- или Schadensregeln;
- Vertragsbindung;
- Kündigung;
- налоговую и бухгалтерскую трактовку;
- Zeitwert des Geldes;
- Netto-/Brutto-Basis.

В AP1 обычно достаточно расчёта по данным задачи и качественного сравнения. Для реального договора необходимы профессиональная правовая и налоговая проверка.

---

## 35. Что такое Stundensatz

Термин может означать разные величины.

### Kostenstundensatz

Внутренняя стоимость продуктивного часа:

```text
Kostenstundensatz =
relevante Jahreskosten / produktive Stunden
```

### Verrechnungssatz

Ставка, по которой время внутренне распределяется между Cost Center или проектами.

### Angebotspreis или externer Stundensatz

Цена, выставляемая клиенту. Она может включать:

- Selbstkosten;
- Risiko;
- Gewinn;
- рыночную корректировку;
- иногда Umsatzsteuer.

Поэтому «час сотрудника стоит 30 €» без определения неполно.

---

## 36. Полные Personalkosten

Bruttogehalt — только часть затрат работодателя.

В модель могут входить:

- Bruttolohn или Bruttogehalt;
- Arbeitgeberanteile;
- Sonderzahlungen;
- Urlaubsgeld;
- Weiterbildung;
- Recruiting;
- Arbeitsplatz;
- Hardware и Software;
- Verwaltung;
- Führung;
- Büro;
- Versicherung;
- Ausfallzeiten.

Какие статьи включать, зависит от цели:

- краткосрочный Entscheidungsvergleich;
- долгосрочная Vollkostenrechnung;
- внутренний Verrechnungssatz;
- внешний Angebotspreis.

Нельзя добавлять один Gemeinkostenblock дважды.

---

## 37. Produktive Stunden

Оплачиваемое рабочее время не равно фактически рассчитываемому клиенту времени.

Из возможных Arbeitstagen вычитаются:

- Urlaub;
- Feiertage, если они ещё не исключены;
- Krankheit как плановое допущение;
- Weiterbildung;
- interne Meetings;
- Administration;
- Vertrieb;
- Angebotsarbeit;
- Zeiten ohne Auftrag;
- technische Störungen.

Пример:

```text
250 mögliche Arbeitstage
− 30 Urlaubstage
− 15 Tage Krankheit und Weiterbildung
− 25 Tage interne Aufgaben und Vertrieb
= 180 produktive Tage

180 Tage × 7,5 h = 1.350 produktive Stunden
```

Каждый вычет должен соответствовать условию. Нельзя дважды вычесть Feiertage, если 250 дней уже определены без них.

---

## 38. Полный Kostenstundensatz

Годовые затраты:

| Kostenblock | Betrag |
|---|---:|
| Personalkosten | 72 000 € |
| Arbeitsplatz, Hardware, Software | 18 000 € |
| anteilige Verwaltung und Gemeinkosten | 31 500 € |
| **relevante Jahreskosten** | **121 500 €** |

Produktive Stunden:

```text
1.350 h pro Jahr
```

Kostenstundensatz:

```text
121.500 € / 1.350 h = 90,00 €/h
```

Интерпретация:

> Каждый продуктивный час должен в среднем покрывать 90 € релевантных затрат, прежде чем будет учтена прибыль.

Это средняя ставка модели, а не обязательно дополнительный денежный отток каждого отдельного часа.

---

## 39. Gewinnzuschlag и Gewinnmarge

### Gewinnzuschlag auf Selbstkosten

15 % Zuschlag на Kostenstundensatz 90 €:

```text
Angebotspreis = 90 € × 1,15 = 103,50 €/h
```

Gewinn:

```text
103,50 € − 90,00 € = 13,50 €
```

13,50 € составляют 15 % от Selbstkosten.

### Gewinnmarge vom Umsatz

Если прибыль должна составлять 15 % от Verkaufspreis:

```text
Preis = Selbstkosten / (1 − Marge)
Preis = 90 € / 0,85
Preis = 105,88 €/h
```

Здесь:

```text
105,88 € − 90,00 € = 15,88 €
15,88 € / 105,88 € ≈ 15 %
```

Zuschlag и Marge дают разные результаты. Условие задачи определяет метод.

---

## 40. Externer Stundensatz и Umsatzsteuer

Если требуется цена для клиента:

```text
Netto-Angebotspreis
+ Umsatzsteuer
= Brutto-Rechnungsbetrag
```

При 103,50 €/h Netto и 19 %:

```text
103,50 € × 1,19 = 123,165 €
≈ 123,17 € brutto
```

Но Umsatzsteuer:

- не является Gewinn;
- не покрывает внутренние Kosten;
- обычно отдельно указывается;
- применяется по ставке и правилам задачи.

В Wirtschaftlichkeitsvergleich предприятия с Vorsteuerabzug часто используют Netto. В счёте для конечного потребителя может быть важен Brutto.

---

## 41. Auslastung и чувствительность Stundensatz

При одинаковых годовых затратах 121 500 €:

| Produktive Stunden | Kostenstundensatz |
|---:|---:|
| 1 500 h | 81,00 €/h |
| 1 350 h | 90,00 €/h |
| 1 200 h | 101,25 €/h |

Чем меньше продуктивных часов, тем больше затрат должен покрыть один час.

Это показывает риск:

- слишком оптимистично запланированная Auslastung делает ставку заниженной;
- слишком низкая ставка не покрывает Jahreskosten;
- слишком высокая ставка может быть неконкурентной.

Sensitivitätsanalyse должна проверять минимум базовый, оптимистичный и осторожный сценарии.

---

## 42. Связь Stundensatz и Make-or-Buy

В Make-or-Buy нельзя автоматически сравнивать:

```text
Bruttogehalt je Stunde
mit
externem Verkaufspreis je Stunde
```

Нужно определить:

- релевантный внутренний Grenzkostensatz;
- Vollkostenstundensatz;
- доступную мощность;
- Opportunitätskosten;
- включённые услуги внешнего поставщика;
- риск и Qualität.

Краткосрочное решение при свободной мощности может использовать дополнительные релевантные затраты. Долгосрочное стратегическое решение обычно требует полных затрат и Capacity-Effekt.

Хороший ответ называет выбранную перспективу.

---

## 43. Связь методов

| Methode | Что измеряет | Чего не доказывает |
|---|---|---|
| Bezugspreis | стоимость получения | эксплуатационные затраты |
| TCO | затраты жизненного цикла | качественную пользу |
| Nutzwertanalyse | балльную полезность | доступность бюджета |
| Deckungsbeitrag | вклад в Fixkosten/Gewinn | возврат инвестиции во времени |
| Break-even | количество/выручку при Gewinn = 0 | полную прибыль жизненного цикла |
| Amortisation | время возврата инвестиции | общую выгодность после окупаемости |
| Rentabilität | результат относительно капитала | ликвидность |
| Stundensatz | стоимость или цену часа | доступную мощность и качество |

Продвинутое решение может использовать несколько методов последовательно, но каждый результат остаётся отдельным.

---

## 44. Полный интегрированный Praxisfall

Компания решает, выполнять ли 320 часов миграции самостоятельно или заказать услугу.

### Make

- Einrichtung: 8 000 €;
- релевантная ставка: 65 €/h;
- предполагаемый Umfang: 320 h;
- доступная внутренняя мощность: предварительно подтверждена.

### Buy

- 105 €/h;
- Einrichtung включена;
- SLA и Datenschutzvertrag ещё проверяются.

### Kostenrechnung

```text
Make = 8.000 € + 320 × 65 € = 28.800 €
Buy = 320 × 105 € = 33.600 €
Vorteil Make = 4.800 €
```

### Indifferenzpunkt

```text
8.000 € / (105 € − 65 €) = 200 h
```

### Entscheidung

При 320 часах Make имеет количественное преимущество. Но рекомендация требует подтвердить:

- что ставка 65 €/h действительно включает релевантные затраты;
- что команда не вытесняет более ценную работу;
- что срок и качество достижимы;
- что внутренняя компетенция достаточна;
- что Buy не содержит дополнительных включённых преимуществ, меняющих сравнение;
- что риски безопасности обеих альтернатив приемлемы.

---

## 45. Prüfungsalgorithmus

1. Определи искомую величину.
2. Выпиши данные с единицами.
3. Приведи всё к одному периоду.
4. Раздели Fixkosten и variable Kosten.
5. Вычисли Stückdeckungsbeitrag.
6. Для Break-even раздели Fixkosten на db.
7. Для Zielgewinn прибавь его к Fixkosten.
8. Для Amortisation используй релевантный Rückfluss, а не автоматически Umsatz.
9. При неравномерных Rückflüsse используй кумуляцию.
10. Для Stundensatz используй produktive, а не просто оплачиваемые часы.
11. Различай Zuschlag и Marge.
12. Для Make-or-Buy сравни одинаковый Umfang и релевантные затраты.
13. Проверь мощность, качество и риски.
14. Округляй количество вверх, если нужна целая единица.
15. Закончи ответ интерпретацией и условием применимости.

---

## 46. Typische Prüfungsformulierungen

### Deckungsbeitrag

> Berechnen Sie den Stückdeckungsbeitrag und erläutern Sie seine Bedeutung.

### Break-even

> Ermitteln Sie die Absatzmenge, ab der das Produkt kostendeckend angeboten werden kann.

### Zielgewinn

> Berechnen Sie die erforderliche Absatzmenge, um einen Jahresgewinn von 24.000 € zu erzielen.

### Amortisation

> Berechnen Sie die statische Amortisationsdauer der Investition und nennen Sie zwei Grenzen des Verfahrens.

### Make-or-Buy

> Ermitteln Sie den kritischen Beschäftigungsumfang und begründen Sie die Entscheidung bei 320 Stunden.

### Stundensatz

> Berechnen Sie auf Basis der produktiven Jahresstunden den kostendeckenden Stundensatz.

### Kauf/Miete/Leasing

> Vergleichen Sie die drei Finanzierungs- beziehungsweise Nutzungsalternativen über den vorgegebenen Zeitraum.

---

## 47. Typische Prüfungsfallen

1. Umsatz mit Gewinn gleichsetzen.
2. Fixkosten je Stück ohne Bezugsmenge angeben.
3. Deckungsbeitrag mit Gewinn verwechseln.
4. Break-even berechnen, obwohl db negativ ist.
5. Monats- und Jahreswerte mischen.
6. Beim Zielgewinn den Zielbetrag nicht zu Fixkosten addieren.
7. Eine Stückzahl mit Nachkommastellen abrunden.
8. Bei 40 % Quote durch 40 statt durch 0,40 teilen.
9. Mehrproduktfall wie einen Einproduktfall behandeln.
10. Sprungfixkosten ignorieren.
11. Kapazitätsengpass nicht berücksichtigen.
12. Gesamten internen Vollkostensatz als kurzfristigen Geldabfluss interpretieren.
13. Bruttogehalt mit externem Stundensatz vergleichen.
14. Sunk Costs als Begründung für Fortsetzung verwenden.
15. Opportunitätskosten ohne Daten erfinden.
16. Amortisation mit Break-even-Menge verwechseln.
17. Investition durch Umsatz statt Rückfluss teilen.
18. Gewinn, Einsparung и Rückfluss ungeprüft austauschen.
19. Abschreibung doppelt berücksichtigen.
20. Ungleichmäßige Rückflüsse mit einfachem Durchschnitt verschleiern.
21. Teiljahr interpolieren, obwohl Cashflow erst am Jahresende kommt.
22. Schnelle Amortisation automatisch mit höchstem Gewinn gleichsetzen.
23. Kauf, Miete und Leasing über unterschiedliche Zeiträume vergleichen.
24. Restwert vergessen oder doppelt abziehen.
25. Beim Leasing einen Eigentumsübergang unterstellen.
26. In produktiven Stunden Urlaub und Ausfall nicht berücksichtigen.
27. Feiertage doppelt abziehen.
28. Gewinnzuschlag и Gewinnmarge verwechseln.
29. Umsatzsteuer als Gewinn behandeln.
30. Ergebnis ohne Einheit oder Zeitraum nennen.
31. Rechenergebnis ohne qualitative Entscheidung verwenden.
32. Eine Vertiefungsmethode als garantiertes AP1-Thema ausgeben.

---

## 48. Selbsttest

### A. Begriffe und Verständnis

1. Объясни различие Umsatz и Gewinn.
2. Что показывает Stückdeckungsbeitrag?
3. Когда Gesamtdeckungsbeitrag равен Fixkosten?
4. Что означает Break-even?
5. Чем Break-even отличается от Amortisation?
6. Назови четыре предпосылки простой Break-even-модели.
7. Что такое Sprungfixkosten?
8. Когда используется relativer Deckungsbeitrag?
9. Что сравнивает Make-or-Buy?
10. Что такое sunk costs?
11. Что такое Opportunitätskosten?
12. Что показывает Amortisationsdauer?
13. Назови три ограничения статической Amortisationsrechnung.
14. Чем Kauf принципиально отличается от Miete?
15. Почему Leasing нельзя автоматически считать покупкой в рассрочку?
16. Что означает produktive Stunden?
17. Чем Kostenstundensatz отличается от внешнего Angebotspreis?
18. Объясни различие Gewinnzuschlag и Gewinnmarge.

### B. Berechnen

19. Цена продукта 1 200 €, переменные затраты 720 €. Рассчитай db.
20. Fixkosten составляют 96 000 €. Рассчитай Break-even-Menge.
21. Рассчитай Gewinn при 260 единицах.
22. Рассчитай необходимое количество для Zielgewinn 24 000 €.
23. Рассчитай DB-Quote и Break-even-Umsatz.
24. План — 260 единиц, Break-even — 200. Рассчитай Sicherheitsabstand в единицах и процентах.
25. Make: 8 000 € + 65 €/h; Buy: 105 €/h. Рассчитай Indifferenzpunkt.
26. Рассчитай Make- и Buy-Kosten при 320 часах.
27. Инвестиция 48 000 €, jährliche Einsparung 22 000 €, дополнительные выплаты 6 000 €. Рассчитай Amortisationsdauer.
28. Инвестиция 65 000 €, Rückflüsse 18 000 €, 24 000 €, 28 000 €, 16 000 €. Определи год окупаемости и интерполированное время.
29. Jahreskosten 121 500 €, produktive Stunden 1 350. Рассчитай Kostenstundensatz.
30. Добавь 15 % Gewinnzuschlag.
31. Рассчитай цену при Gewinnmarge 15 %.
32. Рассчитай Brutto для 103,50 € Netto при 19 %.

### C. Anwenden und begründen

33. Объясни, почему быстрый Rückfluss не доказывает низкие TCO.
34. Почему нельзя считать 1 100 сэкономленных часов реальной Einsparung без дополнительного вопроса?
35. Назови четыре качественных Make-or-Buy-Kriterien.
36. Когда при 320 часах Buy всё равно может быть предпочтительнее?
37. Почему при дефиците ресурса DB je Engpassstunde может быть важнее DB je Auftrag?
38. Назови пять статей для сравнения Kauf, Miete и Leasing.
39. Почему 1 800 оплачиваемых часов нельзя автоматически использовать как produktive Stunden?
40. Сформулируй немецкую рекомендацию по Make-or-Buy-Praxisfall.

<details>
<summary>Lösungen anzeigen</summary>

1. Umsatz — цена, умноженная на проданное количество. Gewinn остаётся после вычета переменных и постоянных затрат.
2. Сумму на единицу, остающуюся после переменных затрат для покрытия Fixkosten и затем прибыли.
3. В Break-even, когда Gewinn равен нулю.
4. Количество или Umsatz, при котором Umsatz равен Gesamtkosten и Gewinn равен нулю.
5. Break-even относится к результату при определённом количестве/выручке за период. Amortisation относится ко времени возврата первоначальной инвестиции.
6. Например: постоянные p и k_v, неизменные Fixkosten, один продукт или стабильный Mix, производство равно продажам, отсутствие Engpass.
7. Постоянные затраты, которые скачкообразно увеличиваются при превышении определённого диапазона.
8. Когда ограничен общий ресурс и продукты требуют разное количество этого ресурса.
9. Внутреннее выполнение и внешний закуп услуги или продукта по релевантным количественным и качественным критериям.
10. Уже возникшие затраты, которые текущее решение не может изменить.
11. Упущенная выгода лучшей отвергнутой альтернативы.
12. Время, за которое накопленные Rückflüsse покрывают первоначальную инвестицию.
13. Например: не учитывает денежные потоки после окупаемости, Zeitwert des Geldes, качество и полный риск.
14. При покупке обычно приобретается собственность; при аренде предоставляется временное пользование без перехода собственности.
15. Eigentumsübergang, Kaufoption, Laufzeit и возврат зависят от конкретного договора.
16. Часы, реально доступные для создающей Leistung или рассчитываемой клиенту работы после Ausfall- и Gemeinzeiten.
17. Kostenstundensatz покрывает релевантные внутренние затраты. Внешний Preis дополнительно может содержать Gewinn, Risiko и рыночную корректировку.
18. Zuschlag рассчитывается от Selbstkosten, Marge — как доля от Verkaufspreis.
19. `1.200 € − 720 € = 480 € je Stück`.
20. `96.000 € / 480 € = 200 Stück`.
21. `260 × 480 € − 96.000 € = 28.800 €`.
22. `(96.000 € + 24.000 €) / 480 € = 250 Stück`.
23. `480 / 1.200 = 0,40 = 40 %`; `96.000 / 0,40 = 240.000 €`.
24. `260 − 200 = 60 Stück`; `60 / 260 × 100 % = 23,08 %`.
25. `8.000 / (105 − 65) = 200 Stunden`.
26. Make: `8.000 + 65 × 320 = 28.800 €`. Buy: `105 × 320 = 33.600 €`. Make дешевле на 4 800 €.
27. `R = 22.000 − 6.000 = 16.000 €`; `48.000 / 16.000 = 3 Jahre`.
28. После двух лет накоплено 42 000 €, остаётся 23 000 €. Окупаемость в третьем году; при равномерном Rückfluss: `2 + 23.000 / 28.000 ≈ 2,82 Jahre`.
29. `121.500 € / 1.350 h = 90,00 €/h`.
30. `90,00 € × 1,15 = 103,50 €/h`.
31. `90,00 € / 0,85 = 105,88 €/h`.
32. `103,50 € × 1,19 = 123,165 € ≈ 123,17 €`.
33. Amortisation учитывает только скорость возврата вложения; TCO охватывает затраты всего заданного жизненного цикла.
34. Нужно проверить, действительно ли мощность сокращается, избегаются выплаты или высвобождённое время используется продуктивно. Иначе номинальные часы не равны денежной экономии.
35. Например: Know-how, Kapazität, Termin, Qualität, Datenschutz, Sicherheit, Abhängigkeit, Skalierung и Reversibilität.
36. Если внутренней мощности или компетенции нет, срок не достижим, Opportunitätskosten выше 4 800 €, внешний Anbieter обеспечивает существенно более низкий риск или дополнительные Leistungen.
37. При Engpass цель — получить максимальный Deckungsbeitrag из каждой единицы ограниченного ресурса.
38. Например: начальные выплаты, текущие ставки, Wartung, Service, Restwert, Rückgabe, Sonderzahlung, Gebühren и Vertragsbindung.
39. Urlaub, Krankheit, Weiterbildung, Administration, Vertrieb и Zeiten ohne Auftrag уменьшают реально продуктивное время.
40. Например: `Bei einem Umfang von 320 Stunden verursacht Make nach dem vorgegebenen Modell Kosten von 28.800 €, Buy dagegen 33.600 €. Make ist damit rechnerisch um 4.800 € günstiger. Die Eigenleistung ist zu empfehlen, sofern interne Kapazität, Kompetenz und Termine gesichert sind und keine höheren Opportunitätskosten entstehen. Andernfalls ist trotz des rechnerischen Kostennachteils ein Fremdbezug zu prüfen.`

</details>

---

## 49. Quellen und Abgleich

- [§ 9 FIAusbV – Prüfungsbereich Teil 1](https://www.gesetze-im-internet.de/fiausbv/__9.html)
- [FIAusbV und Ausbildungsrahmenplan – BIBB](https://www.bibb.de/dienst/berufesuche/de/index_berufesuche.php/regulation/VO_Fachinformatiker_2020.pdf)
- [§ 7 BHO – Wirtschaftlichkeit und Sparsamkeit](https://www.gesetze-im-internet.de/bho/__7.html)
- [KOINNO – Lebenszykluskosten-Rechner](https://www.koinno.de/oeffentliche-auftraggeber/services/lzk-rechner/)
- [KOINNO – Bewertungsmethoden-Lotse](https://www.koinno.de/oeffentliche-auftraggeber/bewertungsmethoden-lotse/)

§ 7 BHO и материалы KOINNO относятся к публичному сектору. Здесь они используются как методическое подтверждение необходимости сравнивать варианты, допущения и жизненный цикл, а не как универсальное правило для любого частного предприятия.

Формулы этой главы являются стандартными статическими учебными моделями. В реальной инвестиции могут требоваться Kapitalwert, Zinsen, Steuern, Preisänderungen и профессиональная оценка договора.

Все денежные суммы и сценарии являются вымышленными учебными данными.

---

## 50. Offene Prüfpunkte für den Unterricht

- Включает ли действующий WBS-план Deckungsbeitrag и Break-even в AP1?
- Какую точную формулу Rückfluss использует WBS для статической Amortisation?
- Нужно ли прибавлять Abschreibung к Gewinn в используемой учебной схеме?
- Ожидается ли интерполяция неполного года?
- Требуется ли Break-even-Umsatz или только Break-even-Menge?
- Рассматриваются ли Mehrproduktfälle и Engpassrechnung?
- Какая глубина Make-or-Buy ожидается?
- Нужно ли различать Grenz-, Teil- и Vollkosten?
- Какая схема Stundensatz используется в WBS?
- Нужно ли различать Gewinnzuschlag и Gewinnmarge?
- Включаются ли Kauf, Miete и Leasing в активный материал AP1?
- Требуется ли Rentabilität или она остаётся дополнительной Vertiefung?
