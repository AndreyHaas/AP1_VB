---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Virtualisierung und Cloud

## Virtuelle Maschine

Eine VM virtualisiert einen vollständigen Rechner mit eigenem Gastbetriebssystem.

```text
Vorteile: Isolation, Snapshots, unterschiedliche Betriebssysteme
Nachteile: höherer RAM-/Speicherbedarf, Verwaltungsaufwand
```

`Typ-1-Hypervisor` läuft direkt auf der Hardware. `Typ-2-Hypervisor` läuft auf einem Host-Betriebssystem.

## Container

Container isolieren Anwendungen und teilen den Kernel des Hostsystems. Sie starten meist schneller und benötigen weniger Ressourcen als vollständige VMs, bieten aber ein anderes Isolationsmodell.

VM und Container sind keine Gegensätze: Container können innerhalb von VMs betrieben werden.

## Virtueller Desktop / DaaS

Ein Desktop läuft zentral oder in der Cloud, der Client überträgt hauptsächlich Ein-/Ausgabe. Vorteile: zentrale Verwaltung und Zugriff von verschiedenen Endgeräten. Nachteile: Abhängigkeit von Netzwerk, Backend-Verfügbarkeit, Lizenzierung und Datenschutz.

## Cloud-Servicemodelle

```text
IaaS → virtuelle Rechen-, Speicher- und Netzwerkressourcen
PaaS → Plattform/Laufzeit für Anwendungen
SaaS → fertige Anwendung als Dienst
DaaS → virtueller Desktop als Dienst
```

Je weiter oben das Modell, desto mehr Betrieb übernimmt der Anbieter; Verantwortung für Konfiguration, Identitäten, Daten und Rechtskonformität bleibt geteilt und darf nicht pauschal abgegeben werden.

## Auswahlkriterien

```text
Kosten und Skalierbarkeit
Verfügbarkeit und Internetabhängigkeit
Datenschutz, Datenstandort und AVV
Sicherheit und Verantwortungsverteilung
Kompatibilität und Schnittstellen
Portabilität und Vendor Lock-in
Backup/Export und Exit-Strategie
```

## Selbsttest

Ein Unternehmen will eine fertige CRM-Anwendung nutzen, ohne Server und Laufzeit selbst zu betreiben. Welches Modell passt und welche drei Risiken sind zu prüfen?

## Lösungen

> SaaS passt. Zu prüfen sind unter anderem Datenschutz/AVV, Verfügbarkeit, Kosten, Integrationen, Exportmöglichkeit und Anbieterabhängigkeit.

## Offene Punkte / Korrekturen

- Fokus des aktuellen Katalogs liegt insbesondere auf SaaS und virtuellen Desktops/DaaS; übrige Modelle als Kontext behalten.
