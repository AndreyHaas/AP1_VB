---
pruefung: AP1
thema: Netzwerktechnik
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Russisch
gegenstueck: ../de/08-firewall-dmz-und-regelwerke-de.md
---

# Firewall, DMZ и наборы правил

## 1. Lernziele

Ты сможешь:

- различать Paketfilter, Stateful Firewall, Proxy/Application Firewall и Host-Firewall;
- читать Regeln по Quelle, Ziel, Protokoll, Port, Richtung и Zustand;
- применять Default Deny и Least Privilege;
- объяснять DMZ и размещать публичные Dienste;
- проектировать, тестировать и документировать минимальный Regelsatz.

## 2. Prüfungsminimum — 15 Minuten

1. Firewall контролирует Verkehrsflüsse между Zonen или Hosts по правилам.
2. Paketfilter оценивает Headerfelder; Stateful Firewall учитывает Verbindungszustand.
3. Regeln часто обрабатываются сверху вниз, и обычно решает первое совпадение. Точное поведение зависит от продукта.
4. `Default Deny`: разрешать только явно необходимые Verbindungen.
5. Правило содержит Quelle, Ziel, Protokoll/Port, Richtung и Aktion.
6. DMZ — отдельный Netzsegment для публично доступных Systeme.
7. Внутренняя Datenbank не публикуется напрямую в Internet.
8. NAT, VLAN, VPN и Firewall выполняют разные функции.
9. Änderung проверяется Positiv- и Negativtests и протоколируется.

> Nach dem Default-Deny-Prinzip werden nur die für den Geschäftsprozess erforderlichen Verbindungen freigegeben, wodurch die Angriffsfläche reduziert wird.

## 3. Grundlagen

### 3.1 Типы Firewall

| Тип | Уровень решения | Сильная сторона | Ограничение |
|---|---|---|---|
| Paketfilter | IP, Protokoll, Port, Richtung | быстро и понятно | мало Anwendungskontext |
| Stateful Firewall | плюс Verbindungszustand | распознаёт Antwortverkehr | без Zusatzfunktion не видит зашифрованный Inhalt |
| Proxy/Application Firewall | посредничество и анализ Anwendung | более точный контроль | сложнее, зависит от Protokoll |
| WAF | HTTP(S)-Webanwendungen | защита от Webangriffsmuster | не заменяет общую Netzwerk-Firewall |
| Host-Firewall | отдельный Endsystem | защищает и внутри сети | требует централизованного управления |

Next-Generation-Firewall может объединять функции. Но название продукта не доказывает качество Erkennung.

### 3.2 Состав правила

```text
Quelle:       10.5.0.0/24
Ziel:         10.6.0.10
Protokoll:    TCP
Zielport:     22
Richtung:     Admin-Netz → Servernetz
Zustand:      neue Verbindung
Aktion:       erlauben
Logging:      nach Vorgabe
```

Port — только техническая Zuordnung. TCP 443 не доказывает, что там действительно надёжный HTTPS-Dienst.

### 3.3 Stateless и stateful

Stateless Paketfilter оценивает отдельные Pakete. Для Rückverkehr могут потребоваться явные Regeln.

Stateful Firewall ведёт Zustandstabelle. Если исходная Verbindung разрешена, подходящий Rückverkehr определяется как её часть. Произвольное новое входящее Paket от этого не разрешается.

### 3.4 Порядок правил

Пример First-Match-Verarbeitung:

```text
1 DENY  beliebig       → 10.6.0.10 TCP 22
2 ALLOW 10.5.0.0/24    → 10.6.0.10 TCP 22
```

Regel 2 не сработает, потому что Regel 1 уже совпала. Нужно проверять Reihenfolge, Überschneidung и implizite Abschlussregel.

## 4. Vertiefung und Zusammenhänge

### 4.1 DMZ

`Demilitarized Zone` — отдельная Sicherheitszone между менее доверенной сетью и internem Netz.

Обычно в DMZ:

- Reverse Proxy или Web-Frontend;
- Mail-Gateway;
- öffentlicher DNS-Server;
- VPN-Gateway.

Обычно внутри:

- Domain Controller;
- Datenbank с клиентскими или кадровыми данными;
- Datei- и Managementserver;
- Arbeitsplatznetze.

Цель: компрометация публичного Server не должна давать свободный путь в internes Netz.

### 4.2 Варианты DMZ

- dreibeinige Firewall с Interfaces для Internet, DMZ и intern;
- две Firewalls с DMZ между ними;
- virtuelle Zonen на подходящей раздельно управляемой Infrastruktur.

Одной архитектуры мало. Нужны Patchstand, Hardening, Identitäten, Monitoring, Backups и минимальные Berechtigungen.

### 4.3 Egress-Filter и Logging

Важен не только входящий трафик. Egress-Regeln ограничивают исходящие Verbindungen, например Webserver из DMZ только к нужной Datenbank и Update-Repository.

Logging должен быть целесообразным: слишком мало мешает анализу, слишком много создаёт шум и вопросы Datenschutz/Speicher. Обычно пишутся Regel-ID, Zeit, Quelle, Ziel, Aktion и Zustand; чувствительный Inhalt нельзя бездумно помещать в Log.

### 4.4 Change- и Testprozess

1. описать Geschäftsbedarf и Datenfluss;
2. спроектировать конкретное минимальное правило;
3. проверить Risiko, Abhängigkeiten и Rückfallplan;
4. согласовать и выполнить Änderung;
5. провести Positivtest разрешённого трафика;
6. провести Negativtest запрещённого трафика;
7. проверить Logging, Monitoring и Dokumentation;
8. ограничить срок временных Regeln и удалить их.

## 5. Anwendungsfall: Webanwendung в DMZ

```text
Internet
   |
Firewall
   |
DMZ: Web-Frontend 172.16.10.20
   |
Firewall/Zone
   |
Intern: DB 10.0.20.30, Admin-Netz 10.0.5.0/24
```

Требования:

- Kunden используют Web-Frontend по HTTPS;
- Frontend обращается только к Datenbank на TCP 5432;
- Administration только из Admin-Netz по SSH;
- остальное блокируется.

Regelentwurf:

| № | Quelle | Ziel | Dienst | Aktion | Обоснование |
|---:|---|---|---|---|---|
| 1 | Internet | 172.16.10.20 | TCP 443 | Allow | öffentlicher HTTPS-Dienst |
| 2 | 172.16.10.20 | 10.0.20.30 | TCP 5432 | Allow | notwendiger DB-Zugriff |
| 3 | 10.0.5.0/24 | 172.16.10.20 | TCP 22 | Allow | Administration |
| 4 | beliebig | beliebig | alle neuen | Deny | Default Deny |

Tests:

- Internet → Frontend:443 работает;
- Internet → Frontend:22 не работает;
- Internet → DB:5432 не работает;
- Frontend → DB:5432 работает;
- Frontend → другие interne Ziele не работает;
- Admin-Netz → Frontend:22 работает.

## 6. Prüfungsformulierungen

> Die Datenbank wird im internen Netz betrieben und nur vom Web-Frontend auf TCP-Port 5432 freigegeben, damit sie nicht direkt aus dem Internet erreichbar ist.

> Eine Stateful Firewall kann Antwortpakete einer erlaubten Verbindung anhand ihrer Zustandstabelle zuordnen, ohne beliebige neue eingehende Verbindungen freizugeben.

> Die Regel muss vor einer allgemeineren Sperrregel stehen, da bei einer First-Match-Auswertung sonst die frühere passende Regel entscheidet.

> Nach der Änderung werden sowohl erlaubte als auch verbotene Datenflüsse getestet, damit Funktion und wirksame Begrenzung nachgewiesen sind.

## 7. Typische Prüfungsfallen

- NAT не заменяет Firewall и не шифрует.
- Stateful не означает автоматический Inhaltsprüfung.
- WAF защищает Webanwendungen, но не все Netzwerkdienste.
- `any → any` ради быстрой диагностики создаёт большую Angriffsfläche.
- «Administrator» не является Quelladresse; нужен конкретный Admin-Netz или аутентифицированный Zugang.
- DMZ — зона, а не отдельный продукт.
- Freigabe по Port не доказывает безопасность Anwendung.
- Нельзя забывать Reihenfolge и implizite Regeln.
- Одного Positivtest мало; запрещённый трафик тоже проверяется.
- При активных IPv4 и IPv6 нужны правила для обоих.

## 8. Selbsttest

1. Что контролирует Firewall?
2. Различи Paketfilter и Stateful Firewall.
3. Объясни Default Deny.
4. Почему Datenbank с Personalakten не помещают в публичную DMZ?
5. Прочитай: `ALLOW 10.5.0.0/24 → 10.6.0.10 TCP 22`. Кто куда может?
6. Почему общая Deny-Regel может отменить более позднюю Allow-Regel?
7. Спроектируй правило для DNS-Clients `10.10.0.0/24` к Resolver `10.20.0.53`.
8. Назови три Negativtests для DMZ-Fall.
9. Оцени: «Portweiterleitung делает Firewall ненужной».
10. Зачем временной Regel Ablaufdatum?

<details>
<summary>Lösungen anzeigen</summary>

1. Netzwerkverkehr между Zonen/Hosts по заданным критериям.
2. Paketfilter оценивает отдельные Header; Stateful учитывает Verbindungszustände.
3. Всё запрещено, если не требуется и не разрешено явно.
4. Там защищаемые данные, и Server не должен быть доступен напрямую из Internet.
5. Источники из `10.5.0.0/24` могут по SSH к `10.6.0.10`.
6. При First Match решает более раннее совпавшее правило.
7. Quelle `10.10.0.0/24`, Ziel `10.20.0.53`, UDP/TCP 53 по Bedarf, Allow; остальное по Policy.
8. Internet→SSH, Internet→DB, Frontend→другие interne Ziele.
9. Неверно: Portweiterleitung переводит/сопоставляет трафик, а доступ задаёт Firewall.
10. Чтобы Ausnahme не осталось навсегда после исчезновения Bedarf.

</details>

## 9. Quellen und Abgleich

- [NIST SP 800-41 Rev. 1](https://csrc.nist.gov/pubs/sp/800/41/r1/final) — Firewalltechnologien и Firewallpolicy.
- [BSI IT-Grundschutz-Kompendium](https://www.bsi.bund.de/grundschutz-kompendium) — Sicherheitskonzeption, Netzarchitektur и Betrieb.
- Сверено с Routing/NAT и VLAN проекта; Stand 10.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Требуется ли синтаксис конкретного Firewallprodukt или herstellerneutrale Regeln?
- Какую DMZ-Architektur использует WBS?
- Насколько глубоко нужны Proxy, WAF и IPv6-Filterung?
