---
pruefung: AP1
thema: IPv6-Grundlagen und Subnetting
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Deutsch
gegenstueck: ../ru/04-ipv6-grundlagen-und-subnetting-ru.md
---

# AP1: IPv6-Grundlagen und Subnetting

IPv6 erweitert den Adressraum auf 128 Bit und verändert lokale Mechanismen: Broadcast entfällt, NDP übernimmt die Nachbarschaftsauflösung und Router Advertisements wirken an der Konfiguration mit. Subnetting folgt meist geplanten Präfixgrenzen und nicht dem Sparen einzelner Hostadressen.

---

## 1. Lernziele

Nach dieser Einheit kannst du:

- IPv6-Adressen korrekt kürzen und ausschreiben;
- Global Unicast, Link-Local, Unique Local und Multicast erkennen;
- Präfix und Interface Identifier erklären;
- die Subnetzanzahl beim Teilen eines Präfixes berechnen;
- typische `/64`-Subnetze planen;
- SLAAC, DHCPv6 und statische Konfiguration unterscheiden;
- Router Advertisement und NDP erläutern;
- IPv4 und IPv6 ohne falsche Vereinfachungen vergleichen.

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

Eine IPv6-Adresse besitzt acht Blöcke mit jeweils vier hexadezimalen Zeichen:

```text
2001:0db8:0000:0000:021a:2bff:fe3c:4d5e
```

Jede Hexadezimalstelle stellt vier Bit dar. Ein Block enthält 16 Bit und die gesamte Adresse 128 Bit.

Groß- und Kleinschreibung der Buchstaben ist technisch gleichwertig; in Dokumentationen wird üblicherweise Kleinschreibung verwendet.

---

## 4. Führende Nullen entfernen

In jedem Block dürfen nur führende Nullen entfernt werden:

```text
0db8 → db8
0000 → 0
0042 → 42
```

Nullen in der Mitte oder am Ende eines bedeutenden Blocks bleiben erhalten:

```text
1200 ≠ 12
```

---

## 5. Doppelpunkt-Kompression

Eine Folge vollständiger Nullblöcke darf durch `::` ersetzt werden.

```text
2001:db8:0:0:0:ff00:42:8329
→ 2001:db8::ff00:42:8329
```

`::` darf nur einmal vorkommen, weil die Zahl ausgelassener Blöcke sonst nicht eindeutig wäre. Üblicherweise wird die längste Folge gekürzt; bei gleicher Länge verwendet die kanonische Form die erste.

---

## 6. Adresse ausschreiben

`2001:db8:12::50` enthält links drei Blöcke (`2001`, `db8`, `12`) und rechts einen (`50`). Bis acht fehlen vier Nullblöcke:

```text
2001:0db8:0012:0000:0000:0000:0000:0050
```

Sichere Kontrolle: Nach dem Ausschreiben müssen genau acht Blöcke vorhanden sein.

---

## 7. Präfix

Wie bei CIDR in IPv4 bezeichnet `/n` die Anzahl führender Netzbits.

```text
2001:db8:1234:5600::/56
```

Die ersten 56 Bit sind als Netzpräfix festgelegt. Folgende Bits können als Subnetz-ID dienen; die übrigen als Interface Identifier.

Eine IPv6-Adresse ohne Präfixangabe bestimmt keine Netzgröße.

---

## 8. Global Unicast

`2000::/3` bezeichnet den allgemeinen Bereich global routbarer Unicast-Adressen. Die tatsächliche Zuteilung erfolgt über Provider, RIR und organisatorische Adressplanung.

`2001:db8::/32` ist für Dokumentation reserviert und darf nicht als echter öffentlicher Präfix eingesetzt werden.

Global Unicast bedeutet nicht automatisch Erreichbarkeit. Firewall, Routing und Dienst bleiben eigenständige Bedingungen.

---

## 9. Link-Local Unicast

`fe80::/10` gilt nur auf dem lokalen Link. Eine IPv6-Schnittstelle besitzt typischerweise auch dann eine Link-Local-Adresse, wenn sie Global Unicast verwendet.

Sie wird unter anderem für NDP und als Next-Hop-Adresse eines Routers verwendet. Identische Link-Local-Adressen können auf verschiedenen Interfaces vorkommen; deshalb benötigt das Betriebssystem manchmal eine Zone-ID:

```text
fe80::1%eth0
```

Router leiten Link-Local-Pakete nicht zwischen Links weiter.

---

## 10. Unique Local Unicast

`fc00::/7` ist der Bereich für Unique Local Adressen; praktisch erzeugte lokale Präfixe beginnen üblicherweise mit `fd`.

ULA dienen interner Adressierung und sind keine global gerouteten öffentlichen Adressen. Sie sind keine exakte Kopie privater IPv4-Adressen nach RFC 1918, da Größe, Bildung und typische Verwendung abweichen.

---

## 11. Multicast, Anycast und kein Broadcast

- `Multicast` (`ff00::/8`) adressiert eine Empfängergruppe.
- `Anycast` verwendet das normale Unicast-Adressformat auf mehreren Interfaces; Routing führt zu einem passenden beziehungsweise nahen Ziel.
- `Broadcast` existiert in IPv6 nicht; seine Funktionen werden durch gezielte Multicast-Verfahren ersetzt.

Die IPv4-Regel „letzte Adresse ist Broadcast“ wird nicht auf IPv6 übertragen.

---

## 12. Spezielle Adressen

| Adresse | Bedeutung |
|---|---|
| `::1/128` | Loopback |
| `::/128` | nicht spezifizierte Adresse |
| `ff02::1` | Link-Local All-Nodes Multicast |
| `ff02::2` | Link-Local All-Routers Multicast |
| `2001:db8::/32` | Dokumentation |

`::` wird keinem normalen Interface als dauerhafte Zieladresse zugewiesen.

---

## 13. Typische /64-Subnetze

Für die meisten gewöhnlichen IPv6-LANs wird `/64` verwendet: 64 Bit Netzpräfix und 64 Bit Interface Identifier.

Der Grund ist nicht eine erwartete Zahl von `2^64` Geräten, sondern die Architektur und Autokonfigurationsmechanismen. Kleinere Netze werden nicht willkürlich zur Adressersparnis gebildet.

Sondernetze und spezielle Technologien können andere Präfixlängen nutzen; Aufgabe und Designvorgabe haben Vorrang.

---

## 14. Subnetting /48 nach /64

Eine Organisation erhält:

```text
2001:db8:1234::/48
```

Zwischen `/48` und `/64` liegen `16 Bit` Subnetz-ID:

```text
2^16 = 65 536 Subnetze
```

Beispiele:

```text
2001:db8:1234:0000::/64
2001:db8:1234:0001::/64
2001:db8:1234:00ff::/64
2001:db8:1234:ffff::/64
```

Der vierte Block codiert hier die Subnetz-ID.

---

## 15. Subnetting /56 nach /64

Präfix:

```text
2001:db8:abcd:1200::/56
```

Bis `/64` sind acht Bit frei, somit entstehen `256` Subnetze. Das letzte Byte des vierten Blocks ändert sich:

```text
2001:db8:abcd:1200::/64
2001:db8:abcd:1201::/64
...
2001:db8:abcd:12ff::/64
```

`/56` fixiert die ersten zwei Hexstellen des vierten Blocks (`12`); die übrigen zwei bilden die Subnetz-ID.

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

Eine Hexadezimalstelle entspricht genau vier Bit. Daher lassen sich nibble-aligned Präfixe schnell berechnen.

---

## 17. Nicht-nibble-aligned Präfixe

Bei einem nicht durch vier teilbaren Präfix muss bitgenau gerechnet werden. Beispielsweise stellt `/62 → /64` zwei Subnetzbits und damit vier `/64`-Netze bereit.

Die letzte Hexstelle darf nicht ohne Kenntnis der festgelegten Bits einfach erhöht werden. Im schwierigen Fall werden Adresse und Maske binär dargestellt.

---

## 18. Interface Identifier

Die letzten 64 Bit einer normalen `/64`-Adresse identifizieren das Interface im Subnetz. Sie können entstehen durch:

- SLAAC-Verfahren;
- stabile oder temporäre Datenschutzverfahren;
- DHCPv6;
- statische Vergabe.

Moderne Systeme bilden den Interface Identifier nicht zwingend direkt aus der MAC-Adresse.

---

## 19. SLAAC und Router Advertisement

Bei `Stateless Address Autoconfiguration` erhält der Host Netzinformationen über `Router Advertisements (RA)` und bildet eine Adresse passend zum angekündigten Präfix.

RA können unter anderem Präfix- und Default-Router-Informationen liefern. Das IPv6-Default-Gateway wird deshalb gewöhnlich über RA/NDP und nicht als normale DHCPv6-Option gelernt.

SLAAC bedeutet nicht, dass der Host gar keinen Zustand verwaltet. Neighbor Cache, Routerinformationen und Adresszustände bleiben vorhanden.

---

## 20. DHCPv6

DHCPv6 kann Adressen (`stateful`) oder zusätzliche Parameter in einem stateless Szenario bereitstellen. Seine Rolle wird mit RA-Flags und dem Netzdesign abgestimmt.

Wichtige Trennung:

```text
RA/NDP → Router- und On-Link-/Präfixinformation
SLAAC  → Host bildet eigene Adresse
DHCPv6 → Server liefert Adress-/Konfigurationsdaten
```

DHCPv4-DORA und Ports werden nicht mechanisch auf DHCPv6 übertragen.

---

## 21. NDP

Das `Neighbor Discovery Protocol` verwendet ICMPv6 und übernimmt:

- Neighbor Solicitation und Advertisement;
- Router Solicitation und Advertisement;
- Erreichbarkeitsprüfung von Nachbarn;
- Duplicate Address Detection;
- Redirect in geeigneten Fällen.

NDP ersetzt die ARP-Funktion, deckt aber mehr Aufgaben als ARP ab.

---

## 22. Duplicate Address Detection

Vor der normalen Verwendung einer neuen Unicast-Adresse prüft der Host, ob sie auf dem Link bereits verwendet wird. Dieser Vorgang heißt `Duplicate Address Detection (DAD)`.

Bei einem Konflikt darf die Adresse nicht als eindeutig verwendet werden. DAD ersetzt kein vollständiges Monitoring und prüft keine globale Eindeutigkeit außerhalb des Links.

---

## 23. IPv4 und IPv6 vergleichen

| Merkmal | IPv4 | IPv6 |
|---|---|---|
| Länge | 32 Bit | 128 Bit |
| Darstellung | dezimale Oktette | hexadezimale 16-Bit-Blöcke |
| Broadcast | vorhanden | nicht vorhanden |
| Nachbarschaft | ARP | NDP/ICMPv6 |
| Autokonfiguration | DHCP/APIPA/statisch | SLAAC, DHCPv6, statisch |
| Fragmentierung | Router und Hosts gemäß IPv4 | Router fragmentieren nicht; Quellhost/Path MTU |
| NAT | häufig bei privatem Internetzugang | nicht als Lösung für Adressmangel erforderlich |

IPv6 stellt Sicherheit nicht automatisch her. Firewall, Patchstand, Authentisierung und sichere Protokolle bleiben erforderlich.

---

## 24. Vollständiger Praxisfall

Eine Organisation erhält `2001:db8:55aa:7a00::/56` und benötigt getrennte `/64`-Netze für Verwaltung, Entwicklung, Gäste und Server.

```text
Verwaltung:   2001:db8:55aa:7a00::/64
Entwicklung:  2001:db8:55aa:7a10::/64
Gäste:        2001:db8:55aa:7a20::/64
Server:       2001:db8:55aa:7a30::/64
```

Alle vier liegen innerhalb des `/56`, weil die ersten 56 Bit (`...:7a`) unverändert sind. Schritte in Zehner-Hexwerten sind eine organisatorische Struktur und keine technische Pflicht. Von 256 verfügbaren `/64`-Netzen profitieren Dokumentation und Reserve stärker als extreme Dichte.

---

## 25. Diagnosefall

Ein Host besitzt `fe80::25`, aber keine Global-Unicast-Adresse und erreicht nur lokale Nachbarn.

Die Link-Local-Adresse zeigt, dass IPv6 lokal aktiv ist, weist aber kein globales Präfix nach. Zu prüfen sind:

1. Router Advertisements;
2. VLAN und Routerinterface;
3. SLAAC-/DHCPv6-Policy;
4. ICMPv6-Filter;
5. Präfix, Route und Firewall.

Das Blockieren wesentlicher ICMPv6-Nachrichten kann NDP und Path MTU Discovery stören.

---

## 26. Prüfungsalgorithmus

1. Adresse auf acht Blöcke ausschreiben.
2. Präfixgrenze markieren.
3. Adresstyp anhand führender Bits oder Bereich bestimmen.
4. Für Subnetting `Zielpräfix − Ausgangspräfix` berechnen.
5. `2^zusätzliche Bits` ergibt die Subnetzanzahl.
6. Subnetz-ID nur in freien Bits verändern.
7. SLAAC, DHCPv6, RA und NDP getrennt halten.
8. Ergebnis erst nach Kontrolle der Langform kürzen.

---

## 27. Typische Prüfungsformulierungen

> Aus einem `/56`-Präfix entstehen 256 `/64`-Subnetze, da acht zusätzliche Bits für die Subnetz-ID zur Verfügung stehen.

> Die Adresse `fe80::25` ist nur link-lokal gültig und wird von Routern nicht in andere Netze weitergeleitet.

> IPv6 verwendet keinen Broadcast; NDP nutzt ICMPv6 und Multicast für Nachbarschafts- und Routerfunktionen.

> Der Host lernt den Default Router über Router Advertisements und nicht als gewöhnliche DHCPv6-Option.

---

## 28. Typische Prüfungsfallen

| Falle | Korrektur |
|---|---|
| `::` mehrfach verwenden | nur einmal erlaubt |
| Nullen am Blockende entfernen | nur führende Nullen entfernen |
| `fe80::/10` ist global | nur aktueller Link |
| ULA ist exakt wie RFC-1918-IPv4 | ähnlicher Zweck, andere Architektur |
| letzte IPv6-Adresse ist Broadcast | IPv6 besitzt keinen Broadcast |
| DHCPv6 liefert immer das Gateway | Default Router über RA |
| Interface ID kommt immer aus MAC | moderne Verfahren sind häufig anders |
| IPv6 ist automatisch sicher | Sicherheitsmaßnahmen bleiben nötig |

---

## 29. Selbsttest

1. Wie viele Bit hat eine IPv6-Adresse?
2. Wie viele Blöcke und Bit je Block?
3. Kürze `2001:0db8:0000:0000:0000:0000:0000:0050`.
4. Schreibe `2001:db8:12::50` aus.
5. Warum darf `::` nur einmal vorkommen?
6. Was bedeutet `/64`?
7. Klassifiziere `fe80::25`.
8. Klassifiziere `fd12:3456::1`.
9. Klassifiziere `ff02::1`.
10. Wozu dient `2001:db8::/32`?
11. Gibt es Broadcast in IPv6?
12. Wie unterscheidet sich Anycast von Multicast?
13. Wie viele `/64` enthält ein `/48`?
14. Wie viele `/64` enthält ein `/56`?
15. Wie viele `/64` enthält ein `/60`?
16. Nenne erstes und letztes `/64` aus `2001:db8:abcd:1230::/60`.
17. Warum ist `/64` für LANs typisch?
18. Was macht SLAAC?
19. Was liefert ein Router Advertisement?
20. Welche Rolle hat DHCPv6?
21. Wie erhält ein Host den Default Router?
22. Nenne vier NDP-Funktionen.
23. Was prüft DAD?
24. Warum weist Link-Local keinen Internetzugang nach?
25. Wie wird eine fehlende Global-Unicast-Adresse diagnostiziert?

<details>
<summary>Lösungen anzeigen</summary>

1. 128.
2. Acht Blöcke zu 16 Bit.
3. `2001:db8::50`.
4. `2001:0db8:0012:0000:0000:0000:0000:0050`.
5. Sonst wäre die Zahl ausgelassener Nullblöcke mehrdeutig.
6. 64 Netzbits und 64 verbleibende Bits.
7. Link-Local Unicast.
8. Unique Local Unicast.
9. Link-Local Multicast.
10. Für Dokumentationsbeispiele.
11. Nein.
12. Multicast adressiert eine Gruppe; Anycast führt zu einer passenden Instanz.
13. 65 536.
14. 256.
15. 16.
16. `...:1230::/64` und `...:123f::/64`.
17. Wegen Architektur und Autokonfiguration, nicht wegen der erwarteten Hostzahl.
18. Es bildet eine Hostadresse anhand von RA-Präfixinformationen.
19. Router-, Präfix- und weitere Netzinformationen.
20. Adress- und/oder weitere Konfigurationsdaten bereitstellen.
21. Über Router Advertisements.
22. Neighbor/Router Discovery, Erreichbarkeit, DAD und Redirect.
23. Ob die neue Adresse auf dem lokalen Link bereits verwendet wird.
24. Sie gilt nur lokal und weist weder globalen Präfix noch Route nach.
25. RA, VLAN und Router, Policy, ICMPv6 sowie Routing prüfen.

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

`/64` ist der Regelfall für normale IPv6-Subnetze, aber nicht jede technische Sonderverbindung. Konkrete Providerpräfixe und Policies müssen in der Praxis dokumentiert werden.

---

## 31. Offene Prüfpunkte für den Unterricht

- Welche IPv6-Bereiche müssen auswendig bekannt sein?
- Wird nur nibble-aligned oder auch bitgenaues Subnetting geprüft?
- Muss die kanonische Kürzungsregel bei gleich langen Nullfolgen angewendet werden?
- Wie tief werden SLAAC-Flags und DHCPv6 behandelt?
- Welche ICMPv6-/NDP-Nachrichten müssen genannt werden?
- Werden Privacy Extensions und temporäre Adressen geprüft?
