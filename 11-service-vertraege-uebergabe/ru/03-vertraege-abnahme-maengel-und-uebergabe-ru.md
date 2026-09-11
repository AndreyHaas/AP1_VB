---
pruefung: AP1
thema: Verträge, Abnahme, Mängel und Übergabe
prioritaet: Abgleich
status: Entwurf
stand: 2026-09-11
sprache: Russisch
gegenstueck: ../de/03-vertraege-abnahme-maengel-und-uebergabe-de.md
---

# Договоры, приёмка, дефекты и передача

## 1. Lernziele

Ты умеешь:

- различать Kauf-, Miet-, Dienst-, Werk- и Lizenzvertrag по основной обязанности;
- классифицировать смешанный IT-договор по содержанию, а не заголовку;
- связывать Angebot, Auftrag, Leistungsbeschreibung и Abnahmekriterien;
- разграничивать Übergabe, Inbetriebnahme и Abnahme;
- планировать проверяемый процесс приёмки и Abnahmeprotokoll;
- различать Mangel, Restpunkt, Änderungswunsch и Bedienfehler;
- классифицировать Mängelrechte без недопустимых обобщений;
- различать Gewährleistung/Mängelhaftung и Garantie;
- проверять Lieferungs- и Zahlungsverzug по обстоятельствам;
- учитывать документацию, доступы, Datenschutz и открытые риски при передаче.

## 2. Prüfungsminimum — 15 Minuten

1. При `Kaufvertrag` должны быть переданы вещь и покупная цена.
2. При `Mietvertrag` пользование предоставляется временно за плату.
3. `Dienstvertrag` требует согласованную деятельность, `Werkvertrag` — определённый результат.
4. `Lizenzvertrag` регулирует Nutzungsrechte; точная классификация зависит от содержания.
5. `Übergabe` — фактическая передача, `Abnahme` — юридически значимое признание Werk в основном соответствующим договору.
6. Abnahmekriterien заранее выводятся из требований и должны измеряться.
7. Mangel — отклонение от согласованного Soll; новая просьба обычно является Change.
8. При дефекте часто сначала нужно дать возможность Nacherfüllung; дальнейшие права зависят от условий и вида договора.
9. `Garantie` — добровольное дополнительное обещание, `Mängelhaftung` основана на законе или договоре.
10. Verzug нельзя выводить только из календарной задержки: проверить Fälligkeit, Mahnung или исключение, возможность исполнения и ответственность.

> Der Fehler wird als Mangel dokumentiert, da das vereinbarte Abnahmekriterium nicht erfüllt ist; der Auftragnehmer erhält zunächst Gelegenheit zur Nacherfüllung.

## 3. Vertragstypen und Leistungsinhalt

| Vertragstyp | Типичная основная обязанность | IT-Beispiel |
|---|---|---|
| Kaufvertrag | вещь за покупную цену | покупка ноутбуков |
| Mietvertrag | временное пользование за арендную плату | аренда Hardware |
| Dienstvertrag | деятельность, обычно без гарантии конкретного результата | текущая консультация по часам |
| Werkvertrag | согласованный результат/Werk за вознаграждение | работающий интерфейс по критериям |
| Lizenzvertrag | предоставленные права использования и условия | право использования Standardsoftware |

IT-проект может содержать элементы нескольких договоров: покупку Hardware, программную лицензию, установку как Werkleistung и текущий Support как Dienstleistung. Решают содержание, ответственность за результат и соглашения сторон.

### 3.1 Цепочка документов и результата

```text
Kundenbedarf
→ Anforderungen/Leistungsbeschreibung
→ Angebot и Vertrag
→ реализация и внутренние тесты
→ Abnahmekriterien и Abnahmetest
→ Übergabe/Abnahme
→ Betrieb, Support и работа с дефектами
```

Abnahmetest не должен впервые создавать новые требования. Неясные или противоречивые критерии уточняются и документируются до приёмки.

## 4. Übergabe, Abnahme, Mängel und Verzug

### 4.1 Разграничение понятий

`Übergabe`: система, устройство, документы или доступ фактически предоставлены клиенту.

`Inbetriebnahme`: система технически переведена в предусмотренную эксплуатацию.

`Abnahme`: в Werkvertragsrecht заказчик принимает Werk, изготовленное по договору. По § 640 BGB нельзя отказать в Abnahme из-за несущественных дефектов. Конкретные правовые последствия проверяются для отдельного случая.

События могут совпадать, но не обязаны. Система может технически работать, хотя формальная Abnahme ещё открыта.

### 4.2 Abnahmetest

Хороший критерий содержит:

- объект теста и предусловие;
- ввод или действие;
- ожидаемый измеримый результат;
- допуск или границу;
- подтверждение и ответственного.

Пример:

```text
Kriterium: Anmeldung с активной Domänenkonto
Voraussetzung: Client в сети компании, Konto активно
Aktion: пользователь вводит правильные данные
Soll: Desktop появляется за 30 секунд, Richtlinien применены
Nachweis: измерение времени, Ereignisprotokoll, Testergebnis
```

### 4.3 Классификация результата

| Befund | Einordnung | Vorgehen |
|---|---|---|
| обязательный согласованный критерий не выполнен | Mangel/Abweichung | документировать, оценить, запланировать Nacherfüllung |
| небольшое известное отклонение без существенного нарушения | возможный Restmangel | записать срок и ответственного |
| функция не была согласована | Änderungswunsch | Change с Aufwand, Risiko и Freigabe |
| функция исправна, но используется неверно | Bedien-/Schulungsproblem | объяснить, улучшить документацию или обучение |

### 4.4 Классификация Mängelrechte

Для дефектного Werk § 634 BGB при выполнении соответствующих условий называет, в частности:

- Nacherfüllung;
- Selbstvornahme и возмещение необходимых расходов;
- Rücktritt или Minderung;
- Schadensersatz или возмещение бесполезных расходов.

Нельзя пропускать порядок и предпосылки. Для Kaufvertrag действуют отдельные нормы, прежде всего §§ 437 ff. BGB. Если покупка является Handelsgeschäft для обеих сторон, дополнительно может применяться обязанность проверки и уведомления из § 377 HGB.

### 4.5 Проверка Verzug

Схема типового случая:

1. Требование наступило (`fällig`).
2. Исполнение не произошло вовремя.
3. Есть необходимая Mahnung или законное исключение.
4. Должник отвечает за задержку.
5. Последствия и следующие шаги проверяются по договору и закону.

При календарно определённом сроке Mahnung может не требоваться. Но не каждый перенос срока автоматически является виновным Verzug: учитывать Sachverhalt, Mitwirkung, höhere Gewalt и договорные условия.

## 5. Anwendungsfall: Übergabe eines Arbeitsplatz-Rollouts

Поставщик должен поставить, установить и передать готовыми к работе 25 рабочих мест. Согласованы Verschlüsselung, Domänenanmeldung, доступ к печати, документированные тесты и Einweisung. В день приёмки работают 24 устройства; на одном нет подходящего сетевого драйвера. Клиент дополнительно требует никогда не согласованную Spezialsoftware.

### 5.1 Оценка

```text
24 устройства выполняют Soll → записать результаты
1 Treiber отсутствует         → Abweichung/Mangel, записать причину и срок
новая Spezialsoftware         → Änderungswunsch, не исходный Mangel
общая Abnahme                 → проверить существенность, Teilabnahme и договор
```

### 5.2 Abnahmeprotokoll

Протокол содержит минимум:

- проект, версию, место и дату;
- участников и роли;
- ссылку на Vertrag/Auftrag;
- проверенные критерии с Soll, Ist и результатом;
- тестовую среду и доказательства;
- дефекты, приоритет, срок и ответственного;
- Vorbehalte, Restpunkte и открытые Changes;
- итог: abgenommen, с оговоркой/Restpunkte или nicht abgenommen;
- следующие сроки и подтверждение участников.

### 5.3 Безопасная Übergabe

В зависимости от Auftrag вместе с устройствами передаются:

- Benutzer- и Betriebsdokumentation;
- Inventar-, Lizenz- и Konfigurationsnachweise;
- Test- и Sicherheitsprotokolle;
- Backup-/Restore- и Notfallinformationen;
- Supportkontakt, SLA и Eskalationsweg;
- безопасно и отдельно — начальные секреты;
- Einweisung и документированная Lernkontrolle.

Пароли и Private Keys нельзя передавать открыто в обычном Übergabeprotokoll.

## 6. Prüfungsformulierungen

> Es handelt sich hinsichtlich der funktionsfähigen Schnittstelle um eine werkvertraglich geprägte Leistung, da ein bestimmter prüfbarer Erfolg geschuldet wird.

> Die zusätzliche Spezialsoftware ist kein Mangel der ursprünglichen Leistung, weil sie nicht Bestandteil der vereinbarten Anforderungen war; sie ist als Change zu bewerten.

> Die Abnahmeentscheidung muss auf den vereinbarten Kriterien beruhen, damit Soll und Ist nachvollziehbar verglichen werden können.

> Der Lieferverzug ist anhand von Fälligkeit, Mahnung oder deren Entbehrlichkeit und Verantwortlichkeit zu prüfen; die bloße Verspätung genügt nicht für jede Rechtsfolge.

## 7. Typische Prüfungsfallen

- Каждый IT-договор автоматически считать Kaufvertrag.
- Различать Dienst- и Werkvertrag только по способу оплаты.
- Смешивать Übergabe, Inbetriebnahme и Abnahme.
- Определять новые требования только во время теста.
- Считать Change дефектом.
- Каждый небольшой Restpunkt считать автоматическим препятствием для Abnahme.
- Сразу требовать Rücktritt или Schadensersatz без проверки условий.
- Смешивать Gewährleistung и Garantie.
- Применять § 377 HGB к любой частной покупке.
- Утверждать Verzug без Fälligkeit и Mahnung/исключения.
- Открыто отправлять доступы в протоколе.
- Документировать Abnahme без версии, доказательств и ответственных.

## 8. Selbsttest

1. Какая основная обязанность различает Dienst- и Werkvertrag?
2. Назови по одному IT-примеру Kauf-, Miet- и Lizenzvertrag.
3. Почему IT-договор может быть смешанным?
4. Разграничь Übergabe, Inbetriebnahme и Abnahme.
5. Какие пять частей делают Abnahmekriterium проверяемым?
6. Является ли несогласованная функция дефектом?
7. Назови четыре группы Mängelrechte при Werkvertrag.
8. Различи Mängelhaftung и Garantie.
9. Что проверяется до утверждения «Verzug»?
10. Какую особенность может создать § 377 HGB в beiderseitiges Handelsgeschäft?
11. Оцени отсутствующий Treiber и новую Spezialsoftware в случае.
12. Назови восемь элементов Abnahmeprotokoll.

<details>
<summary>Lösungen anzeigen</summary>

1. Dienstvertrag: деятельность; Werkvertrag: определённый результат.
2. покупка ноутбука; аренда Hardware; право использования Software.
3. Поставка, лицензия, изготовление/установка и Support могут подчиняться разным обязанностям.
4. фактическая передача; технический запуск; признание Werk в основном соответствующим договору.
5. объект, предусловие, действие/ввод, измеримое Soll/допуск, Nachweis/ответственный.
6. Обычно нет; сначала это Änderungswunsch.
7. Nacherfüllung; Selbstvornahme/Aufwendungsersatz; Rücktritt/Minderung; Schadensersatz/vergebliche Aufwendungen.
8. законные/договорные права при дефектах; добровольное дополнительное обещание со своими условиями.
9. Fälligkeit, неисполнение, Mahnung или исключение, ответственность и последствия по договору/закону.
10. Незамедлительно проверить товар и уведомить об обнаруженных дефектах; учитывать точные условия нормы.
11. Treiber: Abweichung/Mangel со сроком; Spezialsoftware: Change.
12. проект/версия, дата/место, участники, Auftrag, Soll/Ist-критерии, Nachweise, дефекты/сроки, итог/Freigabe; допустимы другие разумные пункты.

</details>

## 9. Quellen und Abgleich

- [BGB § 433](https://www.gesetze-im-internet.de/bgb/__433.html) — основные обязанности Kaufvertrag.
- [BGB § 535](https://www.gesetze-im-internet.de/bgb/__535.html) — основные обязанности Mietvertrag.
- [BGB § 611](https://www.gesetze-im-internet.de/bgb/__611.html) — Dienstvertrag.
- [BGB §§ 631, 634 и 640](https://www.gesetze-im-internet.de/bgb/__631.html) — Werkvertrag, Mängelrechte и Abnahme; дополнительные нормы проверяются отдельно.
- [BGB § 286](https://www.gesetze-im-internet.de/bgb/__286.html) — Schuldnerverzug.
- [HGB § 377](https://www.gesetze-im-internet.de/hgb/__377.html) — проверка и уведомление в beiderseitiges Handelsgeschäft.
- [FIAusbV § 9](https://www.gesetze-im-internet.de/fiausbv/__9.html) — Einweisung, контроль и протоколирование результата в AP1.

Stand der Rechtsprüfung: 11.09.2026. Учебный обзор не заменяет юридическую консультацию; в экзаменационном случае решают Sachverhalt и заданные договорные условия.

## 10. Offene Prüfpunkte für den Unterricht

- Какие Vertragstypen и правовые последствия входят в текущий объём WBS?
- Как формулировать Abnahme с несущественными Restmängel в WBS-задачах?
- Какие условия Verzug предполагаются выполненными в используемых заданиях?
