---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# DMZ – Demilitarisierte Zone

## Zweck

Eine DMZ ist ein separates Netzsegment für Systeme, die aus einem weniger vertrauenswürdigen Netz, meist dem Internet, erreichbar sein müssen.

Typische DMZ-Systeme:

```text
Webserver
Reverse Proxy
Mail-Gateway
öffentlicher DNS-Server
VPN-Gateway
```

Typische interne Systeme:

```text
Datenbankserver mit Kundendaten
Domain Controller
interner Dateiserver
Arbeitsplatzrechner
```

Ziel:

> Wird ein Server in der DMZ kompromittiert, soll daraus kein automatischer Zugriff auf das interne Netzwerk entstehen.

## Regelprinzip

Nur notwendige Verbindungen werden erlaubt:

```text
Internet → Web-Frontend in DMZ → TCP 443 erlauben
Web-Frontend → Datenbank intern → TCP 5432 erlauben
Admin-Netz → Web-Frontend → TCP 22 erlauben
alles Übrige → blockieren
```

Die Datenbank wird nicht direkt aus dem Internet erreichbar gemacht. Für Administrationszugriff muss als Quelle das konkrete Admin-Netz angegeben werden, nicht pauschal `Administratoren`.

## Beispiel

```text
Web-Frontend:   172.16.10.20
Datenbank:      10.0.20.30
Admin-Netz:     10.0.5.0/24
```

```text
Regel 1: Internet → 172.16.10.20 → TCP 443  → erlauben
Regel 2: 172.16.10.20 → 10.0.20.30 → TCP 5432 → erlauben
Regel 3: 10.0.5.0/24 → 172.16.10.20 → TCP 22 → erlauben
Regel 4: beliebig → beliebig → alle → blockieren
```

## IHK-Merksatz

> Öffentlich erreichbare Dienste werden in einer DMZ vom internen Netz getrennt; Verbindungen in das interne Netz werden auf das notwendige Minimum beschränkt.

## Typische Prüfungsfallen

- DMZ — не один продукт, а сетевой сегмент/архитектурная зона.
- DMZ-Server не становится безопасным автоматически; нужны Updates, Hardening, Monitoring и минимальные Rechte.
- Default Deny уже блокирует Internet → interne Datenbank; отдельное правило можно использовать для ясности, но оно не обязательно при корректной финальной Deny-Regel.

## Selbsttest

Ordne zu: öffentlicher DNS-Server, Domain Controller, Reverse Proxy, Datenbank mit Personalakten.

## Lösungen

```text
DMZ: öffentlicher DNS-Server, Reverse Proxy
internes Netz: Domain Controller, Datenbank mit Personalakten
```

## Offene Punkte / Korrekturen

- Varianten mit zwei Firewalls und dreibeiniger Firewall sind P2.
