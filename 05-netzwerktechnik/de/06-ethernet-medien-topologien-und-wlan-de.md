---
pruefung: AP1
thema: Netzwerktechnik
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Deutsch
gegenstueck: ../ru/06-ethernet-medien-topologien-und-wlan-ru.md
---

# Ethernet, Medien, Topologien und WLAN

## 1. Lernziele

Nach dieser Einheit kannst du:

- Ethernet, WLAN, MAC-Adresse, Switch und Access Point einordnen;
- Kupfer, Lichtwellenleiter und Funk nach Reichweite, Störfestigkeit, Kosten und Einsatz auswählen;
- Stern-, Bus-, Ring- und Mesh-Topologien vergleichen;
- Brutto- und Nettodatenrate sowie Duplexbetrieb unterscheiden;
- ein kleines LAN/WLAN planen und typische Fehler systematisch eingrenzen;
- eine Medien- oder Sicherheitsentscheidung auf Deutsch begründen.

## 2. Prüfungsminimum — 15 Minuten

1. Ethernet und WLAN arbeiten im lokalen Netz überwiegend auf OSI-Layer 1 und 2.
2. Ein Switch leitet Frames anhand seiner MAC-Adresstabelle weiter.
3. Unicast richtet sich an einen Empfänger, Broadcast an alle Geräte der Broadcast-Domäne.
4. Kupfer ist günstig und kann PoE übertragen; LWL ist reichweitenstark und unempfindlich gegen elektromagnetische Störungen.
5. Moderne geswitchte Ethernet-LANs sind meist physisch sternförmig.
6. WLAN ist ein geteiltes Funkmedium; Reichweite, Störungen, Kanalbelegung und Sicherheit beeinflussen die Nutzleistung.
7. Bruttodatenrate ist nicht gleich tatsächlich nutzbarer Datendurchsatz.
8. Für Unternehmenszugänge sind individuelle Anmeldedaten über WPA2/WPA3-Enterprise und 802.1X einem gemeinsamen PSK vorzuziehen.
9. Ein MAC-Filter ist keine starke Authentisierung.
10. Diagnose: erst Link/Funk, dann VLAN/IP, danach Dienste prüfen.

Musterantwort:

> Für die Verbindung zwischen zwei Gebäuden wird Lichtwellenleiter gewählt, weil er große Entfernungen unterstützt, gegen elektromagnetische Störungen unempfindlich ist und keine elektrische Potentialdifferenz überträgt.

## 3. Grundlagen

### 3.1 Ethernet-Frame und MAC-Adresse

Ethernet ist eine Familie von LAN-Techniken nach IEEE 802.3. Auf Layer 2 werden Daten als `Frames` übertragen. Ein Frame enthält unter anderem Ziel- und Quell-MAC-Adresse, Typ-/Längeninformation, Nutzdaten und eine Fehlerprüfinformation.

Eine MAC-Adresse kennzeichnet eine Netzwerkschnittstelle innerhalb des lokalen Layer-2-Bereichs. Sie ersetzt keine IP-Adresse: MAC-Adressen dienen der lokalen Zustellung, IP-Adressen der Kommunikation über Netzgrenzen.

### 3.2 Wie ein Switch lernt

Ein Switch liest die Quell-MAC-Adresse eingehender Frames und merkt sich den zugehörigen Port.

| Situation | Reaktion des Switches |
|---|---|
| Ziel-MAC bekannt | Weiterleitung nur zum gelernten Port |
| Ziel-MAC unbekannt | Flooding an alle geeigneten Ports außer Eingangsport |
| Broadcast | Flooding innerhalb der Broadcast-Domäne |
| Ziel am Eingangsport gelernt | Frame wird nicht an andere Ports weitergegeben |

Die Einträge altern aus. Ein Switch ist deshalb kein dauerhaftes Verzeichnis aller Geräte.

### 3.3 Unicast, Broadcast und Multicast

- `Unicast`: ein Sender zu einem Empfänger;
- `Broadcast`: ein Sender zu allen Teilnehmern derselben Broadcast-Domäne;
- `Multicast`: ein Sender zu einer interessierten Empfängergruppe.

Router leiten Layer-2-Broadcasts normalerweise nicht in andere Netze weiter. VLANs teilen eine Switch-Infrastruktur in getrennte Broadcast-Domänen.

### 3.4 Duplex und Kollisionen

Bei `Full Duplex` können beide Endpunkte gleichzeitig senden und empfangen. Moderne Switchverbindungen arbeiten typischerweise so; klassische Ethernet-Kollisionen treten dort nicht auf.

Bei `Half Duplex` teilen sich Teilnehmer die Übertragungsrichtung zeitlich. Ein Duplex-Mismatch kann niedrigen Durchsatz und Fehler verursachen. Geschwindigkeit und Duplex werden meist automatisch ausgehandelt, müssen aber auf beiden Seiten zueinander passen.

## 4. Medien, Topologien und WLAN

### 4.1 Medienvergleich

| Kriterium | Twisted-Pair-Kupfer | LWL | WLAN |
|---|---|---|---|
| Signal | elektrisch | optisch | Funk |
| typische Stärke | günstig, einfach, PoE | Reichweite, Datenrate, Störfestigkeit | Mobilität, flexible Installation |
| typische Grenze | Dämpfung und EM-Störungen | höhere Montage-/Modulkosten | geteiltes Medium, Störungen, Abschattung |
| elektrisches Potential | kann relevant sein | galvanisch getrennt | keine Leitung zwischen Endpunkten |
| Einsatz | Arbeitsplatz, Access Point | Backbone, Gebäude, Rechenzentrum | mobile Clients, schwer verkabelbare Bereiche |

Bei klassischem Ethernet über strukturierte Kupferverkabelung werden häufig maximal 100 m pro Kanal geplant. Die genaue Grenze hängt vom Ethernet-Verfahren, Kabeltyp und Standard ab. LWL-Auswahl verlangt passende Faser (`Multimode` oder `Singlemode`), Wellenlänge, Transceiver und Stecker.

### 4.2 PoE

`Power over Ethernet` überträgt Daten und elektrische Leistung über dieselbe Verkabelung, etwa zu Access Points, VoIP-Telefonen oder Kameras. Zu prüfen sind:

- PoE-Standard und Leistungsklasse;
- Bedarf des Endgeräts;
- Gesamtleistungsbudget des Switches;
- Kabellänge, Qualität und Wärmeentwicklung im Kabelbündel.

Ein vorhandener RJ45-Anschluss beweist nicht, dass Gerät und Switch dieselbe PoE-Leistung unterstützen.

### 4.3 Topologien

| Topologie | Merkmal | Vorteil | Nachteil |
|---|---|---|---|
| Stern | Endgeräte am zentralen Switch | gut erweiterbar und diagnostizierbar | Switch ist zentraler Ausfallpunkt |
| Bus | gemeinsames lineares Medium | geringer historischer Verkabelungsaufwand | Fehler und Kollisionen schwer einzugrenzen |
| Ring | Knoten ringförmig verbunden | definierter Weg; Redundanz je nach Technik | Unterbrechung kann ohne Schutzmechanismus stören |
| Mesh | mehrere Wege zwischen Knoten | hohe Ausfallsicherheit | Kosten und Planungskomplexität |

Physische und logische Topologie können verschieden sein. Ein WLAN mit zentralem Access Point wirkt logisch wie ein gemeinsames Funkmedium, obwohl der AP per Kabel sternförmig angebunden ist.

### 4.4 WLAN-Grundlagen

Ein Access Point verbindet WLAN-Clients meist als Layer-2-Bridge mit dem LAN. Alle Geräte eines Funkkanals teilen sich Airtime. Deshalb ist eine hohe ausgehandelte Datenrate nicht gleich garantierter Nutzdatenrate.

Leistung beeinflussen unter anderem:

- Entfernung, Wände und Metall;
- Störer und benachbarte WLANs;
- Kanalbreite und Kanalbelegung;
- Zahl und Aktivität der Clients;
- Fähigkeiten von Client und Access Point;
- Protokoll-Overhead und Retransmissions.

`SSID` ist der Netzname, keine Sicherheitsfunktion. Gleiche SSID und passende Sicherheitsparameter können Roaming ermöglichen, garantieren aber keinen störungsfreien Übergang.

### 4.5 WLAN-Sicherheit

| Verfahren | Einordnung |
|---|---|
| WEP | veraltet und unsicher |
| WPA/TKIP | veraltet |
| WPA2 mit AES/CCMP | weiterhin verbreitet; sichere Konfiguration nötig |
| WPA3-Personal mit SAE | moderner Schutz für Personal-Netze |
| Enterprise mit 802.1X/RADIUS | individuelle Identitäten und zentrale Prüfung |

Ein gemeinsamer PSK ist in kleinen Umgebungen einfach, aber schwer personenbezogen zu sperren. WPS kann zusätzliche Angriffsfläche erzeugen. MAC-Adressen sind beobachtbar und fälschbar; ein MAC-Filter ersetzt keine Verschlüsselung und Authentisierung.

## 5. Anwendungsfall: neues Büro

Ein Unternehmen richtet 24 Arbeitsplätze, vier Access Points und eine 300-m-Verbindung zu einer Werkhalle ein.

### 5.1 Auswahl

- Arbeitsplätze: strukturierte Kupferverkabelung zum Etagen-Switch;
- Access Points: geeignete Kupferleitungen mit PoE, sofern Leistung und Budget reichen;
- Werkhalle: LWL wegen Entfernung, EM-Störungen und galvanischer Trennung;
- WLAN: getrennte Mitarbeiter- und Gastzugänge, sichere Authentisierung, Kanal- und Ausleuchtungsplanung.

### 5.2 Durchsatz bewerten

Ein Access Point zeigt `1.200 Mbit/s` Bruttodatenrate. Eine 600-MB-Datei wird in 12 s übertragen.

```text
600 MB × 8 = 4.800 Mbit
4.800 Mbit / 12 s = 400 Mbit/s Nettodurchsatz
Nutzungsgrad = 400 / 1.200 × 100 % = 33,3 %
```

Das Ergebnis beweist keinen Fehler. Funkzugriff, Protokoll-Overhead, Gegenstelle und andere Clients reduzieren die Nutzrate.

### 5.3 Diagnosefolge

1. Link-LED, Kabel, Transceiver beziehungsweise WLAN-Assoziation prüfen.
2. Geschwindigkeit, Duplex, Signalstärke, Kanal und Fehlerzähler prüfen.
3. VLAN und IP-Konfiguration prüfen.
4. Gateway, DNS und Zielerreichbarkeit testen.
5. Messergebnis mit Gegenstelle und erwarteter Last dokumentieren.

## 6. Prüfungsformulierungen

> Ein Switch lernt die Zuordnung von MAC-Adressen zu Ports aus den Quelladressen eingehender Frames und leitet bekannte Unicasts dadurch gezielt weiter.

> Die physische Sternstruktur wird gewählt, weil einzelne Leitungsfehler normalerweise nur einen Arbeitsplatz betreffen und Fehler am zentralen Switch gut eingegrenzt werden können.

> WPA2/WPA3-Enterprise ist für Mitarbeiterkonten geeignet, da Benutzer individuell authentisiert und Zugänge einzeln gesperrt werden können.

> Die angegebene WLAN-Bruttodatenrate darf nicht als garantierter Nutzdurchsatz verwendet werden, weil Protokoll-Overhead, geteilte Airtime und Funkbedingungen die Nutzrate reduzieren.

## 7. Typische Prüfungsfallen

- MAC-Adresse und IP-Adresse nicht gleichsetzen.
- Switch trennt Kollisionsdomänen, aber ohne VLAN nicht automatisch Broadcast-Domänen.
- `1 Gbit/s` bedeutet nicht `1 GB/s`; acht Bit ergeben ein Byte.
- RJ45 beschreibt den Steckverbinder nicht die garantierte Geschwindigkeit oder PoE-Leistung.
- LWL ist nicht automatisch schneller; Endgeräte und Transceiver bestimmen das konkrete Verfahren.
- Starke Signalstärke beweist keinen störungsfreien Kanal.
- Mehr Kanalbreite kann in dichter Umgebung den Gesamtdurchsatz verschlechtern.
- MAC-Filter und versteckte SSID sind kein Ersatz für WPA2/WPA3.
- Ein Access Point ist nicht automatisch Router, DHCP-Server und Firewall.
- Ein Ping-Erfolg beweist nicht den Durchsatz einer Anwendung.

## 8. Selbsttest

1. Welche Aufgabe erfüllt die MAC-Adresse im Ethernet-LAN?
2. Was macht ein Switch bei unbekannter Ziel-MAC?
3. Nenne je zwei Vorteile von Kupfer und LWL.
4. Warum liegt WLAN-Nettodurchsatz unter der Bruttodatenrate?
5. Wähle ein Medium für 500 m zwischen Gebäuden und begründe.
6. Ein Link handelt auf einer Seite Full Duplex, auf der anderen Half Duplex aus. Welche Folgen sind möglich?
7. 750 MB werden in 20 s übertragen. Berechne den Nettodurchsatz in Mbit/s.
8. Warum ist ein gemeinsamer PSK für 200 Beschäftigte ungünstig?
9. Entwirf eine kurze Diagnosefolge für „WLAN verbunden, Intranet nicht erreichbar“.
10. Bewerte: „Der MAC-Filter schützt das WLAN ausreichend.“

<details>
<summary>Lösungen anzeigen</summary>

1. Sie dient der lokalen Zustellung eines Frames an eine Netzwerkschnittstelle.
2. Er flutet den Frame an geeignete Ports derselben Broadcast-Domäne, außer dem Eingangsport.
3. Kupfer: günstig und PoE-fähig. LWL: große Reichweite und EM-Störfestigkeit.
4. Wegen Protokoll-Overhead, geteilter Airtime, Störungen und Wiederholungen.
5. LWL, da 500 m die typische Kupferkanallänge überschreiten und LWL Gebäude galvanisch trennt.
6. Durchsatzprobleme und Fehler; beide Seiten müssen kompatibel konfiguriert sein.
7. `750 MB × 8 / 20 s = 300 Mbit/s`.
8. Keine individuelle Sperrung, schwieriger sicherer Wechsel und breite Offenlegung des Schlüssels.
9. Assoziation/Signal → VLAN/IP → Gateway → DNS/Zieldienst → Firewall.
10. Falsch: MAC-Adressen können beobachtet und nachgeahmt werden; Verschlüsselung und starke Authentisierung fehlen.

</details>

## 9. Quellen und Abgleich

- [IEEE 802.3](https://standards.ieee.org/ieee/802.3/10422/) — Ethernet-Familie; konkrete PHY-Varianten müssen passend ausgewählt werden.
- [IEEE 802.11](https://standards.ieee.org/ieee/802.11/10548/) — WLAN-Grundstandard; Produktangaben immer gegen unterstützte Amendments prüfen.
- [Wi-Fi Alliance: Security](https://www.wi-fi.org/discover-wi-fi/security) — WPA2/WPA3-Einordnung.
- Abgleich mit dem Projektmaterial zu OSI, Datenweg und Übertragungszeiten; Stand 10.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Welche Ethernet- und WLAN-Geschwindigkeiten verlangt der konkrete WBS-Aufgabensatz auswendig?
- Werden PoE-Leistungsklassen oder nur das Grundprinzip geprüft?
- Welche WLAN-Kanalplanung wird im Unterricht als Prüfungsminimum erwartet?
