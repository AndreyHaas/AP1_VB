---
pruefung: AP1
thema: Netzwerktechnik
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Russisch
gegenstueck: ../de/07-vlan-und-netzsegmentierung-de.md
---

# VLAN и сегментация сети

## 1. Lernziele

Ты сможешь:

- объяснять VLAN, Broadcast-Domäne, Access Port и Trunk;
- различать tagged и untagged Frames;
- сопоставлять VLAN с IP-Subnetz и Gateway;
- обосновывать Inter-VLAN-Routing и DHCP-Relay;
- читать небольшой VLAN-Plan, находить ошибки и оценивать границы защиты.

## 2. Prüfungsminimum — 15 Minuten

1. VLAN образует логическую Broadcast-Domäne на Layer 2.
2. Access Port обычно соединяет Endgerät с одним VLAN; Frames к устройству обычно untagged.
3. Trunk переносит несколько VLAN; принадлежность обычно отмечается IEEE 802.1Q.
4. Устройствам разных VLAN нужен Router или Layer-3-Switch.
5. Каждому IP-Subnetz требуется подходящий Layer-3-Gateway.
6. DHCP-Broadcast не пересекает Router без DHCP-Relay.
7. VLAN-Segmentierung уменьшает Broadcast-Verkehr, но не заменяет Firewallpolicy.
8. VLAN-ID, Portzuordnung, Trunk-Liste, Subnetz, Gateway и DHCP-Scope должны совпадать.

> Für die Kommunikation zwischen VLAN 10 und VLAN 20 ist Inter-VLAN-Routing erforderlich, weil beide VLANs getrennte Layer-2-Broadcast-Domänen bilden.

## 3. Grundlagen

### 3.1 Назначение VLAN

`Virtual Local Area Network` делит одну физическую Switch-Infrastruktur на логические сети.

```text
VLAN 10  Verwaltung   10.10.10.0/24
VLAN 20  Entwicklung  10.10.20.0/24
VLAN 30  Gäste        10.10.30.0/24
```

Преимущества:

- Broadcast остаётся в своём VLAN;
- отделы и типы устройств логически разделяются;
- при переезде не всегда требуется новый физический Switch;
- правила между сегментами контролируются на Layer-3-Übergang.

VLAN не шифрует данные. Номер VLAN сам по себе не делает устройство доверенным.

### 3.2 Access и Trunk

| Porttyp | Типичное назначение | VLANs | Frames на линии |
|---|---|---:|---|
| Access | Endgerät | обычно 1 | обычно untagged |
| Trunk | Switch–Switch, Switch–Router, Switch–AP | несколько | обычно 802.1Q-tagged |

802.1Q-Tag содержит VLAN-ID. Поле имеет 12 Bit; не все математически возможные значения доступны как обычные Benutzer-VLANs. Для AP1 важнее правильная Zuordnung, чем запоминание зарезервированных IDs.

### 3.3 Native VLAN и untagged Verkehr

На некоторых Trunks один VLAN передаётся untagged как `Native VLAN`. Поведение зависит от производителя и конфигурации. Настройки обеих сторон должны совпадать. Ненужный Native VLAN и активные неиспользуемые Ports увеличивают риск ошибки и атаки.

### 3.4 VLAN и Subnetz

В простых экзаменационных задачах одному VLAN соответствует один IP-Subnetz. Это хорошая схема, но понятия различны:

- VLAN: Layer-2-Zuordnung и Broadcast-Domäne;
- IP-Subnetz: Layer-3-Adressbereich и Routinggrenze.

Несколько IP-Subnetze в одном VLAN или один Subnetz через разные Layer-2-области технически возможны, но излишне сложны для небольшой сети.

## 4. Vertiefung und Zusammenhänge

### 4.1 Inter-VLAN-Routing

Трафик между VLAN пересылает Router или Layer-3-Switch. Варианты:

- физический Routerinterface на каждый VLAN;
- `Router-on-a-Stick` с 802.1Q-Subinterfaces на одном Trunk;
- Switch Virtual Interfaces (`SVI`) на Layer-3-Switch.

Client отправляет Paket в другой Subnetz на MAC-Adresse своего Default Gateways. Ziel-IP сервера сохраняется, а Router создаёт новый Layer-2-Frame для следующего участка.

### 4.2 DHCP через границы VLAN

DHCP Discover начинается как Broadcast. Если Server в другом VLAN, `DHCP-Relay-Agent` на Gateway принимает Nachricht и направляет её Server. На Server нужен Scope для Client-Subnetz.

При «VLAN 10 получает адрес, VLAN 20 только APIPA» проверяются:

1. Access-Port-Zuordnung клиента;
2. разрешён ли VLAN на Trunk;
3. Layer-3-Interface и Relay для VLAN 20;
4. DHCP-Scope и свободные Leases;
5. Filter для DHCP-Verkehr.

### 4.3 Сегментация и безопасность

VLAN создаёт зоны, но доступ задают Routing-, ACL- или Firewallregeln. Gast-VLAN не становится безопасным только потому, что назван `VLAN 30`.

Разумные меры:

- отключить неиспользуемые Ports и поместить их в неиспользуемый VLAN;
- настраивать Trunk только там, где нужны несколько VLAN;
- ограничить erlaubte VLAN-Liste;
- вынести Managementzugriff в отдельный защищённый Segment;
- разрешать Inter-VLAN-Verkehr по принципу Default Deny;
- документировать Konfiguration и Portbelegung.

## 5. Anwendungsfall: три отдела

Дано:

```text
VLAN 10 Verwaltung    192.168.10.0/26  Gateway 192.168.10.1
VLAN 20 Entwicklung   192.168.20.0/25  Gateway 192.168.20.1
VLAN 30 Gäste         192.168.30.0/27  Gateway 192.168.30.1
DHCP-Server            192.168.10.10
```

Требования:

- Verwaltung использует Druckserver `192.168.20.20:631/TCP`;
- Gäste получают только Internet;
- DHCP работает централизованно.

Эскиз решения:

1. Clientports настроить как Access Ports нужного VLAN.
2. Uplink настроить как Trunk с VLAN 10, 20 и 30.
3. создать Layer-3-Interface с Gatewayadresse для каждого VLAN.
4. настроить Relay в VLAN 20 и 30 к DHCP-Server.
5. создать Scope для каждого Subnetz.
6. целенаправленно разрешить Verwaltung → Druckserver.
7. заблокировать Gäste → interne Netze, разрешить необходимый Internet.
8. протоколировать Regeln, Ports, VLANs и Tests.

Frame от Verwaltung-Client к Druckserver:

```text
Ziel-IP  = 192.168.20.20
Ziel-MAC = MAC des Gateways 192.168.10.1
```

Ziel-MAC не равна MAC удалённого Server, потому что он в другом Subnetz.

## 6. Prüfungsformulierungen

> Ein Access Port wird für ein Endgerät verwendet und gehört normalerweise zu genau einem VLAN, während ein Trunk mehrere VLANs mit IEEE-802.1Q-Tags transportiert.

> Das Gastnetz wird in einem eigenen VLAN und Subnetz betrieben, damit Broadcasts getrennt bleiben und der Übergang zu internen Netzen durch Firewallregeln kontrolliert werden kann.

> Auf dem Gateway von VLAN 20 ist ein DHCP-Relay erforderlich, da Router den ursprünglichen DHCP-Broadcast nicht automatisch zum Server in VLAN 10 weiterleiten.

> Die VLAN-Segmentierung allein ist keine vollständige Zugriffskontrolle, weil ohne Layer-3-Regeln grundsätzlich gerouteter Verkehr zwischen den Segmenten möglich sein kann.

## 7. Typische Prüfungsfallen

- Не считать Access Port по определению соединением только с одним физическим устройством: бывают Sonderfälle.
- Trunk означает не «быстрее», а «несколько VLAN-Zuordnungen».
- VLAN-ID не является IP-Netznummer.
- Разные VLAN не общаются напрямую на Layer 2.
- Нужны и DHCP-Relay, и DHCP-Server-Scope.
- Для удалённого Ziel первый Frame содержит Gateway-MAC, а не Server-MAC.
- VLAN делит Broadcasts, но не шифрует Nutzdaten.
- `Default VLAN` и `Native VLAN` не обязательно одно и то же.
- Разрешённого VLAN на Switch A недостаточно, если его нет на Trunk Switch B.
- Dynamische VLAN-Zuordnung требует надёжной Authentisierung и корректных Fallback-Regeln.

## 8. Selbsttest

1. Что такое Broadcast-Domäne?
2. Различи Access Port и Trunk.
3. Почему трафику между VLAN нужен Layer-3-Gerät?
4. Какие две части нужны DHCP для Clients в другом VLAN?
5. PC в VLAN 20 не достигает PC на том же Switch, ошибочно назначенного VLAN 10. Почему?
6. Назови четыре проверки, если только VLAN 30 не получает DHCP.
7. Какая Ziel-MAC будет в первом Frame от `192.168.10.50` к `192.168.20.20`?
8. Спроектируй минимальную сегментацию для Mitarbeiter, Gäste и Management.
9. Оцени: «VLAN 30 безопасен, потому что гости не видят сотрудников».
10. Зачем ограничивать Liste erlaubter VLANs на Trunk?

<details>
<summary>Lösungen anzeigen</summary>

1. Layer-2-область, в которой Broadcast достигает всех участников.
2. Access: обычно один VLAN untagged. Trunk: несколько VLAN, обычно tagged.
3. VLAN — отдельные Layer-2-Netze; связь IP-Netze выполняет Routing.
4. DHCP-Relay на Gateway и подходящий Scope на Server.
5. Устройства в разных Broadcast-Domänen и нуждаются в Routing.
6. Clientport, Trunk, SVI/Gateway, Relay, Scope, Filter; достаточно любых четырёх.
7. MAC-Adresse шлюза VLAN 10.
8. Три VLAN/Subnetze, Inter-VLAN-Routing, Default-Deny; Management только администраторам.
9. Утверждение неполно: безопасность зависит от Port-, Routing- и Firewallkonfiguration.
10. Чтобы ненужные VLAN не проходили через Link и последствия Fehlkonfiguration были меньше.

</details>

## 9. Quellen und Abgleich

- [IEEE 802.1Q-2022](https://standards.ieee.org/ieee/802.1Q/10323/) — Bridges, Bridged Networks и VLAN-Funktionen.
- [RFC 2131](https://datatracker.ietf.org/doc/html/rfc2131) — DHCP и Relay-Verarbeitung.
- Главы проекта по IPv4, DHCP и Routing; Stand 10.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Требуются ли reservierte VLAN-IDs или только Access/Trunk/Tagging?
- Нужно ли настраивать Router-on-a-Stick или только объяснять?
- Какие Switch-Hardening-Befehle важны для WBS?
