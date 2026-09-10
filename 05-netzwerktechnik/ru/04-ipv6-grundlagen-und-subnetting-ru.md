---
pruefung: AP1
thema: IPv6-Grundlagen und Subnetting
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/04-ipv6-grundlagen-und-subnetting-de.md
---

# AP1: IPv6-Grundlagen und Subnetting

IPv6 расширяет адресное пространство до 128 Bit и меняет локальные механизмы: Broadcast отсутствует, Nachbarschaftsauflösung выполняет NDP, а Router Advertisements участвуют в конфигурации. Subnetting обычно планируется по границам Präfix, а не по экономии отдельных Hostadressen.

---

## 1. Lernziele

После изучения главы нужно уметь:

- правильно сокращать и разворачивать IPv6-Adresse;
- распознавать Global Unicast, Link-Local, Unique Local и Multicast;
- объяснять Präfix и Interface Identifier;
- рассчитывать число Subnetze при делении выделенного Präfix;
- планировать типовые `/64`-Subnetze;
- различать SLAAC, DHCPv6 и statische Konfiguration;
- объяснять Router Advertisement и NDP;
- сравнивать IPv4 и IPv6 без неверных упрощений.

---

## 2. Prüfungsminimum — 15 Minuten

```text
IPv6 = 128 Bit = 8 Blöcke zu je 16 Bit = hexadezimal
führende Nullen je Block entfernen
eine längste Nullblockfolge einmal mit :: ersetzen
```

| Bereich | Bedeutung |
|---|---|
| `2000::/3` | Global Unicast |
| `fe80::/10` | Link-Local Unicast |
| `fc00::/7` | Unique Local Unicast |
| `ff00::/8` | Multicast |
| `::1/128` | Loopback |
| `::/128` | nicht spezifiziert |
| `2001:db8::/32` | Dokumentation |

```text
/48 → /64 = 16 zusätzliche Subnetzbits = 65 536 /64-Netze
/56 → /64 = 8 zusätzliche Subnetzbits  = 256 /64-Netze
/60 → /64 = 4 zusätzliche Subnetzbits  = 16 /64-Netze
```

> IPv6 verwendet keinen Broadcast; lokale Nachbarschaftsauflösung und Routererkennung erfolgen über NDP mit ICMPv6.

---

## 3. Aufbau und Schreibweise

IPv6-Adresse имеет восемь Blöcke по четыре hexadezimale Zeichen:

```text
2001:0db8:0000:0000:021a:2bff:fe3c:4d5e
```

Каждый Hexadezimalstelle представляет четыре Bit. Ein Block enthält 16 Bit, вся Adresse — 128 Bit.

Groß- und Kleinschreibung der Buchstaben ist technisch gleichwertig; in Dokumentation обычно используется Kleinschreibung.

---

## 4. Führende Nullen entfernen

В каждом Block можно удалить только ведущие Nullen:

```text
0db8 → db8
0000 → 0
0042 → 42
```

Нули в середине или в конце значимого Blocks не удаляются:

```text
1200 ≠ 12
```

---

## 5. Doppelpunkt-Kompression

Одна последовательность полных Nullblöcke может быть заменена на `::`.

```text
2001:db8:0:0:0:ff00:42:8329
→ 2001:db8::ff00:42:8329
```

`::` разрешается только один раз, иначе невозможно однозначно определить число пропущенных Blöcke. Обычно сокращают самую длинную последовательность; при равной длине канонически выбирают первую.

---

## 6. Adresse разворачивать

`2001:db8:12::50` содержит слева три Blöcke (`2001`, `db8`, `12`) и справа один (`50`). До восьми не хватает четырёх Nullblöcke:

```text
2001:0db8:0012:0000:0000:0000:0000:0050
```

Надёжная проверка: после разворачивания должно быть ровно восемь Blöcke.

---

## 7. Präfix

Как и в CIDR IPv4, `/n` задаёт число ведущих Netzbits.

```text
2001:db8:1234:5600::/56
```

Первые 56 Bit фиксированы Netzpräfix. Следующие Bits могут использоваться для Subnetz-ID; остальные — для Interface Identifier.

Eine IPv6-Adresse без Präfix не сообщает размер сети.

---

## 8. Global Unicast

`2000::/3` обозначает общий Bereich глобально маршрутизируемых Unicast-Adressen. Реальное выделение идёт через Provider/RIR и организационную Adressplanung.

`2001:db8::/32` зарезервирован для документации и не должен использоваться как настоящий публичный Präfix.

Global Unicast не означает автоматически Erreichbarkeit: Firewall, Routing и Dienst остаются отдельными условиями.

---

## 9. Link-Local Unicast

`fe80::/10` действует только на локальном Link. IPv6-Schnittstelle обычно имеет Link-Local-Adresse даже при наличии Global Unicast.

Она используется, например, NDP и как Next-Hop-Adresse Router. Одинаковые Link-Local-Adressen могут существовать на разных Interfaces; поэтому ОС иногда требует Zone-ID:

```text
fe80::1%eth0
```

Router не пересылают Link-Local-Pakete между Links.

---

## 10. Unique Local Unicast

`fc00::/7` — Bereich для Unique Local Adressen; practically local prefixes обычно начинаются с `fd`.

ULA предназначены для внутренней адресации и не являются глобально маршрутизируемыми öffentlichen Adressen. Они не являются точной копией IPv4 RFC-1918: размер, Bildung и typische Nutzung отличаются.

---

## 11. Multicast, Anycast и kein Broadcast

- `Multicast` (`ff00::/8`) адресует группу Empfänger.
- `Anycast` использует обычный Unicast-Adressformat на нескольких Interfaces; Routing führt zu einem passenden/nächsten Ziel.
- `Broadcast` в IPv6 отсутствует; функции заменяются адресными Multicast-Verfahren.

Нельзя переводить IPv4-Broadcastadresse в «последний IPv6-Host».

---

## 12. Spezielle Adressen

| Adresse | Bedeutung |
|---|---|
| `::1/128` | Loopback |
| `::/128` | nicht spezifizierte Adresse |
| `ff02::1` | Link-Local All-Nodes Multicast |
| `ff02::2` | Link-Local All-Routers Multicast |
| `2001:db8::/32` | Dokumentation |

`::` не выдаётся обычному Interface как постоянная Zieladresse.

---

## 13. Typische /64-Subnetze

Для большинства обычных IPv6-LAN используется `/64`: 64 Bit Netzpräfix и 64 Bit Interface Identifier.

Это связано не с ожиданием `2^64` устройств, а с архитектурой и механизмами автоконфигурации. Не следует самовольно делать маленькие Präfixe только для «экономии адресов».

Sondernetze и специальные технологии могут использовать другие Präfixlängen; Aufgabe/Designvorgabe имеет приоритет.

---

## 14. Subnetting /48 nach /64

Organisation erhält:

```text
2001:db8:1234::/48
```

Между `/48` и `/64` имеется `16 Bit` Subnetz-ID:

```text
2^16 = 65 536 Subnetze
```

Примеры:

```text
2001:db8:1234:0000::/64
2001:db8:1234:0001::/64
2001:db8:1234:00ff::/64
2001:db8:1234:ffff::/64
```

Четвёртый Block здесь кодирует Subnetz-ID.

---

## 15. Subnetting /56 nach /64

Präfix:

```text
2001:db8:abcd:1200::/56
```

До `/64` свободно `8 Bit`, значит `256` Subnetze. Изменяется последний Byte четвёртого Blocks:

```text
2001:db8:abcd:1200::/64
2001:db8:abcd:1201::/64
...
2001:db8:abcd:12ff::/64
```

`/56` фиксирует первые две Hexstellen четвёртого Blocks (`12`), оставшиеся две bilden Subnetz-ID.

---

## 16. Subnetting /60 nach /64

Zwischen `/60` und `/64` liegen vier Bit:

```text
2^4 = 16 Subnetze
```

Für `2001:db8:abcd:1230::/60`:

```text
2001:db8:abcd:1230::/64
2001:db8:abcd:1231::/64
...
2001:db8:abcd:123f::/64
```

Eine Hexadezimalstelle entspricht exakt vier Bit; deshalb sind nibble-aligned Präfixe schnell zu berechnen.

---

## 17. Nicht-nibble-aligned Präfixe

При Präfix, не кратном четырём, нужно работать с отдельными Bits. Например, `/62 → /64` предоставляет два Subnetzbits и четыре `/64`-Netze.

Нельзя просто увеличивать последнюю Hexstelle без понимания, какие Bits фиксированы. В сложном случае Adresse и Maske записываются binär.

---

## 18. Interface Identifier

Последние 64 Bit обычной `/64`-Adresse идентифицируют Interface внутри Subnetz. Они могут быть сформированы:

- SLAAC-Verfahren;
- stabilen oder temporären Datenschutzverfahren;
- DHCPv6;
- statisch.

Не следует предполагать, что moderne Systeme всегда строят Interface Identifier напрямую из MAC-Adresse.

---

## 19. SLAAC und Router Advertisement

Bei `Stateless Address Autoconfiguration` erhält der Host Netzinformationen über `Router Advertisements (RA)` und bildet eine Adresse zum angekündigten Präfix.

RA können unter anderem Präfixe und Default-Router-Information liefern. Поэтому IPv6-Default-Gateway обычно изучается через RA/NDP, а не как обычная DHCPv6-Option.

SLAAC не означает «без состояния вообще»: Neighbor Cache, Routerinformationen и Adresszustände существуют на Host.

---

## 20. DHCPv6

DHCPv6 может предоставлять Adressen (`stateful`) или дополнительные параметры (`stateless`-сценарий). Его роль согласуется с RA-Flags и сетевым Design.

Ключевое разграничение:

```text
RA/NDP → Router и On-Link/Präfix-Information
SLAAC  → Host bildet eigene Adresse
DHCPv6 → Server liefert Adress-/Konfigurationsdaten
```

Не переносить DHCPv4-DORA и Ports механически на DHCPv6.

---

## 21. NDP

`Neighbor Discovery Protocol` использует ICMPv6 и выполняет:

- Neighbor Solicitation/Advertisement;
- Router Solicitation/Advertisement;
- Erreichbarkeitsprüfung von Nachbarn;
- Duplicate Address Detection;
- Redirect в подходящих случаях.

NDP заменяет ARP-функцию, но охватывает больше задач, чем ARP.

---

## 22. Duplicate Address Detection

До обычного использования новой Unicast-Adresse Host проверяет, не используется ли она уже на Link. Этот процесс называется `Duplicate Address Detection (DAD)`.

При конфликте Adresse не должна использоваться как уникальная. DAD не заменяет полное Monitoring и не проверяет глобальную уникальность за пределами Link.

---

## 23. IPv4 und IPv6 vergleichen

| Merkmal | IPv4 | IPv6 |
|---|---|---|
| Länge | 32 Bit | 128 Bit |
| Darstellung | dezimale Oktette | hexadezimale 16-Bit-Blöcke |
| Broadcast | vorhanden | nicht vorhanden |
| Nachbarschaft | ARP | NDP/ICMPv6 |
| Autokonfiguration | DHCP/APIPA/statisch | SLAAC, DHCPv6, statisch |
| Fragmentierung | Router/Hosts gemäß IPv4 | Router fragmentieren nicht; Quellhost/Path MTU |
| NAT | häufig bei privatem Internetzugang | nicht als Adressmangel-Lösung erforderlich |

IPv6 bringt keine automatische Sicherheit: Firewall, Patchstand, Authentisierung und sichere Protokolle bleiben nötig.

---

## 24. Vollständiger Praxisfall

Eine Organisation erhält `2001:db8:55aa:7a00::/56` und benötigt getrennte `/64`-Netze für Verwaltung, Entwicklung, Gäste und Server.

```text
Verwaltung:   2001:db8:55aa:7a00::/64
Entwicklung:  2001:db8:55aa:7a10::/64
Gäste:        2001:db8:55aa:7a20::/64
Server:       2001:db8:55aa:7a30::/64
```

Все четыре лежат внутри `/56`, поскольку первые 56 Bit (`...:7a`) неизменны. Schritte in Zehner-Hexwerten — организационная схема, не техническая необходимость. Доступно 256 `/64`, поэтому Dokumentation и Reserve важнее плотности.

---

## 25. Diagnosefall

Host besitzt `fe80::25`, aber keine Global-Unicast-Adresse und erreicht nur lokale Nachbarn.

Link-Local показывает, что IPv6 локально активен, но не доказывает получение/настройку глобального Präfix. Проверять:

1. RA vom Router;
2. VLAN и Router-Interface;
3. SLAAC/DHCPv6-Policy;
4. ICMPv6-Filter;
5. Prefix/Route и Firewall.

Блокировка критического ICMPv6 может нарушить NDP и Path MTU Discovery.

---

## 26. Prüfungsalgorithmus

1. Adresse auf acht Blöcke расширить.
2. Präfixgrenze markieren.
3. Adresstyp по ведущим Bits/Bereich определить.
4. Для Subnetting вычислить `Zielpräfix − Ausgangspräfix`.
5. `2^zusätzliche Bits` = число Subnetze.
6. Subnetz-ID только в свободных Bits изменять.
7. SLAAC, DHCPv6, RA и NDP не смешивать.
8. Результат сокращать только после контроля полной формы.

---

## 27. Typische Prüfungsformulierungen

> Aus einem `/56`-Präfix entstehen 256 `/64`-Subnetze, da acht zusätzliche Bits für die Subnetz-ID zur Verfügung stehen.

> Die Adresse `fe80::25` ist nur link-lokal gültig und wird von Routern nicht in andere Netze weitergeleitet.

> IPv6 verwendet keinen Broadcast; NDP nutzt ICMPv6 und Multicast für Nachbarschafts- und Routerfunktionen.

> Der Host lernt den Default Router über Router Advertisements und nicht als gewöhnliche DHCPv6-Option.

---

## 28. Typische Prüfungsfallen

| Ловушка | Исправление |
|---|---|
| `::` несколько раз | разрешено только один раз |
| удалить Nullen в конце Blocks | удалять только ведущие |
| `fe80::/10` глобально | только текущий Link |
| ULA = точный аналог RFC1918 | похожая цель, но другая Architektur |
| последний IPv6-адрес = Broadcast | Broadcast отсутствует |
| DHCPv6 всегда выдаёт Gateway | Default Router через RA |
| Interface ID всегда из MAC | современные Verfahren часто другие |
| IPv6 автоматически безопасен | Security Controls всё равно нужны |

---

## 29. Selbsttest

1. Сколько Bit имеет IPv6-Adresse?
2. Сколько Blöcke и Bit на Block?
3. Сократи `2001:0db8:0000:0000:0000:0000:0000:0050`.
4. Разверни `2001:db8:12::50`.
5. Почему `::` разрешено только один раз?
6. Что означает `/64`?
7. Классифицируй `fe80::25`.
8. Классифицируй `fd12:3456::1`.
9. Классифицируй `ff02::1`.
10. Для чего `2001:db8::/32`?
11. Есть ли Broadcast в IPv6?
12. Чем Anycast отличается от Multicast?
13. Сколько `/64` в `/48`?
14. Сколько `/64` в `/56`?
15. Сколько `/64` в `/60`?
16. Перечисли первые и последние `/64` из `2001:db8:abcd:1230::/60`.
17. Почему `/64` типичен для LAN?
18. Что делает SLAAC?
19. Что передаёт Router Advertisement?
20. Какова роль DHCPv6?
21. Как Host получает Default Router?
22. Назови четыре функции NDP.
23. Что проверяет DAD?
24. Почему Link-Local не доказывает Internetzugang?
25. Как диагностировать отсутствие Global-Unicast-Adresse?

<details>
<summary>Lösungen anzeigen</summary>

1. 128.
2. Восемь Blöcke по 16 Bit.
3. `2001:db8::50`.
4. `2001:0db8:0012:0000:0000:0000:0000:0050`.
5. Иначе число пропущенных Nullblöcke неоднозначно.
6. 64 Netzbits и 64 оставшихся Bits.
7. Link-Local Unicast.
8. Unique Local Unicast.
9. Link-Local Multicast.
10. Документационные примеры.
11. Нет.
12. Multicast адресует группу, Anycast ведёт к одному подходящему экземпляру.
13. 65 536.
14. 256.
15. 16.
16. `...:1230::/64` и `...:123f::/64`.
17. Архитектурный стандарт и Autokonfiguration, а не потребность в стольких Hosts.
18. Bildet Hostadresse anhand von RA-Präfixinformationen.
19. Router-, Präfix- und weitere Netzinformationen.
20. Adress- und/oder weitere Konfigurationsdaten liefern.
21. Über Router Advertisements.
22. Neighbor/Router Discovery, Erreichbarkeit, DAD, Redirect.
23. Ob die neue Adresse auf dem lokalen Link bereits verwendet wird.
24. Она действительна только локально и не доказывает Präfix/Route.
25. RA, VLAN/Router, Policy, ICMPv6 und Routing prüfen.

</details>

---

## 30. Quellen und Abgleich

- [RFC 8200 – Internet Protocol, Version 6](https://datatracker.ietf.org/doc/html/rfc8200)
- [RFC 4291 – IPv6 Addressing Architecture](https://datatracker.ietf.org/doc/html/rfc4291)
- [RFC 5952 – IPv6 Text Representation](https://datatracker.ietf.org/doc/html/rfc5952)
- [RFC 4861 – Neighbor Discovery for IPv6](https://datatracker.ietf.org/doc/html/rfc4861)
- [RFC 4862 – IPv6 Stateless Address Autoconfiguration](https://datatracker.ietf.org/doc/html/rfc4862)
- [RFC 8415 – DHCP for IPv6](https://datatracker.ietf.org/doc/html/rfc8415)
- [RFC 4193 – Unique Local IPv6 Unicast Addresses](https://datatracker.ietf.org/doc/html/rfc4193)

`/64` ist der Regelfall für normale IPv6-Subnetze, aber nicht jede technische Sonderverbindung. Konkrete Providerpräfixe und Policy müssen in der Praxis dokumentiert werden.

---

## 31. Offene Prüfpunkte für den Unterricht

- Welche IPv6-Bereiche müssen auswendig bekannt sein?
- Wird nur nibble-aligned oder auch bitgenaues Subnetting geprüft?
- Muss die kanonische Kürzungsregel bei gleich langen Nullfolgen angewendet werden?
- Wie tief werden SLAAC-Flags und DHCPv6 behandelt?
- Welche ICMPv6/NDP-Nachrichten müssen genannt werden?
- Werden Privacy Extensions und temporäre Adressen geprüft?
