---
pruefung: AP1
thema: QoS, VoIP und Netzwerkdienste
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Deutsch
gegenstueck: ../ru/08-qos-voip-und-netzwerkdienste-ru.md
---

# QoS, VoIP und Netzwerkdienste

## 1. Lernziele

Du kannst:

- Bandbreite, Durchsatz, Latenz, Jitter und Paketverlust unterscheiden;
- QoS-Schritte und Grenzen erklären;
- SIP, RTP, RTCP und VoIP-Codecs einordnen;
- Bandbreite eines Sprachstroms mit Overhead abschätzen;
- Voice-VLAN, PoE und Sicherheitsmaßnahmen begründen;
- wichtige Netzwerkdienste Protokollen und typischen Ports zuordnen;
- einen Dienst anhand von Name, Transport, Port und Zweck diagnostizieren.

## 2. Prüfungsminimum — 15 Minuten

1. Bandbreite ist verfügbare Kapazität; Durchsatz ist tatsächlich übertragene Datenrate.
2. Latenz ist Verzögerung; Jitter ist die Schwankung der Paketlaufzeit; Verlust sind fehlende Pakete.
3. QoS klassifiziert, markiert, reiht ein und steuert Verkehr; es erzeugt keine zusätzliche Bandbreite.
4. DSCP markiert im IP-Header eine gewünschte Behandlung; jede Netzgrenze muss die Markierung vertrauen und umsetzen.
5. SIP signalisiert Sitzungen; RTP transportiert typischerweise Medien; RTCP liefert Kontrollinformationen.
6. Sprachbandbreite enthält Codec-Nutzdaten plus Paket-, Transport-, IP- und Layer-2-Overhead.
7. Voice-VLAN trennt Broadcast-Domänen und Richtlinien, ersetzt aber keine Verschlüsselung oder Zugriffskontrolle.
8. PoE-Budget des Switches und Leistung je Port prüfen.
9. Portnummer allein beweist den Dienst nicht; Transportprotokoll und tatsächliche Konfiguration gehören dazu.
10. Unsichere Klartextdienste wie Telnet oder ungeschütztes FTP möglichst durch SSH/SFTP beziehungsweise geschützte Verfahren ersetzen.

## 3. Qualitätsgrößen und QoS

| Größe | Bedeutung | Wirkung auf VoIP |
|---|---|---|
| Bandbreite | mögliche Kapazität | zu wenig Kapazität erzeugt Warteschlangen |
| Durchsatz | tatsächlich nutzbare Rate | bestimmt transportierbare Medienmenge |
| Latenz | Ende-zu-Ende-Verzögerung | Gesprächspartner fallen sich ins Wort |
| Jitter | Schwankung der Laufzeit | ungleichmäßige Wiedergabe |
| Paketverlust | fehlende Pakete | Aussetzer und Qualitätsverlust |
| Verfügbarkeit | nutzbare Zeit | Erreichbarkeit des Dienstes |

Typischer QoS-Ablauf:

1. Verkehr identifizieren und klassifizieren.
2. Vertrauensgrenze und Markierung festlegen.
3. Warteschlangen und Scheduling konfigurieren.
4. Verkehr bei Bedarf formen (`Shaping`) oder begrenzen (`Policing`).
5. Ende-zu-Ende messen, dokumentieren und anpassen.

`Priority Queuing` kann zeitkritische Sprache bevorzugen. Die Prioritätsklasse muss begrenzt und überwacht werden, damit anderer Verkehr nicht verhungert.

## 4. DSCP, VLAN und Netzgrenzen

DSCP nutzt sechs Bits im Differentiated-Services-Feld des IP-Headers und verweist auf ein Per-Hop Behaviour. Eine Markierung ist keine Garantie: Switches, Router, WAN-Provider und Tunnel müssen sie passend behandeln.

Ein Voice-VLAN ermöglicht eigene Adressierung, Broadcast-Domäne, ACLs und QoS-Policy. Dazu gehören sichere Switchport-Konfiguration, DHCP/DNS/NTP-Erreichbarkeit, Call-Server-Zugang und Monitoring.

Bei IP-Telefonen sind zu prüfen:

- PoE-Standard, Leistungsbedarf je Telefon und Gesamtbudget;
- Voice- und Data-VLAN am Anschluss;
- LLDP/LLDP-MED oder andere freigegebene Zuweisung;
- QoS-Vertrauensgrenze: Endgerät nicht blind vertrauen;
- Ausfallszenario von Switch, Call-Server, WAN und Strom.

## 5. VoIP und Bandbreitenrechnung

| Baustein | Aufgabe |
|---|---|
| SIP | Aufbau, Änderung und Abbau einer Sitzung |
| SDP | beschreibt Medienparameter innerhalb der Signalisierung |
| RTP | Transport zeitkritischer Audio-/Videodaten |
| RTCP | Qualitäts- und Teilnehmerinformationen |
| Codec | wandelt und komprimiert Audio oder Video |
| SRTP | schützt RTP-Medien kryptografisch |

### G.711-Beispiel

G.711 erzeugt `64 kbit/s` Audio-Nutzdaten. Bei 20 ms Paketierungszeit:

```text
Pakete je Sekunde = 1 / 0,020 s = 50
Payload je Paket = 64 000 bit/s × 0,020 s / 8 = 160 Byte
IPv4 + UDP + RTP = 20 + 8 + 12 = 40 Byte
IP-Ebene je Richtung = (160 + 40) Byte × 8 × 50
= 80 000 bit/s = 80 kbit/s
```

Layer-2-Overhead, Tunnel, Sicherheitsheader und Reserven kommen hinzu. Für ein gleichzeitiges Gespräch wird Kapazität in beide Richtungen benötigt; je nach Aufgabenstellung werden die Richtungen getrennt oder zusammen angegeben.

## 6. Netzwerkdienste und Anwendungsfall

| Dienst | Zweck | typischer Transport/Port |
|---|---|---|
| DNS | Namensauflösung | UDP/TCP 53 |
| DHCPv4 | Adresskonfiguration | UDP 67/68 |
| HTTP / HTTPS | Web | TCP 80 / TCP 443; HTTP/3 typischerweise UDP 443 |
| SSH / SFTP | sichere Administration/Dateiübertragung | TCP 22 |
| FTP | getrennte Steuer-/Datenverbindung, meist ungeschützt | TCP 21 plus Datenverbindung |
| SMTP | Mailtransport/Submission | TCP 25 / 587; 465 für implizites TLS |
| IMAP | Mailboxzugriff | TCP 143 / 993 mit TLS |
| POP3 | Mailabruf | TCP 110 / 995 mit TLS |
| NTP | Zeitsynchronisation | UDP 123 |
| SNMP | Monitoring/Traps | UDP 161/162 |
| LDAP / LDAPS | Verzeichnisdienst | TCP/UDP 389 / TCP 636 |
| SMB | Dateifreigabe | TCP 445 |
| NFS | Netzwerkdateisystem | typischerweise TCP/UDP 2049 |
| RDP | Remote Desktop | TCP/UDP 3389 |
| SIP | VoIP-Signalisierung | häufig 5060, TLS häufig 5061 |
| RTP | Medienstrom | dynamisch ausgehandelte UDP-Ports |
| Syslog | Protokollversand | häufig UDP/TCP 514, TLS TCP 6514 |

Ports sind Standardzuordnungen, keine Naturgesetze. Anwendungen können andere Ports verwenden, Firewalls können NAT durchführen, und verschlüsselte Varianten unterscheiden sich.

### Diagnosefall

Ein Telefon erhält eine IP-Adresse, zeigt aber falsche Uhrzeit und registriert sich nicht.

1. `ipconfig`/Gerätestatus: Adresse, Maske, Gateway und DHCP prüfen.
2. `ping` zum Gateway: lokale IP-Erreichbarkeit prüfen.
3. DNS-Auflösung des Call-Servers mit `nslookup` prüfen.
4. NTP-Erreichbarkeit und Zeit prüfen; Zertifikate können bei falscher Zeit scheitern.
5. Route/ACL/Firewall für Signalisierung prüfen.
6. SIP-Registrierung und Logs prüfen; danach RTP-Pfad separat testen.

> Der RTP-Verkehr wird priorisiert, weil Sprachpakete empfindlich auf Verzögerung und Jitter reagieren; die Prioritätsklasse wird begrenzt, damit übrige Dienste weiterhin Kapazität erhalten.

## 7. Typische Prüfungsfallen

- Bandbreite und Durchsatz gleichsetzen.
- hohe Bandbreite als Garantie für geringe Latenz darstellen.
- DSCP-Markierung als Ende-zu-Ende-Garantie bezeichnen.
- SIP und RTP verwechseln.
- Codec-Bitrate ohne Header und Layer-2-Overhead als Leitungsbedarf ausgeben.
- Hin- und Rückrichtung unklar addieren.
- Voice-VLAN als vollständige Sicherheitsmaßnahme behandeln.
- PoE-Leistung je Port prüfen, aber Gesamtbudget vergessen.
- TCP/UDP bei einer Portangabe weglassen.
- FTP und SFTP als Varianten desselben Protokolls behandeln.
- dynamische RTP-Ports als einen festen Port auswendig lernen.

## 8. Selbsttest

1. Grenze Latenz und Jitter ab.
2. Nenne fünf Schritte einer QoS-Einführung.
3. Ordne SIP, RTP und RTCP ihren Aufgaben zu.
4. Berechne IP-Bandbreite für 64 kbit/s Payload, 20-ms-Pakete und 40 Byte Header.
5. Nenne Dienste zu 53, 67/68, 123, 161/162, 445 und 3389.
6. Begründe, warum ein separates Voice-VLAN Verschlüsselung nicht ersetzt.

<details>
<summary>Lösungen anzeigen</summary>

1. Latenz ist die Verzögerung; Jitter deren Schwankung zwischen Paketen.
2. Klassifizieren, Vertrauensgrenze/Markierung, Queue/Scheduling, Shaping/Policing, Messen/Anpassen.
3. SIP signalisiert, RTP transportiert Medien, RTCP meldet Kontroll-/Qualitätsinformationen.
4. 50 Pakete/s, 160 Byte Payload; `(160+40)×8×50 = 80 kbit/s` je Richtung auf IP-Ebene.
5. DNS, DHCPv4, NTP, SNMP, SMB, RDP.
6. VLAN trennt logische Netze und Policies, schützt den Medieninhalt aber nicht kryptografisch vor berechtigtem oder kompromittiertem Netzzugriff.

</details>

## 9. Quellen und Abgleich

- RFC 2474 und RFC 4594 zu Differentiated Services und Serviceklassen.
- RFC 3261 zu SIP; RFC 3550 zu RTP/RTCP; RFC 3711 zu SRTP.
- IANA Service Name and Transport Protocol Port Number Registry.
- WBS-Kursinhalt QoS, VoIP und separate Netzwerkdienste; bestätigt am 11.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Welche DSCP-Klassen und VoIP-Codecs wurden bei WBS verlangt?
- Rechnet WBS VoIP-Bandbreite auf IP- oder Ethernet-Ebene?
- Welche Ports müssen auswendig genannt werden und welche stehen im Aufgabentext?
