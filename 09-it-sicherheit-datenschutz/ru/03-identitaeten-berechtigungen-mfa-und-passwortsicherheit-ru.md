---
pruefung: AP1
thema: Identitäten und Berechtigungen
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Russisch
gegenstueck: ../de/03-identitaeten-berechtigungen-mfa-und-passwortsicherheit-de.md
---

# Идентичности, права, MFA и безопасность паролей

## 1. Lernziele

Ты умеешь:

- различать Identifizierung, Authentisierung, Authentifizierung и Autorisierung;
- относить Wissen, Besitz и Inhärenz к категориям факторов;
- отличать настоящую MFA от нескольких шагов одной категории;
- классифицировать OTP, Push, Smartcard, Passkey и Recovery-Codes;
- применять Least Privilege, Need to Know, Funktionstrennung и Vier-Augen-Prinzip;
- объяснять ACL, роли/RBAC и группы;
- планировать жизненный цикл идентичности от приёма до увольнения;
- оценивать парольные процессы и восстановление доступа;
- проверять права с помощью Positiv- и Negativtests.

## 2. Prüfungsminimum — 15 Minuten

1. Указать имя = Identifizierung; предъявить доказательство = Authentisierung; проверить его = Authentifizierung; решить о правах = Autorisierung.
2. Факторы: Wissen, Besitz и Inhärenz.
3. MFA комбинирует минимум две разные категории факторов.
4. Пароль + контрольный вопрос — Wissen + Wissen, не настоящая MFA.
5. Least Privilege выдаёт только нужные права; Need to Know ограничивает доступ к информации.
6. Права лучше выдавать ролям/группам, а не бесконтрольно отдельным аккаунтам.
7. Joiner–Mover–Leaver: выдать при приёме, изменить при переходе, немедленно отозвать при уходе.
8. Общие аккаунты ослабляют Zurechenbarkeit.
9. Длинные уникальные Passphrasen и Passwortmanager лучше повторного использования.
10. Recovery — часть защиты; легко обманываемый Reset обходит сильную MFA.

> Der Zugriff wird über eine rollenbasierte Gruppe vergeben, weil dadurch Least Privilege, nachvollziehbare Freigabe und regelmäßige Rezertifizierung einfacher umgesetzt werden können.

## 3. Grundlagen

### 3.1 Процесс решения о доступе

```text
Identifizierung   → «Я пользователь A».
Authentisierung   → A предъявляет пароль, Token или биометрию.
Authentifizierung → система проверяет доказательство.
Autorisierung     → система проверяет разрешённое действие.
Protokollierung   → существенное действие записывается.
```

Успешный вход не даёт автоматически доступ ко всем файлам. Authentifizierung определяет доказанный аккаунт, Autorisierung — что ему можно делать.

### 3.2 Категории факторов

| Категория | Примеры |
|---|---|
| Wissen | Passwort, PIN |
| Besitz | Smartcard, Hardwaretoken, зарегистрированное устройство |
| Inhärenz | отпечаток, лицо, радужка |

Примеры:

```text
Passwort + Sicherheitsfrage → Wissen + Wissen     → не MFA
PIN + Smartcard             → Wissen + Besitz     → MFA
Passwort + OTP-App          → Wissen + Besitz     → MFA
Fingerabdruck + Gesicht     → Inhärenz + Inhärenz → не настоящая MFA
```

Биометрия не является секретом, допускает ошибки и не меняется так же просто, как пароль. Обычно она локально открывает криптографический ключ или устройство.

### 3.3 Сравнение Authentifikatoren

| Метод | Плюс | Важная граница |
|---|---|---|
| Passwort/Passphrase | применяется повсюду | Phishing, повторение, угадывание |
| TOTP-Code | не требует мобильной сети | можно ввести на Phishing-сайте |
| SMS-Code | просто | атака на номер, доставка, Phishing |
| Push-Freigabe | удобно | Push Fatigue и неясный запрос |
| Smartcard/Hardwaretoken | отдельное устройство, сильная защита ключа | выдача, потеря, замена |
| Passkey/FIDO | привязанная к домену phishing-resistente Anmeldung | нужен процесс устройства, Sync и Recovery |

Не всякая MFA устойчива к Phishing. Злоумышленник может в реальном времени переслать пароль и OTP. Привязанные к домену криптографические методы лучше предотвращают это.

## 4. Berechtigungen und Identitätslebenszyklus

### 4.1 Принципы защиты

- `Least Privilege`: минимальные права для задачи и срока.
- `Need to Know`: доступ только к действительно нужной информации.
- `Separation of Duties`: критические шаги распределены между ролями.
- `Vier-Augen-Prinzip`: критическое действие подтверждает второй уполномоченный.
- `Default Deny`: явно не разрешённый доступ запрещён.
- `Rezertifizierung`: ответственные регулярно подтверждают необходимость прав.

### 4.2 ACL, группы и RBAC

`ACL` задаёт на объекте, какие субъекты имеют какие права. `RBAC` объединяет права в роли; аккаунты получают роли по задачам. Группы каталога часто технически реализуют роли.

```text
Benutzerkonto → Gruppe „Personal-Lesen“ → чтение папки
Benutzerkonto → Gruppe „Personal-Ändern“ → чтение + изменение
```

Explizite Verweigerungen, наследование и несколько групп влияют на результат. Поэтому эффективное право проверяется практически, а не предполагается по Screenshot.

### 4.3 Joiner–Mover–Leaver

1. `Joiner`: личный однозначный аккаунт, утверждённая Grundrolle, безопасная первичная выдача.
2. `Mover`: удалить старые права, утвердить новую роль, проверить конфликты.
3. `Leaver`: вовремя блокировать аккаунт, сессии и токены, забрать устройства и ключи.
4. Dienst- и Notfallkonten имеют владельца, цель, ротацию и мониторинг.
5. Регулярная Rezertifizierung удаляет накопившиеся права.

Общие администраторские аккаунты избегают. Если они технически неизбежны, нужны контролируемая выдача и дополнительная отслеживаемость.

### 4.4 Безопасность паролей

Правильная практика:

- длинная уникальная Passphrase для каждого сервиса;
- Passwortmanager вместо предсказуемых вариантов;
- проверка новых паролей по спискам известных утечек;
- отказ от Sicherheitsfragen с публично доступными ответами;
- Rate Limiting против автоматических попыток;
- смена при подозрении на компрометацию, не просто ритуальная частая ротация;
- хранение как индивидуально посоленный подходящий Passwort-Hash, не Klartext;
- замена временного стартового пароля при первом использовании и безопасная доставка.

Конкретные длины и правила задаёт действующая политика организации. Текущая NIST-Richtlinie предпочитает длину, Blocklisten и Passwortmanager жёстким требованиям типов символов. Если экзаменационная задача явно задаёт Policy, её применяют и затем оценивают профессионально.

### 4.5 Восстановление и Reset

Сброс пароля — новая проверка идентичности. Helpdesk и Self-Service нельзя обходить легко угадываемыми данными. Recovery-Codes хранят безопасно, используют однократно и заменяют. При потере фактора старый блокируется, новый регистрируется контролируемо.

## 5. Anwendungsfall: смена роли в Support

Mira переходит из First-Level-Support в Personalabteilung. Старый аккаунт читает Tickets и временно имеет lokale Adminrechte. Теперь нужен доступ к кадровым документам, но не к Lohnfreigabe.

### 5.1 Sollkonzept

```text
entziehen: lokale Adminrolle, Support-Schreibrechte, alte API-Token
behalten:  allgemeine Mitarbeiterdienste, soweit erforderlich
vergeben:  Gruppe Personal-Lesen/Ändern nach Freigabe
nicht vergeben: Lohnfreigabe und Benutzeradministration
zusätzlich: MFA prüfen, aktive Sitzungen beenden, Änderung protokollieren
```

### 5.2 Разделение функций

Mira может вносить кадровые данные. Другая роль утверждает изменения зарплаты. Одна скомпрометированная идентичность не может выполнить критический процесс полностью.

### 5.3 Проверка прав

| Тест | Soll |
|---|---|
| корректный вход с обоими факторами | успешно |
| вход только с паролем | отклонён |
| открыть кадровый документ | разрешено |
| внести изменение зарплаты | по роли разрешено |
| самой утвердить своё изменение | отклонено |
| изменить старый Supportticket | отклонено |
| использовать старый заблокированный Token | отклонено и записано |

Positivtests проверяют необходимые права. Negativtests доказывают блокировку запрещённых действий.

## 6. Prüfungsformulierungen

> Passwort und Sicherheitsfrage bilden keine Mehrfaktor-Authentifizierung, da beide Nachweise zur Kategorie Wissen gehören.

> Die alten Supportrechte werden beim Rollenwechsel entfernt, weil angesammelte Berechtigungen dem Least-Privilege-Prinzip widersprechen.

> Ein persönliches Administratorkonto verbessert die Zurechenbarkeit, da sicherheitsrelevante Aktionen einer einzelnen Identität zugeordnet werden können.

> Der Rücksetzprozess benötigt eine angemessene Identitätsprüfung, weil ein schwacher Helpdesk-Reset die zuvor eingerichtete MFA umgehen würde.

## 7. Typische Prüfungsfallen

- Путать Authentifizierung и Autorisierung.
- Считать два доказательства одной категории MFA.
- Считать смартфон Besitz-фактором, если используется только сохранённый на нём пароль.
- Называть OTP полностью phishing-resistent.
- Считать биометрию секретной и легко заменяемой.
- При смене роли добавлять новые права, не удаляя старые.
- Выдавать права отдельным аккаунтам, хотя возможны роли.
- Использовать общие аккаунты без Zurechenbarkeit.
- Выполнять только Positivtests.
- Приравнивать длину пароля к непредсказуемости и уникальности.
- Представлять частую смену без повода универсальной гарантией.
- Сочетать безопасный Login со слабым Recovery.

## 8. Selbsttest

1. Объясни Identifizierung, Authentisierung, Authentifizierung и Autorisierung.
2. Назови три категории факторов с двумя примерами.
3. Является ли PIN + Passwort MFA? Обоснуй.
4. Является ли PIN + Smartcard MFA? Обоснуй.
5. Что означают Least Privilege и Need to Know?
6. Объясни ACL и RBAC.
7. Какие шаги включает Joiner–Mover–Leaver?
8. Почему общие администраторские аккаунты проблемны?
9. Назови пять разумных парольных мер.
10. Почему TOTP не обязательно phishing-resistent?
11. Составь два Positiv- и два Negativtests для Personalordner.
12. Оцени: «Сильная MFA делает Passwortreset неважным».

<details>
<summary>Lösungen anzeigen</summary>

1. Заявить идентичность; предъявить доказательство; проверить его; решить о правах.
2. Wissen: Passwort/PIN; Besitz: Token/Smartcard; Inhärenz: отпечаток/лицо.
3. Нет, оба относятся к Wissen.
4. Да, Wissen и Besitz при независимой проверке.
5. минимальные права; доступ к информации только по реальной необходимости.
6. ACL хранит права на объекте; RBAC объединяет права в роли по задачам.
7. безопасно выдать, при переходе изменить и удалить старое, при уходе заблокировать и вернуть средства.
8. Действия хуже отслеживаются, секреты делятся и сложнее ротируются.
9. длина, уникальность, Passwortmanager, Blockliste, Rate Limiting, MFA, безопасный Hash, Reset; пять достаточно.
10. Пользователь может ввести код на Phishing-сайте, который сразу передаст его дальше.
11. Читать/изменять нужный файл; чужой отдел и Freigabeaktion должны отклоняться.
12. Неверно; манипулируемый Reset заменяет факторы и обходит MFA.

</details>

## 9. Quellen und Abgleich

- [NIST SP 800-63B-4](https://csrc.nist.gov/pubs/sp/800/63/b/4/final) — актуальная Richtlinie по Authentifikatoren, паролям, phishing-resistenten Verfahren и жизненному циклу; опубликована в июле 2025 года.
- [BSI IT-Grundschutz-Kompendium](https://www.bsi.bund.de/grundschutz-kompendium) — Identitäts- und Berechtigungsmanagement и sichere Authentisierung.
- [BSI: Sichere Passwörter](https://www.bsi.bund.de/DE/Themen/Verbraucherinnen-und-Verbraucher/Informationen-und-Empfehlungen/Cyber-Sicherheitsempfehlungen/Accountschutz/Sichere-Passwoerter-erstellen/sichere-passwoerter-erstellen_node.html) — рекомендации для Passphrasen и Passwortmanager.

## 10. Offene Prüfpunkte für den Unterricht

- Требует ли WBS различать Authentisierung и Authentifizierung по немецкой терминологии?
- Какие методы MFA входят в актуальные Aufgaben?
- Следует ли в экзаменационных ответах сравнивать прежние Passwortregeln с NIST SP 800-63B-4?
