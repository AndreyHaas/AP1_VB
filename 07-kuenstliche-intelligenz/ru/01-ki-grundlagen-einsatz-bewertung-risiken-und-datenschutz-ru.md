---
pruefung: AP1
thema: Künstliche Intelligenz
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Russisch
gegenstueck: ../de/01-ki-grundlagen-einsatz-bewertung-risiken-und-datenschutz-de.md
---

# KI: основы, применение, оценка, риски и Datenschutz

## 1. Lernziele

Ты сможешь:

- различать KI, maschinelles Lernen и generative KI;
- объяснять Training, Inferenz, Modell, Prompt и Ausgabe;
- выбирать подходящие betriebliche Anwendungsfälle;
- оценивать Nutzen, Qualität, Kosten, Datenschutz и Informationssicherheit;
- распознавать Halluzination, Bias, Automation Bias, Datenabfluss и Prompt Injection;
- планировать контролируемый Einsatz KI с menschliche Prüfung;
- понимать risikobasierten Ansatz EU AI Act на базовом уровне.

## 2. Prüfungsminimum — 15 Minuten

1. KI — общий термин; maschinelles Lernen создаёт Modelle из Daten; generative KI производит новые Inhalte.
2. Training настраивает Modellparameter; Inferenz обрабатывает новые Eingaben готовой моделью.
3. KI-Ausgabe — Ergebnis/Vorschlag, а не доказательство фактической правильности.
4. `Halluzination`: правдоподобная, но ложная/неподтверждённая Ausgabe.
5. `Bias`: систематическое искажение из-за Daten, Modell, Messung или Nutzung.
6. Использовать только freigegebene Systeme и допустимые минимизированные Daten.
7. Vertrauliche/personenbezogene Daten нельзя без проверки отправлять внешнему KI-Dienst.
8. Критические Ergebnisse fachlich prüfen, Quellen verifizieren и документировать Freigabe.
9. AI Act и DSGVO могут действовать одновременно; решает Anwendungsfall.
10. Menschliche Aufsicht должна реально работать, а не существовать формально.

> Die KI-Ausgabe wird vor der Kundenkommunikation fachlich geprüft, da ein sprachlich plausibler Text falsche Tatsachen oder ungeeignete Handlungsempfehlungen enthalten kann.

## 3. Grundlagen

### 3.1 Понятия

| Begriff | Значение | Пример |
|---|---|---|
| KI-System | из Eingaben создаёт Ausgaben для цели | Klassifikation, Empfehlung |
| maschinelles Lernen | учит Muster/Parameter из Daten | Spamklassifikation |
| generative KI | создаёт новые Inhalte | Text, Bild, Code |
| Modell | обученная математическая/техническая Repräsentation | Sprachmodell |
| Trainingsdaten | данные для Anpassung Modell | размеченные Tickets |
| Inferenz | применение готового Modell | классификация нового Ticket |
| Prompt | Eingabe/Anweisung генеративной модели | „Fasse das Ticket zusammen“ |

Не каждая Automatisierung является KI. Фиксированная `if/else`-Regel может быть полезна, но не является gelerntes Modell.

### 3.2 Lernarten на базовом уровне

- `überwachtes Lernen`: примеры содержат Zielwerte/Labels, например Ticketkategorie.
- `unüberwachtes Lernen`: ищет структуры без заданной Zielklasse, например группы похожих Fälle.
- `bestärkendes Lernen`: Agent обучается по Rückmeldungen/Belohnungen в Umgebung.
- `generatives Modell`: создаёт новые данные по изученным Mustern.

Категории могут сочетаться. Chatbot не обязательно относится только к одной Lernart.

### 3.3 Training и Inferenz

```text
Daten → Aufbereitung → Training → Modell → Evaluation → Freigabe
                                                |
Neue Eingabe → Vorverarbeitung → Inferenz → Ausgabe → menschliche/technische Kontrolle
```

Хорошая Trainingsmetrik не гарантирует качество Produktion. Datenverteilung, Eingaben и Zweck могут измениться (`Drift`).

### 3.4 Deterministisch и probabilistisch

Классические Regeln при одинаковых Eingaben обычно дают одинаковый Ergebnis. Generative Modelle могут изменять ответ в зависимости от Parameter и Systemversion. Поэтому Akzeptanzkriterien оценивают качество результата, а не дословное совпадение.

## 4. Nutzen, Qualität und Risiken

### 4.1 Подходящие Einsatzfelder

- сортировка Supporttickets;
- Zusammenfassung/Übersetzung текстов;
- Entwürfe документации;
- Code- и Testfallvorschläge;
- приоритизация Anomalien;
- Wissenssuche с Quellen;
- помощь Barrierefreiheit альтернативными формулировками.

Высокая пригодность: ясная Aufgabe, проверяемый Ergebnis, контролируемый Fehler, подходящие Daten. Низкая: необратимые решения о людях без wirkliche Kontrolle.

### 4.2 Оценка качества

| Kriterium | Вопрос |
|---|---|
| Richtigkeit | fachlich верен Ergebnis? |
| Vollständigkeit | не пропущено важное? |
| Relevanz | отвечает задаче? |
| Robustheit | стабильно ли при вариантах? |
| Fairness | не ущемляются ли группы системно? |
| Nachvollziehbarkeit | документированы Quelle, Version, Prüfung? |
| Sicherheit | устойчив ли Prozess к Manipulation/Datenabfluss? |
| Wirtschaftlichkeit | Nutzen превышает Gesamtaufwand/Risiko? |

Для Klassifikation Precision и Recall показывают разные Folgen ошибок. Metrik выбирается по ущербу False Positive/False Negative.

### 4.3 Типичные риски

`Halluzination`: выдуманные Fakten, Quellen или Funktionen.

`Bias`: искажённые Daten/Prozessannahmen создают систематический вред.

`Automation Bias`: люди принимают Vorschlag, потому что он автоматический.

`Prompt Injection`: чужой Inhalt пытается переписать Systemanweisungen или раскрыть Daten.

`Datenabfluss`: Prompts, Uploads, Logs или Ausgaben содержат Geheimnisse/personenbezogene Daten.

`Unsicherer Code`: сгенерированный Code имеет Schwachstellen, ложные Abhängigkeiten или Lizenzprobleme.

`Drift`: реальные Daten/Anforderungen меняются, а Modell остаётся прежней.

### 4.4 Меры

1. определить Zweck, Eigentümer и Risikoklasse.
2. классифицировать/minimieren Daten, проверить Rechtsgrundlage/Freigabe.
3. проверить Anbieter, Speicherort, Aufbewahrung, Training mit Eingaben и Vertrag.
4. задать repräsentative Testfälle и Mindestqualität.
5. ограничить Rollen, Berechtigungen и technische Schnittstellen.
6. предоставить Quellen/Referenzdaten, если нужна Verifikation.
7. задать menschliche Prüfung и Eskalation критических Fälle.
8. протоколировать Versionen, допустимые Eingaben, Ergebnisse, Fehler, Freigaben.
9. контролировать Betrieb, Drift/Incidents и предусмотреть Abschaltung.

## 5. Recht, Datenschutz und Anwendungsfall

### 5.1 DSGVO

При personenbezogenen Daten проверяются:

- Zweck и Rechtsgrundlage;
- Datenminimierung и Transparenz;
- Rollen Verantwortlicher/Auftragsverarbeiter;
- Empfänger, Drittlandtransfer, Aufbewahrung;
- technische und organisatorische Maßnahmen;
- Betroffenenrechte;
- Datenschutz-Folgenabschätzung при вероятном высоком Risiko;
- границы automatisierter Einzelentscheidungen.

Pseudonymisierung уменьшает риск, но не делает данные automatisch anonym. Даже «внутренний» KI-System может обрабатывать personenbezogene Daten.

### 5.2 EU AI Act — Stand 10.09.2026

AI Act использует risikobasierten Ansatz:

- verbotene Praktiken;
- Hochrisiko-Anwendungen с besonderen Pflichten;
- Transparenzpflichten для некоторых Systeme/Inhalte;
- minimale/geringe Risiken;
- дополнительные Regeln для General-Purpose-AI-Modelle.

Конкретный Zweck и Rolle (`Provider`, `Deployer` и др.) определяют обязанности. По официальной EU-Übersicht AI Act в целом действует с 02.08.2026; у отдельных областей другие Übergangsfristen. AI-Literacy-Pflichten и основные Verbote действуют с 02.02.2025, GPAI-Regeln — с 02.08.2025. Einordnung всегда сверяется с актуальной Rechtslage.

AI Act не заменяет DSGVO, Urheber-, Arbeits- или Sicherheitsrecht.

### 5.3 Anwendungsfall: Ticketassistent

Предприятие хочет суммировать Kundentickets, назначать Kategorien и создавать Antwortentwürfe.

Риски:

- Tickets содержат Namen, Vertragsdaten и Zugangsdaten;
- ложная Kategorie задерживает kritische Störung;
- Antwortentwurf выдумывает Vertragszusage;
- манипулированный Tickettext содержит Prompt Injection;
- Beschäftigte принимают Vorschläge без проверки.

Контролируемая схема:

1. блокировать Zugangsdaten/Secrets, minimieren Daten.
2. использовать freigegebenen Dienst, проверить Vertrag/Verarbeitung.
3. чётко задать Kategorien и Eskalationsregeln.
4. не позволять KI самостоятельно снижать Priorität kritischer Tickets.
5. маркировать Entwürfe и требовать Freigabe перед отправкой.
6. версионировать Wissensquellen, требовать Zitate/Belege.
7. измерять Qualität по Kategorien, следить за False Negatives критических Fälle.
8. контролировать Feedback, Incidents, Kosten и Modelländerungen.

Kennzahl:

```text
200 Testtickets
170 korrekt kategorisiert
Genauigkeit = 170 / 200 × 100 % = 85 %
```

85 % недостаточно для Freigabe. Если все десять Sicherheitsvorfälle классифицированы неправильно, System непригодна несмотря на Gesamtgenauigkeit.

## 6. Prüfungsformulierungen

> Training bezeichnet die Anpassung eines Modells anhand von Daten, während bei der Inferenz das trainierte Modell neue Eingaben verarbeitet.

> Personenbezogene Kundendaten werden minimiert und nur in einem freigegebenen System verarbeitet, da sowohl Zweck, Rechtsgrundlage als auch Schutzmaßnahmen eingehalten werden müssen.

> Die Gesamtgenauigkeit genügt nicht als Qualitätsnachweis, weil besonders schädliche Fehler in einer kleinen, aber kritischen Ticketklasse verborgen bleiben können.

> Eine menschliche Freigabe bleibt erforderlich, da generative KI plausible, aber sachlich falsche oder rechtlich unzulässige Aussagen erzeugen kann.

## 7. Typische Prüfungsfallen

- Приравнивать KI, ML и generative KI.
- Путать Training и Inferenz.
- Считать красивый Text доказательством Wahrheitsgehalt.
- Смотреть только Genauigkeit, а не Folgen ошибок по классам.
- Считать публично доступные personenbezogene Daten свободными для использования.
- Путать Pseudonymisierung и Anonymisierung.
- Заявлять menschliche Kontrolle, когда нет времени/полномочий исправлять.
- Принимать Prompt Injection как обычное желание пользователя.
- Приравнивать «kein Training» Anbieter к полной Datenschutzkonformität.
- Бездумно принимать KI-Ausgabe или Code.
- Считать AI Act заменой DSGVO.
- Указывать AI-Act-Fristen без Stand-Datum.

## 8. Selbsttest

1. Различи KI, ML и generative KI.
2. Различи Training и Inferenz.
3. Что такое Halluzination?
4. Что означает Automation Bias?
5. Назови четыре geeignete betriebliche Einsatzfelder.
6. Почему Gesamtgenauigkeit недостаточно?
7. Назови четыре Datenschutzprüfungen перед внешним KI.
8. Как Prompt Injection может работать в Kundenticket?
9. Составь три контроля KI-generierter Code.
10. Дай базовую risikobasierte Einordnung AI Act.
11. Рассчитай Genauigkeit: 450 правильных из 500.
12. Оцени: «Menschliche Kontrolle решает любой KI-Risiko».

<details>
<summary>Lösungen anzeigen</summary>

1. KI — Oberbegriff; ML учит Muster из Daten; generative KI создаёт Inhalte.
2. Training настраивает Modell; Inferenz применяет к новым Eingaben.
3. Правдоподобная, но ложная/неподтверждённая Ausgabe.
4. Люди слишком доверяют автоматическим Vorschlägen.
5. Klassifikation, Zusammenfassung, Entwurf, Übersetzung, Testideen, Suche; любые четыре.
6. В небольшой критической Klasse могут скрываться опасные ошибки.
7. Zweck/Rechtsgrundlage, Minimierung, Anbieter/AVV, Speicherort/Transfer, Aufbewahrung, TOM, Rechte; любые четыре.
8. Fremdinhalt пытается переписать Anweisungen, запросить Geheimnisse или вызвать Werkzeugaktionen.
9. Review, Tests/Sicherheitsanalyse, Prüfung Abhängigkeiten/Lizenzen, isolierte Ausführung; любые три.
10. Verbote, Hochrisiko, Transparenz, geringe/minimale Risiken и GPAI по Zweck/Rolle.
11. `450 / 500 × 100 % = 90 %`.
12. Неверно: контроль должен быть kompetent, unabhängig, rechtzeitig, technisch wirksam; Restrisiken остаются.

</details>

## 9. Quellen und Abgleich

- [EU-Kommission: AI Act und Anwendungstermine](https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai) — официальная актуальная сводка, проверена 10.09.2026.
- [Verordnung (EU) 2024/1689](https://eur-lex.europa.eu/eli/reg/2024/1689/oj) — Primärtext AI Act; Änderungen/Übergangsrecht проверяются дополнительно.
- [DSGVO](https://eur-lex.europa.eu/eli/reg/2016/679/oj) — Primärquelle Datenschutz.
- [NIST AI Risk Management Framework](https://www.nist.gov/itl/ai-risk-management-framework) — добровольная risikobasierte Grundlage; AI RMF 1.0 по данным NIST перерабатывается.

## 10. Offene Prüfpunkte für den Unterricht

- Какие KI-Begriffe и Fälle требует WBS-Aufgabensatz?
- AI Act проверяется только как Begriff или с Rollen/Risikoklassen?
- Какие Datenschutz-Fälle решаются без juristische Detailprüfung?
