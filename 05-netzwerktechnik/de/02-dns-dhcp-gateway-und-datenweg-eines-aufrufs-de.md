---
pruefung: AP1
thema: DNS, DHCP, Default Gateway und Datenweg eines Aufrufs
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Deutsch
gegenstueck: ../ru/02-dns-dhcp-gateway-und-datenweg-eines-aufrufs-ru.md
---

# AP1: DNS, DHCP, Default Gateway und Datenweg eines Aufrufs

Ein erfolgreicher Websiteaufruf benötigt eine stimmige Clientkonfiguration, Namensauflösung, lokale Zustellung, Routing, Transport und Anwendung. Prüfungsaufgaben testen häufig gerade die Reihenfolge und die Grenzen dieser Funktionen.

---

## 1. Lernziele

Nach dieser Einheit kannst du:

- die DNS-Auflösung und die Rollen Resolver/autoritativer Nameserver erklären;
- wichtige DNS Resource Records und typische Fehler unterscheiden;
- DHCPv4-DORA, Lease und DHCP-Relay erläutern;
- IP-Adresse, Präfix, Default Gateway und DNS-Server prüfen;
- entscheiden, ob ein Frame direkt zum Ziel oder zum Gateway geht;
- den vollständigen Datenweg eines HTTPS-Aufrufs beschreiben;
- veränderliche und unveränderliche Adressen auf dem Weg unterscheiden;
- Fehler aus einem beobachteten Symptom systematisch eingrenzen.

---

## 2. Prüfungsminimum — 15 Minuten

### DNS

```text
Name → Resolver → autoritative Antwort → IP-Adresse
A = IPv4, AAAA = IPv6, CNAME = Alias, MX = Mail, PTR = Reverse
TTL = zulässige Cache-Dauer einer Antwort
```

### DHCPv4

```text
Discover → Offer → Request → Acknowledge
```

DHCP liefert typischerweise IP-Adresse, Subnetzmaske/Präfix, Default Gateway, DNS-Server und Lease-Dauer.

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

Das `Domain Name System` verwaltet verteilte Namensräume und Resource Records. Ein Name kann zu Adressen führen; DNS speichert außerdem Mail-, Zuständigkeits- und weitere Informationen.

```text
www.example.test → A/AAAA → IP-Adresse
```

- Der `Stub Resolver` ist die Clientkomponente, die einen rekursiven Resolver fragt.
- Der `rekursive Resolver` beschafft eine vollständige Antwort und cached sie.
- Der `autoritative Nameserver` liefert maßgebliche Daten für seine Zone.
- Eine `Zone` ist ein administrativ verwalteter Teil des Namensraums.

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
| `TXT` | Textdaten, beispielsweise Richtlinien/Verifikation |

Ein `CNAME` enthält keine IP-Adresse. Für die Adresse muss anschließend der kanonische Name aufgelöst werden.

---

## 5. Rekursive und iterative Auflösung

Vereinfachter Ablauf bei leerem Cache:

1. Die Anwendung fragt den lokalen Stub Resolver.
2. Der Client prüft lokale Mechanismen wie Cache und hosts-Datei gemäß Systemkonfiguration.
3. Der Stub fragt den konfigurierten rekursiven Resolver.
4. Der Resolver erhält Verweise über Root- und TLD-Nameserver.
5. Der autoritative Nameserver liefert den Record.
6. Der Resolver gibt die Antwort zurück und speichert sie gemäß TTL.

Der Client fragt normalerweise nicht selbst jeden Server der Hierarchie.

---

## 6. Cache und TTL

Die `TTL` gibt an, wie lange ein DNS-Datensatz gecached werden darf. Eine hohe TTL reduziert Anfragen, verzögert aber die Verbreitung von Änderungen. Eine kleine TTL erleichtert Umstellungen, erzeugt jedoch mehr Anfragen.

Auch negative Antworten können gecached werden. Nach einer Änderung können verschiedene Clients vorübergehend unterschiedliche gültige Cache-Stände sehen.

DNS-Replikation ist keine magische sofortige „Propagation“; Verzögerungen entstehen häufig durch noch gültige Caches.

---

## 7. DNS-Transport und Fehler

Klassisches DNS verwendet Port `53` über UDP und TCP. UDP ist bei vielen Standardanfragen üblich; TCP wird unter anderem für bestimmte große Antworten und Zonentransfers verwendet. Verschlüsselte Varianten besitzen eigene Verfahren.

| Ergebnis | Bedeutung |
|---|---|
| `NOERROR` mit Daten | erfolgreiche Antwort |
| `NXDOMAIN` | angefragter Domainname existiert nicht |
| `SERVFAIL` | Resolver oder Server konnte keine gültige Antwort liefern |
| Timeout | keine rechtzeitige Antwort; Ursache noch offen |

Ein Timeout beweist nicht automatisch den Ausfall des DNS-Servers. Route, Firewall, Verlust oder falsche Adresse sind ebenfalls möglich.

---

## 8. DNS-Diagnose

Sinnvolle Trennung:

```text
IP-Ziel erreichbar, Name nicht auflösbar → DNS-Konfiguration/Auflösung prüfen
Name löst auf, Ziel-IP falsch            → Record/Cache/Sicht prüfen
NXDOMAIN                                 → Schreibweise und autoritative Daten prüfen
SERVFAIL                                 → Resolverkette, DNSSEC/Serverzustand prüfen
```

Werkzeuge sind beispielsweise `nslookup`, `dig` und `Resolve-DnsName`. Die Ausgabe ist nach verwendetem Resolver, Recordtyp und TTL auszuwerten.

---

## 9. DHCPv4: Zweck

DHCP automatisiert die Hostkonfiguration. Typische Optionen sind:

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

Eine Lease gilt für einen begrenzten Zeitraum. Der Client versucht sie vor Ablauf zu erneuern. Funktioniert der ursprüngliche Server nicht, wird später breiter nach einer Verlängerung gesucht.

Wichtige Praxisregeln:

- feste Geräte sauber reservieren oder außerhalb des dynamischen Pools statisch planen;
- der Scope darf nicht erschöpft sein;
- identische Adressen verursachen Konflikte;
- die Lease-Zeit muss zu Mobilität und Poolgröße passen.

Konkrete T1/T2-Werte werden nur genannt, wenn Aufgabe oder Unterricht sie verlangt.

---

## 12. DHCP-Relay

Router leiten lokale Broadcasts normalerweise nicht weiter. Befindet sich der DHCP-Server in einem anderen Subnetz oder VLAN, nimmt ein `DHCP-Relay-Agent` die Anfrage entgegen und leitet sie gerichtet weiter.

Der Relay liefert dem Server Informationen über das Ursprungsnetz, damit der passende Scope gewählt wird.

Fehlt der Relay nur in VLAN 20, können Clients in VLAN 10 funktionieren, während VLAN 20 APIPA-Adressen erhält.

---

## 13. APIPA und Diagnose

Windows-Clients verwenden bei ausbleibender geeigneter DHCPv4-Konfiguration häufig eine Link-Local-Adresse aus `169.254.0.0/16`.

Mögliche Ursachen:

- Link oder VLAN falsch;
- DHCP-Server nicht erreichbar;
- DHCP-Relay fehlt oder ist falsch;
- Scope fehlt oder ist ausgeschöpft;
- UDP 67/68 wird gefiltert;
- Clientdienst oder Netzwerkkarte fehlerhaft.

APIPA ist ein Symptom und keine Ursachenbezeichnung.

---

## 14. Default Gateway

Der Client vergleicht eigene Adresse und Zieladresse unter Verwendung des Präfixes.

- Gleiches Netz: direkte lokale Zustellung.
- Anderes Netz: Paket an den nächsten Hop, meistens das Default Gateway.
- Keine passende Route und kein Gateway: entferntes Netz nicht erreichbar.

Die Gateway-Adresse muss aus Sicht des Clients lokal erreichbar und als Hostadresse geeignet sein.

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

1. Browser und Betriebssystem prüfen vorhandene Namensinformationen.
2. Die DNS-Auflösung liefert die Server-IP.
3. Der Client berechnet, ob die Server-IP lokal ist.
4. Bei entferntem Ziel wählt er das Default Gateway.
5. ARP ermittelt die Gateway-MAC.
6. Der Client kapselt das TCP-Segment in IP-Paket und lokalen Frame.
7. Der Switch leitet den Frame zum Router.
8. Der Router entkapselt Layer 2, wählt eine Route und erstellt den nächsten Frame.
9. Gegebenenfalls ändert NAT/PAT Quell-IP und Quellport.
10. TCP baut mit SYN, SYN-ACK und ACK die Verbindung auf.
11. TLS prüft das Serverzertifikat und vereinbart Schutzparameter.
12. Die HTTP-Anfrage wird geschützt übertragen.
13. Der Server antwortet mit HTTP-Inhalt und Statuscode.

HTTP/3 verwendet QUIC über UDP. Nur bei entsprechender Angabe wird von der klassischen TCP-Sequenz abgewichen.

---

## 17. Adressen im ersten Frame

Bei einem entfernten Webserver:

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
3. prüft Ziel-IP und Routingtabelle;
4. reduziert die IPv4-TTL beziehungsweise das IPv6-Hop-Limit;
5. bestimmt nächsten Hop und Ausgangsschnittstelle;
6. kapselt das Paket in einen neuen Frame.

Ein Router fragt nicht für den gesamten Weg nach einer einzigen MAC-Adresse.

---

## 19. Diagnosekette

Von unten nach oben kann geprüft werden:

1. Link, WLAN-Verbindung und VLAN.
2. Eigene IP- und Präfixkonfiguration.
3. Lokale Erreichbarkeit und Gateway.
4. Routing zu einer bekannten IP-Adresse.
5. DNS-Auflösung und richtige Antwort.
6. TCP- oder UDP-Zielport.
7. TLS und Zertifikat.
8. HTTP- und Anwendungsfunktion.

Die Reihenfolge darf an das Symptom angepasst werden. Jede Beobachtung soll eine Hypothese trennen.

---

## 20. Praxisfall: nur ein VLAN ohne DHCP

Clients in VLAN 10 erhalten Adressen. Clients in VLAN 20 erhalten `169.254.x.x`. Der zentrale Server läuft.

Wahrscheinliche Prüfpfade:

- VLAN-20-Uplink und Tagging prüfen;
- Relay auf dem Layer-3-Interface von VLAN 20 prüfen;
- Scope für das VLAN-20-Subnetz prüfen;
- UDP-Filter und Serverbindung prüfen.

DNS ist noch nicht die erste Ursache, weil bereits die Grundkonfiguration fehlt.

---

## 21. Praxisfall: IP funktioniert, Name nicht

`ping 203.0.113.20` funktioniert, `nslookup portal.example` läuft in einen Timeout.

Damit ist eine IP-Verbindung zum Testziel möglich. Zu prüfen sind konfigurierte DNS-Serveradresse, Erreichbarkeit des Resolvers, Port und Firewall sowie Resolverdienst. Der Test beweist nicht, dass jeder Internetweg funktioniert.

---

## 22. Prüfungsalgorithmus

1. Symptom exakt formulieren.
2. Clientkonfiguration vollständig notieren.
3. Local/Remote-Entscheidung mit dem Präfix treffen.
4. Nächsten Hop und dessen MAC-Adresse bestimmen.
5. DNS, Transport und Anwendung getrennt prüfen.
6. Bei DHCP Scope, Lease, Relay und Filter unterscheiden.
7. Ergebnis mit Soll, Ist und nächstem Test dokumentieren.

---

## 23. Typische Prüfungsformulierungen

> Der rekursive Resolver beschafft die DNS-Antwort für den Client, während der autoritative Nameserver die maßgeblichen Einträge seiner Zone bereitstellt.

> Der Client sendet das Paket an das Default Gateway, da die Zieladresse gemäß Subnetzmaske nicht zum eigenen Netz gehört.

> Ein DHCP-Relay ist erforderlich, weil der ursprüngliche DHCP-Broadcast ein geroutetes Netz nicht ohne Weiterleitung erreicht.

> Die erfolgreiche Namensauflösung beweist nur die DNS-Funktion; der Zielport und der Anwendungsdienst müssen separat geprüft werden.

---

## 24. Typische Prüfungsfallen

| Falle | Korrektur |
|---|---|
| DNS liefert eine vollständige URL | DNS verwaltet Resource Records, nicht die ganze URL |
| Resolver ist immer autoritativ | Rollen unterscheiden |
| TTL ist Lebensdauer einer Domain | TTL steuert den Cache eines Datensatzes |
| DHCP und DNS sind identisch | Konfiguration und Namensauflösung trennen |
| DHCP-Broadcast durchquert Router | Relay oder lokaler Server erforderlich |
| 169.254 bedeutet immer defekte NIC | mehrere mögliche Ursachen |
| erster Frame braucht MAC des entfernten Servers | Ziel-MAC ist die Gateway-MAC |
| erfolgreicher DNS-Test beweist Website | Transport, TLS und HTTP fehlen noch |

---

## 25. Selbsttest

1. Unterscheide Stub Resolver, rekursiven Resolver und autoritativen Nameserver.
2. Welcher Record enthält eine IPv4-Adresse?
3. Welcher Record enthält einen Alias?
4. Wozu dient die MX-Priorität?
5. Was steuert die TTL?
6. Warum kann nach einer Änderung noch die alte IP erscheinen?
7. Unterscheide NXDOMAIN, SERVFAIL und Timeout.
8. Kann DNS TCP verwenden?
9. Nenne die vier DORA-Schritte.
10. Welche fünf Angaben liefert DHCP typischerweise?
11. Warum wird ein DHCP-Relay benötigt?
12. Was zeigt eine APIPA-Adresse?
13. Nenne vier mögliche APIPA-Ursachen.
14. Wie entscheidet der Client über das Gateway?
15. Welche Ziel-MAC wird für eine entfernte IP verwendet?
16. Welche Ziel-IP steht im ersten Paket?
17. Was tut der Router mit dem Layer-2-Frame?
18. Was ändert sich normalerweise an jedem Router?
19. Ordne DNS, TCP, TLS und HTTP.
20. Was ändert HTTP/3 an der typischen Kette?
21. Warum beweist Ping zu einer IP kein DNS?
22. Warum beweist DNS-Erfolg kein HTTPS?
23. Ein VLAN erhält kein DHCP, andere schon: Was wird geprüft?
24. Ein Name löst auf eine falsche IP auf: Nenne zwei Prüfbereiche.
25. Formuliere, warum der Frame zum Gateway geht.

<details>
<summary>Lösungen anzeigen</summary>

1. Stub fragt; rekursiver Resolver beschafft und cached; autoritativer Server liefert Zonendaten.
2. A.
3. CNAME.
4. Zur bevorzugten Reihenfolge der Mailserverauswahl.
5. Die zulässige Cache-Dauer eines DNS-Datensatzes.
6. Ein Cache ist bis zum Ablauf der TTL noch gültig.
7. Name existiert nicht; Serverauflösung fehlgeschlagen; keine rechtzeitige Antwort.
8. Ja.
9. Discover, Offer, Request, Acknowledge.
10. IP, Maske oder Präfix, Gateway, DNS-Server und Lease-Dauer.
11. Router leiten den ursprünglichen Broadcast nicht in das andere Netz.
12. Der Client erhielt keine geeignete DHCPv4-Konfiguration; die Ursache ist noch zu ermitteln.
13. Link oder VLAN, Relay, Scope, Filter oder Server.
14. Er vergleicht die Netzanteile der eigenen und der Ziel-IP unter der Maske.
15. MAC-Adresse des Default Gateways.
16. IP-Adresse des entfernten Servers.
17. Er entfernt den alten Frame, routet das Paket und erstellt einen neuen Frame.
18. MAC-Adressen und Frame; außerdem wird der Hop-Zähler reduziert.
19. DNS, TCP, TLS, HTTP.
20. QUIC über UDP ersetzt den klassischen TCP-Verbindungsaufbau.
21. Ping zu einer numerischen IP benötigt keine Namensauflösung.
22. Port, TLS und Anwendung können weiterhin ausfallen.
23. VLAN, Relay, passenden Scope und UDP-Filter.
24. Autoritativen Record und Caches beziehungsweise verwendeten Resolver.
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
- Werden rekursive und iterative Anfragen im Detail unterschieden?
- Sind DHCP-Lease-Erneuerung T1/T2 prüfungsrelevant?
- Welche DHCP-Optionen müssen benannt werden?
- Wird HTTP/3 im Datenweg berücksichtigt oder klassisches TCP erwartet?
- Welche Diagnosebefehle und Ausgabefelder sind Pflicht?
