---
pruefung: AP1
thema: DNS, DHCP, Default Gateway und Datenweg eines Aufrufs
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/02-dns-dhcp-gateway-und-datenweg-eines-aufrufs-de.md
---

# AP1: DNS, DHCP, Default Gateway und Datenweg eines Aufrufs

Успешный вызов сайта требует согласованной работы конфигурации клиента, Namensauflösung, локальной доставки, Routing, Transport и Anwendung. Экзаменационная задача часто проверяет именно порядок и границы этих функций.

---

## 1. Lernziele

После изучения главы нужно уметь:

- объяснять DNS-Auflösung и роли Resolver/autoritativer Nameserver;
- различать важные DNS Resource Records и типовые Fehlercodes;
- объяснять DHCPv4-DORA, Lease и DHCP-Relay;
- проверять IP-Adresse, Präfix, Default Gateway и DNS-Server;
- определять, отправляется ли Frame прямо цели или Gateway;
- описывать полный Datenweg при HTTPS-Aufruf;
- различать адреса, меняющиеся и сохраняющиеся на пути;
- локализовать Fehler по наблюдаемому Symptom.

---

## 2. Prüfungsminimum — 15 Minuten

### DNS

```text
Name → Resolver → autoritative Antwort → IP-Adresse
A = IPv4, AAAA = IPv6, CNAME = Alias, MX = Mail, PTR = Reverse
TTL = допустимое время хранения ответа в Cache
```

### DHCPv4

```text
Discover → Offer → Request → Acknowledge
```

DHCP обычно выдаёт IP-Adresse, Subnetzmaske/Präfix, Default Gateway, DNS-Server и Lease-Dauer.

### Gateway-Entscheidung

```text
Ziel im eigenen Subnetz  → direkt zum Ziel
Ziel in anderem Subnetz  → an Default Gateway
```

### HTTPS-Ablauf

```text
DNS → Subnetzentscheidung → ARP/NDP → Routing
→ TCP oder QUIC → TLS → HTTP
```

> Befindet sich der Zielhost in einem anderen Netz, verwendet der Client im ersten Frame die MAC-Adresse des Default Gateways, während die Ziel-IP-Adresse die Adresse des entfernten Hosts bleibt.

---

## 3. DNS: Aufgabe und Begriffe

`Domain Name System` verwaltet verteilte Namensräume und Resource Records. Ein Name kann zu Adressen führen; DNS speichert auch Mail-, Zuständigkeits- und weitere Informationen.

```text
www.example.test → A/AAAA → IP-Adresse
```

- `Stub Resolver`: Clientkomponente, die einen rekursiven Resolver fragt.
- `rekursiver Resolver`: beschafft eine vollständige Antwort und cached sie.
- `autoritativer Nameserver`: liefert maßgebliche Daten für seine Zone.
- `Zone`: administrativ verwalteter Teil des Namensraums.

---

## 4. Wichtige Resource Records

| Record | Funktion |
|---|---|
| `A` | Name → IPv4-Adresse |
| `AAAA` | Name → IPv6-Adresse |
| `CNAME` | Alias → kanonischer Name |
| `MX` | Mailserver einer Domain; Priorität beachten |
| `PTR` | Reverse Lookup: Adresse → Name |
| `NS` | autoritativer Nameserver einer Zone |
| `SOA` | Verwaltungs- und Zeitdaten der Zone |
| `TXT` | Textdaten, z. B. Richtlinien/Verifikation |

Ein `CNAME` enthält keine IP-Adresse. Für die Adresse muss anschließend der kanonische Name aufgelöst werden.

---

## 5. Rekursive und iterative Auflösung

Упрощённый Ablauf при пустом Cache:

1. Anwendung fragt lokalen Stub Resolver.
2. Client prüft lokale Mechanismen wie Cache/hosts gemäß Systemkonfiguration.
3. Stub fragt konfigurierten rekursiven Resolver.
4. Resolver erhält Verweise über Root- und TLD-Nameserver.
5. Autoritativer Nameserver liefert den Record.
6. Resolver gibt die Antwort zurück und speichert sie gemäß TTL.

Der Client fragt normalerweise nicht selbst jeden Server der Hierarchie.

---

## 6. Cache und TTL

`TTL` gibt an, wie lange ein DNS-Datensatz gecached werden darf. Большая TTL уменьшает запросы, но замедляет распространение Änderungen. Kleine TTL erleichtert Umstellungen, erzeugt aber mehr Anfragen.

Auch negative Antworten können gecached werden. Nach einer Änderung können verschiedene Clients vorübergehend unterschiedliche gültige Cache-Stände sehen.

DNS-Replikation не является magische sofortige „Propagation“; часто задержка объясняется ещё gültigen Caches.

---

## 7. DNS-Transport und Fehler

Klassisches DNS verwendet Port `53` über UDP und TCP. UDP ist bei vielen Standardanfragen üblich; TCP wird unter anderem für bestimmte große Antworten und Zonentransfers verwendet. Verschlüsselte Varianten haben eigene Verfahren.

| Ergebnis | Bedeutung |
|---|---|
| `NOERROR` mit Daten | erfolgreiche Antwort |
| `NXDOMAIN` | angefragter Domainname existiert nicht |
| `SERVFAIL` | Resolver/Server konnte keine gültige Antwort liefern |
| Timeout | keine rechtzeitige Antwort; Ursache offen |

Ein Timeout beweist nicht automatisch, dass der DNS-Server ausgefallen ist: Route, Firewall, Verlust oder falsche Adresse sind ebenfalls möglich.

---

## 8. DNS-Diagnose

Sinnvolle Trennung:

```text
IP-Ziel erreichbar, Name nicht auflösbar → DNS-Konfiguration/Auflösung prüfen
Name löst auf, Ziel-IP falsch            → Record/Cache/Sicht prüfen
NXDOMAIN                                 → Schreibweise und autoritative Daten prüfen
SERVFAIL                                 → Resolverkette, DNSSEC/Serverzustand prüfen
```

Werkzeuge: `nslookup`, `dig`, `Resolve-DnsName`. Ausgabe muss nach verwendetem Resolver, Recordtyp und TTL gelesen werden.

---

## 9. DHCPv4: Zweck

DHCP automatisiert Hostkonfiguration. Typische Optionen:

- IPv4-Adresse und Subnetzmaske;
- Default Gateway;
- DNS-Server und gegebenenfalls DNS-Suffix;
- Lease-Dauer;
- weitere organisationsspezifische Optionen.

DHCP vergibt keine öffentliche Internetadresse durch NAT und ersetzt kein Routing.

---

## 10. DORA-Ablauf

```text
Client  → DHCPDISCOVER → Netz
Server  → DHCPOFFER    → Client
Client  → DHCPREQUEST  → Netz
Server  → DHCPACK      → Client
```

Der Client beginnt ohne nutzbare IPv4-Konfiguration. Deshalb verwendet der Ablauf Broadcasts, bis Server und Client passend kommunizieren können. `REQUEST` zeigt auch, welches Angebot ausgewählt wurde; `ACK` bestätigt die Lease.

---

## 11. Lease, Erneuerung und Konflikt

Eine Lease gilt nur für einen Zeitraum. Der Client versucht sie vor Ablauf zu erneuern. Funktioniert der ursprüngliche Server nicht, wird später breiter nach einer Verlängerung gesucht.

Wichtige Praxisregeln:

- feste Geräte entweder sauber reservieren oder außerhalb des dynamischen Pools statisch planen;
- Scope darf nicht erschöpft sein;
- identische Adressen verursachen Konflikte;
- Lease-Zeit muss zu Mobilität und Poolgröße passen.

Konkrete T1/T2-Werte nur nennen, wenn Aufgabe oder Unterricht sie verlangt.

---

## 12. DHCP-Relay

Router leiten lokale Broadcasts normalerweise nicht weiter. Befindet sich der DHCP-Server in einem anderen Subnetz/VLAN, nimmt ein `DHCP-Relay-Agent` die Anfrage entgegen und leitet sie gerichtet weiter.

Der Relay liefert dem Server Information über das Ursprungsnetz, damit der passende Scope gewählt wird.

Fehlt Relay nur in VLAN 20, können Clients in VLAN 10 funktionieren, während VLAN 20 APIPA-Adressen erhält.

---

## 13. APIPA und Diagnose

Windows-Clients verwenden bei ausbleibender geeigneter DHCPv4-Konfiguration häufig eine Link-Local-Adresse aus `169.254.0.0/16`.

Mögliche Ursachen:

- Link/VLAN falsch;
- DHCP-Server nicht erreichbar;
- DHCP-Relay fehlt oder ist falsch;
- Scope fehlt oder ist ausgeschöpft;
- UDP 67/68 wird gefiltert;
- Clientdienst oder Netzwerkkarte fehlerhaft.

APIPA ist ein Symptom, keine Ursachenbezeichnung.

---

## 14. Default Gateway

Der Client vergleicht eigene Adresse und Zieladresse unter Verwendung des Präfixes.

- gleiches Netz: direkte lokale Zustellung;
- anderes Netz: Paket an Next Hop, meistens Default Gateway;
- keine passende Route/Gateway: entferntes Netz nicht erreichbar.

Gateway-Adresse muss aus Sicht des Clients lokal erreichbar und als Hostadresse geeignet sein.

---

## 15. ARP/NDP vor dem ersten Frame

Bei IPv4 ermittelt ARP die MAC-Adresse des lokalen Ziels oder Gateways. Bei IPv6 übernimmt NDP die Nachbarschaftsauflösung.

```text
entferntes IPv4-Ziel:
ARP-Frage nach Gateway-IP → Gateway-MAC
Frame-Ziel = Gateway-MAC
Paket-Ziel = entfernte Server-IP
```

Diese Trennung ist eine sehr häufige Prüfungsaufgabe.

---

## 16. Vollständiger HTTPS-Datenweg

Ausgangslage:

```text
Client: 192.168.10.25/24
Gateway/DNS: 192.168.10.1
URL: https://portal.example/
```

Typischer Ablauf für HTTP/1.1 oder HTTP/2:

1. Browser/OS prüft vorhandene Namensinformationen.
2. DNS-Auflösung liefert Server-IP.
3. Client berechnet, ob Server-IP lokal ist.
4. Bei entferntem Ziel wählt er Default Gateway.
5. ARP ermittelt Gateway-MAC.
6. Client kapselt TCP-Segment in IP-Paket und lokalen Frame.
7. Switch leitet Frame zum Router.
8. Router entkapselt Layer 2, wählt Route und erstellt nächsten Frame.
9. Gegebenenfalls ändert NAT/PAT Quell-IP/Quellport.
10. TCP baut mit SYN, SYN-ACK, ACK die Verbindung auf.
11. TLS prüft Serverzertifikat und vereinbart Schutzparameter.
12. HTTP-Anfrage wird geschützt übertragen.
13. Server antwortet mit HTTP-Inhalt und Statuscode.

HTTP/3 verwendet QUIC über UDP; nur bei entsprechender Angabe von der klassischen TCP-Sequenz abweichen.

---

## 17. Adressen im ersten Frame

Bei entferntem Webserver:

```text
Source MAC:       Client-MAC
Destination MAC: Gateway-MAC
Source IP:        Client-IP
Destination IP:  Server-IP
Source Port:      temporärer Clientport
Destination Port: 443
```

MAC-Adressen gelten für den aktuellen Link. IP-Adressen beschreiben die Netzendpunkte; NAT ist eine ausdrückliche mögliche Ausnahme.

---

## 18. Was ein Router tut

Ein Router:

1. nimmt einen Frame für seine Schnittstelle an;
2. entfernt den Layer-2-Rahmen;
3. prüft die Ziel-IP und Routingtabelle;
4. reduziert die IPv4-TTL beziehungsweise IPv6-Hop-Limit;
5. bestimmt Next Hop und Ausgangsschnittstelle;
6. kapselt das Paket in einen neuen Frame.

Ein Router fragt nicht für den gesamten Weg nach einer einzigen MAC-Adresse.

---

## 19. Diagnosekette

Von unten nach oben prüfen:

1. Link, WLAN-Verbindung und VLAN.
2. eigene IP/Präfix-Konfiguration.
3. lokale Erreichbarkeit und Gateway.
4. Routing zu einer bekannten IP.
5. DNS-Auflösung und richtige Antwort.
6. TCP/UDP-Zielport.
7. TLS und Zertifikat.
8. HTTP/Anwendungsfunktion.

Die Reihenfolge kann an das Symptom angepasst werden; jede Beobachtung soll eine Hypothese trennen.

---

## 20. Praxisfall: nur ein VLAN ohne DHCP

Clients in VLAN 10 erhalten Adressen. Clients in VLAN 20 erhalten `169.254.x.x`. Der zentrale Server läuft.

Wahrscheinliche Prüfpfade:

- VLAN-20-Uplink/Tagging prüfen;
- Relay auf dem Layer-3-Interface von VLAN 20 prüfen;
- Scope für das VLAN-20-Subnetz prüfen;
- UDP-Filter und Serverbindung prüfen.

DNS ist noch nicht die erste Ursache, weil schon die Grundkonfiguration fehlt.

---

## 21. Praxisfall: IP funktioniert, Name nicht

`ping 203.0.113.20` funktioniert, `nslookup portal.example` läuft in Timeout.

Damit ist eine IP-Verbindung zum Testziel möglich. Zu prüfen sind konfigurierte DNS-Serveradresse, Erreichbarkeit des Resolvers, Port/Firewall und Resolverdienst. Der Test beweist nicht, dass jeder Internetweg funktioniert.

---

## 22. Prüfungsalgorithmus

1. Symptom exakt formulieren.
2. Clientkonfiguration vollständig notieren.
3. Local/Remote-Entscheidung mit Präfix treffen.
4. Next Hop und dessen MAC-Adresse bestimmen.
5. DNS, Transport und Anwendung getrennt prüfen.
6. Bei DHCP Scope, Lease, Relay und Filter unterscheiden.
7. Ergebnis mit Soll/Ist und nächstem Test dokumentieren.

---

## 23. Typische Prüfungsformulierungen

> Der rekursive Resolver beschafft die DNS-Antwort für den Client, während der autoritative Nameserver die maßgeblichen Einträge seiner Zone bereitstellt.

> Der Client sendet das Paket an das Default Gateway, da die Zieladresse gemäß Subnetzmaske nicht zum eigenen Netz gehört.

> Ein DHCP-Relay ist erforderlich, weil der ursprüngliche DHCP-Broadcast ein geroutetes Netz nicht ohne Weiterleitung erreicht.

> Die erfolgreiche Namensauflösung beweist nur die DNS-Funktion; der Zielport und der Anwendungsdienst müssen separat geprüft werden.

---

## 24. Typische Prüfungsfallen

| Ловушка | Исправление |
|---|---|
| DNS выдаёт URL | DNS хранит Resource Records, не весь URL |
| Resolver всегда autoritativ | роли различать |
| TTL — время жизни Domain | TTL управляет Cache конкретного Datensatz |
| DHCP и DNS — одно | Konfiguration и Namensauflösung |
| DHCP-Broadcast проходит Router | нужен Relay или Server в сегменте |
| 169.254 всегда defekte NIC | множество возможных причин |
| удалённому серверу нужен его MAC в первом Frame | Ziel-MAC = Gateway |
| успешный DNS доказывает сайт | Transport/TLS/HTTP ещё не проверены |

---

## 25. Selbsttest

1. Различи Stub Resolver, rekursiver Resolver и autoritativer Nameserver.
2. Какой Record содержит IPv4-Adresse?
3. Какой Record содержит Alias?
4. Для чего нужен MX-Priorität?
5. Что регулирует TTL?
6. Почему после изменения может возвращаться старая IP?
7. Различи NXDOMAIN, SERVFAIL и Timeout.
8. Может ли DNS использовать TCP?
9. Назови четыре шага DORA.
10. Какие пять данных обычно выдаёт DHCP?
11. Почему нужен DHCP-Relay?
12. Что показывает APIPA-Adresse?
13. Назови четыре возможные причины APIPA.
14. Как клиент решает, использовать ли Gateway?
15. Какой MAC-Ziel выбирается для удалённой IP?
16. Какой IP-Ziel находится в первом Paket?
17. Что Router делает с Layer-2-Frame?
18. Что обычно меняется на каждом Router?
19. Расставь DNS, TCP, TLS и HTTP по порядку.
20. Что меняет HTTP/3 в типовой цепочке?
21. Почему ping до IP не доказывает DNS?
22. Почему DNS-Erfolg не доказывает HTTPS?
23. Клиенты одного VLAN без DHCP, другие работают: что проверить?
24. Name löst auf falsche IP: какие два направления проверки?
25. Сформулируй немецкий ответ, почему Frame идёт к Gateway.

<details>
<summary>Lösungen anzeigen</summary>

1. Stub fragt; rekursiver Resolver beschafft/cached; autoritativer Server liefert Zonendaten.
2. A.
3. CNAME.
4. Для выбора Mailserver в предпочтительном порядке.
5. Допустимое время хранения DNS-Datensatz в Cache.
6. Cache ещё действителен до Ablauf der TTL.
7. Name existiert nicht; Serverauflösung fehlgeschlagen; keine rechtzeitige Antwort.
8. Да.
9. Discover, Offer, Request, Acknowledge.
10. IP, Maske/Präfix, Gateway, DNS-Server, Lease-Dauer.
11. Router не пересылает исходный Broadcast в другую сеть.
12. Клиент не получил подходящую DHCPv4-Konfiguration; точную причину ещё искать.
13. Link/VLAN, Relay, Scope, Filter/Server.
14. Сравнивает Netzanteil своей и целевой IP под Maske/Präfix.
15. MAC Default Gateway.
16. IP удалённого сервера.
17. Entfernt den alten Frame, routet das Paket und erstellt einen neuen Frame.
18. MAC-Adressen/Frame; Hop-Zähler уменьшается.
19. DNS, TCP, TLS, HTTP.
20. QUIC über UDP заменяет классический TCP-Verbindungsaufbau.
21. Ping до числовой IP не требует Namensauflösung.
22. Port, TLS и Anwendung могут не работать.
23. VLAN, Relay, passenden Scope und UDP-Filter.
24. Autoritativen Record и Caches/используемый Resolver.
25. Das Ziel liegt außerhalb des eigenen Subnetzes, deshalb adressiert der Client den ersten Frame an die MAC-Adresse des Default Gateways.

</details>

---

## 26. Quellen und Abgleich

- [RFC 1034 – Domain Names: Concepts and Facilities](https://datatracker.ietf.org/doc/html/rfc1034)
- [RFC 1035 – Domain Names: Implementation and Specification](https://datatracker.ietf.org/doc/html/rfc1035)
- [RFC 2131 – Dynamic Host Configuration Protocol](https://datatracker.ietf.org/doc/html/rfc2131)
- [RFC 826 – Address Resolution Protocol](https://datatracker.ietf.org/doc/html/rfc826)
- [RFC 9293 – Transmission Control Protocol](https://datatracker.ietf.org/doc/html/rfc9293)
- [RFC 8446 – TLS 1.3](https://datatracker.ietf.org/doc/html/rfc8446)
- [RFC 9114 – HTTP/3](https://datatracker.ietf.org/doc/html/rfc9114)

DNS-Verhalten kann durch lokale Caches, Split DNS, VPN und Sicherheitsrichtlinien abweichen. Konkrete Werkzeugausgaben sind systemabhängig.

---

## 27. Offene Prüfpunkte für den Unterricht

- Welche DNS-Records und Fehlercodes verlangt die WBS auswendig?
- Werden rekursive und iterative Anfrage im Detail unterschieden?
- Sind DHCP-Lease-Erneuerung T1/T2 prüfungsrelevant?
- Welche DHCP-Optionen müssen benannt werden?
- Wird HTTP/3 im Datenweg berücksichtigt oder klassisches TCP erwartet?
- Welche Diagnosebefehle und Ausgabefelder sind Pflicht?
