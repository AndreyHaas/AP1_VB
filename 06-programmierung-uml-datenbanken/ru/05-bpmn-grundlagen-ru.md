---
pruefung: AP1
thema: Prozessmodellierung
prioritaet: Abgleich
status: Entwurf
stand: 2026-09-10
sprache: Russisch
gegenstueck: ../de/05-bpmn-grundlagen-de.md
---

# Основы BPMN

## 1. Lernziele

Ты сможешь:

- объяснять назначение и границы BPMN-Prozessdiagramm;
- различать Ereignisse, Aktivitäten, Gateways, Sequence Flow и Message Flow;
- осмысленно использовать Pool и Lane;
- читать простой Geschäftsprozess с XOR- и AND-Gateway;
- находить типичные Modellierungsfehler;
- различать BPMN и UML-Aktivitätsdiagramm на базовом уровне.

## 2. Prüfungsminimum — 15 Minuten

1. BPMN моделирует Geschäftsprozesse и коммуникацию участников.
2. Event = что-то происходит; Task = выполняется работа; Gateway = Ablauf разветвляется/синхронизируется.
3. Start Event начинает, End Event завершает Prozesspfad.
4. Sequence Flow соединяет элементы внутри Pool.
5. Message Flow показывает Kommunikation между разными Pools.
6. Pool представляет Teilnehmer; Lane распределяет Verantwortung внутри Teilnehmer.
7. XOR: ровно один альтернативный Pfad; AND: все параллельные Pfade.
8. Bedingungen стоят у исходящих Sequence Flows datenbasiertes Gateway.
9. AND-Split часто требует AND-Join, если дальше нужно ждать все Pfade.
10. Точный объём BPMN для AP1 нужно сверить с WBS/Prüfungskatalog.

> Der Message Flow wird verwendet, weil Kunde und Unternehmen als getrennte Teilnehmer in unterschiedlichen Pools modelliert sind.

## 3. Grundlagen

### 3.1 Основные элементы

| Kategorie | Element | Значение |
|---|---|---|
| Flow Object | Event | Auslöser или Ergebnis |
| Flow Object | Activity/Task | выполняемая работа |
| Flow Object | Gateway | разветвление/объединение |
| Connecting Object | Sequence Flow | Reihenfolge внутри Pool |
| Connecting Object | Message Flow | Nachricht между Pools |
| Swimlane | Pool | Teilnehmer/Prozessgrenze |
| Swimlane | Lane | Verantwortungsbereich внутри Pool |
| Artifact | Data Object/Annotation | данные/пояснение |

### 3.2 Events

- `Start Event`: запускает Prozess; тонкий круг.
- `Intermediate Event`: происходит в ходе Prozess; двойной круг.
- `End Event`: обозначает Ergebnis/Ende; толстый круг.

Символ внутри Event уточняет тип, например Nachricht или Timer. Для Prüfungsminimum сначала уверенно различать Start, Zwischenereignis и Ende.

### 3.3 Tasks

Task — атомарная Aktivität на выбранном уровне модели. Хорошее имя содержит Verb и Objekt:

```text
Ticket erfassen
Bestellung prüfen
Freigabe erteilen
Kunde informieren
```

`Prüfung` без глагола менее ясно. Состояние «Ticket offen» не является Task.

### 3.4 Pool и Lane

Pool представляет Prozessbeteiligter: `Kunde` или `Unternehmen`. Lanes делят Pool по Verantwortungsbereiche: `Service Desk`, `Second Level`.

Lanes не являются отдельными Kommunikationspartner. Между Lanes одного Pools идёт Sequence Flow, не Message Flow.

## 4. Gateways und Flüsse

### 4.1 Exclusive Gateway (XOR)

Выбирается ровно один Pfad:

```text
Ticket vollständig?
  [ja]   → Priorität bestimmen
  [nein] → Rückfrage senden
```

Guards должны не пересекаться и покрывать ожидаемые Fälle. Default Flow может принять остаток.

### 4.2 Parallel Gateway (AND)

Все Pfade запускаются параллельно:

```text
AND-Split
  → Benutzer informieren
  → Monitoring aktualisieren
AND-Join
  → Ticket schließen
```

Join ждёт входящие параллельные Pfade. Ошибочный Join может моделировать Deadlock или преждевременное продолжение.

### 4.3 Inclusive Gateway (OR)

По Bedingungen выбирается один или несколько Pfade. Это не XOR. Из-за сложной Synchronisation OR изучается после уверенного XOR/AND.

### 4.4 Sequence Flow и Message Flow

| Flow | внутри Pool | между Pools |
|---|---:|---:|
| Sequence Flow | да | нет |
| Message Flow | нет | да |

Message Flow показывает fachliche Kommunikation, а не обязательно конкретный Netzwerkprotokoll.

## 5. Anwendungsfall: Supportticket

Teilnehmer:

- Pool `Kunde`;
- Pool `IT-Dienstleister` с Lanes `ServiceDesk`, `Second Level`.

Ablauf:

```text
Kunde: Störung melden
  ..Message Flow..
ServiceDesk: Ticket erfassen
ServiceDesk: Angaben vollständig?
  [nein] → Rückfrage senden ..Message Flow.. Kunde
  [ja]   → Priorität bestimmen
ServiceDesk: im First Level lösbar?
  [ja]   → Lösung umsetzen
  [nein] → an Second Level übergeben
SecondLevel: Ursache analysieren
SecondLevel: Lösung umsetzen
AND-Split: Kunde informieren + Dokumentation aktualisieren
AND-Join: Ticket schließen
```

Проверка модели:

1. Каждый XOR-Ausgang имеет чёткий Guard.
2. После Antwort возврат к Vollständigkeitsprüfung.
3. Переход между Lanes остаётся Sequence Flow.
4. Kommunikation к Kunden — Message Flow.
5. Ticket закрывается после обоих параллельных Abschlussarbeiten.

### 5.1 BPMN или UML-Aktivitätsdiagramm?

| Вопрос | BPMN | UML-Aktivitätsdiagramm |
|---|---|---|
| Geschäftsprozess и Teilnehmer | особенно подходит | возможно |
| Nachrichten между Organisationen | явный Message Flow | моделируется иначе/проще |
| Software-/Arbeitsablauf | возможно | часто подходит |
| Klassen/Struktur | не назначение | нужна другая UML-Diagramm |

Обе Notationen показывают Abläufe. Нельзя незаметно смешивать Symbole.

## 6. Prüfungsformulierungen

> Das exklusive Gateway wird verwendet, da abhängig von der Vollständigkeit genau einer der beiden alternativen Pfade ausgeführt wird.

> Die Aufgaben „Kunde informieren“ und „Dokumentation aktualisieren“ werden mit einem parallelen Gateway gestartet, weil beide unabhängig ausgeführt werden müssen.

> Zwischen Service Desk und Second Level wird Sequence Flow verwendet, da beide Lanes zum selben Pool des IT-Dienstleisters gehören.

> Die Störungsmeldung zwischen Kunde und Dienstleister wird als Message Flow modelliert, da die Nachricht die Grenze zweier Pools überschreitet.

## 7. Typische Prüfungsfallen

- Путать Event, Task и Gateway.
- Моделировать Zustand как Task без Verb.
- Рисовать Message Flow внутри одного Pool.
- Проводить Sequence Flow через Poolgrenze.
- Приравнивать Pool и Lane.
- Использовать XOR, когда должны идти все Pfade.
- Использовать AND, когда выбирается один Pfad.
- Продолжать после Parallelität без нужного Join.
- Делать XOR-Guards пересекающимися или неполными.
- Считать Message Flow техническим TCP-соединением.
- Смешивать BPMN- и UML-Symbole.
- Называть BPMN подтверждённым AP1-Kern без Abgleich.

## 8. Selbsttest

1. Каково назначение BPMN?
2. Различи Event, Task и Gateway.
3. Когда используется Sequence Flow?
4. Когда используется Message Flow?
5. Различи Pool и Lane.
6. Какой Gateway моделирует ровно одну альтернативу?
7. Какой Gateway запускает все параллельные Pfade?
8. Составь Guards для `Betrag ≥ 1000`.
9. Зачем нужен AND-Join?
10. Допустим ли Message Flow между Lanes одного Pools?
11. Текстом смоделируй Bestellannahme с Ablehnungspfad.
12. Обоснуй BPMN вместо Klassendiagramm для Supportprozess.

<details>
<summary>Lösungen anzeigen</summary>

1. Понятно показывать Geschäftsprozesse, Verantwortungen и Kommunikation.
2. Event происходит, Task выполняется, Gateway управляет Pfade.
3. Для Reihenfolge внутри Pool.
4. Для Nachrichten между разными Pools.
5. Pool = Teilnehmer; Lane = Verantwortungsbereich внутри Teilnehmer.
6. XOR.
7. AND.
8. `[betrag ≥ 1000]` и `[betrag < 1000]`.
9. Чтобы Folgeschritt начался после завершения всех параллельных Pfade.
10. Нет, там Sequence Flow.
11. Start → Bestellung prüfen → XOR `[gültig]` annehmen / `[ungültig]` ablehnen → Ende.
12. BPMN показывает Prozess, Zuständigkeiten и Kommunikation; Klassendiagramm — статическую Struktur.

</details>

## 9. Quellen und Abgleich

- [OMG BPMN 2.0.2](https://www.omg.org/spec/BPMN/2.0.2/About-BPMN) — normative Spezifikation и официальные примеры.
- Themenumfang помечен `Abgleich`, потому что глубину AP1 нужно подтвердить по WBS/Prüfungskatalog; Stand 10.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- BPMN обязательно входит в используемый Prüfungskatalog AP1?
- Какие Eventtypen и Gateways требует WBS?
- Нужно рисовать Diagramm или только читать/исправлять?
