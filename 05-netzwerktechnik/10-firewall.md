---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Firewall

## Aufgabe

Eine Firewall kontrolliert Netzwerkverkehr anhand von Regeln, zum Beispiel:

```text
Quell-IP-Adresse
Ziel-IP-Adresse
Quellport
Zielport
Transportprotokoll
Richtung
Verbindungszustand
```

## Typen

`Paketfilter` prüft einzelne Pakete anhand von Headerinformationen.

`Stateful Firewall` merkt sich Verbindungszustände. Antwortverkehr einer erlaubten Verbindung kann dadurch automatisch zugeordnet werden.

`Application Firewall / WAF` analysiert zusätzlich anwendungsspezifische Inhalte. Eine WAF schützt speziell Webanwendungen; sie ersetzt keine allgemeine Netzwerk-Firewall.

## Default Deny

```text
Alles ist verboten, was nicht ausdrücklich erlaubt wurde.
```

Regeln werden in vielen Systemen von oben nach unten ausgewertet; häufig entscheidet der erste passende Eintrag. Konkretes Verhalten зависит от продукта и конфигурации.

## Beispielregeln

```text
1. Erlaube Internet → 203.0.113.10 → TCP 443
2. Erlaube 10.0.10.0/24 → 10.0.20.5 → TCP 22
3. Blockiere alle übrigen neuen Verbindungen
```

Ergebnisse:

```text
Internet → 203.0.113.10:443/TCP      erlaubt
Internet → 203.0.113.10:80/TCP       blockiert
10.0.10.55 → 10.0.20.5:22/TCP       erlaubt
10.0.30.55 → 10.0.20.5:22/TCP       blockiert
```

## IHK-Merksatz

> Nach dem Default-Deny-Prinzip werden nur ausdrücklich benötigte Verbindungen erlaubt; alle übrigen Verbindungen werden blockiert.

## Typische Prüfungsfallen

- Firewall не шифрует автоматически разрешённый трафик.
- NAT не заменяет Firewall.
- Ein Port allein beweist nicht, welches Programm tatsächlich kommuniziert.
- Stateful означает учёт состояния соединения, не глубокий анализ любого Inhalts.

## Selbsttest

Formuliere eine Regel, die nur dem Admin-Netz `10.5.0.0/24` SSH-Zugriff auf Server `10.6.0.10` erlaubt. Alle anderen neuen Zugriffe sollen blockiert werden.

## Lösungen

```text
Quelle: 10.5.0.0/24
Ziel: 10.6.0.10
Protokoll/Port: TCP 22
Aktion: erlauben

Anschließend: Default Deny für alle nicht ausdrücklich erlaubten Verbindungen.
```

## Offene Punkte / Korrekturen

- Personal Firewall и Application Control добавить в Endpoint-Security.
