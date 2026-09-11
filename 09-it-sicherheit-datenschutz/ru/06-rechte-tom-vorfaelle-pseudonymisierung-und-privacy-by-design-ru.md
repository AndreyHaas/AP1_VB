---
pruefung: AP1
thema: Datenschutzmaßnahmen und Betroffenenrechte
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Russisch
gegenstueck: ../de/06-rechte-tom-vorfaelle-pseudonymisierung-und-privacy-by-design-de.md
---

# Защита данных: права, TOM, инциденты, псевдонимизация и Privacy by Design

## 1. Lernziele

Ты умеешь:

- различать права субъектов и применять их к ситуации;
- разграничивать Widerruf, Widerspruch, Löschung и Einschränkung;
- выбирать технические и организационные меры по риску;
- различать Zutritts-, Zugangs-, Zugriffs-, Übertragungs-, Eingabe- и Verfügbarkeitskontrolle;
- распознавать, сдерживать, документировать и эскалировать Datenschutzverletzung;
- объяснять пути сообщения и пороги риска Art. 33/34 DSGVO;
- надёжно различать Pseudonymisierung и Anonymisierung;
- переводить Privacy by Design и Privacy by Default в требования;
- тестировать и доказывать эффективность TOM.

## 2. Prüfungsminimum — 15 Minuten

1. Права включают Information, Auskunft, Berichtigung, Löschung, Einschränkung, Datenübertragbarkeit, Widerspruch, Widerruf, Beschwerde и защиту при отдельных автоматизированных решениях.
2. Права не абсолютны: проверяются личность, условия и законные исключения.
3. Запрос обрабатывается без задержки и обычно в течение месяца; допустимое продление сообщается с причиной.
4. TOM должны соответствовать риску, а эффективность — регулярно проверяться.
5. Zutritt = помещение, Zugang = IT-система, Zugriff = данные/функции.
6. Datenschutzverletzung включает потерю, уничтожение, изменение, раскрытие или незаконный доступ.
7. Auftragsverarbeiter немедленно сообщает Verantwortlicher; тот документирует каждый случай.
8. Риск → орган обычно по возможности за 72 часа; высокий риск → дополнительно субъекты без задержки, если нет исключения.
9. Псевдонимизированные данные остаются персональными; действительно анонимные разумными средствами не связываются с человеком.
10. Design встраивает защиту в архитектуру/цикл; Default задаёт безопасные исходные настройки.

> Der Vorfall wird unabhängig von einer möglichen Meldepflicht intern dokumentiert, damit Bewertung, Maßnahmen und Entscheidung nachgewiesen werden können.

## 3. Betroffenenrechte und TOM

### 3.1 Права

| Право | Цель | Пример |
|---|---|---|
| Information | прозрачная информация о сборе/обработке | Datenschutzhinweis |
| Auskunft | узнать, обрабатываются ли и какие данные | копия и сведения |
| Berichtigung | исправить неверное/неполное | адрес |
| Löschung | удалить при выполнении условий | цель отпала |
| Einschränkung | временно ограничить обработку | проверяется точность |
| Datenübertragbarkeit | получить/передать отдельные данные структурированно | смена поставщика |
| Widerspruch | возразить против определённой обработки | Direktwerbung |
| Widerruf | отозвать Einwilligung на будущее | Newsletter |
| Beschwerde | обратиться в Aufsichtsbehörde | предполагаемое нарушение |
| automatisierte Entscheidung | защита при отдельных исключительно автоматических решениях | существенное влияние на договор |

Перед выполнением может понадобиться соразмерная проверка личности. Но для неё нельзя без причины собирать ещё больше данных.

### 3.2 Widerruf, Widerspruch и Löschung

```text
Widerruf     → касается Einwilligung; действует на будущее
Widerspruch  → против определённой иной обработки
Löschung     → удаление при условиях и отсутствии исключения
Einschränkung → данные остаются, обработка ограничена
```

Законная Aufbewahrungspflicht может мешать немедленному удалению. Тогда данные блокируют для иных целей и удаляют после срока.

### 3.3 TOM по Art. 32

Выбор учитывает риск, Stand der Technik, стоимость, вид, объём, обстоятельства и цели. Art. 32 называет:

- Pseudonymisierung и Verschlüsselung;
- постоянную Vertraulichkeit, Integrität, Verfügbarkeit и Belastbarkeit;
- своевременное восстановление после инцидента;
- регулярную проверку и оценку эффективности.

### 3.4 Классические виды контроля

| Контроль | Защищает | Пример |
|---|---|---|
| Zutrittskontrolle | физические помещения | карта серверной |
| Zugangskontrolle | использование системы | MFA, блокировка аккаунта |
| Zugriffskontrolle | конкретные данные/функции | RBAC, Least Privilege |
| Weitergabe-/Übertragungskontrolle | передачу данных | TLS, проверка получателя, протокол |
| Eingabekontrolle | отслеживание изменений | Audit-Log с пользователем/временем |
| Verfügbarkeitskontrolle | отказ и потерю | Backup, резерв, Restore-Test |
| Trennungsgebot | цели/клиентов | логическое разделение Mandanten |

Это распространённая систематика, а не дословная структура Art. 32. В ответе связывай меру, риск и защитный эффект.

## 4. Datenschutzverletzung, Pseudonymisierung und Privacy

### 4.1 Что такое Datenschutzverletzung?

Нарушение безопасности случайно или незаконно приводит к уничтожению, потере, изменению, раскрытию или несанкционированному доступу к персональным данным.

Примеры:

- письмо с данными персонала ушло не тому;
- потерян незашифрованный носитель;
- Ransomware сделала данные пациентов недоступными;
- неуполномоченно изменена запись клиента;
- открытая Cloudfreigabe базы данных.


### 4.2 Реакция

1. Сдержать дальнейший ущерб и сохранить доказательства.
2. Немедленно известить внутренние ответственные роли.
3. Установить вид, объём, данные, людей и последствия.
4. Оценить защитные меры и идентифицируемость.
5. Определить риск для прав и свобод.
6. Документировать решение, причины, факты и меры.
7. Выполнить обязательные сообщения в срок.
8. Устранить причину, помочь людям и проверить эффективность.

```text
Auftragsverarbeiter → unverzüglich Verantwortlichen informieren
нет ожидаемого риска → документировать, обычно без сообщения органу
риск → Aufsichtsbehörde möglichst binnen 72 Stunden ab Bekanntwerden
высокий риск → дополнительно Betroffene unverzüglich, если нет исключения
```

Если через 72 часа информации недостаточно, сообщение может дополняться поэтапно, а задержка обосновывается. Срок не повод откладывать сдерживание.

### 4.3 Pseudonymisierung и Anonymisierung

`Pseudonymisierung`: прямые признаки заменены; отдельная Zusatzinformation позволяет восстановить связь. DSGVO продолжает действовать.

`Anonymisierung`: связь разумно применимыми средствами больше невозможна. Только тогда отсутствует Personenbezug.

```text
имя → Studien-ID; отдельный ключ есть → pseudonymisiert
имя удалено, уникальная E-Mail осталась → не anonym
сильно агрегированная статистика        → может быть anonym
```

Малые группы, редкие признаки и внешние базы повышают Re-Identifizierungsrisiko.

### 4.4 Privacy by Design и Default

`Privacy by Design`: встроить защиту в планирование, архитектуру, разработку, эксплуатацию и удаление.

`Privacy by Default`: без действий пользователя включены только необходимые данные, доступ, видимость и срок.

Примеры:

- построить RBAC и Löschlauf как требования продукта;
- профиль по умолчанию не публичный;
- Standortzugriff выключен;
- минимальные Logs и технически ограниченный срок;
- тестовые данные псевдонимизированы, продуктивные не копируются.

## 5. Anwendungsfall: ошибочная отправка Personalliste

Незашифрованная таблица с именами, домашними адресами, зарплатой и отсутствиями 120 сотрудников отправлена внешнему неверному получателю. Через 40 минут он подтвердил удаление.

### 5.1 Оценка

```text
Art:       нарушение Vertraulichkeit
Daten:     идентичность, контакты, зарплата, возможная связь со здоровьем
Umfang:    120 Beschäftigte
Schutz:    без шифрования; получатель имел доступ
Folgen:    финансовый/социальный ущерб, огласка, злоупотребление
Minderung: подтверждение снижает риск, но не исключает копирование автоматически
```

Риск вероятен; из-за чувствительности и объёма серьёзно проверяется высокий риск. Решение принимает Verantwortlicher по документированным фактам, не один отправитель.

### 5.2 Срочные меры и TOM

- потребовать не использовать/удалить через известный канал и сохранить подтверждение;
- активировать Datenschutz-, Sicherheits- и Verantwortlichenprozess;
- сохранить Übermittlungslogs и версию файла;
- оценить и подготовить сообщения органу/субъектам;
- улучшить выбор получателя, предупреждение и Freigabeprozess;
- шифровать чувствительный экспорт и отдельно проверять адресата;
- минимизировать экспорт, применить DLP/Schutzkennzeichnung;
- проверить эффективность тестами Fehlversand.

### 5.3 Privacy-Anforderung

> Der Export enthält standardmäßig nur Name und Personalnummer; Gehalt und Fehlzeiten werden nur nach zusätzlicher rollenbasierter Auswahl und dokumentierter Freigabe aufgenommen.

Здесь соединены Default, Datenminimierung, Zugriffskontrolle и Nachweisbarkeit.

## 6. Prüfungsformulierungen

> Der Widerruf beendet die auf Einwilligung beruhende Verarbeitung für die Zukunft, berührt jedoch nicht automatisch die Rechtmäßigkeit der bisherigen Verarbeitung.

> Die Pseudonymisierung hebt den Personenbezug nicht auf, weil die Zuordnung mithilfe der getrennten Zusatzinformationen weiterhin möglich ist.

> Die Aufsichtsbehörde wird bei bestehendem Risiko möglichst binnen 72 Stunden informiert; bei voraussichtlich hohem Risiko werden grundsätzlich zusätzlich die betroffenen Personen unverzüglich benachrichtigt.

> Die Wirksamkeit der Zugriffskontrolle wird durch Positiv- und Negativtests geprüft, da eine dokumentierte Rollenmatrix allein keine korrekte technische Umsetzung beweist.

## 7. Typische Prüfungsfallen

- Представлять права абсолютными и без проверки личности.
- Путать Widerruf и Widerspruch.
- Обещать немедленную Löschung вопреки срокам хранения.
- Путать Zutritt, Zugang и Zugriff.
- Считать TOM одинаковым фиксированным списком для всех.
- Считать инцидентом только нарушение конфиденциальности.
- Называть 72 часа сроком Auftragsverarbeiter или сообщения субъектам.
- Сообщать Betroffene при любом малом случае.
- Считать подтверждение удаления автоматическим отсутствием риска.
- Путать Pseudonymisierung и Anonymisierung.
- Удалить имя и объявить данные анонимными.
- Считать Privacy by Default опцией глубоко в меню.

## 8. Selbsttest

1. Назови восемь Betroffenenrechte.
2. Различи Widerruf и Widerspruch.
3. Каков обычный срок ответа на запрос?
4. Назови четыре цели Art. 32.
5. Соотнеси карту серверной, MFA, роли и Audit-Log.
6. Определи Datenschutzverletzung.
7. Кто кому сообщает, если Hoster обнаружил случай?
8. Когда сообщают органу и субъектам?
9. Различи Pseudonymisierung и Anonymisierung.
10. Объясни Privacy by Design и Default.
11. Назови четыре срочные меры при Fehlversand.
12. Почему Restore-Test — datenschutzrelevante TOM?

<details>
<summary>Lösungen anzeigen</summary>

1. Information, Auskunft, Berichtigung, Löschung, Einschränkung, Übertragbarkeit, Widerspruch, Widerruf, Beschwerde, automatisierte Entscheidungen; восемь достаточно.
2. Widerruf прекращает согласие на будущее; Widerspruch направлен против определённой иной обработки.
3. без задержки и обычно месяц; возможно продление при условиях и уведомлении.
4. Pseudonymisierung/Verschlüsselung, постоянные CIA/Belastbarkeit, восстановление, проверка эффективности.
5. Zutritt, Zugang, Zugriff, Eingabekontrolle.
6. Нарушение с уничтожением, потерей, изменением, раскрытием или доступом к персональным данным.
7. Auftragsverarbeiter немедленно информирует Verantwortlicher.
8. Риск: орган по возможности за 72 часа; высокий риск: обычно дополнительно субъекты без задержки.
9. Связь возможна по Zusatzwissen и DSGVO действует; разумными средствами связи больше нет.
10. встроить в архитектуру/цикл; задать безопасные исходные настройки.
11. сдержать, сообщить внутри, сохранить факты/Logs, оценить риск, связаться с получателем, подготовить Meldung; четыре достаточно.
12. Он доказывает своевременное восстановление и доступность после инцидента.

</details>

## 9. Quellen und Abgleich

- [DSGVO — первичный текст](https://eur-lex.europa.eu/eli/reg/2016/679/oj) — Art. 12–22, 25, 32–34; проверено 11.09.2026.
- [EDPB Guidelines 9/2022](https://www.edpb.europa.eu/our-work-tools/our-documents/guidelines/guidelines-92022-personal-data-breach-notification-under_en) — официальное толкование уведомлений с примерами.
- [BfDI — Betroffenenrechte](https://www.bfdi.bund.de/DE/Buerger/Inhalte/Allgemein/Datenschutz/Betroffenenrechte.html) — официальная обзорная информация.

## 10. Offene Prüfpunkte für den Unterricht

- Какие классические TOM-Begriffe использует WBS-Lösungstabelle?
- Нужно ли подробно учить продление и исключения месячного срока?
- Какие Vorfälle курс относит к высокому риску?
