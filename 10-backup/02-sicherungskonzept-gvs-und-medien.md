---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Sicherungskonzept, GVS und Backupmedien

## Großvater-Vater-Sohn-Prinzip

GVS regelt Zeitpunkte und Aufbewahrungsdauer von Sicherungsgenerationen:

```text
Sohn       → täglich, kurze Aufbewahrung
Vater      → wöchentlich, längere Aufbewahrung
Großvater  → monatlich, lange Aufbewahrung
```

Beispiel:

```text
Montag–Donnerstag       → Sohn
jeder Freitag           → Vater
letzter Freitag im Monat → Großvater
```

Konkrete Intervalle und Fristen bestimmt das betriebliche Sicherungskonzept.

Wichtig:

```text
Voll/differenziell/inkrementell → welche Daten gesichert werden
GVS                            → wann und wie lange Generationen aufbewahrt werden
3-2-1                          → Kopien, Medien/Systeme und externe Lagerung
```

GVS legt nicht fest, ob alle oder nur geänderte Daten kopiert werden. Die Verfahren können kombiniert werden.

## 3-2-1-Regel

```text
3 Kopien insgesamt, einschließlich der Arbeitsdaten
2 unterschiedliche Medien beziehungsweise Speichersysteme
1 Kopie an einem anderen Ort, möglichst zusätzlich offline/immutable
```

Offline oder unveränderbare Kopien erhöhen den Schutz gegen Ransomware.

## Backupmedien auswählen

Kriterien:

```text
Kapazität
Schreib- und Lesegeschwindigkeit
Lebensdauer und Lagerfähigkeit
Kosten
Störanfälligkeit
Transportierbarkeit
Offline-/Offsite-Fähigkeit
Verschlüsselung und Zugriffsschutz
```

Beispiele:

- Festplatte/Backup-Appliance: schnell, aber online verwundbar, wenn nicht getrennt geschützt.
- Band: große Kapazität, gute Offline-Lagerung, aber langsamer direkter Zugriff.
- Cloud/Object Storage: offsite und skalierbar; Datenschutz, Verschlüsselung, Kosten und Anbieterabhängigkeit prüfen.

## Hot und Cold Backup

`Hot Backup`: Sicherung während des laufenden Betriebs. Hohe Verfügbarkeit, aber Konsistenz muss durch anwendungsgeeignete Verfahren sichergestellt werden.

`Cold Backup`: Anwendung/System wird für die Sicherung gestoppt. Konsistenz ist einfacher, dafür entsteht Ausfallzeit.

## Sicherungswürdige Daten

Zu sichern sind Daten, deren Verlust betriebliche, rechtliche, finanzielle oder persönliche Folgen hätte und die nicht wirtschaftlich neu erzeugt werden können. Dazu gehören je nach Betrieb Nutzdaten, Konfigurationen, Datenbanken, Schlüsselmaterial in geeigneter Form und für Restore erforderliche Dokumentation.

## Restore-Test

Ein erfolgreiches Backup ist erst wertvoll, wenn die Wiederherstellung funktioniert. Deshalb:

```text
Sicherungsprotokolle prüfen
Restore regelmäßig testen
Integrität kontrollieren
Zugriffsrechte und Verschlüsselung prüfen
Verfahren dokumentieren
```

## Backup, Archiv und Synchronisation

- `Backup`: Wiederherstellung nach Verlust/Fehler.
- `Archiv`: langfristige, nachvollziehbare Aufbewahrung nach fachlichen/rechtlichen Regeln.
- `Synchronisation`: gleicht Zustände ab; Löschungen/Fehler können mit übertragen werden und ersetzen kein Backup.

## Selbsttest

1. Welche Generation wird gewöhnlich am längsten aufbewahrt?
2. Bestimmt GVS, ob inkrementell oder vollständig gesichert wird?
3. Warum ist Cloud-Synchronisation allein kein Backup?

## Lösungen

```text
1. Großvater
2. Nein
3. Löschungen und Fehler können synchronisiert werden; getrennte Versionen/Restore-Punkte fehlen möglicherweise.
```

## Offene Punkte / Korrekturen

- Aufbewahrungsfristen nie ohne konkreten Rechts-/Betriebskontext pauschal festlegen.
