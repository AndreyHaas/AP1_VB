---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Symmetrische, asymmetrische und hybride Verschlüsselung

## Symmetrische Verschlüsselung

Zum Verschlüsseln und Entschlüsseln wird derselbe geheime Schlüssel verwendet.

Vorteile:

- schnell;
- für große Datenmengen geeignet.

Nachteil:

- Der gemeinsame Schlüssel muss sicher vereinbart und geschützt werden.

Beispiele: `AES`, `ChaCha20`.

## Asymmetrische Verschlüsselung

Jeder Teilnehmer besitzt ein Schlüsselpaar:

```text
Public Key  → darf veröffentlicht werden
Private Key → muss geheim bleiben
```

Für Vertraulichkeit:

```text
Verschlüsseln   → Public Key des Empfängers
Entschlüsseln   → Private Key des Empfängers
```

Vorteil: kein gemeinsamer geheimer Schlüssel muss vorher über einen sicheren Kanal übertragen werden.

Nachteil: deutlich rechenintensiver; für große Nutzdaten ungeeignet.

Beispiele: RSA und Elliptic-Curve-Verfahren, wobei konkrete Verfahren unterschiedliche Aufgaben wie Verschlüsselung, Signatur oder Schlüsselaustausch erfüllen.

## Hybride Verfahren

Hybride Verschlüsselung kombiniert:

```text
asymmetrisch → Authentisierung und/oder sichere Schlüsselvereinbarung
symmetrisch  → schnelle Verschlüsselung der Nutzdaten
```

Bei modernen Protokollen wird ein Sitzungsschlüssel häufig aus einem Schlüsselaustausch abgeleitet und nicht einfach als fertiger Schlüssel mit RSA übertragen.

## IHK-Merksatz

> Hybride Verschlüsselung verbindet die sichere Schlüsselvereinbarung asymmetrischer Verfahren mit der hohen Geschwindigkeit symmetrischer Verschlüsselung.

## Selbsttest

Ordne zu: AES-Festplattenverschlüsselung; Datei mit Public Key des Empfängers; asymmetrischer Handshake mit anschließendem Sitzungsschlüssel.

## Lösungen

```text
AES-Festplattenverschlüsselung → symmetrisch
Public Key des Empfängers      → asymmetrisch
Handshake + Sitzungsschlüssel  → hybrid
```

## Offene Punkte / Korrekturen

- Algorithmendetails sind nicht Lernziel; Schlüsselrollen und Vor-/Nachteile sicher beherrschen.
