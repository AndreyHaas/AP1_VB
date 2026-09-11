---
pruefung: AP1
thema: QoS, VoIP und Netzwerkdienste
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/08-qos-voip-und-netzwerkdienste-de.md
---

# QoS, VoIP und Netzwerkdienste

## 1. Lernziele

После изучения главы нужно уметь:

- различать Bandbreite, Durchsatz, Latenz, Jitter и Paketverlust;
- объяснять шаги и границы QoS;
- понимать SIP, RTP, RTCP и VoIP-Codecs;
- оценивать Bandbreite речи с Overhead;
- обосновывать Voice-VLAN, PoE и Sicherheitsmaßnahmen;
- связывать Netzwerkdienste с Protokolle и типичными Ports;
- диагностировать Dienst по Name, Transport, Port и Zweck.

## 2. Prüfungsminimum — 15 Minuten

1. Bandbreite — доступная ёмкость; Durchsatz — реально передаваемая скорость.
2. Latenz — задержка; Jitter — колебание времени доставки; Verlust — отсутствующие пакеты.
3. QoS классифицирует, маркирует, ставит в очереди и регулирует трафик; новой Bandbreite он не создаёт.
4. DSCP помечает желаемую обработку в IP-Header; каждая Netzgrenze должна доверять и обрабатывать метку.
5. SIP сигнализирует Sitzung; RTP обычно несёт Medien; RTCP передаёт контрольную информацию.
6. Sprachbandbreite включает Codec-Nutzdaten и Paket-, Transport-, IP-, Layer-2-Overhead.
7. Voice-VLAN разделяет Broadcast-Domänen и Policies, но не заменяет Verschlüsselung/Zugriffskontrolle.
8. Проверяются PoE-Budget Switch и Leistung каждого Port.
9. Portnummer не доказывает Dienst: нужны Transportprotokoll и реальная Konfiguration.
10. Небезопасные Klartextdienste Telnet/FTP по возможности заменяются SSH/SFTP или защищёнными методами.

## 3. Qualitätsgrößen и QoS

| Größe | Bedeutung | Wirkung auf VoIP |
|---|---|---|
| Bandbreite | возможная ёмкость | нехватка создаёт Warteschlangen |
| Durchsatz | реально полезная скорость | определяет объём Medien |
| Latenz | Ende-zu-Ende-Verzögerung | собеседники перебивают друг друга |
| Jitter | колебание Laufzeit | неравномерное воспроизведение |
| Paketverlust | отсутствующие Pakete | выпадения и потеря качества |
| Verfügbarkeit | доступное время | Erreichbarkeit сервиса |

Типичный QoS-Ablauf:

1. Идентифицировать и классифицировать Verkehr.
2. Определить Vertrauensgrenze и Markierung.
3. Настроить Warteschlangen и Scheduling.
4. При необходимости применить `Shaping` или `Policing`.
5. Измерять Ende-zu-Ende, документировать, улучшать.

`Priority Queuing` предпочитает чувствительную речь. Prioritätsklasse ограничивается и контролируется, чтобы другой трафик не был вытеснен.

## 4. DSCP, VLAN и Netzgrenzen

DSCP использует шесть Bits в Differentiated-Services-Feld IP-Headers и указывает Per-Hop Behaviour. Это не гарантия: Switches, Router, WAN-Provider и Tunnel должны обработать метку.

Voice-VLAN даёт собственную Adressierung, Broadcast-Domäne, ACLs и QoS-Policy. Нужны sichere Switchport-Konfiguration, DHCP/DNS/NTP, доступ к Call-Server и Monitoring.

Для IP-Telefone проверяют:

- PoE-Standard, Leistung каждого телефона и Gesamtbudget;
- Voice-/Data-VLAN на Anschluss;
- LLDP/LLDP-MED или другой разрешённый механизм;
- QoS-Vertrauensgrenze, без слепого доверия Endgerät;
- отказ Switch, Call-Server, WAN и Strom.

## 5. VoIP и Bandbreitenrechnung

| Baustein | Aufgabe |
|---|---|
| SIP | Aufbau, Änderung, Abbau Sitzung |
| SDP | параметры Medien внутри Signalisierung |
| RTP | транспорт Audio-/Videodaten |
| RTCP | Qualitäts- и Teilnehmerinformationen |
| Codec | преобразует/сжимает Audio/Video |
| SRTP | криптографически защищает RTP-Medien |

### G.711-Beispiel

G.711 создаёт `64 kbit/s` Audio-Nutzdaten. При 20 ms Paketierungszeit:

```text
Pakete je Sekunde = 1 / 0,020 s = 50
Payload je Paket = 64 000 bit/s × 0,020 s / 8 = 160 Byte
IPv4 + UDP + RTP = 20 + 8 + 12 = 40 Byte
IP-Ebene je Richtung = (160 + 40) Byte × 8 × 50
= 80 000 bit/s = 80 kbit/s
```

Добавляются Layer-2-Overhead, Tunnel, Sicherheitsheader и Reserve. Для разговора нужна ёмкость в обе стороны; в задаче направления могут указываться отдельно или суммарно.

## 6. Netzwerkdienste и Anwendungsfall

| Dienst | Zweck | typischer Transport/Port |
|---|---|---|
| DNS | Namensauflösung | UDP/TCP 53 |
| DHCPv4 | Adresskonfiguration | UDP 67/68 |
| HTTP / HTTPS | Web | TCP 80 / TCP 443; HTTP/3 обычно UDP 443 |
| SSH / SFTP | sichere Administration/Dateiübertragung | TCP 22 |
| FTP | отдельные Steuer-/Datenverbindung, обычно без защиты | TCP 21 плюс Datenverbindung |
| SMTP | Mailtransport/Submission | TCP 25 / 587; 465 implizites TLS |
| IMAP | Mailboxzugriff | TCP 143 / 993 TLS |
| POP3 | Mailabruf | TCP 110 / 995 TLS |
| NTP | Zeitsynchronisation | UDP 123 |
| SNMP | Monitoring/Traps | UDP 161/162 |
| LDAP / LDAPS | Verzeichnisdienst | TCP/UDP 389 / TCP 636 |
| SMB | Dateifreigabe | TCP 445 |
| NFS | Netzwerkdateisystem | обычно TCP/UDP 2049 |
| RDP | Remote Desktop | TCP/UDP 3389 |
| SIP | VoIP-Signalisierung | часто 5060, TLS часто 5061 |
| RTP | Medienstrom | согласованные динамические UDP-Ports |
| Syslog | Protokollversand | часто UDP/TCP 514, TLS TCP 6514 |

Ports — стандартные Zuordnungen, но не закон природы. Приложения используют другие Ports, Firewall делает NAT, verschlüsselte Varianten отличаются.

### Diagnosefall

Telefon получает IP-Adresse, но показывает неправильное время и не регистрируется.

1. `ipconfig`/Gerätestatus: Adresse, Maske, Gateway, DHCP.
2. `ping` Gateway: локальная IP-Erreichbarkeit.
3. `nslookup` Call-Server: DNS-Auflösung.
4. Проверить NTP и время; Zertifikate могут отказать при неверном времени.
5. Проверить Route/ACL/Firewall для Signalisierung.
6. Проверить SIP-Registrierung/Logs, затем отдельно RTP-Pfad.

> Der RTP-Verkehr wird priorisiert, weil Sprachpakete empfindlich auf Verzögerung und Jitter reagieren; die Prioritätsklasse wird begrenzt, damit übrige Dienste weiterhin Kapazität erhalten.

## 7. Typische Prüfungsfallen

- приравнивать Bandbreite и Durchsatz;
- считать высокую Bandbreite гарантией малой Latenz;
- считать DSCP Ende-zu-Ende-Garantie;
- путать SIP и RTP;
- выдавать Codec-Bitrate без Header/Layer-2 за Leitungsbedarf;
- неясно складывать направления;
- считать Voice-VLAN полной Sicherheit;
- проверять PoE je Port, но забывать Gesamtbudget;
- не указывать TCP/UDP с Port;
- считать FTP и SFTP вариантами одного протокола;
- учить один фиксированный RTP-Port.

## 8. Selbsttest

1. Различи Latenz и Jitter.
2. Назови пять шагов QoS-Einführung.
3. Свяжи SIP, RTP, RTCP с задачами.
4. Рассчитай IP-Bandbreite: 64 kbit/s Payload, 20-ms-Pakete, 40 Byte Header.
5. Назови Dienste на 53, 67/68, 123, 161/162, 445, 3389.
6. Почему Voice-VLAN не заменяет Verschlüsselung?

<details>
<summary>Lösungen anzeigen</summary>

1. Latenz — задержка; Jitter — её колебание между пакетами.
2. Klassifizieren, Vertrauensgrenze/Markierung, Queue/Scheduling, Shaping/Policing, Messen/Anpassen.
3. SIP сигнализирует, RTP несёт Medien, RTCP — контроль/качество.
4. 50 Pakete/s, 160 Byte Payload; `(160+40)×8×50 = 80 kbit/s` в направлении на IP-Ebene.
5. DNS, DHCPv4, NTP, SNMP, SMB, RDP.
6. VLAN разделяет сети/Policies, но не защищает Medieninhalt криптографически.

</details>

## 9. Quellen und Abgleich

- RFC 2474 и RFC 4594: Differentiated Services и Serviceklassen.
- RFC 3261: SIP; RFC 3550: RTP/RTCP; RFC 3711: SRTP.
- IANA Service Name and Transport Protocol Port Number Registry.
- WBS-Kursinhalt QoS, VoIP и отдельные Netzwerkdienste; подтверждено 11.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Какие DSCP-Klassen и VoIP-Codecs требовал WBS?
- Считает ли WBS Bandbreite на IP- или Ethernet-Ebene?
- Какие Ports надо знать наизусть, а какие даются в задаче?
