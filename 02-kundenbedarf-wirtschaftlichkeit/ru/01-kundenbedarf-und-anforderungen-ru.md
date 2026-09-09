---
pruefung: AP1
thema: Kundenbedarf und Anforderungen
prioritaet: Kern
status: Entwurf
stand: 2026-09-09
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/01-kundenbedarf-und-anforderungen-de.md
---

# AP1: Kundenbedarf и Anforderungen

Выявление потребности — начало экзаменационного сценария AP1. Нельзя качественно выбрать аппаратное и программное обеспечение, рассчитать стоимость или проверить результат, пока не выяснено, **какую проблему решает клиент и по каким критериям он примет решение**.

## 1. Lernziele

После изучения темы нужно уметь:

- различать `Bedürfnis`, `Bedarf` и `Nachfrage`;
- выявлять цели, пользователей, ограничения и заинтересованные стороны;
- выбирать подходящую `Erhebungstechnik`;
- использовать открытые, закрытые и уточняющие вопросы;
- отличать `funktionale` и `nichtfunktionale Anforderungen`;
- формулировать однозначные и проверяемые требования;
- отличать требование от преждевременно выбранного решения;
- приоритизировать требования;
- превращать пожелания клиента в `Abnahmekriterien`;
- документировать источник, приоритет и изменения требований.

---

## 2. Bedürfnis, Bedarf и Nachfrage

В экономическом контексте термины разграничиваются так:

| Термин | Значение | Пример |
|---|---|---|
| `Bedürfnis` | Общий недостаток или желание | Сотрудникам трудно работать вне офиса |
| `Bedarf` | Конкретизированная потребность, для которой имеются средства | Предприятие планирует приобрести 25 мобильных рабочих мест |
| `Nachfrage` | Потребность проявляется на рынке как намерение купить | Предприятие запрашивает предложения на 25 ноутбуков |

Классическая экономическая схема:

```text
Bedürfnis + Kaufkraft = Bedarf
Bedarf + Kaufentschluss = Nachfrage
```

В IT-задаче выражение `Kundenbedarf` часто используется шире: оно охватывает цели, задачи, ограничения и ожидания клиента.

### Экзаменационная логика

```text
Problem oder Bedürfnis
        ↓
Kundenbedarf ermitteln
        ↓
Anforderungen formulieren und priorisieren
        ↓
Lösungsvarianten vergleichen
        ↓
Lösung auswählen
        ↓
testen und abnehmen
```

Если начать с конкретного продукта, не выяснив потребность, можно выбрать технически хороший, но неподходящий вариант.

---

## 3. Сначала проблема и цель, потом продукт

Фраза клиента:

> „Wir brauchen schnellere Laptops.“

ещё не является достаточным требованием. За ней могут скрываться разные причины:

- слишком мало оперативной памяти;
- медленный сетевой доступ;
- плохо настроенное приложение;
- недостаточная скорость сервера;
- старый накопитель;
- слишком много фоновых процессов;
- неудобный рабочий процесс;
- субъективное ощущение без измеренного показателя.

До предложения решения необходимо выяснить:

1. какие задачи выполняются;
2. где возникает проблема;
3. кого она затрагивает;
4. как измеряется текущее состояние;
5. какой результат считается достаточным;
6. какие ограничения нельзя нарушить.

> Eine Produktvorgabe ist noch keine vollständige Anforderung. Zuerst müssen Problem, Ziel, Nutzungskontext und Randbedingungen geklärt werden.

---

## 4. Stakeholder и Zielgruppen

`Stakeholder` — лицо или группа, которые влияют на решение, используют его, оплачивают его или затронуты его последствиями.

Типичные группы:

| Stakeholder | Интерес и информация |
|---|---|
| `Auftraggeber/Geschäftsleitung` | Nutzen, Kosten, Termine, Risiken, Wirtschaftlichkeit |
| `Anwender` | Arbeitsablauf, Bedienbarkeit, Geschwindigkeit, Barrierefreiheit |
| `IT-Administration` | Kompatibilität, Sicherheit, Verwaltung, Support, Schnittstellen |
| `Datenschutzbeauftragter` | Rechtsgrundlage, Datenminimierung, TOM, Löschung |
| `Informationssicherheitsbeauftragter` | Schutzbedarf, Bedrohungen, technische und organisatorische Maßnahmen |
| `Einkauf` | Anbieter, Konditionen, Lieferzeit, Gewährleistung |
| `Betriebsrat` | Interessen der Beschäftigten, insbesondere bei Überwachung oder Leistungsdaten |
| `Support` | Wartbarkeit, Diagnose, Ersatzteile, Dokumentation |

Одного интервью с руководителем часто недостаточно: он знает бюджет и бизнес-цель, но не обязательно детали ежедневной работы.

### Zielgruppengerechte Kommunikation

Информация адаптируется к аудитории:

- Geschäftsleitung: польза, затраты, риски и решение;
- IT-Fachpersonal: архитектура, протоколы, интерфейсы и условия эксплуатации;
- Anwender: действия, понятные термины, примеры и помощь при ошибках;
- Personen mit Einschränkungen: доступный формат, достаточный контраст, альтернативные способы ввода и восприятия.

Адаптация языка не означает скрывать важные риски. Технический термин можно объяснить простыми словами и затем назвать точно.

---

## 5. Ablauf der Bedarfsermittlung

Практический процесс:

### 5.1 Auftrag klären

- Кто является заказчиком?
- Какой результат ожидается?
- Каковы границы исследования?
- Кто принимает окончательное решение?
- Когда требуется результат?

### 5.2 Ist-Zustand erfassen

- текущие устройства, программы и версии;
- рабочие процессы;
- количество пользователей и мест;
- производительность и ошибки;
- существующие договоры, лицензии и стандарты;
- сеть, серверы и внешние зависимости;
- фактические затраты и поддержка.

### 5.3 Soll-Zustand definieren

- бизнес-цель;
- ожидаемые функции;
- измеримые показатели;
- требования безопасности и защиты данных;
- ожидаемая доступность;
- критерии удобства и доступности;
- срок и бюджет.

### 5.4 Abweichung analysieren

```text
Soll-Zustand − Ist-Zustand = Handlungsbedarf
```

Разница между текущим и желаемым состоянием определяет, что действительно нужно изменить.

### 5.5 Anforderungen dokumentieren

Каждому требованию назначаются идентификатор, источник, приоритет и критерий проверки.

### 5.6 Abstimmen und freigeben

Участники проверяют:

- правильно ли понята потребность;
- нет ли противоречий;
- реалистичны ли требования;
- кто утверждает изменения;
- какие критерии обязательны для приёмки.

---

## 6. Erhebungstechniken

Метод выбирается по типу информации, числу участников и доступному времени.

| Метод | Когда полезен | Сильная сторона | Ограничение |
|---|---|---|---|
| `Interview` | Нужны подробные ответы отдельного эксперта | Можно уточнять и исследовать причины | Требует времени; возможна субъективность |
| `Workshop` | Нужно согласовать несколько групп | Быстро выявляет конфликты и создаёт общее понимание | Доминирующие участники могут влиять на результат |
| `Beobachtung` | Реальный процесс отличается от описанного | Показывает фактическую работу и обходные решения | Наблюдение может изменить поведение |
| `Dokumentenanalyse` | Есть регламенты, договоры, Tickets или старая документация | Даёт проверяемые исходные сведения | Документы могут быть устаревшими |
| `Fragebogen` | Много распределённых пользователей | Быстро собирает сравнимые ответы | Мало возможностей для уточнения |
| `Prototyp/Mock-up` | Требования к интерфейсу ещё неясны | Делает идеи видимыми и вызывает конкретную обратную связь | Прототип могут ошибочно принять за почти готовый продукт |
| `Auswertung von Tickets/Kennzahlen` | Нужно установить частоту проблем и фактическую нагрузку | Использует реальные данные | Данные могут быть неполными или неправильно классифицированными |
| `Schnittstellenanalyse` | Решение взаимодействует с другими системами | Выявляет форматы, протоколы и зависимости | Не раскрывает все потребности пользователей |

Для серьёзной задачи методы комбинируются. Например: анализ Tickets показывает частоту ошибок, наблюдение раскрывает рабочий процесс, а Workshop согласует будущий вариант.

---

## 7. Fragetechniken

### 7.1 Offene Fragen

Позволяют отвечать свободно и раскрывают неизвестную информацию.

Примеры:

> Welche Aufgaben bearbeiten Sie mit dem Gerät?

> Welche Probleme treten im aktuellen Ablauf auf?

> Woran würden Sie erkennen, dass die neue Lösung erfolgreich ist?

### 7.2 Geschlossene Fragen

Предполагают короткий или однозначный ответ. Полезны для подтверждения.

> Muss das Gerät über einen integrierten Mobilfunkzugang verfügen?

> Werden mehr als zwei externe Monitore angeschlossen?

Если задавать только закрытые вопросы, легко пропустить неизвестные потребности.

### 7.3 Alternativfragen

Предлагают ограниченный выбор:

> Soll die Anmeldung über Smartcard oder Authenticator-App erfolgen?

Они полезны, если допустимые варианты уже установлены. Иначе вопрос преждевременно ограничивает решение.

### 7.4 Skalierungsfragen

Помогают оценить степень:

> Wie wichtig ist eine Akkulaufzeit von mindestens acht Stunden auf einer Skala von 1 bis 5?

Шкала должна быть одинаково объяснена всем участникам.

### 7.5 Kontroll- und Rückfragen

Проверяют понимание:

> Habe ich Sie richtig verstanden, dass alle Geräte offline mindestens vier Stunden arbeitsfähig sein müssen?

### 7.6 Suggestivfragen

Подталкивают к желаемому ответу:

> Sie möchten doch sicher das leistungsstärkste Modell, oder?

Такие вопросы искажают выявление потребности и должны избегаться.

---

## 8. Aktives Zuhören

`Aktives Zuhören` снижает риск ложных предположений.

Основные действия:

- дать человеку закончить мысль;
- задавать уточняющие вопросы;
- перефразировать — `paraphrasieren`;
- резюмировать — `zusammenfassen`;
- отделять факт от интерпретации;
- документировать открытые вопросы;
- в конце согласовать результат разговора.

Пример:

> Wenn ich Sie richtig verstanden habe, arbeiten 25 Außendienstmitarbeiter regelmäßig ohne Steckdose. Deshalb ist eine gemessene Akkulaufzeit von mindestens acht Stunden ein Muss-Kriterium. Ist das korrekt?

Здесь пожелание преобразуется в число, область применения и приоритет.

---

## 9. Arten von Anforderungen

### 9.1 Funktionale Anforderungen

Описывают, **что система должна делать**.

> Das System muss Benutzern ermöglichen, Rechnungen als PDF zu exportieren.

### 9.2 Nichtfunktionale Anforderungen

Описывают качество или условия выполнения функции.

Категории:

- `Performance` — время ответа, пропускная способность;
- `Verfügbarkeit` — допустимое время простоя;
- `Sicherheit` — аутентификация, права, шифрование;
- `Benutzbarkeit` — понятность и эффективность использования;
- `Barrierefreiheit` — использование людьми с ограничениями;
- `Kompatibilität` — ОС, форматы, интерфейсы;
- `Wartbarkeit` — диагностика, обновления, замена;
- `Skalierbarkeit` — рост пользователей и нагрузки;
- `Zuverlässigkeit` — устойчивость и частота ошибок;
- `Energieeffizienz` — энергопотребление и режимы ожидания.

Требования безопасности могут быть как функциональными, так и нефункциональными. Например, автоматическая блокировка учётной записи описывает поведение системы и является функциональным требованием. Требование к стойкости шифрования или допустимому уровню риска описывает качество защиты и обычно относится к нефункциональным требованиям.

Плохая формулировка:

> Die Anwendung muss schnell sein.

Проверяемая формулировка:

> Die Suchergebnisse müssen bei 200 gleichzeitigen Benutzern in mindestens 95 Prozent der Anfragen innerhalb von zwei Sekunden angezeigt werden.

### 9.3 Randbedingungen

Ограничивают возможные решения:

- максимальный бюджет;
- дата ввода;
- обязательная Betriebssystemversion;
- существующий Rahmenvertrag;
- внутренний Sicherheitsstandard;
- доступная площадь или электропитание;
- правовые и лицензионные требования.

### 9.4 Übergangsanforderungen

Нужны для перехода от старого состояния к новому:

- миграция данных;
- обучение;
- параллельная эксплуатация;
- Rollback;
- вывод старого оборудования;
- временные Schnittstellen.

После завершения перехода такие требования могут потерять актуальность, но во время проекта они критичны.

---

## 10. Требование или решение?

Хорошее требование по возможности описывает необходимый результат, не ограничивая выбор без причины.

Преждевременное решение:

> Es müssen Notebooks des Modells X gekauft werden.

Возможное требование:

> Die Geräte müssen die freigegebene CAD-Anwendung bei den definierten Testdaten ohne kritische Fehler ausführen und mindestens acht Stunden mobilen Betrieb ermöglichen.

Конкретный продукт допустим как ограничение, если есть обоснование:

- совместимость с существующей инфраструктурой;
- Rahmenvertrag;
- стандартизация поддержки;
- обязательная сертификация;
- экономически доказанное преимущество.

> Die Festlegung auf ein konkretes Produkt ist nur dann bedarfsgerecht, wenn sie aus einer nachvollziehbaren Anforderung oder Randbedingung folgt.

---

## 11. Qualitätsmerkmale guter Anforderungen

| Критерий | Смысл | Проверка |
|---|---|---|
| `eindeutig` | Только одно разумное толкование | Все понимают одинаково? |
| `vollständig` | Есть необходимые условия и результат | Не отсутствует важное ограничение? |
| `widerspruchsfrei` | Не конфликтует с другими требованиями | Возможно ли выполнить требования вместе? |
| `notwendig` | Поддерживает реальную цель | Что произойдёт, если убрать требование? |
| `realisierbar` | Выполнимо технически, экономически и по сроку | Есть ресурсы и технология? |
| `prüfbar` | Есть объективный тест или доказательство | Как будет проведена Abnahme? |
| `priorisiert` | Известна важность | Что обязательно, а что можно отложить? |
| `atomar` | Описывает одну основную потребность | Можно ли проверить требование одним решением? |
| `nachverfolgbar` | Известны источник и связанные элементы | Кто запросил и каким тестом проверяется? |
| `verständlich` | Подходит адресатам | Понятно ли Fachbereich и IT? |

Слова `schnell`, `modern`, `benutzerfreundlich`, `sicher` и `kostengünstig` без измеримого уточнения обычно недостаточны.

---

## 12. Aufbau einer Anforderung

Практический шаблон:

```text
ID:
Titel:
Quelle/Stakeholder:
Anforderung:
Begründung/Ziel:
Priorität:
Akzeptanzkriterium:
Abhängigkeiten:
Status:
```

Пример:

| Поле | Содержание |
|---|---|
| ID | NFA-07 |
| Titel | Akkulaufzeit |
| Quelle | Außendienstleitung |
| Anforderung | Jedes Notebook muss im standardisierten Office-Test mindestens acht Stunden ohne Netzteil arbeiten. |
| Begründung | Ganztägige Kundentermine ohne sicheren Zugang zu Steckdosen |
| Priorität | Muss |
| Akzeptanzkriterium | Test mit freigegebenem Image, WLAN aktiv, Bildschirmhelligkeit 60 %, Laufzeit ≥ 8 h |
| Abhängigkeit | Auswahl des Akkus und Energiesparprofils |
| Status | freigegeben |

Обоснование помогает позже оценить альтернативу: если цель достигается иным способом, решение можно изменить, не теряя потребность.

---

## 13. Приоритизация

### 13.1 Muss, Soll и Kann

| Приоритет | Значение |
|---|---|
| `Muss` | Без выполнения решение не принимается или не может использоваться |
| `Soll` | Высокая ценность; отклонение требует обоснования |
| `Kann` | Дополнительная польза, реализуется при наличии ресурсов |

`Muss` не означает «клиент очень хочет». Оно должно иметь объективное обоснование: закон, безопасность, ключевой процесс или обязательный интерфейс.

### 13.2 MoSCoW

| Категория | Значение |
|---|---|
| `Must have` | Обязательно для согласованного результата |
| `Should have` | Важно, но временно возможно обойти |
| `Could have` | Желательно при наличии времени и бюджета |
| `Won't have this time` | Осознанно не входит в текущий Umfang |

Категория `Won't` не означает «никогда». Она защищает текущие сроки и бюджет от скрытого расширения `Scope Creep`.

### 13.3 Приоритет и Angebotsvergleich

Сначала проверяются `Muss-Kriterien`. Предложение, не выполняющее обязательный критерий, может быть исключено независимо от низкой цены.

Оставшиеся предложения сравниваются по цене и взвешенным `Soll-/Kann-Kriterien`, например с помощью `Nutzwertanalyse`.

---

## 14. Lastenheft

`Lastenheft` описывает требования заказчика: **что** требуется и **для чего**.

Типичное содержание:

- исходная ситуация;
- цель;
- область применения;
- Stakeholder и Zielgruppen;
- функциональные требования;
- нефункциональные требования;
- обязательные ограничения;
- объём поставки и границы;
- критерии приёмки;
- сроки и бюджетные рамки;
- определения и приложения.

`Pflichtenheft` исполнителя позднее описывает, **как** и **чем** эти требования будут реализованы.

Важно: названия и степень детализации документов зависят от организации и договора. Содержание и ответственность важнее слепой привязки к названию.

---

## 15. Akzeptanzkriterien и Abnahme

`Akzeptanzkriterium` определяет наблюдаемое условие, при котором требование считается выполненным.

Плохо:

> Der Rechner funktioniert zuverlässig.

Лучше:

> Der Rechner durchläuft den festgelegten 60-minütigen Belastungstest ohne Absturz; im Ereignisprotokoll treten keine kritischen Fehler auf.

Хороший критерий содержит:

- объект проверки;
- исходные условия;
- действие или нагрузку;
- ожидаемый результат;
- измеряемую границу;
- при необходимости метод и доказательство.

### Given-When-Then

Для поведения системы можно использовать:

```text
Gegeben sei ...
Wenn ...
Dann ...
```

Пример:

> Gegeben sei ein gesperrtes Benutzerkonto. Wenn sich der Benutzer mit dem korrekten Passwort anmeldet, dann wird der Zugriff verweigert und der Versuch protokolliert.

---

## 16. Anforderungsmatrix и Nachverfolgbarkeit

Простая матрица связывает требование с источником, решением и тестом:

| ID | Quelle | Anforderung | Umsetzung | Testfall | Status |
|---|---|---|---|---|---|
| FR-01 | Buchhaltung | PDF-Export | Modul Export | T-01 | bestanden |
| NFA-02 | IT-Sicherheit | MFA | Identity Provider | T-07 | offen |
| NFA-03 | Außendienst | 8 h Akku | Gerät + Energieprofil | T-12 | bestanden |

Преимущества:

- видно, не забыто ли требование;
- изменение можно проследить до тестов и документации;
- приёмка опирается на согласованные критерии;
- легче оценить влияние `Change Request`.

---

## 17. Umgang mit Änderungen und Konflikten

Требования могут конфликтовать:

- высокая производительность против низкого энергопотребления;
- строгая безопасность против удобства;
- минимальная цена против долгой гарантии;
- быстрый срок против широкого объёма.

Нужно:

1. явно документировать конфликт;
2. определить затронутых Stakeholder;
3. оценить влияние на время, стоимость, качество и риск;
4. предложить альтернативы;
5. получить решение уполномоченного лица;
6. обновить требования, план и тесты.

Изменение после Freigabe не следует вносить незаметно. Оно проходит согласованный `Änderungsprozess`.

---

## 18. Durchgängiges Praxisbeispiel

### Ausgangssituation

Предприятие хочет оборудовать 25 сотрудников Außendienst мобильными рабочими местами. Руководитель говорит: «Нужны хорошие и безопасные ноутбуки».

### Geeignete Rückfragen

1. Какие приложения используются и какова их техническая нагрузка?
2. Нужен ли доступ к персональным данным клиентов?
3. Как долго устройство работает без электросети?
4. Есть ли утверждённые Betriebssysteme и приложения?
5. Какие периферийные устройства подключаются?
6. Как выполняется вход в корпоративную сеть?
7. Каковы бюджет, дата поставки и ожидаемый срок использования?
8. Какие требования к весу, экрану и доступности?
9. Как будет выполняться удалённая поддержка?
10. Что считается успешной приёмкой?

### Из пожелания в требования

| ID | Тип | Требование | Приоритет |
|---|---|---|---|
| FR-01 | funktional | Das Gerät muss einen verschlüsselten VPN-Zugang zum Unternehmensnetz ermöglichen. | Muss |
| NFA-01 | Sicherheit | Die lokale Systempartition muss vollständig verschlüsselt sein. | Muss |
| NFA-02 | Authentisierung | Der Fernzugriff muss mit zwei unterschiedlichen Faktoren abgesichert sein. | Muss |
| NFA-03 | Mobilität | Das Gesamtgewicht einschließlich Netzteil darf 1,8 kg nicht überschreiten. | Soll |
| NFA-04 | Laufzeit | Das Gerät muss im festgelegten Nutzungstest mindestens acht Stunden Akkulaufzeit erreichen. | Muss |
| RB-01 | Randbedingung | Pro Arbeitsplatz dürfen die Beschaffungskosten 1.600 Euro netto nicht überschreiten. | Muss |
| RB-02 | Termin | Alle abgenommenen Geräte müssen bis zum 30.11.2026 bereitstehen. | Muss |
| TR-01 | Übergang | Vor Übergabe müssen die vorhandenen Benutzerdaten nach Freigabe migriert werden. | Soll |

### Проверка

Эти требования позволяют:

- исключить неподходящие Angebote по Muss-Kriterien;
- сравнить оставшиеся решения;
- спланировать настройку;
- подготовить Testfälle;
- выполнить документированную Abnahme.

---

## 19. Prüfungsformulierungen

### Offene Frage begründen

> Eine offene Frage ist geeignet, weil der Kunde seine Arbeitsabläufe und Probleme frei beschreiben kann und dadurch bisher unbekannte Anforderungen erkennbar werden.

### Funktional und nichtfunktional unterscheiden

> Die Exportfunktion ist eine funktionale Anforderung, weil sie beschreibt, was das System leisten soll. Die maximale Antwortzeit ist eine nichtfunktionale Anforderung, weil sie die Qualität der Ausführung festlegt.

### Unklare Anforderung verbessern

> Die Formulierung „Das System muss schnell sein“ ist nicht prüfbar. Stattdessen sollte eine maximale Antwortzeit unter einer definierten Last angegeben werden.

### Produktvorgabe bewerten

> Die Festlegung auf Modell X ist ohne weitere Begründung nicht bedarfsgerecht, weil sie mögliche Alternativen vor der Ermittlung der fachlichen und technischen Anforderungen ausschließt.

### Lastenheft erklären

> Das Lastenheft beschreibt aus Sicht des Auftraggebers, was benötigt wird und welche Ziele, Anforderungen und Randbedingungen einzuhalten sind.

### Muss-Kriterium anwenden

> Angebot B ist auszuschließen, weil es das Muss-Kriterium einer Akkulaufzeit von mindestens acht Stunden nicht erfüllt.

---

## 20. Typische Prüfungsfallen

1. Клиентское пожелание не равно проверяемому требованию.
2. `Bedürfnis`, `Bedarf` и `Nachfrage` нельзя использовать как полные синонимы.
3. Начинать с конкретного продукта до анализа потребности рискованно.
4. Открытые вопросы получают информацию; закрытые подтверждают конкретные детали.
5. `Suggestivfrage` искажает ответ.
6. `funktional` означает функцию, а не «важно».
7. Производительность, безопасность и доступность обычно являются нефункциональными требованиями.
8. Ограничение бюджета — `Randbedingung`, а не функция системы.
9. `Muss` требует обоснования и не означает просто высокий Wunsch.
10. Низкая цена не компенсирует невыполненное Muss-Kriterium.
11. `Lastenheft` описывает требуемое, `Pflichtenheft` — реализацию.
12. «Schnell», «sicher» и «benutzerfreundlich» без показателей не проверяются.
13. Требование без Testfall трудно надёжно принять.
14. Изменение требования влияет на план, стоимость, тесты и документацию.
15. Технически правильный ответ может быть неверным, если он не учитывает Zielgruppe.

---

## 21. Selbsttest

### A. Begriffe

1. Объясни различие между `Bedürfnis`, `Bedarf` и `Nachfrage`.
2. Назови четыре возможных Stakeholder при внедрении нового рабочего места.
3. Чем открытый вопрос отличается от закрытого?
4. Назови три `Erhebungstechniken` и по одному преимуществу каждой.
5. Чем функциональное требование отличается от нефункционального?

### B. Anforderungen verbessern

6. Улучши требование: „Der Laptop muss leicht sein.“
7. Улучши требование: „Die Anwendung muss sicher sein.“
8. Оцени формулировку: „Es muss das Notebook SuperBook Z gekauft werden.“
9. Сформулируй Akzeptanzkriterium для автоматической блокировки экрана.

### C. Fall

Новая система видеоконференций предназначена для 40 сотрудников. Требуются простое управление, участие внешних партнёров, защита служебных разговоров и стоимость не более 12 000 Euro.

10. Сформулируй две открытые Rückfragen.
11. Сформулируй две функциональные Anforderungen.
12. Сформулируй три нефункциональные Anforderungen.
13. Назови одно Muss- и одно Soll-Kriterium с обоснованием.
14. Объясни, как проверить одно из требований.

<details>
<summary>Показать решения</summary>

1. Bedürfnis — общий недостаток или желание; Bedarf — конкретизированная и обеспеченная средствами потребность; Nachfrage — её проявление на рынке.
2. Например: Auftraggeber, Anwender, IT-Administration, Einkauf, Datenschutzbeauftragter, Betriebsrat или Support.
3. Открытый вопрос позволяет свободный развёрнутый ответ; закрытый ограничивает ответ и полезен для подтверждения.
4. Например: Interview — уточнение; Beobachtung — фактический процесс; Workshop — согласование нескольких групп.
5. Функциональное описывает, что система делает; нефункциональное — насколько хорошо или при каких условиях.
6. Например: `Das Gesamtgewicht des Notebooks einschließlich Netzteil darf 1,8 kg nicht überschreiten.`
7. Например: `Nach fünf aufeinanderfolgenden Fehlanmeldungen muss das Benutzerkonto für 15 Minuten gesperrt und das Ereignis protokolliert werden.`
8. Это преждевременная Produktvorgabe, если модель не вытекает из обоснованного ограничения.
9. Например: `Nach fünf Minuten ohne Benutzereingabe muss der Bildschirm automatisch gesperrt werden; eine erneute Nutzung ist erst nach erfolgreicher Authentisierung möglich.`
10. Например: `Wie arbeiten die Beschäftigten heute mit externen Partnern zusammen?` и `Welche Probleme treten bei aktuellen Besprechungen auf?`
11. Например: планирование конференции; приглашение внешних участников через временную ссылку.
12. Например: Transportverschlüsselung; управление без Schulung максимум за определённое время; поддержка 40 одновременных участников.
13. Muss: шифрование, потому что обсуждается служебная информация. Soll: интеграция с календарём, если есть допустимый обходной процесс.
14. Например: провести Testkonferenz с 40 участниками, измерить соединение и проверить протокол ошибок по установленным критериям.

</details>

---

## 22. Quellen und Abgleich

- [FIAusbV § 9 – Prüfungsbereich von Teil 1](https://www.gesetze-im-internet.de/fiausbv/__9.html)
- [IREB CPRE – Downloads und Ressourcen](https://cpre.ireb.org/de/downloads-und-resources/downloads)
- [U-Form: Prüfungskatalog FIAE, gültig für AP1 ab Frühjahr 2025](https://www.u-form-shop.de/ihk-pruefungen/pruefungskataloge-abschlusspruefung/fachinformatiker-fachinformatikerin-anwendungsentwicklung-pruefungskatalog-fuer-die-ihk-abschlusspruefung-1)

Тема в AP1 должна изучаться с точки зрения практического сценария выбора и настройки рабочего места. Более формальное Requirements Engineering здесь используется для углубления и повышения качества ответов, а не как требование воспроизводить полный CPRE-курс.

## 23. Offene Prüfpunkte für den Unterricht

- Использует ли WBS схему `Muss/Soll/Kann` или `MoSCoW`?
- Как преподаватель разграничивает `Bedarf` и `Anforderung` в экзаменационных заданиях?
- Требуется ли в AP1 знать структуру полного `Lastenheft` или только различие с `Pflichtenheft`?
- Какие Qualitätsmerkmale Anforderungen ожидаются в формулировках WBS?
