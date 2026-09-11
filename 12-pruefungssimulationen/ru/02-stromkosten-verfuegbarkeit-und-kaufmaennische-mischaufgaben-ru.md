---
pruefung: AP1
thema: Stromkosten, Verfügbarkeit und kaufmännische Mischaufgaben
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Russisch
gegenstueck: ../de/02-stromkosten-verfuegbarkeit-und-kaufmaennische-mischaufgaben-de.md
---

# Электроэнергия, доступность и смешанные коммерческие задачи

## 1. Lernziele

Ты умеешь:

- рассчитывать Leistung, Energie и Stromkosten для нескольких Betriebszustände;
- находить экономию и простую Amortisationsdauer;
- рассчитывать Verfügbarkeit и допустимый простой по Servicezeiten;
- различать Netto, Umsatzsteuer и Brutto по ситуации;
- применять Rabatt, Skonto и Bezugskosten в правильном порядке;
- разграничивать Bezugspreis и TCO;
- выбирать Break-even, Amortisation и Nutzwert по вопросу задачи;
- делить многоступенчатую задачу на части, единицы и периоды;
- проверять результат обратным расчётом и порядком величины;
- формулировать решение с числом, единицей, допущением и обоснованием.

## 2. Prüfungsminimum — 15 Minuten

1. `Energie (kWh) = Leistung (kW) × Zeit (h)`.
2. `Stromkosten = Energie × Preis je kWh`.
3. Betriebszustände считать отдельно и только затем складывать.
4. `Verfügbarkeit = Betriebszeit / Gesamtzeit × 100 %`.
5. `zulässige Ausfallzeit = Gesamtzeit × Nichtverfügbarkeitsanteil`.
6. Проценты вводятся как десятичная доля: `0,3 % = 0,003`.
7. Bezugskalkulation: Listenpreis − Rabatt = Zieleinkaufspreis; − Skonto = Bareinkaufspreis; + Bezugskosten = Bezugspreis.
8. Umsatzsteuer учитывать только тогда, когда этого требуют условие и перспектива.
9. Bezugspreis не равен автоматически TCO; добавляются Betrieb, Support, Personal и Aussonderung.
10. Сначала определить вопрос и период, затем формулу, а в конце дать обоснование.

> Das wirtschaftlich geeignete Angebot wird nicht allein nach dem Listenpreis, sondern nach Muss-Kriterien, vergleichbaren Gesamtkosten und relevantem Nutzen bewertet.

## 3. Formelwerkzeug

### 3.1 Энергия и стоимость

```text
P_kW = P_W / 1 000
E_kWh = Anzahl × P_kW × Zeit_h
Kosten = E_kWh × Preis_€/kWh
```

При нескольких состояниях:

```text
E_gesamt = E_aktiv + E_idle + E_standby + ...
```

Номинал Netzteil не равен автоматически фактической средней Leistungsaufnahme.

### 3.2 Verfügbarkeit

```text
A = (Gesamtzeit − anrechenbare Ausfallzeit) / Gesamtzeit × 100 %
t_ausfall,zulässig = Gesamtzeit × (1 − A_ziel,dezimale Zahl)
```

Использовать только Servicezeit и учитываемые простои, определённые в SLA.

### 3.3 Bezugskalkulation

```text
Listeneinkaufspreis
− Lieferrabatt
= Zieleinkaufspreis
− Lieferskonto
= Bareinkaufspreis
+ Bezugskosten
= Bezugspreis
```

Rabatt и Skonto последовательно считаются от своих оснований, а не оба от Listenpreis.

### 3.4 Другие показатели решения

```text
TCO = einmalige Kosten + laufende Kosten des Vergleichszeitraums
Amortisationsdauer = Investition / jährlicher Rückfluss
Stückdeckungsbeitrag = Preis − variable Stückkosten
Break-even-Menge = Fixkosten / Stückdeckungsbeitrag
Teilnutzwert = Gewicht × Bewertung
```

Каждая формула отвечает на отдельный вопрос. Баллы Nutzwertanalyse нельзя без объяснения складывать с евро.

## 4. Strategie für Mischaufgaben

### 4.1 Шесть шагов

1. Отметить искомое, перспективу и период.
2. Записать данные вместе с единицами.
3. Упорядочить подзадачи и зависимости.
4. Преобразовать все единицы и проценты.
5. Считать с неокруглёнными промежуточными результатами.
6. Добавить итог, единицу, округление, Plausibilität и вывод.

### 4.2 Plausibilitätskontrollen

- Больше времени работы при той же мощности означает больше энергии.
- Rabatt должен снижать цену.
- 99,9 % допускает меньше простоя, чем 99 %, за тот же период.
- Wirkungsgrad ниже 100 % удлиняет передачу.
- Нецелый Break-even для изделий округляется вверх.
- Альтернативы сравниваются за одинаковый период и одинаковый Leistungsumfang.

### 4.3 Netto или Brutto

Предприятия с правом Vorsteuerabzug обычно сравнивают Nettobeträge. Частный клиент обычно оплачивает Bruttopreis. В экзаменационной задаче решает указанная перспектива; нельзя придумывать налоговую ставку.

```text
Brutto = Netto × (1 + Umsatzsteuersatz)
Netto = Brutto / (1 + Umsatzsteuersatz)
```

## 5. Integrierter Anwendungsfall

Компания закупает 30 Clients. Дано:

- Listenpreis устройства: `960 € netto`;
- Rabatt: `10 %`, Skonto: `2 %`;
- разовая Fracht: `650 €`;
- установка: `1,5 h` на устройство по `72 €/h`;
- активная работа: `65 W`, `7 h` в 220 рабочих дней;
- Idle: `12 W`, `1 h` в 220 рабочих дней;
- Standby: `1,5 W` в остальные часы;
- Strompreis: `0,34 €/kWh`;
- Support первого года: `900 €`.

### 5.1 Bezugspreis

```text
Listeneinkaufspreis = 30 × 960 € = 28 800 €
Rabatt              = 28 800 € × 0,10 = 2 880 €
Zieleinkaufspreis   = 25 920 €
Skonto              = 25 920 € × 0,02 = 518,40 €
Bareinkaufspreis    = 25 401,60 €
Bezugspreis         = 25 401,60 € + 650 € = 26 051,60 €
```

### 5.2 Jahresenergie

Aktiv и Idle в рабочие дни:

```text
E_aktiv = 30 × 0,065 kW × 7 h × 220 = 3 003 kWh
E_idle  = 30 × 0,012 kW × 1 h × 220 = 79,2 kWh
```

Standby: 16 часов в 220 рабочих дней и 24 часа в остальные 145 дней.

```text
E_standby,Arbeitstage = 30 × 0,0015 × 16 × 220 = 158,4 kWh
E_standby,übrige Tage = 30 × 0,0015 × 24 × 145 = 156,6 kWh
E_gesamt = 3 003 + 79,2 + 158,4 + 156,6 = 3 397,2 kWh
Stromkosten = 3 397,2 × 0,34 € = 1 155,048 € ≈ 1 155,05 €
```

### 5.3 TCO первого года

```text
Installation = 30 × 1,5 h × 72 €/h = 3 240 €
TCO_Jahr1 = 26 051,60 + 3 240 + 1 155,05 + 900
TCO_Jahr1 = 31 346,65 €
```

Здесь Bezugspreis включает устройства и Fracht; Installation, Energie и Support расширяют его до заданной TCO-модели.

### 5.4 Verfügbarkeitskontrolle

Supportservice действует 22 рабочих дня по 10 часов. Цель: `99,7 %`. Два учитываемых простоя — 18 и 24 минуты.

```text
Gesamtzeit = 22 × 10 h = 220 h = 13 200 min
zulässig = 13 200 × (1 − 0,997) = 39,6 min
tatsächlich = 18 + 24 = 42 min
42 min > 39,6 min → цель пропущена на 2,4 min
A_ist = (13 200 − 42) / 13 200 × 100 % ≈ 99,6818 %
```

## 6. Prüfungsformulierungen

> Der Bezugspreis beträgt 26 051,60 Euro netto, da Rabatt und Skonto nacheinander abgezogen und die Fracht anschließend addiert werden.

> Die jährlichen Stromkosten betragen unter dem vorgegebenen Nutzungsprofil rund 1 155,05 Euro.

> Das Verfügbarkeitsziel wurde verfehlt, weil 42 anrechenbare Ausfallminuten das zulässige Budget von 39,6 Minuten um 2,4 Minuten überschreiten.

> Der reine Bezugspreis reicht für die Entscheidung nicht aus, da Installation, Energie und Support im betrachteten Zeitraum weitere Kosten verursachen.

## 7. Typische Prüfungsfallen

- Использовать Watt как Kilowatt без деления на 1 000.
- Умножать Leistung в kW на минуты, а не часы.
- Забывать Anzahl устройств или Betriebstage.
- Создавать пересечение времени разных Betriebszustände.
- Считать номинал Netzteil фактическим потреблением.
- Подставлять Zielverfügbarkeit как долю простоя.
- Использовать месяц 24×7, хотя SLA называет только Servicezeiten.
- Считать Rabatt и Skonto оба от Listenpreis.
- Добавлять Bezugskosten до Skonto вопреки заданной схеме.
- Смешивать Netto и Brutto без перспективы.
- Выдавать Bezugspreis за полную TCO.
- Считать Amortisation, Break-even и TCO взаимозаменяемыми.
- Слишком рано округлять.
- Принимать решение без качественных Muss-Kriterien.

## 8. Selbsttest

1. Разграничь Leistung и Energie.
2. Рассчитай энергию и стоимость для 8 устройств по 120 W, 6 h в 200 дней и 0,30 €/kWh.
3. Какой простой допускают 99,9 % за 30 дней 24×7?
4. Рассчитай фактическую Verfügbarkeit при 720 h и 2 h простоя.
5. Назови порядок Bezugskalkulation.
6. Listenpreis 12 000 €, Rabatt 5 %, Skonto 2 %, Fracht 300 €: Bezugspreis?
7. Почему Bezugspreis не является TCO?
8. Investition 4 800 €, ежегодная экономия 1 200 €: простая Amortisationsdauer?
9. Fixkosten 18 000 €, Preis 150 €, variable Kosten 90 €: Break-even-Menge?
10. Когда обычно применяются Netto- и когда Bruttowerte?
11. Проверь, все ли часы в интегрированном случае учтены полностью и без пересечений.
12. Назови четыре Plausibilitätsprüfungen для смешанных задач.

<details>
<summary>Lösungen anzeigen</summary>

1. Leistung — энергия за время в W/kW; Energie — Leistung × Zeit в Wh/kWh.
2. `8 × 0,12 × 6 × 200 = 1 152 kWh`; `1 152 × 0,30 = 345,60 €`.
3. `30 × 24 × 60 × 0,001 = 43,2 min`.
4. `718/720 × 100 % ≈ 99,72 %`.
5. Liste − Rabatt = Ziel; − Skonto = Bar; + Bezugskosten = Bezugspreis.
6. `12 000 − 600 = 11 400`; `−228 = 11 172`; `+300 = 11 472 €`.
7. Могут отсутствовать текущие и другие разовые затраты: Installation, Energie, Support и Entsorgung.
8. `4 800/1 200 = 4 года`.
9. `18 000/(150−90) = 300 штук`.
10. Unternehmen с Vorsteuerabzug обычно netto; Endverbraucher обычно brutto; решает условие.
11. Рабочий день: 7 h aktiv + 1 h Idle + 16 h Standby = 24 h; другой день: 24 h Standby.
12. единица, период, порядок величины, направление процента, обратный расчёт; достаточно четырёх.

</details>

## 9. Quellen und Abgleich

- [BIPM — SI Brochure](https://www.bipm.org/en/publications/si-brochure) — SI-единицы и префиксы для Leistung, Energie и Zeit.
- [Umsatzsteuergesetz](https://www.gesetze-im-internet.de/ustg_1980/) — первичный источник; в задаче применяются заданная ставка и ситуация.
- [FIAusbV § 9](https://www.gesetze-im-internet.de/fiausbv/__9.html) — Wirtschaftlichkeit, Auswahl, Einrichtung, Kontrolle и Protokollierung в AP1.
- [BIBB — Umsetzungshilfe Fachinformatiker/-in](https://www.bibb.de/dienst/publikationen/de/16661) — профессиональный контекст Wirtschaftlichkeit и Kundenauftrag.

## 10. Offene Prüfpunkte für den Unterricht

- Какие термины Bezugskalkulation и правила округления использует WBS?
- Какие kaufmännische Formeln точно входят в AP1 по текущему каталогу?
- Моделирует ли WBS Strom-Betriebsprofile за 365 дней или только Arbeitstage?
