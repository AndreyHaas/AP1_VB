---
pruefung: AP1
thema: Kryptografie und TLS
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Russisch
gegenstueck: ../de/04-hashing-verschluesselung-signatur-zertifikate-und-tls-de.md
---

# Хеширование, шифрование, подпись, сертификаты и TLS

## 1. Lernziele

Ты умеешь:

- различать Hashing и Verschlüsselung по назначению;
- правильно объяснять Salt, Pepper и Passwort-Hashfunktion;
- сравнивать симметричные, асимметричные и гибридные методы;
- выбирать Public и Private Key для конфиденциальности и подписи;
- объяснять цели и ограничения цифровой подписи;
- описывать содержание, подпись и Vertrauenskette сертификата;
- называть основные проверки Webserverzertifikat;
- объяснять упрощённый TLS-1.3-Ablauf и гибридную работу;
- находить типичные ошибки ключей и сертификатов.

## 2. Prüfungsminimum — 15 Minuten

1. Hashing — одностороннее отображение для отпечатка/сравнения; Verschlüsselung обратимо с правильным ключом.
2. Пароли хранят подходящей медленной Passwort-Hashfunktion с индивидуальным Salt, не в Klartext.
3. Salt индивидуален и не секретен; Pepper опционален, секретен и хранится отдельно.
4. Симметрично: один секретный ключ, быстро; асимметрично: Public-/Private-Key-Paar, дороже.
5. Конфиденциальная отправка: шифровать Public Key получателя; расшифровывать его Private Key.
6. Подпись: Private Key отправителя; проверка: Public Key отправителя.
7. Подпись поддерживает Integrität, Authentizität и Zurechenbarkeit, но не Vertraulichkeit.
8. Сертификат связывает идентичность/домен с Public Key и подписывается CA; Private Key в нём отсутствует.
9. Браузер проверяет Hostname, срок, цепочку, назначение и доступный статус отзыва.
10. TLS защищает канал аутентичностью, конфиденциальностью и целостностью, но не доказывает честность содержания.

> Der Absender signiert mit seinem Private Key, während der Empfänger die Signatur mit dem Public Key des Absenders prüft.

## 3. Hashing und Passwortspeicherung

### 3.1 Криптографическая Hashfunktion

Hashfunktion отображает данные произвольной длины в значение фиксированной длины. Для криптографии важны:

- односторонность: практически нельзя восстановить вход из Hash;
- Preimage-Resistenz: трудно найти вход для заданного Hash;
- Kollisionsresistenz: трудно найти два разных входа с одинаковым Hash;
- Avalanche-Effekt: малое изменение входа сильно меняет Hash.

```text
Dokument → Hashfunktion → Hashwert
Dokument изменён → другой Hashwert
```

Совпавший Hash доказывает целостность только тогда, когда алгоритм и эталон защищены либо аутентифицированы.

### 3.2 Hashing — не шифрование

| Метод | Обратим? | Ключ? | Главная цель |
|---|---|---|---|
| Hashing | концептуально нет | обычно нет | проверка целостности, отпечаток |
| Verschlüsselung | да, с ключом | да | Vertraulichkeit |
| digitale Signatur | проверяема, но не «расшифровывает документ» | пара ключей | Integrität и Authentizität |

Злоумышленник всё же угадывает слабые пароли: хеширует каждый кандидат и сравнивает. Односторонность не означает неуязвимость к перебору.

### 3.3 Безопасное хранение паролей

```text
Passwort + individueller Salt + Parameter
→ Passwort-Hashfunktion/KDF
→ gespeicherter Wert
```

Подходящие методы: Argon2id, scrypt, bcrypt или корректно настроенный PBKDF2. Быстрая общая функция SHA-256 сама по себе непригодна: массовое угадывание остаётся дешёвым.

`Salt`:

- случаен и индивидуален для каждой записи;
- хранится вместе с Hash и параметрами;
- одинаковые пароли не видны напрямую как одинаковые Hashes;
- мешает готовым таблицам, но не перебору каждой записи.

`Pepper`:

- необязательный общий или системно управляемый секрет;
- хранится отдельно от базы, например в Secret Store/HSM;
- не заменяет индивидуальный Salt;
- требует Rotation- и Ausfallkonzept.

## 4. Verschlüsselung, Signatur und PKI

### 4.1 Симметричное шифрование

Один и тот же секретный материал применяется для шифрования и расшифрования.

Плюсы: быстро и эффективно для больших объёмов. Сложность: безопасно распределять, хранить, менять и отзывать ключи. Примеры базового уровня: AES, ChaCha20.

### 4.2 Асимметричное шифрование

```text
Public Key  → можно распространять
Private Key → остаётся секретным у владельца
```

Для конфиденциальности:

```text
Alice шифрует для Bob → Bobs Public Key
Bob расшифровывает    → Bobs Private Key
```

Асимметрия не решает автоматически доверие: Alice должна знать, что Public Key действительно принадлежит Bob.

### 4.3 Гибридный метод

Гибрид соединяет асимметричную аутентификацию/согласование ключа с быстрым симметричным шифрованием данных. Современные протоколы часто выводят Sitzungsschlüssel из Schlüsselaustausch, а не передают готовый симметричный ключ напрямую.

### 4.4 Цифровая подпись

Упрощённая модель:

```text
Signieren: Dokument → Hash → Signatur mit Private Key des Absenders
Prüfen:    Dokument → Hash + Signaturprüfung mit Public Key des Absenders
```

Цели:

- Integrität: изменение обнаруживается при правильной проверке;
- Authentizität/Zurechenbarkeit: подпись соответствует контролируемому Private Key;
- Nichtabstreitbarkeit только вместе с надёжной привязкой личности, контролем ключа и процессами.

Подпись не скрывает содержание. Для Vertraulichkeit нужно отдельное шифрование.

### 4.5 Сертификат и CA

X.509-Zertifikat обычно содержит:

- владельца или домены (`Subject Alternative Name`);
- Public Key;
- издателя;
- срок и серийный номер;
- допустимые назначения;
- цифровую подпись издателя.

Private Key сервера никогда не входит в сертификат. CA подписывает своим Private Key; проверяют Public Key CA.

```text
Serverzertifikat → Intermediate CA → vertrauenswürdige Root CA
```

Цепочка полезна, только если подходят подписи, имена, срок, назначение и остальные правила. Самоподписанный сертификат может участвовать в шифровании, но без отдельно установленного доверия не имеет публично подтверждённой Identitätskette.

## 5. Anwendungsfall: подписанный документ и HTTPS

### 5.1 Конфиденциально и с подписью от Alice к Bob

```text
1. Alice подписывает Alices Private Key.
2. Alice шифрует для Bob или согласует защиту
   с применением доверенного Bobs Public Key.
3. Bob расшифровывает Bobs Private Key.
4. Bob проверяет подпись Alices Public Key.
```

Схема:

| Цель | Ключ |
|---|---|
| зашифровать для получателя | Public Key des Empfängers |
| расшифровать | Private Key des Empfängers |
| подписать | Private Key des Absenders |
| проверить подпись | Public Key des Absenders |

### 5.2 Проверка браузера при HTTPS

Браузер обычно проверяет:

1. подходит ли Hostname к сертификату?
2. попадает ли текущее время в Gültigkeitszeitraum?
3. ведёт ли Signaturkette к доверенной Root CA?
4. разрешена ли Serverauthentifizierung?
5. не отозван ли сертификат по доступной информации?
6. доказывает ли сервер владение соответствующим Private Key в Handshake?

Действительный сертификат подтверждает контролируемую связь ключа с доменом, но не моральную надёжность сайта.

### 5.3 Упрощённый TLS-1.3-Ablauf

```text
ClientHello: версии, параметры, доля Schlüsselaustausch
ServerHello: выбор и собственная доля Schlüsselaustausch
Server: Zertifikatskette + доказательство владения ключом
Client: проверить цепочку, Hostname и доказательство
оба: вывести общее Schlüsselmaterial и Sitzungsschlüssel
затем: симметрично и аутентифицированно шифровать Anwendungsdaten
```

На 11.09.2026 RFC 9846 специфицирует TLS 1.3 и заменяет RFC 8446. Для AP1 ядро модели не меняется: Handshake аутентифицирует и согласует ключевой материал; Record-Layer эффективно защищает данные симметрично.

Обычный HTTPS аутентифицирует сервер. Clientzertifikate или иные процедуры для клиента настраиваются отдельно.

## 6. Prüfungsformulierungen

> Ein individueller Salt muss nicht geheim sein; er sorgt dafür, dass gleiche Passwörter unterschiedliche gespeicherte Hashwerte erzeugen.

> Die Datei wird mit dem Public Key des Empfängers verschlüsselt, da nur der zugehörige Private Key die vertraulichen Daten entschlüsseln soll.

> Die digitale Signatur gewährleistet keine Vertraulichkeit, weil der Dokumentinhalt dadurch nicht verborgen wird.

> Das Zertifikat enthält den Public Key und die Signatur der CA, aber nicht den Private Key des Servers.

> TLS schützt die Verbindung gegen Mitlesen und unbemerkte Veränderung, beweist jedoch nicht, dass der Inhalt der Website ehrlich oder ungefährlich ist.

## 7. Typische Prüfungsfallen

- Называть Hashing обратимым шифрованием.
- Пытаться скрыть Salt или применять один Salt для всех аккаунтов.
- Называть SHA-256 идеальным хранением пароля.
- Выбирать Public/Private только по правилу «отправитель всегда Private» без учёта цели.
- Шифровать для получателя Public Key отправителя.
- Путать подпись с конфиденциальностью.
- Полагать, что Private Key передаётся в сертификате.
- Проверять только срок сертификата.
- Приравнивать действительный сертификат к честному содержанию.
- Не замечать симметричное шифрование Nutzdaten в TLS.
- Считать обычный HTTPS автоматической аутентификацией пользователя.
- Называть RFC 8446 актуальной спецификацией после замены в 2026 году.

## 8. Selbsttest

1. Различи Hashing и Verschlüsselung.
2. Почему одного SHA-256 недостаточно для паролей?
3. Объясни Salt и Pepper.
4. Сравни симметричное и асимметричное шифрование.
5. Каким ключом Alice шифрует конфиденциально для Bob?
6. Каким ключом Bob расшифровывает?
7. Каким ключом Alice подписывает и Bob проверяет?
8. Какие цели поддерживает подпись, а какую нет?
9. Назови шесть типичных полей сертификата.
10. Какие проверки выполняет браузер?
11. Почему TLS работает гибридно?
12. Оцени: «Замок доказывает честность магазина».

<details>
<summary>Lösungen anzeigen</summary>

1. Hashing — односторонний отпечаток; Verschlüsselung обратимо ключом и защищает Vertraulichkeit.
2. Он слишком быстр и облегчает массовый перебор; нужна Passwort-KDF с Salt и параметрами.
3. Salt индивидуален/не секретен против одинаковых Hashes и таблиц; Pepper опционален/секретен/отделён.
4. Симметрично быстро с общим секретом; асимметрично использует пару и требует больше ресурсов.
5. Bobs Public Key.
6. Bobs Private Key.
7. Alices Private Key; Alices Public Key.
8. Integrität, Authentizität, Zurechenbarkeit; не Vertraulichkeit.
9. владелец/домен, Public Key, издатель, срок, серийный номер, назначение, CA-Signatur; достаточно шести.
10. Hostname, срок, цепочку/доверие, назначение, отзыв и владение ключом в Handshake.
11. Асимметрия для аутентификации/ключевого соглашения, симметрия для эффективных Nutzdaten.
12. Неверно; он означает защищённый канал к проверенному домену, не честность содержания.

</details>

## 9. Quellen und Abgleich

- [RFC 9846 — TLS 1.3](https://datatracker.ietf.org/doc/html/rfc9846) — актуальная TLS-1.3-спецификация с июля 2026 года, заменившая RFC 8446.
- [RFC 5280 — X.509 PKI](https://datatracker.ietf.org/doc/html/rfc5280) — профиль сертификатов и списков отзыва.
- [RFC 9106 — Argon2](https://datatracker.ietf.org/doc/html/rfc9106) — memory-hard-функция для паролей; параметры задаются актуально.
- [NIST SP 800-63B-4](https://csrc.nist.gov/pubs/sp/800/63/b/4/final) — хранение/проверка паролей и требования к Authentifikatoren.

## 10. Offene Prüfpunkte für den Unterricht

- Какие алгоритмы нужно называть в WBS-Aufgabensatz?
- Проверяется только Zertifikatskette или также CRL/OCSP?
- Нужно рисовать упрощённый TLS-Handshake или достаточно описания?
