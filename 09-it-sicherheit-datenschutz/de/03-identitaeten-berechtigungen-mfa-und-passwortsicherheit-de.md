---
pruefung: AP1
thema: Identitäten und Berechtigungen
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Deutsch
gegenstueck: ../ru/03-identitaeten-berechtigungen-mfa-und-passwortsicherheit-ru.md
---

# Identitäten, Berechtigungen, MFA und Passwortsicherheit

## 1. Lernziele

Du kannst:

- Identifizierung, Authentisierung, Authentifizierung und Autorisierung trennen;
- Wissen, Besitz und Inhärenz als Faktorkategorien zuordnen;
- echte MFA von mehreren Schritten derselben Kategorie unterscheiden;
- OTP, Push, Smartcard, Passkey und Wiederherstellungscodes einordnen;
- Least Privilege, Need to Know, Funktionstrennung und Vier-Augen-Prinzip anwenden;
- ACL, Rollen/RBAC und Gruppen als Berechtigungsmodelle erklären;
- den Identitätslebenszyklus von Eintritt bis Austritt planen;
- sichere Passwort- und Wiederherstellungsprozesse bewerten;
- Berechtigungen mit Positiv- und Negativtests kontrollieren.

## 2. Prüfungsminimum — 15 Minuten

1. Benutzername angeben = Identifizierung; Nachweis vorlegen = Authentisierung; Systemprüfung = Authentifizierung; Rechteentscheidung = Autorisierung.
2. Faktoren: Wissen, Besitz und Inhärenz.
3. MFA kombiniert mindestens zwei unterschiedliche Faktorkategorien.
4. Passwort + Sicherheitsfrage ist Wissen + Wissen und damit keine echte MFA.
5. Least Privilege vergibt nur erforderliche Rechte; Need to Know begrenzt Informationszugriff.
6. Berechtigungen besser über Rollen/Gruppen als unkontrolliert je Einzelkonto vergeben.
7. Joiner–Mover–Leaver: Rechte bei Eintritt vergeben, bei Wechsel anpassen, bei Austritt sofort entziehen.
8. Gemeinsame Konten schwächen Zurechenbarkeit.
9. Lange, einzigartige Passphrasen und Passwortmanager sind sinnvoller als Wiederverwendung.
10. Recovery ist Teil des Schutzes; ein leicht manipulierbarer Reset umgeht starke MFA.

> Der Zugriff wird über eine rollenbasierte Gruppe vergeben, weil dadurch Least Privilege, nachvollziehbare Freigabe und regelmäßige Rezertifizierung einfacher umgesetzt werden können.

## 3. Grundlagen

### 3.1 Ablauf der Zugriffsentscheidung

```text
Identifizierung  → „Ich bin Benutzerin A.“
Authentisierung  → A legt Passwort, Token oder biometrisches Merkmal vor.
Authentifizierung → Das System prüft den Nachweis.
Autorisierung     → Das System prüft die erlaubte Aktion.
Protokollierung   → Relevante Aktion wird nachvollziehbar erfasst.
```

Eine erfolgreiche Anmeldung bedeutet nicht automatisch Zugriff auf jede Datei. Authentifizierung klärt, wer beziehungsweise welches Konto nachgewiesen wurde; Autorisierung entscheidet, was erlaubt ist.

### 3.2 Faktorkategorien

| Kategorie | Beispiele |
|---|---|
| Wissen | Passwort, PIN |
| Besitz | Smartcard, Hardwaretoken, registriertes Gerät |
| Inhärenz | Fingerabdruck, Gesicht, Iris |

Beispiele:

```text
Passwort + Sicherheitsfrage → Wissen + Wissen   → keine MFA
PIN + Smartcard             → Wissen + Besitz   → MFA
Passwort + OTP-App          → Wissen + Besitz   → MFA
Fingerabdruck + Gesicht     → Inhärenz + Inhärenz → keine echte MFA
```

Biometrie ist kein Geheimnis, kann Fehlannahmen haben und lässt sich nicht wie ein Passwort einfach ändern. Üblicherweise entsperrt sie einen lokalen kryptografischen Schlüssel oder ein Gerät.

### 3.3 Authentifikatoren im Vergleich

| Verfahren | Vorteil | wichtige Grenze |
|---|---|---|
| Passwort/Passphrase | überall nutzbar | Phishing, Wiederverwendung, Erraten |
| TOTP-Code | kein Mobilfunk nötig | kann auf Phishing-Seite eingegeben werden |
| SMS-Code | einfach | Rufnummernangriff, Zustellung, Phishing |
| Push-Freigabe | komfortabel | Push Fatigue und unklare Anfrage |
| Smartcard/Hardwaretoken | getrenntes Gerät, starker Schlüsselschutz möglich | Ausgabe, Verlust und Ersatzprozess |
| Passkey/FIDO | domänengebundene, phishing-resistente Anmeldung möglich | Geräte-, Sync- und Recovery-Konzept nötig |

Nicht jede MFA ist phishing-resistent. Ein Angreifer kann Passwort und OTP in Echtzeit weiterleiten. Domänengebundene kryptografische Verfahren verhindern diese typische Weiterleitung besser.

## 4. Berechtigungen und Identitätslebenszyklus

### 4.1 Schutzprinzipien

- `Least Privilege`: minimale Rechte für Aufgabe und Zeitraum.
- `Need to Know`: Zugriff nur auf tatsächlich benötigte Informationen.
- `Separation of Duties`: kritische Schritte auf verschiedene Rollen verteilen.
- `Vier-Augen-Prinzip`: zweite befugte Person bestätigt eine kritische Aktion.
- `Default Deny`: nicht ausdrücklich erlaubter Zugriff bleibt untersagt.
- `Rezertifizierung`: Verantwortliche bestätigen regelmäßig, dass Rechte weiter nötig sind.

### 4.2 ACL, Gruppen und RBAC

`ACL` ordnet einem Objekt zu, welche Subjekte welche Rechte besitzen. `RBAC` bündelt Rechte in Rollen; Konten erhalten Rollen entsprechend ihrer Aufgaben. Verzeichnisgruppen setzen Rollen häufig technisch um.

```text
Benutzerkonto → Gruppe „Personal-Lesen“ → Leserecht auf Ordner
Benutzerkonto → Gruppe „Personal-Ändern“ → Lesen + Ändern
```

Explizite Verweigerungen, Vererbung und mehrere Gruppen können das Ergebnis beeinflussen. Die wirksame Berechtigung wird deshalb praktisch getestet, nicht nur aus einem Screenshot angenommen.

### 4.3 Joiner–Mover–Leaver

1. `Joiner`: eindeutiges persönliches Konto, genehmigte Grundrolle, sichere Erstausgabe.
2. `Mover`: alte Rechte entfernen, neue Rolle genehmigen, Konflikte prüfen.
3. `Leaver`: Konto/Sitzungen/Token zeitgerecht sperren, Geräte und Schlüssel zurücknehmen.
4. Dienst- und Notfallkonten besitzen Eigentümer, Zweck, Rotation und Überwachung.
5. Regelmäßige Rezertifizierung entfernt schleichend angesammelte Rechte.

Gemeinsame Administratorkonten werden vermieden. Wo sie technisch unvermeidbar sind, braucht es kontrollierte Ausgabe und zusätzliche Nachvollziehbarkeit.

### 4.4 Passwortsicherheit

Sichere Praxis:

- lange, einzigartige Passphrase für jeden Dienst;
- Passwortmanager statt vorhersehbarer Varianten;
- Prüfung neuer Passwörter gegen Listen bekannter kompromittierter Werte;
- keine Sicherheitsfragen mit öffentlich auffindbaren Antworten;
- Rate Limiting und Schutz vor automatisierten Versuchen;
- Änderung bei Kompromittierungsverdacht, nicht allein als ritualisierte Kurzfristrotation;
- Passwörter als gesalzene, geeignete Passwort-Hashes speichern, niemals im Klartext;
- temporäre Startkennwörter beim ersten Gebrauch ersetzen und sicher zustellen.

Konkrete Mindestlängen und Regeln folgen dem gültigen Organisationskonzept. Die aktuelle NIST-Richtlinie bevorzugt Länge, Blocklisten und Passwortmanager statt starrer Zeichentypzwänge. Eine Prüfungsaufgabe mit ausdrücklich vorgegebener Policy wird dennoch nach dieser Vorgabe gelöst und fachlich bewertet.

### 4.5 Wiederherstellung und Reset

Ein Passwortreset ist eine erneute Identitätsprüfung. Helpdesk und Self-Service dürfen nicht durch leicht erratbare Daten umgangen werden. Recovery-Codes werden sicher aufbewahrt, nur einmal genutzt und nach Gebrauch ersetzt. Verlust eines Faktors führt zu Sperrung des alten Faktors und kontrollierter Neuregistrierung.

## 5. Anwendungsfall: Rollenwechsel im Support

Mira wechselt vom First-Level-Support in die Personalabteilung. Ihr altes Supportkonto besitzt Leserechte auf Tickets und temporäre lokale Adminrechte. Neu benötigt sie Zugriff auf Personaldokumente, aber keine Lohnfreigabe.

### 5.1 Sollkonzept

```text
entziehen: lokale Adminrolle, Support-Schreibrechte, alte API-Token
behalten:  allgemeine Mitarbeiterdienste, soweit weiter erforderlich
vergeben:  Gruppe Personal-Lesen/Ändern nach Freigabe
nicht vergeben: Lohnfreigabe und Benutzeradministration
zusätzlich: MFA neu prüfen, aktive Sitzungen beenden, Änderung protokollieren
```

### 5.2 Funktionstrennung

Mira darf Personaldaten erfassen. Eine zweite Rolle gibt Lohnänderungen frei. Dadurch kann eine einzelne kompromittierte Identität nicht den vollständigen kritischen Prozess ausführen.

### 5.3 Berechtigungstest

| Test | Soll |
|---|---|
| gültige Anmeldung mit beiden Faktoren | erfolgreich |
| Anmeldung nur mit Passwort | abgewiesen |
| Personaldokument öffnen | erlaubt |
| Lohnänderung erfassen | je Rolle erlaubt |
| eigene Lohnänderung freigeben | abgewiesen |
| altes Supportticket ändern | abgewiesen |
| gesperrten alten Token nutzen | abgewiesen und protokolliert |

Positivtests prüfen benötigte Rechte. Negativtests beweisen, dass verbotene Aktionen tatsächlich blockiert sind.

## 6. Prüfungsformulierungen

> Passwort und Sicherheitsfrage bilden keine Mehrfaktor-Authentifizierung, da beide Nachweise zur Kategorie Wissen gehören.

> Die alten Supportrechte werden beim Rollenwechsel entfernt, weil angesammelte Berechtigungen dem Least-Privilege-Prinzip widersprechen.

> Ein persönliches Administratorkonto verbessert die Zurechenbarkeit, da sicherheitsrelevante Aktionen einer einzelnen Identität zugeordnet werden können.

> Der Rücksetzprozess benötigt eine angemessene Identitätsprüfung, weil ein schwacher Helpdesk-Reset die zuvor eingerichtete MFA umgehen würde.

## 7. Typische Prüfungsfallen

- Authentifizierung und Autorisierung verwechseln.
- zwei Nachweise aus derselben Kategorie als MFA werten.
- Smartphone automatisch als Besitzfaktor zählen, obwohl die Anmeldung nur ein dort gespeichertes Passwort nutzt.
- OTP als vollständig phishing-resistent bezeichnen.
- Biometrie als geheim und beliebig austauschbar behandeln.
- nach Rollenwechsel nur neue Rechte hinzufügen, alte aber behalten.
- Berechtigungen direkt an viele Einzelkonten vergeben, obwohl Rollen möglich sind.
- gemeinsame Konten ohne Zurechenbarkeit zulassen.
- nur Positivtests durchführen.
- Passwortlänge mit Unvorhersagbarkeit und Einzigartigkeit gleichsetzen.
- häufige erzwungene Änderung unabhängig von Anlass als universelle Sicherheitsgarantie darstellen.
- sicheren Login mit schwachem Recovery-Prozess kombinieren.

## 8. Selbsttest

1. Erkläre Identifizierung, Authentisierung, Authentifizierung und Autorisierung.
2. Nenne die drei Faktorkategorien mit je zwei Beispielen.
3. Ist PIN + Passwort MFA? Begründe.
4. Ist PIN + Smartcard MFA? Begründe.
5. Was bedeuten Least Privilege und Need to Know?
6. Erkläre ACL und RBAC.
7. Welche Schritte umfasst Joiner–Mover–Leaver?
8. Warum sind gemeinsame Administratorkonten problematisch?
9. Nenne fünf sinnvolle Passwortmaßnahmen.
10. Warum ist TOTP nicht automatisch phishing-resistent?
11. Formuliere zwei Positiv- und zwei Negativtests für einen Personalordner.
12. Bewerte: „Starke MFA macht den Passwortreset unwichtig.“

<details>
<summary>Lösungen anzeigen</summary>

1. Identität behaupten; Nachweis vorlegen; Nachweis prüfen; Rechte entscheiden.
2. Wissen: Passwort/PIN; Besitz: Token/Smartcard; Inhärenz: Finger/Gesicht.
3. Nein, beide sind Wissen.
4. Ja, Wissen und Besitz, sofern beide unabhängig geprüft werden.
5. minimale Rechte; Informationszugriff nur bei tatsächlichem Bedarf.
6. ACL trägt Rechte am Objekt ein; RBAC bündelt Rechte in Rollen für Aufgaben.
7. sicher vergeben, bei Wechsel anpassen/alte entziehen, bei Austritt sperren und Mittel zurücknehmen.
8. Aktionen sind schlechter zurechenbar; Geheimnisse werden geteilt und schwerer rotiert.
9. lang, einzigartig, Passwortmanager, Blockliste, Rate Limiting, MFA, sicherer Hash, sicherer Reset; fünf genügen.
10. Nutzer kann Code auf einer Phishing-Seite eingeben, die ihn sofort weiterleitet.
11. benötigte Datei lesen/ändern; fremde Abteilung und Freigabeaktion müssen abgewiesen werden.
12. Falsch; ein manipulierbarer Reset kann Faktoren ersetzen und damit MFA umgehen.

</details>

## 9. Quellen und Abgleich

- [NIST SP 800-63B-4](https://csrc.nist.gov/pubs/sp/800/63/b/4/final) — aktuelle Richtlinie zu Authentifikatoren, Passwörtern, phishing-resistenten Verfahren und Lebenszyklus; veröffentlicht Juli 2025.
- [BSI IT-Grundschutz-Kompendium](https://www.bsi.bund.de/grundschutz-kompendium) — Identitäts- und Berechtigungsmanagement sowie sichere Authentisierung.
- [BSI: Sichere Passwörter](https://www.bsi.bund.de/DE/Themen/Verbraucherinnen-und-Verbraucher/Informationen-und-Empfehlungen/Cyber-Sicherheitsempfehlungen/Accountschutz/Sichere-Passwoerter-erstellen/sichere-passwoerter-erstellen_node.html) — aktuelle Empfehlungen zu Passphrasen, Einzigartigkeit und Passwortmanagern.

## 10. Offene Prüfpunkte für den Unterricht

- Welche deutschen Begriffe für Authentisierung/Authentifizierung erwartet WBS?
- Werden effektive Rechte mit Vererbung und explizitem Deny praktisch berechnet?
- Welche Passwortregeln gelten im verwendeten WBS-Szenario ausdrücklich?
