---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# VPN – Virtual Private Network

## Zweck

Ein VPN erzeugt einen geschützten Tunnel über ein nicht vertrauenswürdiges Netz, zum Beispiel das Internet.

```text
VPN-Tunnel = verschlüsselte und authentisierte Verbindung über ein öffentliches Netz
```

Je nach Verfahren werden Vertraulichkeit, Integrität und Authentizität der Kommunikation geschützt.

## Typen

`Remote-Access-VPN / End-to-Site`:

> Ein einzelnes Endgerät verbindet sich mit dem Unternehmensnetz, zum Beispiel ein Notebook aus dem Homeoffice.

`Site-to-Site-VPN`:

> Zwei Netze oder Standorte werden über VPN-Gateways dauerhaft oder bedarfsgesteuert gekoppelt.

`End-to-End-VPN`:

> Zwei Endpunkte bauen direkt eine geschützte Verbindung zueinander auf.

## Grenzen

Ein VPN garantiert nicht:

- dass das Endgerät frei von Schadsoftware ist;
- dass eine besuchte Website ehrlich ist;
- vollständige Anonymität;
- Schutz außerhalb der definierten Tunnelendpunkte.

VPN ersetzt nicht Endpoint-Security, Berechtigungskonzept oder sichere Anwendungen.

## IHK-Merksätze

> Beim Remote-Access-VPN verbindet sich ein einzelner Client mit einem entfernten Netzwerk; beim Site-to-Site-VPN werden zwei Netzwerke miteinander verbunden.

> Ein VPN schützt die Verbindung, bewertet aber nicht die Vertrauenswürdigkeit der übertragenen Inhalte.

## Selbsttest

1. Ein Notebook im Homeoffice verbindet sich mit dem Firmennetz.
2. Die Netze zweier Filialen sind über zwei VPN-Gateways verbunden.
3. Das VPN soll Schadsoftware auf dem Client automatisch entfernen.

## Lösungen

```text
1. Remote-Access-VPN
2. Site-to-Site-VPN
3. falsche Aussage; das ist nicht die Aufgabe eines VPN.
```

## Offene Punkte / Korrekturen

- IPsec und L2TP auf Begriffsiveau nach WBS-Vorgabe ergänzen.
