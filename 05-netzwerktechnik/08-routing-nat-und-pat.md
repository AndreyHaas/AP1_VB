---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Routing, NAT und PAT

## Routingtabelle

Ein Router wählt den Weg anhand seiner Routingtabelle. Typische Angaben:

```text
Zielnetz / Präfix
Next Hop / Gateway
Netzwerkschnittstelle
Metrik
```

`0.0.0.0/0` называется `Default Route` или `Standardroute` и используется, если нет более точного маршрута.

## Longest Prefix Match

Подходящий маршрут с самым длинным Präfix является самым конкретным и выбирается первым.

| Zielnetz | Gateway |
|---|---|
| `10.0.0.0/8` | A |
| `10.20.0.0/16` | B |
| `10.20.30.0/24` | C |
| `0.0.0.0/0` | D |

```text
10.20.30.40 → C
10.20.50.40 → B
10.50.30.40 → A
8.8.8.8     → D
```

## NAT und PAT

`NAT` verändert IP-Adressen beim Durchgang durch ein Gerät.

Beim Internetzugang aus einem privaten IPv4-Netz:

```text
private Quell-IP → öffentliche Quell-IP des Routers
```

`PAT (Port Address Translation)` unterscheidet mehrere interne Verbindungen zusätzlich durch Portnummern:

```text
10.0.0.25:53000 → 203.0.113.10:40001 → Webserver:443
10.0.0.26:53000 → 203.0.113.10:40002 → Webserver:443
```

Der Router speichert die Zuordnung in einer NAT-Tabelle.

## Portweiterleitung / Destination NAT

Для входящего соединения статическое правило может перенаправить публичный адрес и Port на внутренний Server:

```text
203.0.113.10:443 → 10.0.0.50:443
```

## Abgrenzung

```text
DHCP → vergibt Netzwerkkonfiguration
Routing → wählt den Weg in andere Netze
NAT/PAT → verändert Adressen/Ports
Firewall → erlaubt oder blockiert Verkehr nach Regeln
TLS/VPN → schützt übertragene Inhalte
```

NAT является не Verschlüsselung, не Authentifizierung и не заменяет Firewall.

## IHK-Merksatz

> PAT ermöglicht mehreren internen Clients, eine öffentliche IPv4-Adresse mithilfe unterschiedlicher Portnummern gemeinsam zu nutzen.

## Selbsttest

1. Welcher Gateway wird für `10.20.50.7` in der Tabelle oben verwendet?
2. Wie heißt die Weiterleitung `203.0.113.10:443 → 10.0.0.50:443`?
3. Verschlüsselt NAT die Nutzdaten?

## Lösungen

```text
1. Gateway B über 10.20.0.0/16
2. Portweiterleitung beziehungsweise Destination NAT
3. Nein
```

## Offene Punkte / Korrekturen

- Unterschied zwischen statischem Routing und dynamischen Routingprotokollen ist P2.
