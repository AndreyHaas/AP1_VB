---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# IPv4, DHCP und Default Gateway

## Private und besondere IPv4-Bereiche

| Bereich | Bedeutung |
|---|---|
| `10.0.0.0/8` | privat |
| `172.16.0.0/12` | privat (`172.16` bis `172.31`) |
| `192.168.0.0/16` | privat |
| `169.254.0.0/16` | Link-Local/APIPA |
| `127.0.0.0/8` | Loopback |

Private IPv4-Adressen werden im öffentlichen Internet nicht direkt geroutet.

## DHCP

DHCP liefert einem Client typischerweise:

```text
IPv4-Adresse
Subnetzmaske
Default Gateway
DNS-Server
Lease-Dauer
```

Der grundlegende Ablauf heißt `DORA`:

```text
Discover → Offer → Request → Acknowledge
```

Erhält ein Client eine Adresse `169.254.x.x`, konnte er häufig keine nutzbare DHCP-Konfiguration beziehen. Возможные причины: сервер недоступен, неверный VLAN, отсутствующий DHCP-Relay, исчерпанный Scope или проблема соединения.

## Default Gateway

Клиент сравнивает Ziel-IP со своей сетью:

- цель в той же подсети — отправляет напрямую;
- цель в другой подсети — отправляет через `Default Gateway`.

Gateway должен иметь допустимый Host-Adresse в той же подсети, что и интерфейс клиента. Netzadresse и Broadcastadresse назначать нельзя.

## DHCP über mehrere Netze

DHCP Discover ist zunächst ein Broadcast und wird von Routern normalerweise nicht weitergeleitet. Если DHCP-Server находится в другом VLAN/Subnetz, на Router или Layer-3-Switch используется `DHCP-Relay-Agent`.

## Fehlersuche

```text
Lokaler Server erreichbar, Internet nicht erreichbar:
→ zuerst IP-Konfiguration und Default Gateway prüfen

IP-Adressen erreichbar, Namen nicht erreichbar:
→ DNS-Konfiguration prüfen

169.254.x.x:
→ DHCP-Kommunikation und Scope prüfen
```

## IHK-Merksätze

> DHCP weist dem Client eine Netzwerkkonfiguration zu; NAT übernimmt diese Aufgabe nicht.

> Das Default Gateway leitet Pakete in andere Netze weiter.

## Selbsttest

Ein Client in VLAN 20 erhält `169.254.8.4`. Der zentrale DHCP-Server in VLAN 10 funktioniert für andere Clients. Nenne zwei wahrscheinliche Ursachen.

## Lösungen

> Auf dem Gateway des VLAN 20 könnte der DHCP-Relay-Agent fehlen oder falsch konfiguriert sein. Außerdem könnte auf dem DHCP-Server der Scope für das Subnetz des VLAN 20 fehlen oder ausgeschöpft sein.

## Offene Punkte / Korrekturen

- DHCP-Lease-Verlängerung (`T1/T2`) ist P2 und wird nur bei Bedarf ergänzt.
