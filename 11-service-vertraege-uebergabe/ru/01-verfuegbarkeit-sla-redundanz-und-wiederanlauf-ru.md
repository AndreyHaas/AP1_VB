---
pruefung: AP1
thema: Verfügbarkeit und Wiederanlauf
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Russisch
gegenstueck: ../de/01-verfuegbarkeit-sla-redundanz-und-wiederanlauf-de.md
---

# Доступность, SLA, резервирование и Wiederanlauf

## 1. Lernziele

Ты умеешь:

- рассчитывать Verfügbarkeit по рабочему и общему времени;
- определять допустимый простой из процентов;
- учитывать Messzeitraum, Servicezeit и исключения SLA;
- различать Reaktions-, Wiederherstellungs- и Lösungszeit;
- находить SPOF и подходящее резервирование;
- модельно рассчитывать последовательные и параллельные компоненты;
- различать Backup, Redundanz и Disaster Recovery;
- связывать RTO, RPO, порядок запуска и Notbetrieb;
- планировать Wiederanlauftest с измеримыми критериями.

## 2. Prüfungsminimum — 15 Minuten

1. `Verfügbarkeit = Betriebszeit / Gesamtzeit × 100 %`.
2. `Betriebszeit = Gesamtzeit − anrechenbare Ausfallzeit`.
3. `zulässige Ausfallzeit = Gesamtzeit × (1 − Verfügbarkeit dezimal)`.
4. 99,9 % означает 0,1 % недоступности, не 0,1 часа.
5. SLA задаёт период, Servicezeit, точку измерения, определение отказа и Wartungsfenster.
6. Reaktionszeit не является автоматически Lösungszeit.
7. Резерв устраняет SPOF только при учёте общих зависимостей.
8. Для последовательно необходимых независимых компонентов доступности перемножаются.
9. Для двух полностью резервных независимых компонентов: `1 − (1 − A1) × (1 − A2)`.
10. Redundanz поддерживает работу; Backup восстанавливает данные; Wiederanlauf требует плана и тестов.

> Die zugesagte Verfügbarkeit kann erst bewertet werden, wenn Servicezeit, Messzeitraum und anrechenbare Ausfälle eindeutig definiert sind.

## 3. Grundlagen und SLA

### 3.1 Расчёт Verfügbarkeit

```text
A = Betriebszeit / Gesamtzeit × 100 %
Betriebszeit = Gesamtzeit − Ausfallzeit
```

Пример: 30 дней 24×7, простой 3 часа.

```text
Gesamtzeit   = 30 × 24 h = 720 h
Betriebszeit = 720 h − 3 h = 717 h
A            = 717 / 720 × 100 % = 99,5833... % ≈ 99,58 %
```

### 3.2 Допустимый простой

30 дней и 99,9 %:

```text
Gesamtzeit = 30 × 24 × 60 min = 43 200 min
Nichtverfügbarkeit = 1 − 0,999 = 0,001
Ausfallzeit = 43 200 min × 0,001 = 43,2 min
```

Проценты сначала переводятся в десятичную долю. Для `99,95 %` недоступность `0,05 % = 0,0005`.

### 3.3 Содержание SLA

Service Level Agreement может включать:

- описание и Servicezeiten;
- Verfügbarkeit и Messzeitraum;
- Messpunkt, источник данных и формулу;
- плановые работы и исключённые события;
- классы приоритета и временные цели;
- коммуникацию и Eskalationswege;
- отчёты, Review и последствия нарушения.

`Servicezeit` — период действия обещания. Месячные 24×7 нельзя прямо сравнивать с Mo–Fr 08:00–18:00.

### 3.4 Временные понятия

| Термин | Значение |
|---|---|
| Reaktionszeit | до принятия/квалифицированного начала |
| Wiederherstellungszeit | до пригодности сервиса |
| Lösungszeit | до постоянного устранения причины |
| RTO | целевой максимум до восстановления |
| RPO | допустимая потеря данных во времени |

Workaround может восстановить сервис, хотя окончательное решение появится позже.

## 4. Redundanz und Wiederanlauf

### 4.1 SPOF и общие причины

`Single Point of Failure (SPOF)`: один компонент, отказ которого останавливает весь сервис.

Меры:

- второе Netzteil и независимое питание;
- Servercluster/Failover;
- несколько сетевых путей и Switches;
- репликация сервисов и баз;
- географически разные площадки.

Два сервера в одном Rack вместе уязвимы к сбою питания, пожару или ошибке конфигурации. Нужны независимость, Umschaltmechanismus, достаточная мощность и тесты.

### 4.2 Последовательная модель

Если оба независимых компонента обязательны:

```text
A_gesamt = A1 × A2
```

Server и Switch по 99,9 %:

```text
A_gesamt = 0,999 × 0,999 = 0,998001 = 99,8001 %
```

Дополнительные обязательные компоненты могут снизить общую доступность.

### 4.3 Параллельная модель

Два независимых полных резерва, достаточно одного:

```text
A_parallel = 1 − (1 − A1) × (1 − A2)
```

При 99 % у каждого:

```text
A_parallel = 1 − 0,01 × 0,01 = 0,9999 = 99,99 %
```

Это упрощение. Общие причины, ошибки переключения, обслуживание и зависимости снижают реальность.

### 4.4 Backup, Redundanz и DR

```text
Redundanz         → продолжить работу при отказе компонента
Backup            → восстановить данные после потери/манипуляции
Disaster Recovery → вернуть системы, данные, персонал и площадку по порядку
```

Репликация может сразу перенести повреждение или шифрование. Она дополняет, но не заменяет Backup.

### 4.5 План Wiederanlauf

План содержит:

1. критерии запуска и полномочия решения;
2. контакты, роли и каналы;
3. приоритеты процессов и зависимости;
4. RTO/RPO по сервисам;
5. Notbetrieb и Ersatzressourcen;
6. порядок Restore и старта;
7. технические/бизнес-тесты и Freigabe;
8. возврат к Normalbetrieb и разбор.

## 5. Anwendungsfall und Berechnung

Kundenportal имеет 24×7-SLA `99,8 %` за 31 день. Неплановый простой 70 минут. Плановые работы 60 минут по договору исключены.

### 5.1 Допустимое время

```text
Gesamtzeit = 31 × 24 × 60 min = 44 640 min
zulässige Nichtverfügbarkeit = 1 − 0,998 = 0,002
zulässige Ausfallzeit = 44 640 × 0,002 = 89,28 min
```

По заданному SLA учитывается только неплановый простой:

```text
70 min ≤ 89,28 min → цель выполнена
Restbudget = 89,28 − 70 = 19,28 min
```

### 5.2 Фактическая SLA-Verfügbarkeit

```text
Betriebszeit = 44 640 − 70 = 44 570 min
A = 44 570 / 44 640 × 100 % ≈ 99,8432 %
```

### 5.3 Порядок запуска

```text
1. Strom, Netz, DNS/Zeit и Identitätsdienst
2. Datenbank и консистентный Datenstand
3. Anwendung/API
4. Webfrontend
5. Monitoring, Schnittstellen и fachlicher Funktionstest
6. Freigabe и Kundenkommunikation
```

Реальный порядок следует зависимостям, а не только видимости клиенту.

## 6. Prüfungsformulierungen

> Die maximal zulässige Ausfallzeit beträgt 89,28 Minuten, da der Monat 44 640 Minuten umfasst und 0,2 % davon nicht verfügbar sein dürfen.

> Die geplante Wartung wird in dieser Rechnung nicht berücksichtigt, weil sie laut vorgegebenem SLA ausdrücklich von der Messung ausgeschlossen ist.

> Der zweite Server beseitigt den Single Point of Failure nur, wenn Stromversorgung, Netzwerk, Datenhaltung und Failover ebenfalls ausreichend unabhängig ausgelegt sind.

> Der Identitätsdienst wird vor dem Portal gestartet, da sich Benutzer ohne diese Abhängigkeit nicht an der Anwendung authentifizieren können.

## 7. Typische Prüfungsfallen

- Путать Gesamtzeit, Betriebszeit и Ausfallzeit.
- Считать остаток `99,9 %` как `0,1`, а не `0,001`.
- Смешивать часы и минуты.
- Включать/исключать плановые работы без условия SLA.
- Считать Reaktionszeit полным решением.
- Сравнивать проценты без периода.
- Считать компоненты независимыми при общей Versorgung.
- Путать формулы серии и параллели.
- Принимать модель за реальную гарантию.
- Считать Replikation или RAID резервной копией.
- Путать RTO и RPO.
- Планировать запуск без зависимостей и fachliche Freigabe.

## 8. Selbsttest

1. Назови формулу доступности.
2. Рассчитай при 720 h и 2 h простоя.
3. Рассчитай простой для 28 дней 24×7 и 99,5 %.
4. Какие SLA-Angaben нужны для измерения?
5. Различи три временных показателя.
6. Что такое SPOF?
7. Рассчитай серию 99 % и 98 %.
8. Рассчитай два параллельных компонента по 98 %.
9. Почему реальность хуже Parallelmodell?
10. Различи Redundanz, Backup и Disaster Recovery.
11. Объясни RTO и RPO.
12. Расставь Identitätsdienst, Datenbank и Portal.

<details>
<summary>Lösungen anzeigen</summary>

1. Betriebszeit/Gesamtzeit × 100 %.
2. `(718 / 720) × 100 % ≈ 99,72 %`.
3. `672 × 0,005 = 3,36 h = 3 h 21,6 min`.
4. Servicezeit, Zeitraum, Messpunkt, Ausfalldefinition, Wartung/Ausschlüsse.
5. до начала; до использования; до постоянного устранения.
6. Компонент, отказ которого останавливает сервис.
7. `0,99 × 0,98 = 97,02 %`.
8. `1 − 0,02 × 0,02 = 99,96 %`.
9. общие причины, Failover, обслуживание, ПО и зависимости.
10. продолжение работы; восстановление данных; полный организованный запуск.
11. время до восстановления; допустимая потеря данных во времени.
12. Identitätsdienst, Datenbank, Portal; проверить реальные зависимости.

</details>

## 9. Quellen und Abgleich

- [NIST SP 800-34 Rev. 1](https://csrc.nist.gov/pubs/sp/800/34/r1/upd1/final) — Business Impact Analysis, приоритеты, стратегии, план и тесты.
- [BSI IT-Grundschutz-Kompendium](https://www.bsi.bund.de/grundschutz-kompendium) — Verfügbarkeit, Notfallmanagement, Redundanz и Wiederherstellung.
- [FIAusbV § 9](https://www.gesetze-im-internet.de/fiausbv/__9.html) — контроль и протоколирование результата в AP1.

## 10. Offene Prüfpunkte für den Unterricht

- Как WBS округляет Ausfallzeiten?
- Считает ли AP1 Serien-/Parallelmodelle или только оценивает?
- Какая Wartungsfenster-конвенция в используемых SLA-Aufgaben?
