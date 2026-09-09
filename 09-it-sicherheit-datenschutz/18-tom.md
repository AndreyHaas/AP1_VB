---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Technische und organisatorische Maßnahmen (TOM)

## Grundidee

Nach Art. 32 DSGVO müssen Verantwortliche und Auftragsverarbeiter ein dem Risiko angemessenes Schutzniveau herstellen. Auswahl und Umfang hängen vom Risiko, Stand der Technik, Kosten sowie Art und Umfang der Verarbeitung ab.

## Klassische Kontrollbegriffe

`Zutrittskontrolle`:

> Verhindert unbefugten körperlichen Zutritt zu Räumen, z. B. Türschloss oder Zugangskarte zum Serverraum.

`Zugangskontrolle`:

> Verhindert die unbefugte Nutzung eines IT-Systems, z. B. Passwort und MFA.

`Zugriffskontrolle`:

> Beschränkt innerhalb eines Systems den Zugriff auf erlaubte Daten und Funktionen, z. B. Rollen- und Berechtigungskonzept.

`Weitergabe-/Übertragungskontrolle`:

> Schützt und dokumentiert Übermittlungen, z. B. TLS, VPN, definierte Empfänger.

`Eingabekontrolle`:

> Macht nachvollziehbar, wer Daten eingegeben, verändert oder gelöscht hat, z. B. Audit-Log mit Benutzer und Zeitstempel.

`Verfügbarkeitskontrolle`:

> Schützt gegen Ausfall und Datenverlust, z. B. Backup, USV, Redundanz und Restore-Test.

`Trennungsgebot`:

> Daten für unterschiedliche Zwecke oder Mandanten werden getrennt verarbeitet.

Diese Begriffe sind verbreitete Prüfungssystematik; Art. 32 nennt unter anderem Pseudonymisierung/Verschlüsselung, dauerhafte Vertraulichkeit/Integrität/Verfügbarkeit/Belastbarkeit, Wiederherstellbarkeit und regelmäßige Wirksamkeitsprüfung.

## IHK-Merksatz

```text
Zutritt → Raum
Zugang  → IT-System
Zugriff → konkrete Daten/Funktionen
```

## Selbsttest

1. Serverraum nur mit Karte.
2. Anwendung verlangt Passwort und Authenticator-App.
3. Buchhaltung sieht Rechnungen, aber keine Personalakten.
4. Änderungen werden mit Benutzer und Zeitstempel protokolliert.

## Lösungen

```text
1. Zutrittskontrolle
2. Zugangskontrolle
3. Zugriffskontrolle
4. Eingabekontrolle
```

## Offene Punkte / Korrekturen

- Klassifikation an die in WBS verwendete TOM-Tabelle anpassen, falls andere Begriffe erwartet werden.
