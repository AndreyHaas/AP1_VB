---
pruefung: AP1
thema: Netzwerkmodelle, Kapselung, TCP, UDP und Ports
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Deutsch
gegenstueck: ../ru/01-netzwerkmodelle-kapselung-tcp-udp-und-ports-ru.md
---

# AP1: Netzwerkmodelle, Kapselung, TCP, UDP und Ports

Netzwerkmodelle zerlegen die Datenübertragung in Aufgaben. Dadurch lassen sich Begriffe systematisch zuordnen und Fehler auf Kabel, lokalen Frame, IP-Weg, Transportverbindung oder Anwendung eingrenzen.

---

## 1. Lernziele

Nach dieser Einheit kannst du:

- die sieben OSI-Schichten den vier TCP/IP-Schichten zuordnen;
- Bit, Frame, Paket, Segment, Datagramm und Anwendungsdaten unterscheiden;
- Kapselung und Entkapselung erklären;
- MAC-Adresse, IP-Adresse und Portnummer abgrenzen;
- TCP und UDP nach Eigenschaften und Einsatz vergleichen;
- TCP-Verbindungsaufbau, Bestätigung und Wiederholung erläutern;
- ein Transportprotokoll anforderungsbezogen auswählen;
- typische Netzwerkfehler einer Schicht zuordnen.

---

## 2. Prüfungsminimum — 15 Minuten

### OSI-Kette

```text
7 Anwendung       HTTP, DNS, DHCP
6 Darstellung     Format, Codierung, Verschlüsselung
5 Sitzung         Sitzungssteuerung
4 Transport       TCP/UDP, Ports
3 Vermittlung     IPv4/IPv6, Routing, Paket
2 Sicherung       Ethernet/WLAN, MAC, Frame, Switch
1 Bitübertragung  Kabel, Funk, Signal, Bits
```

### Kapselung

```text
Daten → TCP-Segment/UDP-Datagramm → IP-Paket → Frame → Bits
```

### Adressen

```text
MAC-Adresse → lokale Zustellung auf dem aktuellen Abschnitt
IP-Adresse  → netzübergreifende Zustellung zum Ziel
Portnummer  → Anwendung oder Dienst auf dem Zielsystem
```

### TCP und UDP

| TCP | UDP |
|---|---|
| verbindungsorientiert | verbindungslos |
| bestätigt und ordnet | keine Zustell- oder Reihenfolgegarantie |
| Wiederholung bei Verlust | keine eingebaute Wiederholung |
| mehr Steuerungsaufwand | geringer Overhead |

> TCP wird verwendet, wenn eine vollständige und geordnete Übertragung wichtiger ist als minimale Verzögerung.

> UDP eignet sich, wenn geringe Latenz oder ein einfacher Nachrichtenaustausch wichtiger ist und die Anwendung Verluste toleriert oder selbst behandelt.

---

## 3. Zweck von Schichtenmodellen

Jede Schicht stellt der darüberliegenden eine Leistung bereit und verwendet die darunterliegende. Das Modell schafft eine gemeinsame Sprache für Planung, Dokumentation und Fehlersuche.

Leuchtet der Link, aber der Client besitzt keine IP-Konfiguration, ist die physische Verbindung möglicherweise in Ordnung und der Fehler liegt höher. Funktioniert `ping`, aber HTTPS nicht, weist Layer 3 allein noch keine Funktion der Layer 4 bis 7 nach.

Ein Schichtenmodell ist ein Analysewerkzeug. Reale Protokolle passen nicht immer eindeutig in genau eine didaktische Zelle.

---

## 4. OSI-Modell

| Layer | Bezeichnung | Hauptaufgabe | Adresse/PDU | Beispiele |
|---:|---|---|---|---|
| 7 | Anwendung | Netzwerkfunktionen für Anwendungen | Daten | HTTP, DNS, DHCP, SMTP |
| 6 | Darstellung | Format, Codierung und Umwandlung | Daten | UTF-8, JSON, JPEG; TLS wird didaktisch oft hier gezeigt |
| 5 | Sitzung | Steuerung logischer Sitzungen | Daten | Sitzungssteuerung, RPC-Kontext |
| 4 | Transport | Prozess-zu-Prozess-Kommunikation | Port; Segment/Datagramm | TCP, UDP |
| 3 | Vermittlung | logische Adressierung und Routing | IP; Paket | IPv4, IPv6, ICMP, Router |
| 2 | Sicherung | Übertragung im lokalen Segment | MAC; Frame | Ethernet, WLAN, VLAN, Switch |
| 1 | Bitübertragung | Signal und Medium | Bits | Kupfer, LWL, Funk, Repeater |

In einer Aufgabe ist das vorgegebene Modell anzuwenden. Bei einem Grenzfall zählt die geprüfte Hauptfunktion, nicht ein Streit über jede Implementierungsnuance.

---

## 5. TCP/IP-Modell

Die praktische Internetprotokollfamilie wird häufig mit vier Schichten dargestellt:

| TCP/IP-Schicht | ungefähre OSI-Zuordnung | Beispiele |
|---|---|---|
| Anwendung | 7–5 | HTTP, DNS, DHCP, SMTP |
| Transport | 4 | TCP, UDP |
| Internet | 3 | IP, ICMP |
| Netzzugang | 2–1 | Ethernet, WLAN, physisches Medium |

OSI eignet sich für eine detaillierte Funktionsanalyse, TCP/IP beschreibt den praktisch verwendeten Protokollstapel. Es handelt sich nicht um zwei konkurrierende Netze.

---

## 6. Protokoll, Dienst und Schnittstelle

- Ein `Protokoll` definiert Regeln für den Nachrichtenaustausch.
- Ein `Dienst` ist die bereitgestellte Funktion, beispielsweise Namensauflösung.
- Eine `Schnittstelle` verbindet Schichten oder Komponenten.

DNS ist ein Anwendungsprotokoll und stellt Namensauflösung bereit. Für die Übertragung einer DNS-Nachricht verwendet es UDP oder TCP; diese verwenden wiederum IP.

---

## 7. Protocol Data Units

| Schicht | typische Bezeichnung der Dateneinheit |
|---|---|
| Anwendung 7–5 | Daten/Nachricht |
| TCP | Segment |
| UDP | Datagramm |
| IP | Paket |
| Ethernet | Frame |
| Physical | Bits |

Fachliteratur verwendet Begriffe teilweise weiter. In der AP1 sollte die Dateneinheit mit der konkreten Schicht verbunden werden.

---

## 8. Kapselung

Beim Senden ergänzt jede Schicht ihre Steuerungsinformationen:

```text
HTTP-Daten
+ TCP-Header      = TCP-Segment
+ IP-Header       = IP-Paket
+ Ethernet-Header und Trailer = Ethernet-Frame
→ Übertragung als Bits
```

Header können Ports, IP-Adressen, Protokollkennungen, Prüfinformationen und weitere Felder enthalten. Der Ethernet-Trailer enthält eine Integritätsprüfung für den Frame auf dem lokalen Abschnitt.

---

## 9. Entkapselung

Der Empfänger arbeitet in umgekehrter Reihenfolge:

1. Die Netzwerkkarte empfängt Bits und prüft den Frame.
2. Layer 2 übergibt das enthaltene IP-Paket nach oben.
3. IP prüft Zieladresse und angegebenes Transportprotokoll.
4. TCP oder UDP wertet den Zielport aus.
5. Das Betriebssystem übergibt die Nutzdaten dem passenden Prozess.

Jede Schicht interpretiert nur den für sie relevanten Header.

---

## 10. Änderungen auf dem Übertragungsweg

An einem Router endet der alte Layer-2-Frame. Der Router entnimmt das IP-Paket und erstellt für den nächsten Link einen neuen Frame.

```text
MAC-Adressen  → ändern sich auf jedem gerouteten Abschnitt
IP-Adressen   → normalerweise Ende-zu-Ende; NAT kann sie ändern
Ports         → normalerweise Ende-zu-Ende; PAT kann den Quellport ändern
Nutzdaten     → werden von einem gewöhnlichen Router nicht geändert
```

---

## 11. MAC, IP und Port

| Kennung | Frage | Bereich |
|---|---|---|
| MAC-Adresse | An welche Schnittstelle geht der Frame auf dem lokalen Link? | Layer 2 |
| IP-Adresse | Welcher Host oder welches Interface ist das Netzziel? | Layer 3 |
| Portnummer | Welche Anwendung erhält die Daten? | Layer 4 |

Liegt die Ziel-IP außerhalb des eigenen Subnetzes, gehört die Ziel-MAC des ersten Frames dem Default Gateway und nicht dem entfernten Server.

---

## 12. Switch, Router und Access Point

- Ein `Switch` lernt Quell-MAC-Adressen und leitet Frames nach Ziel-MAC im Layer-2-Netz weiter.
- Ein `Router` verbindet IP-Netze und wählt einen Weg nach Ziel-IP.
- Ein `Access Point` verbindet WLAN-Clients in seiner Grundfunktion als Layer-2-Bridge mit dem LAN.
- Ein `Layer-3-Switch` führt zusätzlich Routing aus; entscheidend ist die konkrete Funktion.

Hub und Repeater arbeiten auf Layer 1 und entscheiden nicht anhand einer MAC- oder IP-Adresse.

---

## 13. ARP, NDP und ICMP

- `ARP` ermittelt im lokalen Broadcast-Domain die MAC-Adresse zu einer IPv4-Adresse.
- `NDP` übernimmt Nachbarschaftsauflösung und weitere IPv6-Funktionen über ICMPv6.
- `ICMP` übermittelt Netzstatus und wird beispielsweise von `ping` verwendet; ICMP besitzt keinen TCP- oder UDP-Port.

ARP sucht nicht die MAC-Adresse eines entfernten Webservers über das Internet. Der Client benötigt die MAC des lokalen nächsten Hops.

---

## 14. TCP: Verbindung und Bytestrom

TCP stellt Anwendungen einen zuverlässigen, geordneten Bytestrom zwischen Endpunkten bereit. Es erhält Anwendungsnachrichtengrenzen nicht: Ein einzelner `send`-Aufruf muss nicht einem empfangenen Segment entsprechen.

Für die Identifikation einer Verbindung ist die Kombination relevant:

```text
Quell-IP + Quellport + Ziel-IP + Zielport + Transportprotokoll
```

---

## 15. TCP Three-Way Handshake

```text
Client → SYN     → Server
Client ← SYN-ACK ← Server
Client → ACK     → Server
```

Der Handshake synchronisiert anfängliche Sequenznummern und bestätigt die beidseitige Erreichbarkeit. Er ist keine TLS-Verschlüsselung und authentifiziert keinen Benutzer.

---

## 16. Sequenznummer, ACK und Wiederholung

TCP nummeriert Bytes, bestätigt empfangene Daten und kann unbestätigte Daten erneut senden.

- Die `Sequenznummer` bezeichnet die Position der Daten im Strom.
- Das `Acknowledgment` nennt das nächste erwartete Byte.
- Eine Prüfsumme hilft, Übertragungsfehler zu erkennen.
- Der Empfänger kann Daten in die richtige Reihenfolge bringen.

Zuverlässigkeit bezeichnet Erkennungs- und Kompensationsmechanismen. Sie verspricht keine unendliche Zustellung; eine Verbindung kann mit Fehler abbrechen.

---

## 17. Fluss- und Überlastungssteuerung

- `Flusssteuerung` schützt den Empfänger vor zu schneller Übertragung.
- `Überlastungssteuerung` reduziert die Sendemenge bei Hinweisen auf Netzüberlastung.

Für die AP1 genügt meist die Begründung, dass TCP die Übertragung steuert und dadurch mehr Overhead und gegebenenfalls Verzögerung als ein einfacher UDP-Austausch erzeugt.

---

## 18. UDP

UDP überträgt einzelne Datagramme ohne Verbindungsaufbau und ohne eingebaute Garantie für Zustellung, Reihenfolge oder Wiederholung.

Vorteile:

- kleiner Header und einfacher Ablauf;
- kein TCP-Handshake;
- Eignung für Multicast und kurze Anfragen;
- bei Echtzeitanwendungen muss ein verspätetes Paket nicht nachgeholt werden.

Eine Anwendung kann selbst Bestätigung, Reihenfolge oder Wiederholung ergänzen. Deshalb bedeutet `UDP` nicht automatisch `unzuverlässige Anwendung`.

---

## 19. Auswahl von TCP oder UDP

| Anforderung | geeigneter Ansatz |
|---|---|
| Datei muss vollständig ankommen | TCP |
| SSH-Sitzung mit exaktem Befehlsstrom | TCP |
| kurze DNS-Standardanfrage | meist UDP; TCP ist ebenfalls vorgesehen |
| Live-Audio mit Aktualitätspriorität | häufig UDP |
| HTTP/1.1 oder HTTP/2 | TCP |
| HTTP/3 | QUIC über UDP |

Die Auswahl folgt Anforderungen und nicht der pauschalen Aussage, TCP sei gut und UDP schlecht.

---

## 20. Portnummern

Ein Port ist eine 16-Bit-Zahl von `0` bis `65535`. IANA unterscheidet:

| Bereich | Bezeichnung |
|---:|---|
| 0–1023 | System/Well-Known Ports |
| 1024–49151 | User/Registered Ports |
| 49152–65535 | Dynamic/Private Ports |

Ein Betriebssystem kann temporäre Clientports nach eigenen Regeln auswählen. Ohne Systemprüfung darf nicht behauptet werden, jeder Clientport liege zwingend nur in einem bestimmten Lehrbuchbereich.

---

## 21. Wichtige Dienste und Ports

| Dienst | Port/Transport | Zweck |
|---|---|---|
| SSH | 22/TCP | sichere Fernadministration |
| DNS | 53/UDP und TCP | Namensauflösung |
| DHCPv4 | 67/UDP Server, 68/UDP Client | IPv4-Konfiguration |
| HTTP | 80/TCP | Web ohne TLS |
| HTTPS | 443/TCP; HTTP/3 auch 443/UDP | Web mit TLS |
| NTP | 123/UDP | Zeitsynchronisation |
| IMAP/IMAPS | 143/993 TCP | Mailzugriff |
| SMTP Submission | 587/TCP | Mailversand durch Clients |
| LDAP/LDAPS | 389/636 TCP | Verzeichnisdienst |
| SMB | 445/TCP | Datei-/Druckfreigaben |
| RDP | 3389/TCP/UDP | Remote Desktop |

Ein offener Port zeigt nur, dass ein Endpunkt Verbindungen oder Datagramme annimmt. Er beweist nicht die korrekte oder sichere Funktion des erwarteten Dienstes.

---

## 22. Mehrere Verbindungen zu einem Serverport

Ein Webserver kann viele Clients auf `443` bedienen, weil Verbindungen anhand ihrer Endpunkte unterschieden werden.

```text
192.168.10.11:53001 → 203.0.113.20:443/TCP
192.168.10.12:53001 → 203.0.113.20:443/TCP
192.168.10.11:53002 → 203.0.113.20:443/TCP
```

Eine andere IP-Adresse oder ein anderer Quellport ergibt einen anderen Datenstrom.

---

## 23. HTTP-Statuscode ist kein Netzwerkport

Port `443` identifiziert einen HTTPS-Endpunkt. Ein HTTP-Statuscode ist eine Antwort des Anwendungsprotokolls nach erfolgreicher Transport- und TLS-Kommunikation.

| Code | Bedeutung |
|---:|---|
| 200 | Anfrage erfolgreich bearbeitet |
| 201 | Ressource erstellt |
| 400 | fehlerhafte Anfrage |
| 401 | gültige Authentifizierung fehlt |
| 403 | Anfrage verstanden, Zugriff verboten |
| 404 | Ressource nicht gefunden |
| 500 | interner Serverfehler |
| 502 | Gateway erhielt ungeeignete Backend-Antwort |
| 503 | Dienst vorübergehend nicht verfügbar |
| 504 | Gateway erhielt rechtzeitig keine Backend-Antwort |

---

## 24. Vollständiger Praxisfall

Bei einem Client ist der Link aktiv. `ping` zum Gateway und zur IP-Adresse des Webservers funktioniert, aber `curl https://server.example` liefert `Connection refused`.

Analyse:

1. Layer 1 und 2 funktionieren hinreichend für die lokale Übertragung.
2. IP-Routing zum Server funktioniert.
3. DNS ist separat zu prüfen, wenn ein Name verwendet wurde.
4. `Connection refused` bedeutet typischerweise, dass der Zielhost erreichbar ist, aber der TCP-Port nicht lauscht oder aktiv abgewiesen wird.
5. Dienststatus, Binding, Zielport und Firewall sind zu prüfen.

Die Aussage „Netzwerk kaputt“ ist zu ungenau.

---

## 25. Prüfungsalgorithmus

1. Geforderte Funktion bestimmen.
2. Schicht und Protokoll nennen.
3. PDU und relevante Adresse angeben.
4. Bei Transport TCP oder UDP nach Anforderung auswählen und begründen.
5. Bei entferntem Ziel die Ziel-MAC des nächsten Hops von der Ziel-IP des Endsystems trennen.
6. Ein Ergebnis auf einer unteren Schicht nicht als Nachweis für höhere Schichten verwenden.

---

## 26. Typische Prüfungsformulierungen

> Ein Switch leitet Frames innerhalb eines lokalen Netzes anhand von MAC-Adressen weiter, während ein Router Pakete anhand von IP-Netzen zwischen Netzen vermittelt.

> Beim Senden werden die Anwendungsdaten schrittweise um Transport-, IP- und Sicherungsinformationen ergänzt; dieser Vorgang heißt Kapselung.

> TCP ist hier geeignet, da die Datei vollständig und in der richtigen Reihenfolge ankommen muss.

> Ein erfolgreicher Ping weist IP-Erreichbarkeit nach, aber nicht, dass der benötigte TCP-Port und der Anwendungsdienst funktionieren.

---

## 27. Typische Prüfungsfallen

| Falle | Korrektur |
|---|---|
| Switch ist immer nur Layer 2 | konkrete Funktion prüfen; ein Layer-3-Switch routet |
| DNS gehört zur Transportschicht | DNS ist Anwendung und verwendet TCP/UDP |
| Port 443 gehört zu Layer 7 | Port ist Layer 4; HTTPS ist Anwendung |
| ping verwendet einen Port | ICMP verwendet keinen TCP/UDP-Port |
| TCP garantiert jeden Erfolg | TCP erkennt und kompensiert, kann aber fehlschlagen |
| UDP ist immer schneller | Anwendung, Netz und Implementierung entscheiden |
| Client braucht MAC des entfernten Servers | er braucht die MAC des lokalen nächsten Hops |
| TLS ist immer eindeutig Layer 6 | didaktische Zuordnung; reale Grenzen sind komplexer |

---

## 28. Selbsttest

1. Nenne die OSI-Schichten von unten nach oben.
2. Ordne die vier TCP/IP-Schichten dem OSI-Modell zu.
3. Welche PDU gehört zu Ethernet?
4. Was wird bei der Kapselung ergänzt?
5. Was geschieht am Router mit dem Layer-2-Header?
6. Welche Aufgabe hat eine MAC-Adresse?
7. Welche Aufgabe hat eine IP-Adresse?
8. Welche Aufgabe hat eine Portnummer?
9. Auf welchem Layer arbeitet ein normaler Switch?
10. Warum prüft `ping` kein HTTPS?
11. Beschreibe den TCP Three-Way Handshake.
12. Wozu dienen Sequenznummern und ACK?
13. Erhält TCP die Nachrichtengrenzen der Anwendung?
14. Welche Garantien bietet UDP nicht eingebaut?
15. Warum verwendet Live-Audio häufig UDP?
16. Welchen Transport verwendet SSH gewöhnlich?
17. Kann DNS TCP verwenden?
18. Welche Ports verwendet DHCPv4?
19. Wie unterscheiden sich Serverport und temporärer Clientport?
20. Warum können viele Clients gleichzeitig Serverport 443 verwenden?
21. Zu welchem Layer gehört ICMP?
22. Welche MAC-Adresse ermittelt ARP für ein entferntes Ziel?
23. Wähle TCP oder UDP für eine Sicherungsdatei und begründe.
24. Ordne ein: Link ist nicht vorhanden.
25. Ordne ein: IP ist erreichbar, TCP 443 ist geschlossen.

<details>
<summary>Lösungen anzeigen</summary>

1. Bitübertragung, Sicherung, Vermittlung, Transport, Sitzung, Darstellung, Anwendung.
2. Netzzugang = OSI 1–2; Internet = 3; Transport = 4; Anwendung = 5–7.
3. Frame.
4. Steuerungsheader und auf Layer 2 zusätzlich ein Trailer.
5. Der alte Frame wird entfernt und für den nächsten Link ein neuer erstellt.
6. Lokale Frame-Zustellung zu einer Schnittstelle.
7. Logische Ende-zu-Ende-Adressierung und Routing.
8. Übergabe an den passenden Prozess oder Dienst.
9. Layer 2.
10. Ping verwendet ICMP und prüft TCP, TLS und HTTP nicht.
11. SYN, SYN-ACK, ACK.
12. Byte-Reihenfolge, Bestätigung und Erkennung notwendiger Wiederholung.
13. Nein, TCP stellt einen Bytestrom bereit.
14. Zustellung, Reihenfolge, Duplikatschutz und Wiederholung.
15. Aktualität und geringe Verzögerung können wichtiger als späte Wiederholung sein.
16. TCP.
17. Ja, DNS verwendet UDP und TCP.
18. 67/UDP für Server und 68/UDP für Client.
19. Der Serverport bezeichnet den wartenden Dienst; der Clientport unterscheidet den ausgehenden Endpunkt.
20. Verbindungen besitzen unterschiedliche Kombinationen aus IP-Adressen und Ports.
21. Layer 3.
22. Die MAC-Adresse des lokalen nächsten Hops, meistens des Gateways.
23. TCP, da vollständige und geordnete Übertragung gefordert ist.
24. Zuerst Layer 1, anschließend lokaler Layer 2.
25. Layer 3 funktioniert; Layer 4 sowie Dienst und Firewall sind zu prüfen.

</details>

---

## 29. Quellen und Abgleich

- [RFC 1122 – Requirements for Internet Hosts](https://datatracker.ietf.org/doc/html/rfc1122)
- [RFC 8200 – Internet Protocol, Version 6](https://datatracker.ietf.org/doc/html/rfc8200)
- [RFC 9293 – Transmission Control Protocol](https://datatracker.ietf.org/doc/html/rfc9293)
- [RFC 768 – User Datagram Protocol](https://datatracker.ietf.org/doc/html/rfc768)
- [IANA – Service Name and Transport Protocol Port Number Registry](https://www.iana.org/assignments/service-names-port-numbers/)

Zuordnungen oberhalb der Transportschicht sind didaktische Modelle. In einer Aufgabe hat das angegebene Modell Vorrang. Die Portliste ist eine Orientierung und kein Nachweis für den tatsächlich laufenden Dienst.

---

## 30. Offene Prüfpunkte für den Unterricht

- Verlangt die WBS alle sieben PDU-Bezeichnungen exakt?
- Wird das TCP/IP-Modell mit vier oder fünf Schichten verwendet?
- Welche Ports müssen auswendig gelernt werden?
- Müssen TCP-Flags außer SYN und ACK detailliert behandelt werden?
- Gehört HTTP/3/QUIC zum aktuellen AP1-Umfang?
- Wie ordnet die WBS TLS und ARP in ihren OSI-Aufgaben ein?
