---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Digitale Signatur

## Schutzziele

Eine digitale Signatur unterstützt:

```text
Integrität
Authentizität
Nichtabstreitbarkeit / Zurechenbarkeit
```

Sie verschlüsselt den Dokumentinhalt nicht und gewährleistet deshalb keine Vertraulichkeit.

## Signieren

```text
1. Hashwert des Dokuments berechnen.
2. Signatur mit dem Private Key des Absenders erzeugen.
3. Dokument und Signatur übertragen.
```

Die genaue Kryptografie signiert je nach Verfahren nicht wörtlich „den Hashwert als Klartext“, aber dieses Modell reicht für die Schlüsselrollen in der AP1.

## Prüfen

```text
1. Hashwert des empfangenen Dokuments neu berechnen.
2. Signatur mit dem Public Key des Absenders prüfen.
3. Prüfergebnis beziehungsweise Hashbezug vergleichen.
```

Wenn das Dokument verändert wurde, ist die Signaturprüfung nicht erfolgreich.

## Schlüsselregel

```text
Signieren          → Private Key des Absenders
Signatur prüfen    → Public Key des Absenders
Verschlüsseln      → Public Key des Empfängers
Entschlüsseln      → Private Key des Empfängers
```

Alice sendet vertraulich und signiert an Bob:

```text
Alice signiert mit ihrem Private Key.
Alice verschlüsselt für Bob mit Bobs Public Key.
Bob entschlüsselt mit seinem Private Key.
Bob prüft Alices Signatur mit Alices Public Key.
```

## Voraussetzungen

Authentizität ist nur sinnvoll, wenn der Public Key zuverlässig der behaupteten Person zugeordnet ist, zum Beispiel durch ein Zertifikat. Für starke rechtliche Nichtabstreitbarkeit sind zusätzlich sichere Prozesse und je nach Fall qualifizierte elektronische Signaturen relevant.

## IHK-Merksatz

> Der Absender signiert mit seinem Private Key; der Empfänger prüft die Signatur mit dem Public Key des Absenders.

## Selbsttest

Carla sendet David ein vertrauliches und signiertes Dokument. Nenne für Signieren, Verschlüsseln, Entschlüsseln und Prüfen jeweils den Schlüssel.

## Lösungen

```text
Signieren:       Carlas Private Key
Verschlüsseln:   Davids Public Key
Entschlüsseln:   Davids Private Key
Signatur prüfen: Carlas Public Key
```

## Offene Punkte / Korrekturen

- Unterschied zwischen digitaler Signatur und qualifizierter elektronischer Signatur nur bei Bedarf vertiefen.
