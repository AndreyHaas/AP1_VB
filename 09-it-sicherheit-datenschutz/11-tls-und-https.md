---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# TLS und HTTPS

## Bedeutung

```text
HTTPS = HTTP über TLS
```

Ein korrekt aufgebautes TLS-Verhältnis schützt:

```text
Authentizität des Servers
Vertraulichkeit der übertragenen Daten
Integrität der übertragenen Daten
```

Bei gewöhnlichem HTTPS wird der Server authentifiziert. Eine Client-Authentifizierung per Client-Zertifikat erfolgt nur, wenn sie ausdrücklich eingerichtet ist.

## Vereinfachter Ablauf

1. Client und Server handeln unterstützte kryptografische Parameter aus.
2. Der Server weist seine Identität typischerweise mit Zertifikat und zugehörigem Private Key nach.
3. Der Client prüft unter anderem Hostname, Gültigkeit und Zertifikatskette.
4. Beide Seiten führen einen Schlüsselaustausch durch und leiten gemeinsames Schlüsselmaterial ab.
5. Anwendungsdaten werden effizient symmetrisch verschlüsselt und gegen Veränderungen geschützt.

Der Private Key des Servers wird niemals an den Browser gesendet.

## Warum hybrid?

```text
asymmetrische Kryptografie → Authentisierung und Schlüsselaustausch
symmetrische Kryptografie  → schnelle Verschlüsselung großer Nutzdatenmengen
```

## Was HTTPS nicht beweist

HTTPS beweist nicht, dass:

- Inhalte ehrlich oder ungefährlich sind;
- Betreiber keine betrügerischen Absichten haben;
- Website frei von Schadsoftware ist.

Auch eine Phishing-Website kann ein gültiges TLS-Zertifikat für ihre eigene Domain besitzen.

## IHK-Merksätze

> TLS schützt die Verbindung, nicht die inhaltliche Vertrauenswürdigkeit einer Website.

> Nutzdaten werden symmetrisch verschlüsselt, weil symmetrische Verfahren für große Datenmengen deutlich effizienter sind.

## Selbsttest

1. Warum sendet der Server ein Zertifikat?
2. Wird der Private Key des Servers übertragen?
3. Authentifiziert normales HTTPS automatisch den Benutzer?
4. Beweist das Schloss-Symbol, dass der Inhalt ehrlich ist?

## Lösungen

```text
1. Zum Nachweis der Zuordnung von Domain und Public Key und zur Serverauthentifizierung.
2. Nein.
3. Nein; Clientauthentifizierung erfolgt nur bei entsprechender Konfiguration.
4. Nein; es bestätigt eine geschützte Verbindung zur aufgerufenen Domain.
```

## Offene Punkte / Korrekturen

- HTTP/3/QUIC не углублять, если WBS не включает это в задачи.
