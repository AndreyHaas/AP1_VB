---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Systemeinrichtung und Betriebssysteme

## Aufgaben eines Betriebssystems

```text
Prozess- und Speicherverwaltung
Datei- und Geräteverwaltung
Benutzer- und Rechteverwaltung
Netzwerkfunktionen
Benutzeroberfläche und Schnittstellen für Anwendungen
```

`Prozess` ist eine laufende Programminstanz; ein `Thread` ist ein Ausführungsstrang innerhalb eines Prozesses. Präemptives Multitasking teilt Prozessorzeit durch das Betriebssystem zu.

## BIOS und UEFI

Firmware initialisiert Hardware und startet den Bootloader.

`UEFI` bietet gegenüber klassischem BIOS unter anderem moderne Bootmechanismen, GPT-Unterstützung und häufig `Secure Boot`. Secure Boot prüft signierte Bootkomponenten, ersetzt aber keine vollständige Systemhärtung.

## Einrichtungsablauf

1. Kunden- und Sicherheitsanforderungen prüfen.
2. Hardwarekompatibilität und Firmware-Einstellungen prüfen.
3. Datensicherung vorhandener Systeme sicherstellen.
4. Datenträger partitionieren und Dateisystem wählen.
5. Betriebssystem installieren und aktivieren/lizenzieren.
6. Treiber, Updates und freigegebene Software installieren.
7. Benutzer, Rechte, Netzwerk, Domäne und Sicherheitsvorgaben konfigurieren.
8. Funktion, Leistung, Sicherheit und Netzwerk testen.
9. Ergebnis, Abweichungen und Übergabe dokumentieren.

## Geräteklassen

```text
Desktop       → gut erweiterbar, stationär
Notebook      → mobil, Akku, begrenztere Erweiterbarkeit
All-in-One    → kompakt, weniger modular
Thin Client   → geringe lokale Leistung, zentrale Dienste/Desktops
Tablet/Smartphone → mobil, Touch, spezielle Verwaltung
```

## Domäne und Arbeitsgruppe

`Arbeitsgruppe`: lokale Konten und dezentrale Verwaltung.

`Domäne`: zentrale Identitäten, Richtlinien und Ressourcenverwaltung, например Active Directory.

Für die Domänenaufnahme müssen typischerweise DNS, Zeit, Netzwerkverbindung, Berechtigungen und Computername stimmen.

## Remote Desktop

RDP/ICA/VNC ermöglichen Fernzugriff. Zu prüfen sind Authentifizierung, Verschlüsselung, Firewall-Regeln, Berechtigungen, Protokollierung und minimale Freigabe. Dienste nie ungeschützt aus dem Internet veröffentlichen.

## Selbsttest

Ein neuer Windows-Client kann die Domain nicht finden, aber IP-Verbindungen funktionieren. Welchen Parameter prüfst du zuerst und warum?

## Lösungen

> Zuerst wird die DNS-Konfiguration geprüft, weil Domänendienste über DNS-Einträge gefunden werden. Der Client sollte den vorgesehenen internen DNS-Server verwenden.

## Offene Punkte / Korrekturen

- Konkreter Ablauf einer Windows-Domänenaufnahme mit WBS-Labor ergänzen.
