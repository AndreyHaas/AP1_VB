---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# VLAN – Virtual Local Area Network

## Zweck

Ein VLAN teilt eine physische Switch-Infrastruktur in mehrere logische Layer-2-Netze. Jedes VLAN bildet eine eigene `Broadcast-Domäne`.

```text
VLAN 10 → Buchhaltung
VLAN 20 → Entwicklung
VLAN 30 → Gäste
```

Geräte unterschiedlicher VLANs kommunizieren nicht direkt auf Layer 2. Dafür ist `Inter-VLAN-Routing` über Router oder Layer-3-Switch erforderlich. Firewall-Regeln können dabei den Verkehr begrenzen.

## Access Port

Ein Access Port gehört im Normalfall zu genau einem VLAN und verbindet ein Endgerät. Frames werden zum Endgerät gewöhnlich `untagged` übertragen.

```text
PC → Access Port → VLAN 20
```

## Trunk Port

Ein Trunk transportiert mehrere VLANs zwischen Netzkomponenten. Ethernet-Frames werden typischerweise nach `IEEE 802.1Q` mit einer VLAN-ID gekennzeichnet (`tagged`).

```text
Switch 1 ⇄ Trunk ⇄ Switch 2
```

## Statische und dynamische Zuordnung

- `statisch/portbasiert`: Switchport ist fest einem VLAN zugeordnet.
- `dynamisch`: Zuordnung erfolgt beispielsweise anhand von Authentifizierung oder Gerätemerkmalen.

## DHCP über VLAN-Grenzen

Ist der DHCP-Server in einem anderen VLAN, wird auf dem Layer-3-Gateway ein `DHCP-Relay-Agent` benötigt.

## Beispiel: Zieladressen

```text
Client:          192.168.20.50/24
Default Gateway: 192.168.20.1
Server:          192.168.10.50/24
```

Im ersten Frame:

```text
Ziel-MAC = MAC-Adresse des Default Gateways
Ziel-IP  = 192.168.10.50
```

## IHK-Merksätze

> Ein Access Port transportiert normalerweise ein VLAN untagged; ein Trunk transportiert mehrere VLANs tagged.

> Für die Kommunikation zwischen VLANs ist Routing erforderlich.

## Typische Prüfungsfallen

- VLAN создаёт логическое разделение, но не автоматически политику доступа; её задают Routing/Firewall-Regeln.
- Gateway должен быть допустимым Host в подсети, не Netz- или Broadcastadresse.
- В `/27` сети `10.20.30.32–63` адрес `.63` является Broadcast; `.33` допустим как Gateway.

## Selbsttest

1. Welcher Porttyp verbindet zwei Switches und transportiert VLAN 10, 20 und 30?
2. Was wird für Verkehr zwischen VLAN 10 und VLAN 20 benötigt?
3. Warum erreicht ein DHCP-Broadcast aus VLAN 20 den Server in VLAN 10 nicht direkt?

## Lösungen

```text
1. Trunk Port mit IEEE 802.1Q
2. Inter-VLAN-Routing über Router oder Layer-3-Switch
3. Router leiten Broadcasts nicht automatisch weiter; ein DHCP-Relay wird benötigt.
```

## Offene Punkte / Korrekturen

- Native VLAN и безопасность VLAN-Hopping — P2/P3.
