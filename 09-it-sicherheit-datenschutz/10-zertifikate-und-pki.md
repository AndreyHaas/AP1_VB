---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Digitale Zertifikate und PKI

## Zweck

Ein digitales Zertifikat verbindet einen Public Key mit einer geprüften Identität oder, bei Webserver-Zertifikaten, mit einem Domainnamen.

Typischer Inhalt:

```text
Inhaber / Domainnamen
Public Key
Aussteller
Gültigkeitszeitraum
Seriennummer
zulässige Verwendungszwecke
digitale Signatur des Ausstellers
```

Der Private Key des Servers steht niemals im Zertifikat und wird nicht an den Browser übertragen.

## Certification Authority

Eine `CA (Certification Authority / Zertifizierungsstelle)` signiert das Zertifikat mit ihrem Private Key. Die Signatur wird mit dem Public Key der CA geprüft.

Browser und Betriebssysteme besitzen vertrauenswürdige Root-Zertifikate. Daraus entsteht eine `Zertifikatskette`:

```text
Serverzertifikat → Intermediate CA → Root CA
```

## Browserprüfung

Typische Prüfungen:

- passt der aufgerufene Hostname zu den Namen im Zertifikat (`Subject Alternative Name`)?
- liegt der aktuelle Zeitpunkt im Gültigkeitszeitraum?
- ist die Signaturkette bis zu einer vertrauenswürdigen CA gültig?
- ist das Zertifikat für Serverauthentifizierung geeignet?
- ist es nach den verfügbaren Informationen nicht widerrufen?

Ein gültiges Domain-Zertifikat bestätigt nicht, dass ein Unternehmen moralisch vertrauenswürdig ist. Es belegt vor allem die kontrollierte Zuordnung des Schlüssels zum Domainnamen gemäß Prüfverfahren der CA.

## IHK-Merksätze

> Ein Zertifikat enthält den Public Key des Inhabers und die Signatur der ausstellenden CA, aber niemals den Private Key des Servers.

> Die CA signiert mit ihrem Private Key; geprüft wird mit dem Public Key der CA.

## Selbsttest

1. Welche zwei Dinge verbindet ein Webserver-Zertifikat?
2. Welcher Schlüssel der CA wird zum Signieren verwendet?
3. Warum genügt ein gültiger Zeitraum allein nicht für die Browserprüfung?

## Lösungen

```text
1. Domainname und Public Key
2. Private Key der CA
3. Auch Hostname, Zertifikatskette, Verwendungszweck und gegebenenfalls Widerruf müssen passen.
```

## Offene Punkte / Korrekturen

- Begriffe CSR, SAN, CRL und OCSP sind P2.
