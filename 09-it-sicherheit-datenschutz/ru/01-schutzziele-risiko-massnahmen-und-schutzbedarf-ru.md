---
pruefung: AP1
thema: IT-Sicherheit
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Russisch
gegenstueck: ../de/01-schutzziele-risiko-massnahmen-und-schutzbedarf-de.md
---

# IT-безопасность: цели защиты, риск, меры и Schutzbedarf

## 1. Lernziele

Ты умеешь:

- распознавать Vertraulichkeit, Integrität и Verfügbarkeit в ситуациях;
- дополнять их Authentizität, Zurechenbarkeit и Nichtabstreitbarkeit;
- различать Schutzobjekt, Bedrohung, Schwachstelle, Angriff, Schaden и Risiko;
- качественно или по заданной матрице оценивать риски;
- определять и обосновывать Schutzbedarf отдельно по каждой цели;
- применять Maximumprinzip, зависимости и Kumulationseffekt;
- различать технические, организационные, кадровые и инфраструктурные меры;
- избегать, уменьшать, передавать или осознанно принимать риск;
- документировать Restrisiko и проверять эффективность мер.

## 2. Prüfungsminimum — 15 Minuten

1. `Vertraulichkeit`: доступ получают только уполномоченные.
2. `Integrität`: несанкционированное или незаметное изменение предотвращается либо обнаруживается.
3. `Verfügbarkeit`: информация и сервис доступны тогда, когда нужны.
4. Угроза может использовать уязвимость и вызвать ущерб.
5. Risiko связывает вероятность и величину последствий; Risikomatrix — модель оценки.
6. Schutzbedarf обосновывается для объекта и цели, а не выводится только из названия продукта.
7. Базовые категории BSI: `normal`, `hoch`, `sehr hoch`.
8. Технические, организационные, кадровые и инфраструктурные меры работают совместно.
9. Мера снижает вероятность, последствия или оба фактора; остаток — Restrisiko.
10. Принятие риска требует полномочного решения, обоснования и документации.

> Die Vertraulichkeit der Gesundheitsdaten hat einen sehr hohen Schutzbedarf, da eine Offenlegung erhebliche persönliche und rechtliche Folgen für die Betroffenen verursachen kann.

## 3. Grundlagen

### 3.1 Основные цели защиты

| Цель | Контрольный вопрос | Типичные меры |
|---|---|---|
| Vertraulichkeit | Кто может читать или получать доступ? | права, шифрование, Sichtschutz |
| Integrität | Верны и неизменны ли данные/системы? | подпись, Hash с защищённым эталоном, журналирование |
| Verfügbarkeit | Доступен ли сервис вовремя? | резервирование, Backup/Restore, Monitoring, Notfallplanung |

Один инцидент может нарушить несколько целей. Ransomware изменяет или шифрует данные, лишает сервис доступности и иногда до этого выводит данные наружу.

### 3.2 Дополнительные цели

- `Authentizität`: можно проверить подлинность идентичности, сообщения или источника.
- `Zurechenbarkeit`: действие можно связать с определённой идентичностью.
- `Nichtabstreitbarkeit`: источник или действие нельзя правдоподобно отрицать позднее.

Один Hashwert не доказывает автора. Нужна доверенная привязка, например корректно проверенная цифровая подпись.

### 3.3 Последовательность понятий

```text
Schutzobjekt → подвержен угрозе
Bedrohung    → может использовать уязвимость
Angriff      → конкретное, часто намеренное использование
Ereignis     → может привести к ущербу
Risiko       → оценивает вероятность и последствия
Maßnahme     → изменяет риск
Restrisiko   → остаётся после обработки
```

Пример:

| Понятие | Ситуация |
|---|---|
| Schutzobjekt | база клиентов |
| Bedrohung | внешний злоумышленник |
| Schwachstelle | известная неустранённая уязвимость |
| Angriff | использование уязвимости |
| Schaden | раскрытие данных и простой |
| Maßnahme | патч, ограничение доступа, Monitoring |

## 4. Risiko, Schutzbedarf und Maßnahmen

### 4.1 Оценка риска

Часто применяется учебная модель:

```text
Risiko = Eintrittswahrscheinlichkeit × Schadensausmaß
```

Факторы задаются числами или классами `niedrig/mittel/hoch`. Числа внутренней матрицы — порядковые оценки, а не автоматически евро или точные вероятности.

Пример заданной матрицы от 1 до 3:

| Wahrscheinlichkeit \ Auswirkung | 1 gering | 2 mittel | 3 hoch |
|---|---:|---:|---:|
| 1 gering | 1 | 2 | 3 |
| 2 mittel | 2 | 4 | 6 |
| 3 hoch | 3 | 6 | 9 |

Организация сама устанавливает границы и требуемую обработку. Одинаковое произведение в разных организациях не обязано вести к одинаковому решению.

### 4.2 Определение Schutzbedarf

Потребность в защите рассматривается отдельно для Vertraulichkeit, Integrität и Verfügbarkeit. Типовые категории IT-Grundschutz:

- `normal`: последствия ограничены и обозримы;
- `hoch`: последствия могут быть значительными;
- `sehr hoch`: последствия могут угрожать существованию или быть катастрофическими.

Критерии обоснования:

- нарушение закона, договора или внутренних правил;
- ущерб информационному самоопределению;
- вред людям;
- нарушение выполнения задач;
- отрицательный внутренний или внешний эффект;
- финансовый ущерб.

Решает не только «чувствительное» название. Учитываются требуемое время восстановления, объём, зависимости и конкретные последствия.

### 4.3 Наследование, максимум и накопление

`Maximumprinzip`: поддерживающая система в принципе наследует максимальный Schutzbedarf зависящих от неё приложений, если это следует из зависимости и защитного эффекта.

`Kumulationseffekt`: множество по отдельности менее критичных записей вместе может создать больший ущерб.

`Verteilungseffekt`: резервирование или распределение иногда не даёт полному Schutzbedarf приложения перейти на каждый отдельный компонент. Это требует обоснования и не является автоматическим снижением.

### 4.4 Категории мер

| Категория | Примеры |
|---|---|
| technisch | MFA, Verschlüsselung, Firewall, техника Backup |
| organisatorisch | Richtlinie, Berechtigungskonzept, Vier-Augen-Prinzip |
| personell | Schulung, чёткие роли, Sicherheitsüberprüfung |
| infrastrukturell | Zutrittskontrolle, Brandschutz, Klimatisierung |

Awareness-Schulung планируется организационно и действует на персонал. Поэтому на экзамене выбранная категория кратко обосновывается.

### 4.5 Обработка риска

- `vermeiden`: отказаться от рискованного действия или изменить процесс;
- `reduzieren`: снизить вероятность или ущерб мерами;
- `übertragen/teilen`: передать часть, например договором или страховкой; ответственность полностью не исчезает;
- `akzeptieren`: полномочная сторона принимает обоснованный Restrisiko.

Меры должны быть соразмерны и проверены. Написанный, но не внедрённый документ фактический риск не снижает.

## 5. Anwendungsfall: мобильный доступ к данным персонала

Ноутбук с данными о здоровье регулярно используется в поезде и Homeoffice. Данные лежат локально без шифрования, вход защищён только паролем, обновления нерегулярны.

### 5.1 Анализ

```text
Schutzobjekte: Gesundheitsdaten, Notebook, Benutzerkonto, Zugangsdienst
Bedrohungen: кража, подсматривание, Schadsoftware, использование известных дыр
Schwachstellen: нет шифрования диска, нет MFA,
                видимый экран, нерегулярные обновления
Schäden: раскрытие, изменение, простой, правовые последствия
```

Schutzbedarf:

- Vertraulichkeit: `sehr hoch`, потому что затронуты особо чувствительные данные и тяжёлые последствия.
- Integrität: `hoch`, потому что ложные кадровые данные вредят решениям и людям.
- Verfügbarkeit: обосновывается процессом; может быть `normal` при быстрой замене либо `hoch`, если есть сроки и нет резерва.

### 5.2 Пакет мер

1. техническое шифрование диска и безопасное управление ключами;
2. MFA, Least Privilege и отдельные администраторские аккаунты;
3. централизованный Patchprozess и управление устройством;
4. автоматическая блокировка экрана и Sichtschutz;
5. минимум локальных данных либо контролируемый Remote-Zugriff;
6. Backup/Restore, сообщение о потере и Fernsperre;
7. обучение работе в поездках и общественных местах;
8. протоколирование и регулярная проверка эффективности.

### 5.3 Сравнение риска

Заданные значения:

```text
до мер:    Wahrscheinlichkeit 3 × Auswirkung 3 = Risikowert 9
после мер: Wahrscheinlichkeit 1 × Auswirkung 3 = Restrisikowert 3
```

При успешном раскрытии ущерб остаётся высоким, но вероятность снизилась. Приемлем ли 3, определяют Risikopolitik и уполномоченная роль.

## 6. Prüfungsformulierungen

> Die Integrität ist verletzt, da die Kontonummer unberechtigt verändert wurde.

> Die fehlende Datenträgerverschlüsselung ist eine Schwachstelle, während der Diebstahl des Notebooks ein Bedrohungsszenario beziehungsweise Ereignis darstellt.

> Die Maßnahme reduziert die Eintrittswahrscheinlichkeit, beseitigt jedoch nicht jede mögliche Schadensauswirkung; deshalb bleibt ein dokumentiertes Restrisiko bestehen.

> Der Schutzbedarf wird für jedes Schutzziel getrennt begründet, weil Vertraulichkeit, Integrität und Verfügbarkeit im selben Prozess unterschiedliche Folgen haben können.

## 7. Typische Prüfungsfallen

- Смешивать Bedrohung, Schwachstelle, Angriff и Schaden.
- Определять риск только как ущерб.
- Перечислять CIA без объяснения по ситуации.
- Путать Verfügbarkeit с правильностью данных.
- Называть Hashing защитой конфиденциальности.
- Назначать Schutzbedarf без конкретных последствий.
- Слепо переносить Maximumprinzip на каждый компонент.
- Выдавать одну меру за полную безопасность.
- Считать перенос риска устранением ответственности.
- Не упоминать Restrisiko.
- Выдавать значения матрицы за точную вероятность.
- Считать наличие документа доказательством внедрения.

## 8. Selbsttest

1. Определи Vertraulichkeit, Integrität и Verfügbarkeit.
2. Классифицируй: прочитали зарплаты, изменили IBAN, сервер упал.
3. Объясни Schutzobjekt, Bedrohung, Schwachstelle, Angriff и Schaden.
4. Что означает учебная модель риска?
5. Назови три категории Schutzbedarf.
6. Объясни Maximumprinzip и Kumulationseffekt.
7. Назови по две технические и организационные меры.
8. Какие четыре способа обработки риска существуют?
9. Матрица даёт вероятность 2 и последствия 3. Рассчитай значение.
10. Почему последствия после меры могут остаться высокими?
11. Обоснуй Schutzbedarf доступности системы экстренного вызова.
12. Оцени: «Страховка устраняет риск информационной безопасности».

<details>
<summary>Lösungen anzeigen</summary>

1. Доступ только уполномоченным; защита от незаметного/несанкционированного изменения; своевременная доступность.
2. Vertraulichkeit; Integrität; Verfügbarkeit.
3. Объект защищают; угроза может навредить; уязвимость допускает использование; атака использует её; ущерб — отрицательное следствие.
4. Комбинацию или модельное произведение вероятности и последствий.
5. normal, hoch, sehr hoch.
6. На зависимую систему переходит максимальная потребность; многие объекты вместе могут создать больший ущерб.
7. Технические: MFA/шифрование; организационные: Richtlinie/Vier-Augen-Prinzip.
8. vermeiden, reduzieren, übertragen/teilen, akzeptieren.
9. `2 × 3 = 6` по заданной матрице.
10. Мера может снижать в основном вероятность; при успешной атаке потенциальный ущерб остаётся большим.
11. Sehr hoch, потому что недоступность может угрожать жизни и здоровью.
12. Неверно: частично передаётся финансовый ущерб, но операционные, правовые и репутационные риски остаются.

</details>

## 9. Quellen und Abgleich

- [BSI IT-Grundschutz-Kompendium](https://www.bsi.bund.de/grundschutz-kompendium) — цели, угрозы и требования IT-Grundschutz; актуальную редакцию нужно проверять заново.
- [BSI-Standard 200-2: IT-Grundschutz-Methodik](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Grundschutz/BSI_Standards/standard_200_2.html) — Schutzbedarfsfeststellung, моделирование и IT-Grundschutz-Check.
- [BSI-Standard 200-3: Risikomanagement](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Grundschutz/BSI_Standards/standard_200_3.html) — анализ и обработка риска.
- [FIAusbV § 9](https://www.gesetze-im-internet.de/fiausbv/__9.html) — настройка с учётом IT-Sicherheit, Datenschutz и Qualität.

## 10. Offene Prüfpunkte für den Unterricht

- Какую Risikomatrix и какие границы использует WBS?
- Проверяется ли Verteilungseffekt или достаточно Maximumprinzip?
- Какие BSI-Schadensszenarien требуется знать дословно?
