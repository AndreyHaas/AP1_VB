---
pruefung: AP1
thema: Netzwerktechnik
prioritaet: Vertiefung
status: Entwurf
stand: 2026-09-10
sprache: Russisch
gegenstueck: ../de/09-ids-ips-und-vpn-de.md
---

# IDS, IPS и VPN

## 1. Lernziele

Ты сможешь:

- различать Firewall, IDS и IPS по задаче и позиции;
- объяснять signatur- и anomaliebasierte Erkennung;
- уверенно различать False Positive и False Negative;
- различать Remote-Access-, Site-to-Site- и End-to-End-VPN;
- оценивать защиту и границы VPN;
- сочетать Erkennung, Prävention, sicheren Tunnel и дополнительные меры.

## 2. Prüfungsminimum — 15 Minuten

1. IDS обнаруживает и сообщает о подозрительной активности; обычно само не блокирует.
2. IPS стоит активно в Datenpfad и может блокировать распознанный Verkehr.
3. Firewall исполняет Verkehrsregeln; IDS/IPS дополнительно ищет Angriffsmuster или Abweichungen.
4. `False Positive`: нормальная активность ошибочно распознана как Angriff.
5. `False Negative`: настоящий Angriff остался незамеченным.
6. Signaturerkennung ищет известные Muster; Anomalieerkennung — отклонения от ожидаемого поведения.
7. Remote Access соединяет Client с сетью; Site to Site соединяет сети.
8. VPN криптографически защищает данные на определённом пути, но не делает Endgeräte и Inhalte автоматически безопасными.
9. Нужны starke Authentisierung, minimale Berechtigungen, Patchstand и Monitoring.

> Ein IDS eignet sich zur Erkennung und Alarmierung, während ein IPS zusätzlich automatisch eingreifen kann, dafür aber wegen möglicher Fehlalarme sorgfältig getestet werden muss.

## 3. Grundlagen IDS und IPS

### 3.1 Сравнение задач

| System | Hauptaufgabe | Типичная реакция | Position |
|---|---|---|---|
| Firewall | исполнять разрешённые Datenflüsse | allow/deny/log | Übergang или Host |
| IDS | распознавать подозрительную активность | Alarm, Log, Ticket | часто пассивно через Sensor/Spiegelport |
| IPS | распознавать и предотвращать | blockieren, verwerfen, Verbindung beenden | inline в Datenpfad |

Функции могут быть объединены в одном продукте. В ответе важна описанная функция, а не название продукта.

### 3.2 Методы обнаружения

`Signaturbasiert`:

- сравнивает Ereignisse с известными Mustern;
- часто точно распознаёт известные Angriffe;
- требует актуальных Signaturen;
- может пропустить новый или сильно изменённый Angriff.

`Anomaliebasiert`:

- сравнивает поведение с Basiswerten или Modell;
- может найти неизвестные Abweichungen;
- требует обучения, Tuning и контекста;
- может принять легитимный Sonderfall за Angriff.

Дополнительный контекст дают Protokollanalyse, Reputation, Datei- и Verhaltensanalyse. Ни один метод не распознаёт всё.

### 3.3 Ошибки распознавания

| Реальность | Meldung | Ergebnis |
|---|---|---|
| Angriff отсутствует | Alarm | False Positive |
| Angriff есть | kein Alarm | False Negative |
| Angriff есть | Alarm | True Positive |
| Angriff отсутствует | kein Alarm | True Negative |

False Positives отнимают время и могут блокировать легитимный трафик в IPS. False Negatives пропускают атаку. Schwellenwerte часто меняют баланс между ними.

### 3.4 Размещение и эксплуатация

Sensor может находиться:

- на Internetübergang;
- между DMZ и internem Netz;
- перед критическим Serversegment;
- на Hosts как HIDS/HIPS;
- в WLAN или Cloud-Datenpfad.

Зашифрованный Datenstrom ограниченно доступен Netzwerksensor. Анализ возможен в разрешённой точке Entschlüsselung или на Endsystem; учитываются Datenschutz и риски ключей.

## 4. VPN-Grundlagen und Grenzen

### 4.1 Типы VPN

| Тип | Endpunkte | Пример |
|---|---|---|
| Remote Access / End to Site | Client ↔ Unternehmensgateway | Notebook в Homeoffice |
| Site to Site | Gateway ↔ Gateway | две Filialnetze |
| End to End | Anwendung/Host ↔ Anwendung/Host | прямая защищённая Verbindung |

VPN-Tunnel использует криптографические механизмы для Vertraulichkeit, Integrität и Authentisierung партнёра — в зависимости от Protokoll и Konfiguration.

### 4.2 IPsec и другие VPN-Verfahren

`IPsec` защищает IP-Kommunikation на Netzwerkschicht и обычно использует IKE для Aushandlung и Schlüsselmanagement. В Tunnelmodus исходное IP-Paket может быть полностью защищено и вложено в новое.

TLS-basierte VPNs и другие Protokolle тоже дают Remote Access. Слово «VPN» не задаёт Algorithmus или Sicherheitsniveau; устаревшие Protokolle и слабые настройки исключаются.

### 4.3 Full Tunnel и Split Tunnel

- `Full Tunnel`: заданный Clientverkehr идёт через Unternehmensgateway; проще zentraler Kontrolle, выше Bandbreitenbedarf.
- `Split Tunnel`: только Unternehmensziele идут через Tunnel, локальные/Internet-Ziele — напрямую. Нагрузка меньше, но путей и рисков больше.

Решение зависит от Risiko, Datenschutz, Leistung и Unternehmensrichtlinie. Универсального победителя нет.

### 4.4 Чего VPN не делает

VPN не гарантирует:

- отсутствие Schadsoftware на Endgerät;
- правильные Berechtigungen после входа;
- надёжность Webseiten или Dateien;
- полную Anonymität;
- защиту вне Tunnelendpunkte;
- Verfügbarkeit удалённого Dienst.

Дополнительно нужны MFA, Gerätezustandsprüfung, Patchmanagement, Endpoint-Security, minimale Rechte, Firewallregeln, Logging и Incident Response.

## 5. Anwendungsfall: Homeoffice и филиалы

Требования:

- 40 Beschäftigte обращаются из Homeoffice к ERP;
- два филиала постоянно обмениваются данными;
- подозрительный доступ к ERP должен распознаваться;
- Fehlalarm не должен незаметно остановить Betrieb.

Решение:

1. Remote-Access-VPN для сотрудников с MFA.
2. Site-to-Site-VPN между Filialgateways.
3. rollenbasierte Freigabe только к нужным Diensten.
4. IDS-Sensor или осторожно настроенный IPS перед ERP-Segment.
5. IPS сначала тестировать в Erkennungsmodus или с точечными Blockregeln.
6. приоритизировать Alarme, назначить Verantwortliche и Eskalationsweg.
7. документировать Positivtest, Negativtest, Logging и Wiederherstellungsplan.

Примеры:

```text
Nächtliches Backup erzeugt ungewöhnlich viel Datenverkehr → möglicher False Positive
Bekannte Exploit-Signatur, Verbindung wird beendet       → IPS-Aktion / True Positive, wenn Angriff bestätigt
Neuer Angriff ohne Alarm                                 → False Negative
```

## 6. Prüfungsformulierungen

> Beim Remote-Access-VPN verbindet sich ein einzelner Client mit dem Unternehmensnetz, während ein Site-to-Site-VPN zwei Netze über ihre Gateways koppelt.

> Die Signaturerkennung eignet sich besonders für bekannte Angriffsmuster, kann jedoch neue oder veränderte Angriffe übersehen, wenn keine passende Signatur vorhanden ist.

> Der Backupverkehr ist ein False Positive, wenn er legitim ist, aber fälschlich als Angriff gemeldet wird.

> Das VPN wird mit MFA und minimalen Firewallfreigaben kombiniert, weil der geschützte Tunnel allein weder die Identität ausreichend absichert noch unbeschränkten internen Zugriff rechtfertigt.

## 7. Typische Prüfungsfallen

- IDS обычно сообщает; IPS может блокировать.
- IPS не автоматически лучше: учитываются Fehlblockierungen и Verfügbarkeit.
- Не путать False Positive и False Negative.
- Отсутствие Alarm не доказывает отсутствие Angriff.
- Signaturdatenbank должна обновляться, но Restrisiko остаётся.
- VPN и HTTPS могут применяться вместе; Tunnel не заменяет Anwendungsschutz.
- VPN не делает Client доверенным.
- Split Tunnel не означает незашифрованные Unternehmensdaten при правильном Routing, но меняет путь других данных.
- Verschlüsselter Verkehr может мешать Netzwerkerkennung.
- Общее VPN-Konto мешает Nachvollziehbarkeit и индивидуальной Sperrung.

## 8. Selbsttest

1. Различи Firewall, IDS и IPS.
2. Определи False Positive и False Negative.
3. Сравни Signatur- и Anomalieerkennung.
4. Сопоставь: Homeoffice-Notebook; Verbindung двух филиалов.
5. Почему Remote-Access-VPN дополнительно требует MFA?
6. Legitimes Backup вызывает Alarm. Что это?
7. IPS блокирует новую Fachanwendung. Какая реакция нужна?
8. Назови четыре Grenzen VPN.
9. Оцени Full Tunnel и Split Tunnel для управляемого Notebook.
10. Спроектируй защиту публичного VPN-Gateway.

<details>
<summary>Lösungen anzeigen</summary>

1. Firewall исполняет Regeln; IDS распознаёт/сообщает; IPS распознаёт и может inline блокировать.
2. False Positive: ложная тревога. False Negative: Angriff пропущен.
3. Signatur: известные Muster, нужны Updates. Anomalie: Abweichungen, требуется Tuning, возможны Fehlalarme.
4. Remote Access; Site to Site.
5. Чтобы украденного Passwort было недостаточно.
6. False Positive.
7. Проверить Ereignis, точечно настроить Regel/Schwelle, минимизировать Ausnahme, протестировать и документировать; не отключать всё.
8. Нет Malware-, Berechtigungs-, Inhalts- или Endpunktschutz; нет гарантии Verfügbarkeit/Anonymität.
9. Full Tunnel упрощает zentraler Kontrolle, но требует Bandbreite; Split Tunnel снижает нагрузку, но расширяет Datenwege/Risiken.
10. Patches, Hardening, MFA, minimale Freigaben, Rate Limits по Bedarf, Monitoring, sichere Protokolle и Notfallplan.

</details>

## 9. Quellen und Abgleich

- [NIST SP 800-94](https://csrc.nist.gov/pubs/sp/800/94/final) — Grundlagen и Betrieb IDPS; источник старый, поэтому используются только стабильные продуктонезависимые понятия.
- [NIST SP 800-77 Rev. 1](https://csrc.nist.gov/pubs/sp/800/77/r1/final) — IPsec и IKE.
- [BSI IT-Grundschutz-Kompendium](https://www.bsi.bund.de/grundschutz-kompendium) — актуальные дополнительные Sicherheitsanforderungen; Stand 10.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Нужны ли HIDS/NIDS и конкретные Sensorpositionen?
- Требуется ли различать IPsec Transport- и Tunnelmodus?
- Какую Full-/Split-Tunnel-Policy использует WBS?
