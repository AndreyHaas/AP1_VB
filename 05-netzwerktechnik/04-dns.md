---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# DNS – Domain Name System

## Aufgabe

DNS löst Namen in IP-Adressen und weitere Ressourceninformationen auf.

```text
www.example.de → 203.0.113.20
```

## Wichtige Resource Records

| Record | Bedeutung |
|---|---|
| `A` | Hostname → IPv4-Adresse |
| `AAAA` | Hostname → IPv6-Adresse |
| `CNAME` | Alias auf einen anderen Namen |
| `MX` | zuständiger Mailserver |
| `PTR` | IP-Adresse → Hostname für Reverse Lookup |
| `NS` | zuständiger Nameserver |
| `SOA` | Verwaltungsdaten einer DNS-Zone |
| `TXT` | Textinformationen, z. B. SPF/Verifikation |

## Rekursive Auflösung

1. Browser-Cache, Betriebssystem-Cache und `hosts`-Datei werden geprüft.
2. Der Client fragt seinen rekursiven Resolver.
3. Der Resolver folgt Verweisen von Root- zu TLD- und autoritativem Nameserver.
4. Der autoritative Nameserver liefert den verbindlichen Record.
5. Resolver und Client speichern die Antwort gemäß `TTL` im Cache.

```text
Client → rekursiver Resolver → Root → TLD → autoritativer Nameserver
```

`TTL (Time to Live)` определяет, как долго ответ может оставаться в Cache. После изменения IP старый ответ может использоваться до истечения TTL.

## Transport

DNS относится к OSI-Layer 7 и использует Port 53:

- UDP для большинства обычных запросов;
- TCP, например при необходимости крупного ответа или Zone Transfer;
- современные защищённые варианты DoT/DoH возможны, но изучаются отдельно.

## Fehlerbilder

```text
NXDOMAIN → Domainname existiert nicht
SERVFAIL → Server konnte die Anfrage nicht erfolgreich bearbeiten
Timeout  → keine rechtzeitige Antwort
```

Типичный признак DNS-проблемы:

```text
ping 1.1.1.1 funktioniert
Namensauflösung für example.de funktioniert nicht
```

## IHK-Merksatz

> Der autoritative Nameserver enthält die verbindlichen DNS-Einträge einer Zone; ein rekursiver Resolver beschafft die Antwort für den Client und speichert sie gegebenenfalls im Cache.

## Selbsttest

1. Welcher Record ordnet einen Namen einer IPv6-Adresse zu?
2. Welcher Server enthält den endgültigen Eintrag einer Zone?
3. Warum kann nach einer DNS-Änderung vorübergehend noch die alte IP verwendet werden?

## Lösungen

```text
1. AAAA
2. autoritativer Nameserver
3. wegen noch gültiger Cache-Einträge bis zum Ablauf der TTL
```

## Offene Punkte / Korrekturen

- `SOA` ergänzen, falls es in WBS-Aufgaben konkret verwendet wird.
