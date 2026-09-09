---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Angriffsarten und Schadsoftware

## Social Engineering

`Social Engineering` manipuliert Menschen, um Informationen, Geld oder Zugang zu erhalten.

```text
Phishing       → massenhaftes gefälschtes Nachrichtenszenario
Spear-Phishing → gezielt auf eine Person/Organisation zugeschnitten
Whaling        → Spear-Phishing gegen Führungskräfte
Smishing       → Phishing über SMS
Vishing        → Phishing per Telefon
```

## Schadsoftware

```text
Virus       → hängt sich an Datei/Programm; Aktivierung meist durch Ausführung
Wurm        → verbreitet sich selbstständig, häufig über Netze
Trojaner    → tarnt sich als nützliche oder harmlose Software
Ransomware  → verschlüsselt/sperrt und fordert Lösegeld
Spyware     → sammelt heimlich Informationen
Keylogger   → zeichnet Tastatureingaben auf
Rootkit     → verbirgt Angreifer/Schadsoftware und ermöglicht privilegierten Zugriff
Bot         → infiziertes System, das zentral gesteuerte Befehle ausführt
```

Ein Programm kann mehrere Eigenschaften besitzen, например `Trojaner mit Spyware-Funktion`.

## Technische Angriffe

```text
Brute Force        → viele Passwortkandidaten ausprobieren
Credential Stuffing → gestohlene Zugangsdaten bei anderen Diensten testen
DoS                 → ein Ursprung überlastet einen Dienst
DDoS                → viele verteilte Systeme überlasten einen Dienst
Man in the Middle   → Kommunikation abfangen oder verändern
Spoofing            → Identität/Adresse fälschen
Sniffing            → Datenverkehr mitschneiden
SQL Injection       → Eingaben verändern Datenbankbefehle
XSS                 → fremder Scriptcode wird im Browser ausgeführt
```

## Schutzmaßnahmen

- Schulung und Prüfung unerwarteter Anfragen;
- MFA und eindeutige Passwörter;
- Updates und Patchmanagement;
- Eingabevalidierung, parametrisierte Datenbankzugriffe, Output-Encoding;
- Firewall, Rate Limiting, Monitoring, IDS/IPS;
- Backups und Restore-Tests.

## IHK-Merksatz

> Ein Trojaner beschreibt die Tarnung als nützliche Software; Spyware beschreibt die ausspähende Funktion.

## Selbsttest

1. Eine personalisierte Mail im Namen eines bekannten Geschäftspartners enthält einen schädlichen Link.
2. Ein gefälschter PDF-Konverter stiehlt nach der Installation Passwörter.
3. Ein Botnetz macht einen Webshop durch Millionen Anfragen unerreichbar.

## Lösungen

```text
1. Spear-Phishing
2. Trojaner mit Spyware-Funktion
3. DDoS-Angriff
```

## Offene Punkte / Korrekturen

- Webangriffe wie SQL Injection/XSS nur auf Schutzprinzip-Ebene lernen; SQL-Syntax selbst ist nicht AP1.
