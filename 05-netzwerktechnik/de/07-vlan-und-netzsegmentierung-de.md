---
pruefung: AP1
thema: Netzwerktechnik
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Deutsch
gegenstueck: ../ru/07-vlan-und-netzsegmentierung-ru.md
---

# VLAN und Netzsegmentierung

## 1. Lernziele

Du kannst:

- VLAN, Broadcast-Domäne, Access Port und Trunk erklären;
- tagged und untagged Frames unterscheiden;
- VLANs passenden IP-Subnetzen und Gateways zuordnen;
- Inter-VLAN-Routing und DHCP-Relay begründen;
- einen kleinen VLAN-Plan lesen, Fehler finden und Sicherheitsgrenzen bewerten.

## 2. Prüfungsminimum — 15 Minuten

1. Ein VLAN bildet eine logische Broadcast-Domäne auf Layer 2.
2. Ein Access Port verbindet meist ein Endgerät mit genau einem VLAN; Frames zum Endgerät sind gewöhnlich untagged.
3. Ein Trunk transportiert mehrere VLANs; die Zuordnung wird typischerweise mit IEEE 802.1Q markiert.
4. Geräte in verschiedenen VLANs benötigen einen Router oder Layer-3-Switch.
5. Für jedes IP-Subnetz wird ein passendes Layer-3-Gateway benötigt.
6. Ein DHCP-Broadcast überschreitet die Routergrenze nicht ohne DHCP-Relay.
7. VLAN-Segmentierung reduziert Broadcast-Verkehr, ersetzt aber keine Firewallpolicy.
8. VLAN-ID, Portzuordnung, Trunk-Liste, Subnetz, Gateway und DHCP-Scope müssen zusammenpassen.

> Für die Kommunikation zwischen VLAN 10 und VLAN 20 ist Inter-VLAN-Routing erforderlich, weil beide VLANs getrennte Layer-2-Broadcast-Domänen bilden.

## 3. Grundlagen

### 3.1 Zweck eines VLAN

Ein `Virtual Local Area Network` teilt eine physische Switch-Infrastruktur in logische Netze.

```text
VLAN 10  Verwaltung   10.10.10.0/24
VLAN 20  Entwicklung  10.10.20.0/24
VLAN 30  Gäste        10.10.30.0/24
```

Vorteile:

- Broadcasts bleiben im jeweiligen VLAN;
- Abteilungen oder Gerätetypen können logisch getrennt werden;
- Umzüge benötigen nicht zwingend neue physische Switches;
- Regeln zwischen Segmenten können am Layer-3-Übergang kontrolliert werden.

Ein VLAN ist keine Verschlüsselung. Wer Zugriff auf falsch konfigurierte Switchports besitzt, wird nicht allein durch die VLAN-Nummer vertrauenswürdig.

### 3.2 Access und Trunk

| Porttyp | Typischer Zweck | VLANs | Frames auf der Leitung |
|---|---|---:|---|
| Access | Endgerät | meist 1 | gewöhnlich untagged |
| Trunk | Switch–Switch, Switch–Router, Switch–AP | mehrere | typischerweise 802.1Q-tagged |

Ein 802.1Q-Tag enthält unter anderem eine VLAN-ID. Sie hat 12 Bit; nicht alle rechnerisch möglichen Werte stehen normalen Benutzer-VLANs zur Verfügung. Für AP1 ist die korrekte Zuordnung wichtiger als das Auswendiglernen reservierter IDs.

### 3.3 Native VLAN und untagged Verkehr

Auf manchen Trunks wird ein VLAN untagged als `Native VLAN` übertragen. Das Verhalten ist konfigurations- und herstellerabhängig. Beide Seiten müssen konsistent sein. Unnötige Native-VLAN-Nutzung und ungenutzte Ports erhöhen Fehlkonfigurations- und Angriffsrisiken.

### 3.4 VLAN und Subnetz

In einfachen Prüfungsfällen entspricht einem VLAN ein IP-Subnetz. Das ist eine saubere Planung, aber VLAN und IP-Subnetz sind verschiedene Konzepte:

- VLAN: Layer-2-Zuordnung und Broadcast-Domäne;
- IP-Subnetz: Layer-3-Adressbereich und Routinggrenze.

Mehrere IP-Subnetze in einem VLAN oder ein Subnetz über mehrere Layer-2-Bereiche sind technisch möglich, aber für kleine Netze oft unnötig komplex.

## 4. Vertiefung und Zusammenhänge

### 4.1 Inter-VLAN-Routing

Für Verkehr zwischen VLANs übernimmt ein Router oder Layer-3-Switch die Weiterleitung. Varianten:

- je VLAN ein physisches Routerinterface;
- `Router-on-a-Stick` mit 802.1Q-Subinterfaces auf einem Trunk;
- Switch Virtual Interfaces (`SVI`) auf einem Layer-3-Switch.

Der Client sendet ein Paket zu einem anderen Subnetz an die MAC-Adresse seines Default Gateways. Die Ziel-IP des Servers bleibt im Paket erhalten; der Router erstellt für den nächsten Abschnitt einen neuen Layer-2-Frame.

### 4.2 DHCP über VLAN-Grenzen

DHCP Discover beginnt als Broadcast. Steht der Server in einem anderen VLAN, nimmt ein `DHCP-Relay-Agent` die Nachricht am Gateway entgegen und leitet sie zum Server. Der Server benötigt einen Scope für das Client-Subnetz.

Bei „VLAN 10 erhält Adressen, VLAN 20 nur APIPA“ prüft man:

1. Access-Port-Zuordnung des Clients;
2. VLAN auf dem Trunk erlaubt;
3. Layer-3-Interface und Relay für VLAN 20;
4. DHCP-Scope und freie Leases;
5. Filter für DHCP-Verkehr.

### 4.3 Segmentierung und Sicherheit

VLANs schaffen Zonen, aber die Zugriffsentscheidung entsteht durch Routing-, ACL- oder Firewallregeln. Ein Gast-VLAN sollte beispielsweise nicht allein deshalb als sicher gelten, weil es `VLAN 30` heißt.

Sinnvolle Maßnahmen:

- ungenutzte Ports deaktivieren und einem ungenutzten VLAN zuordnen;
- Trunks nur dort konfigurieren, wo mehrere VLANs nötig sind;
- erlaubte VLAN-Liste begrenzen;
- Managementzugriff in ein separates, geschütztes Segment legen;
- Inter-VLAN-Verkehr nach Default Deny freigeben;
- Konfiguration und Portbelegung dokumentieren.

## 5. Anwendungsfall: drei Abteilungen

Gegeben:

```text
VLAN 10 Verwaltung    192.168.10.0/26  Gateway 192.168.10.1
VLAN 20 Entwicklung   192.168.20.0/25  Gateway 192.168.20.1
VLAN 30 Gäste         192.168.30.0/27  Gateway 192.168.30.1
DHCP-Server            192.168.10.10
```

Anforderungen:

- Verwaltung darf den Druckserver `192.168.20.20:631/TCP` nutzen;
- Gäste dürfen nur ins Internet;
- DHCP soll zentral arbeiten.

Lösungsskizze:

1. Clientports als Access Ports dem passenden VLAN zuordnen.
2. Uplink als Trunk mit VLAN 10, 20 und 30 konfigurieren.
3. je VLAN ein Layer-3-Interface mit der Gatewayadresse einrichten.
4. Relay auf VLAN 20 und 30 zum DHCP-Server konfigurieren.
5. einen Scope für jedes Subnetz anlegen.
6. Verwaltung → Druckserver gezielt erlauben.
7. Gäste → interne Netze blockieren, benötigte Internetverbindungen erlauben.
8. Regeln, Ports, VLANs und Tests protokollieren.

Frame des Verwaltungsclients zum Druckserver:

```text
Ziel-IP  = 192.168.20.20
Ziel-MAC = MAC des Gateways 192.168.10.1
```

Die Ziel-MAC ist nicht die MAC des entfernten Servers, weil er in einem anderen Subnetz liegt.

## 6. Prüfungsformulierungen

> Ein Access Port wird für ein Endgerät verwendet und gehört normalerweise zu genau einem VLAN, während ein Trunk mehrere VLANs mit IEEE-802.1Q-Tags transportiert.

> Das Gastnetz wird in einem eigenen VLAN und Subnetz betrieben, damit Broadcasts getrennt bleiben und der Übergang zu internen Netzen durch Firewallregeln kontrolliert werden kann.

> Auf dem Gateway von VLAN 20 ist ein DHCP-Relay erforderlich, da Router den ursprünglichen DHCP-Broadcast nicht automatisch zum Server in VLAN 10 weiterleiten.

> Die VLAN-Segmentierung allein ist keine vollständige Zugriffskontrolle, weil ohne Layer-3-Regeln grundsätzlich gerouteter Verkehr zwischen den Segmenten möglich sein kann.

## 7. Typische Prüfungsfallen

- Access Port nicht mit einem einzelnen physischen Gerät als Definition verwechseln; Sonderfälle existieren.
- Trunk bedeutet nicht „schneller“, sondern „mehrere VLAN-Zuordnungen“.
- VLAN-ID ist keine IP-Netznummer.
- Unterschiedliche VLANs kommunizieren nicht direkt auf Layer 2.
- DHCP-Relay und DHCP-Server-Scope sind beide erforderlich.
- Bei einem entfernten Ziel steht im ersten Frame die Gateway-MAC, nicht die Server-MAC.
- VLAN trennt Broadcasts, verschlüsselt aber keine Nutzdaten.
- `Default VLAN` und `Native VLAN` sind nicht automatisch dasselbe Konzept.
- Ein erlaubtes VLAN auf Switch A genügt nicht, wenn es am Trunk von Switch B fehlt.
- Dynamische VLAN-Zuordnung setzt eine vertrauenswürdige Authentisierung und korrekte Fallback-Regeln voraus.

## 8. Selbsttest

1. Was ist eine Broadcast-Domäne?
2. Unterscheide Access Port und Trunk.
3. Warum braucht Verkehr zwischen VLANs ein Layer-3-Gerät?
4. Welche zwei Komponenten braucht DHCP für Clients in einem anderen VLAN?
5. Ein PC in VLAN 20 erreicht keinen zweiten PC am selben Switch, der versehentlich VLAN 10 zugeordnet ist. Begründe.
6. Nenne vier Prüfpunkte, wenn nur VLAN 30 kein DHCP erhält.
7. Welcher Ziel-MAC steht im ersten Frame von `192.168.10.50` zu `192.168.20.20`?
8. Entwirf die minimale Segmentierung für Mitarbeiter, Gäste und Management.
9. Bewerte: „VLAN 30 ist sicher, weil Gäste dort keine Mitarbeiter sehen.“
10. Warum sollte die Liste erlaubter VLANs auf einem Trunk begrenzt werden?

<details>
<summary>Lösungen anzeigen</summary>

1. Ein Layer-2-Bereich, in dem ein Broadcast alle Teilnehmer erreicht.
2. Access: meist ein VLAN untagged zum Endgerät. Trunk: mehrere VLANs typischerweise tagged.
3. VLANs sind getrennte Layer-2-Netze; Weiterleitung zwischen IP-Netzen ist Routing.
4. DHCP-Relay am Gateway und ein passender Scope am Server.
5. Die Geräte befinden sich in verschiedenen Broadcast-Domänen und benötigen Routing.
6. Clientport, Trunk, SVI/Gateway, Relay, Scope und Filter; vier davon genügen.
7. Die MAC-Adresse des Gateways im VLAN 10.
8. Drei VLANs/Subnetze, Inter-VLAN-Routing und Default-Deny-Regeln; Management nur für Administratoren.
9. Unvollständig: Sicherheit entsteht erst durch korrekte Port-, Routing- und Firewallkonfiguration.
10. Damit unnötige VLANs nicht über den Link erreichbar werden und Fehlkonfigurationen begrenzt bleiben.

</details>

## 9. Quellen und Abgleich

- [IEEE 802.1Q-2022](https://standards.ieee.org/ieee/802.1Q/10323/) — Bridges, Bridged Networks und VLAN-Funktionen.
- [RFC 2131](https://datatracker.ietf.org/doc/html/rfc2131/) — DHCP und Relay-Verarbeitung.
- Projektkapitel zu IPv4, DHCP und Routing; Stand 10.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Werden reservierte VLAN-IDs oder nur Access/Trunk/Tagging verlangt?
- Muss Router-on-a-Stick konfiguriert oder nur erklärt werden?
- Welche Switch-Hardening-Befehle sind produktabhängig im WBS-Unterricht relevant?
