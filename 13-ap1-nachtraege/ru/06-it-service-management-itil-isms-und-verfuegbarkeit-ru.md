---
pruefung: AP1
thema: IT-Service-Management, ITIL, ISMS und Verfügbarkeit
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/06-it-service-management-itil-isms-und-verfuegbarkeit-de.md
---

# IT-Service-Management, ITIL, ISMS und Verfügbarkeit

## 1. Lernziele

После изучения главы нужно уметь:

- объяснять Service, Wert, Nutzen и Servicequalität;
- различать основные ITIL-Practices по ситуации;
- отделять Incident, Service Request, Problem и Change;
- понимать SLA, OLA и Underpinning Contract;
- различать и связывать ITSM и ISMS;
- различать роли IT-Sicherheit и Datenschutz;
- оценивать Passwort-Policy и NAS-Verfügbarkeit.

## 2. Prüfungsminimum — 15 Minuten

1. IT-Service-Management управляет Services по жизненному циклу, чтобы совместно создавать Wert.
2. Utility — пригодность для цели; Warranty — пригодность для использования, например Verfügbarkeit и Kapazität.
3. Incident: незапланированный перерыв/снижение качества; цель — быстро восстановить Service.
4. Service Request: стандартный запрос; Problem: причина одного или нескольких Incidents.
5. Change: контролируемое изменение; Standard Change заранее разрешён и низкорисковый, Emergency Change проходит ускоренный контролируемый путь.
6. SLA согласует измеримые Serviceziele с Kunden; OLA — внутренние вклады.
7. ITSM фокусируется на ценности/качестве сервиса; ISMS системно управляет Informationssicherheitsrisiken.
8. Datenschutzbeauftragter независимо контролирует Datenschutz; IT-Sicherheitsbeauftragter координирует Informationssicherheit. Это разные роли.
9. Passwort-Policy рассматривает Länge, Sperrlisten, MFA, sichere Speicherung, Rücksetzung и Monitoring вместе.
10. RAID/NAS-Redundanz повышает Verfügbarkeit, но не заменяет Backup и Wiederanlaufplan.

## 3. ITIL и Servicewert

ITIL — распространённая рамка Service Management, а не обязательная инструкция продукта. В сентябре 2026 PeopleCert продолжает предлагать ITIL 4 и одновременно уже публикует новую ITIL Version 5. Поэтому для AP1 сначала учатся общие Begriffe и та версия, которую реально проходили в WBS; версионные модели не угадываются. `Service` позволяет клиенту получать результаты, не управляя всеми специфическими Kosten и Risiken самостоятельно.

| Begriff | Kernfrage |
|---|---|
| Value | какая воспринимаемая польза создаётся? |
| Utility | поддерживает ли сервис нужный результат? |
| Warranty | достаточно ли сервис доступен, безопасен и производителен? |
| Outcome | какой результат становится возможным? |
| Output | какой непосредственный результат работы поставлен? |

Continual Improvement означает постоянное улучшение Services и работы на основе Soll, Ist, Messwerte и Feedback.

## 4. Practices и Prozessunterschiede

| Begriff | Beispiel | primäres Ziel |
|---|---|---|
| Incident | Druckdienst не работает | быстро восстановить Service |
| Major Incident | критический общий Ausfall | координация с высшим приоритетом |
| Service Request | стандартный новый Zugang | стандартизированно выполнить |
| Problem | повторяющаяся ошибка Treiber | устранить Ursache и Wiederholung |
| Known Error | известная причина с Workaround | использовать знания |
| Change | новая версия Druckserver | контролировать Nutzen и Risiko |
| Event | превышена Speichergrenze | распознать состояние и реагировать |

Workaround может закрыть Incident, не устранив Problemursache. Change не равен Incident, Emergency Change не означает отсутствие Genehmigung.

### Priorisierung

```text
Priorität = Wirkung × Dringlichkeit nach festgelegter Matrix
```

Должность заявителя сама по себе не заменяет оценку Auswirkung.

## 5. SLA, ISMS и Rollen

| Vereinbarung | Beziehung |
|---|---|
| SLA | Service Provider ↔ Kunde |
| OLA | внутренние единицы Provider |
| Underpinning Contract | Provider ↔ внешний Lieferant |

Messgröße требует Definition, Messpunkt, Zeitraum и Ausschlüsse. `99,9 %` без Servicezeit и Ausfallregel неполно.

`ISMS` определяет правила, ответственность и непрерывный процесс работы с Informationssicherheitsrisiken: определить контекст и Werte, проанализировать Risiken, выбрать Maßnahmen, проверить Wirksamkeit, улучшить.

| Rolle | Schwerpunkt |
|---|---|
| Informationssicherheitsbeauftragter | Sicherheitsorganisation, Risiken, Maßnahmen, Reporting |
| Datenschutzbeauftragter | независимая консультация и контроль Datenschutzvorschriften |
| Systemadministrator | техническая реализация и Betrieb по поручению |
| Verantwortlicher | определяет Zwecke und Mittel обработки персональных данных |

## 6. Passwort-Policy, NAS и Anwendungsfall

### 6.1 Passwort-Policy bewerten

Хорошая Policy:

- предпочитает достаточную Länge и разрешает длинные Passphrasen;
- блокирует известные скомпрометированные/частые Passwörter;
- не требует беспричинной календарной смены, но меняет при Verdacht/Kompromittierung;
- требует MFA по Risiko и Schutzbedarf;
- хранит пароль как подходящий gesalzener Passwort-Hash;
- регулирует Wiederherstellung, Rate Limiting, Protokollierung и Schulung.

Одни жёсткие Komplexitätsregeln часто создают предсказуемые шаблоны. Конкретная Policy должна соответствовать организации, угрозам и актуальным правилам.

### 6.2 NAS-Verfügbarkeit

Для NAS учитывают:

- redundante Datenträger и время Rebuild;
- Netzteile, Netzwerkpfade и Switches;
- Controller, Firmware и Stromversorgung;
- USV и kontrolliertes Herunterfahren;
- Monitoring, Ersatzteile и Wiederanlauf;
- отдельный проверенный Backup против удаления, Malware и Standortschaden.

### 6.3 Anwendungsfall

После повторных NAS-Abbrüche Service Desk восстанавливает доступ через Ersatzpfad (`Incident`). Причину в Firmware исследуют как `Problem`. Проверенный Update вводят с Backup, Wartungsfenster, Rückfallplan и Abnahmetest как `Change`. ISMS оценивает риски, а SLA-Kennzahlen — эффект сервиса.

## 7. Prüfungsformulierungen и typische Fallen

> Der Zugriffsausfall ist als Incident zu bearbeiten, weil eine ungeplante Unterbrechung des vereinbarten Services vorliegt.

> Die Ursachenanalyse gehört zum Problem Management, da wiederkehrende Incidents dauerhaft verhindert werden sollen.

> Die Datenträgerredundanz erhöht die Verfügbarkeit, ersetzt jedoch kein getrenntes Backup, weil logische Fehler und Schadsoftware auf redundante Datenträger übertragen werden können.

Типичные ошибки:

- называть ITIL обязательной Norm или жёстким процессом;
- различать Incident и Problem по тяжести, а не цели;
- считать любой Wunsch пользователя Incident;
- проводить Emergency Change без Bewertung, Autorisierung и Nachkontrolle;
- писать SLA без Messdefinition;
- приравнивать ITSM и ISMS;
- делать Datenschutzbeauftragter операционным владельцем всех Sicherheitsmaßnahmen;
- путать RAID/NAS и Backup;
- считать календарную смену пароля главной универсальной мерой.

## 8. Selbsttest

1. Различи Utility и Warranty.
2. Определи: заказ стандартного ПО, отказ сервиса, повторные сбои, установка Patch.
3. Объясни SLA и OLA.
4. Почему Workaround не всегда Problem-Lösung?
5. Назови четыре критерия Passwort-Policy.
6. Обоснуй две меры Verfügbarkeit NAS и отдельную Backup-Maßnahme.

<details>
<summary>Lösungen anzeigen</summary>

1. Utility — функциональная пригодность к результату; Warranty — пригодность использования через Verfügbarkeit, Kapazität, Sicherheit.
2. Service Request, Incident, Problem, Change.
3. SLA согласует цели с Kunden; OLA обеспечивает внутренние вклады.
4. Он может восстановить сервис, но не устранить Ursache.
5. Länge/Passphrase, Sperrliste, MFA, gesalzener Hash, sichere Rücksetzung, Rate Limiting.
6. Например Datenträger- и Netzpfadredundanz; отдельный versioniertes Backup с Restore-Test.

</details>

## 9. Quellen und Abgleich

- PeopleCert: официальная ITIL-Übersicht с ITIL 4 и ITIL Version 5; проверено 11.09.2026.
- ISO/IEC 20000-1 для Service-Management-Systeme и ISO/IEC 27001 для ISMS без требования Detailnormwissen.
- NIST SP 800-63B и BSI-Empfehlungen zur Authentisierung.
- WBS-Kursinhalt ITIL/IT-Service-Management; подтверждено 11.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Проходили ли в WBS ITIL 4, ITIL Version 5 или versionsneutraler ITSM-Überblick?
- Какие ITIL-Practices и Begriffe WBS требует по названию?
- Какая Prioritätsmatrix используется в курсе?
- ISO-Zertifizierung только классифицируется или проверяется по требованиям?
