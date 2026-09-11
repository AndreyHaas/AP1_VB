---
pruefung: AP1
thema: Backup und Wiederherstellung
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Russisch
gegenstueck: ../de/01-backup-arten-gvs-medien-und-restore-de.md
---

# Резервное копирование: виды, GVS, носители и восстановление

## 1. Lernziele

Ты умеешь:

- различать Backup, Snapshot, Synchronisation, Archiv и Redundanz;
- сравнивать и рассчитывать Voll-, differenzielle и inkrementelle Sicherungen;
- определять необходимую Restore-Kette;
- объяснять GVS и правило 3-2-1 независимо от вида копии;
- выводить RPO и RTO из бизнес-требований;
- выбирать носитель по объёму, времени, защите и стоимости;
- классифицировать Hot-, Warm- и Cold-Backup;
- строить Sicherungs- und Wiederherstellungskonzept;
- доказывать успех через Restore-Test, проверку целостности и протокол.

## 2. Prüfungsminimum — 15 Minuten

1. Backup — отделённая восстанавливаемая копия; RAID, Sync и Snapshot не заменяют её автоматически.
2. Vollbackup копирует все выбранные данные; Restore требует эту копию.
3. Differenziell копирует изменения с последнего Vollbackup; Restore: Voll + последнее Differential.
4. Inkrementell копирует изменения с предыдущей копии цепочки; Restore: Voll + все последующие Inkremente.
5. GVS определяет поколения и хранение, не вид Voll/differenziell/inkrementell.
6. 3-2-1: три копии всего, две разные системы/носителя, одна внешняя; offline/immutable повышает защиту от Ransomware.
7. `RPO`: максимально допустимая потеря данных во времени; `RTO`: целевое время восстановления.
8. Backupfenster, объём изменений, Restorezeit и хранение планируются вместе.
9. Шифрование требует Schlüsselverwaltung, иначе надёжный Restore невозможен.
10. Только успешно испытанный Restore доказывает восстанавливаемость.

> Für das Tagesziel wird eine inkrementelle Sicherung eingesetzt, da sie das Backupfenster reduziert; die längere Restore-Kette wird durch regelmäßige Vollsicherungen und getestete Wiederherstellungsabläufe beherrscht.

## 3. Grundlagen und Sicherungsarten

### 3.1 Разграничение

| Метод | Главная цель | Ограничение |
|---|---|---|
| Backup | восстановление после потери/ошибки | ценен при отделении и проверяемости |
| Snapshot | быстрое состояние/откат | часто в той же системе и погибает вместе с ней |
| Synchronisation | выравнивание состояний | удаление/шифрование может синхронизироваться |
| Archiv | долгосрочное доказуемое хранение | не оптимизирован для быстрого Betriebs-Restore |
| Redundanz/RAID | продолжение работы при отказе компонента | не защищает от удаления, Malware, пожара, ошибки |

### 3.2 Vollbackup

Копирует все выбранные данные.

```text
Плюс: простая цепочка и обычно быстрый Restore
Минус: большой объём и долгое Backupfenster
Restore: подходящий Vollbackup
```

### 3.3 Differenzielles Backup

Копирует все изменения с последнего Vollbackup.

```text
Плюс: Restore требует Vollbackup + последнее Differential
Минус: ежедневная копия растёт до нового Vollbackup
```

### 3.4 Inkrementelles Backup

Копирует изменения с предыдущей копии внутри цепочки.

```text
Плюс: малый ежедневный объём и короткое Backupfenster
Минус: длинная и чувствительная Restore-Kette
Restore: Vollbackup + каждый Inkrement до цели
```

Изменения определяются по Katalog, Zeitstempel, Prüfsummen, Changed Block Tracking или согласованным с приложением Snapshots.

## 4. Sicherungskonzept, Ziele und Medien

### 4.1 GVS и 3-2-1

```text
Sohn      → часто/ежедневно, короткое хранение
Vater     → еженедельно, дольше
Großvater → ежемесячно, долго
```

GVS определяет **когда и сколько хранить**. Вид копии — **какой объём данных копировать**. Их можно сочетать.

```text
3 копии всего, включая продуктивные данные
2 разных носителя или независимых системы
1 копия в другом месте
```

Расширение `3-2-1-1-0` добавляет offline/immutable-копию и ноль непроверенных ошибок после Verifikation. Это практическое правило, не закон.

### 4.2 RPO и RTO

`Recovery Point Objective (RPO)`: насколько старым максимум может быть последний восстанавливаемый снимок?

`Recovery Time Objective (RTO)`: за какое целевое время сервис должен восстановиться?

```text
RPO = 4 h → допускается максимум 4 часа потерянных изменений
RTO = 8 h → от отказа до целевой работы максимум 8 часов
```

RPO не гарантирован при ошибке копии. RTO включает обнаружение, решение, подготовку, восстановление, тест и Freigabe.

### 4.3 Выбор носителей

| Носитель/система | Сильная сторона | Риск/проверка |
|---|---|---|
| локальный Disk/Appliance | быстро | онлайн-доступ и тот же Standort |
| Band | ёмкость, offline-хранение | Laufwerk, перевозка, медленный прямой доступ |
| Object Storage/Cloud | offsite, масштаб, версии | доступ, цена, Datenschutz, зависимость |
| Wechselmedium | физически отделим | потеря, старение, ручной процесс |

Критерии: объём, скорость, долговечность, ошибки носителя, стоимость, шифрование, Offsite/Offline и Restorezeit.

### 4.4 Hot, Warm и Cold

- `Hot Backup`: приложение работает; консистентность обеспечивает специальный механизм.
- `Warm Backup`: работа частично ограничена или создан согласованный момент.
- `Cold Backup`: приложение остановлено; консистентность проще, но есть простой.

Простая копия файлов работающей базы не обязана быть консистентной.

## 5. Berechnung und Restore-Fall

В понедельник Vollbackup `200 GB`. Непересекающиеся изменения:

```text
Dienstag 12 GB
Mittwoch  7 GB
Donnerstag 6 GB
```

### 5.1 Объёмы

| День | inkrementell | differenziell с понедельника |
|---|---:|---:|
| Montag | 200 GB | 200 GB |
| Dienstag | 12 GB | 12 GB |
| Mittwoch | 7 GB | 19 GB |
| Donnerstag | 6 GB | 25 GB |

```text
Inkrementell gesamt = 200 + 12 + 7 + 6 = 225 GB
Differenziell gesamt = 200 + 12 + 19 + 25 = 256 GB
```

### 5.2 Restore на вечер четверга

```text
inkrementell: Montag Voll + Dienstag + Mittwoch + Donnerstag
differenziell: Montag Voll + Donnerstag Differential
```

Если Mittwoch-Inkrement отсутствует, последующая цепочка для этой цели обычно неполна. Может оставаться более старый консистентный Zielpunkt.

### 5.3 Restore-Runbook

1. Определить инцидент и нужный Zielzeitpunkt.
2. Подготовить чистую изолированную среду.
3. Проверить носители, Kataloge, ключи и версии ПО.
4. Восстановить в правильной последовательности.
5. Проверить Integrität, консистентность, права и функцию.
6. Получить fachliche Freigabe.
7. Записать время, потерю данных, ошибки и отклонения.
8. Внести выводы в Sicherungsplan и оценку RTO/RPO.

## 6. Prüfungsformulierungen

> Für den inkrementellen Restore werden das Vollbackup und alle nachfolgenden Inkremente benötigt, da jedes Inkrement nur die Änderungen seit der vorherigen Sicherung enthält.

> Die Synchronisation ersetzt kein Backup, weil versehentliche Löschungen oder verschlüsselte Dateien auf das zweite System übertragen werden können.

> Das RPO beträgt vier Stunden und beschreibt den maximal tolerierten Datenverlust, während das RTO die angestrebte Wiederherstellungsdauer festlegt.

> Die Wiederherstellbarkeit wird durch einen dokumentierten Restore-Test nachgewiesen, weil ein fehlerfreies Sicherungsprotokoll allein keine nutzbaren Daten garantiert.

## 7. Typische Prüfungsfallen

- Называть RAID или зеркало Backup.
- Путать GVS с видом копии.
- В Differential считать только изменения за предыдущий день.
- В Inkrement каждый день суммировать изменения с Vollbackup.
- Пропускать промежуточный Inkrement при Restore.
- Путать RPO и RTO.
- Считать интервал копии гарантированным RPO.
- Называть Cloud-Sync без версий/изоляции полной копией.
- Шифровать без Schlüsselbackup и Recovery-Prozess.
- Сохранять данные, но не конфигурации/Kataloge.
- Измерять успех только зелёным Backupjob.
- Назначать сроки без правового и бизнес-контекста.

## 8. Selbsttest

1. Различи Backup, Snapshot, Sync, Archiv и RAID.
2. Объясни три вида копии.
3. Какая цепочка нужна для каждого Restore?
4. Что задаёт GVS?
5. Объясни 3-2-1 и опциональное 1-0.
6. Различи RPO и RTO.
7. Назови шесть критериев носителя.
8. Почему копия файлов работающей базы может быть неконсистентна?
9. Рассчитай объёмы примера.
10. Что будет без Mittwoch-Inkrement?
11. Назови шесть шагов Restore-Test.
12. Оцени: «Backupjob зелёный, значит Restore гарантирован».

<details>
<summary>Lösungen anzeigen</summary>

1. копия; точка состояния; выравнивание; архив; Betriebsredundanz.
2. всё; с Voll; с предыдущей копии.
3. Voll; Voll + последний Differential; Voll + все Inkremente.
4. поколения/время и сроки хранения.
5. три копии, две системы/носителя, одна внешняя; offline/immutable и ноль непроверенных ошибок.
6. потеря данных во времени; время до восстановления.
7. объём, скорость, долговечность, цена, Offsite, Offline, шифрование, Restorezeit; достаточно шести.
8. Связанные записи могут попасть в разные моменты состояния.
9. 225 GB inkrementell, 256 GB differenziell.
10. Поздняя цепочка обычно не восстановится; проверить старую точку.
11. цель, среда, носители/ключи, порядок, проверка, Freigabe, протокол; шесть достаточно.
12. Неверно: при Restore могут отказать носитель, Katalog, ключ, консистентность или процедура.

</details>

## 9. Quellen und Abgleich

- [BSI IT-Grundschutz-Kompendium](https://www.bsi.bund.de/grundschutz-kompendium) — актуальные требования к Datensicherung, Wiederherstellung, Kryptografie и Notfallvorsorge.
- [NIST SP 800-34 Rev. 1](https://csrc.nist.gov/pubs/sp/800/34/r1/upd1/final) — Contingency Planning и восстановление; конкретную технику из-за возраста документа сверять с текущими системами.
- [CISA StopRansomware Guide](https://www.cisa.gov/stopransomware/ransomware-guide) — официальные рекомендации по отделённым/offline Backups и восстановлению.

## 10. Offene Prüfpunkte für den Unterricht

- Использует WBS только 3-2-1 или также 3-2-1-1-0?
- RPO/RTO проверяются здесь или в Verfügbarkeit?
- Какие допущения задаются при пересекающихся изменениях?
