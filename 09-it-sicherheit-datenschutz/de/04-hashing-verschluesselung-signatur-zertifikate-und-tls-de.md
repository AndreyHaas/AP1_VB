---
pruefung: AP1
thema: Kryptografie und TLS
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Deutsch
gegenstueck: ../ru/04-hashing-verschluesselung-signatur-zertifikate-und-tls-ru.md
---

# Hashing, Verschlüsselung, Signatur, Zertifikate und TLS

## 1. Lernziele

Du kannst:

- Hashing und Verschlüsselung anhand ihres Zwecks unterscheiden;
- Salt, Pepper und Passwort-Hashfunktion korrekt einordnen;
- symmetrische, asymmetrische und hybride Verfahren vergleichen;
- Public und Private Key für Vertraulichkeit und Signatur richtig zuordnen;
- Schutzziele und Grenzen einer digitalen Signatur erklären;
- Inhalt, Signatur und Vertrauenskette eines Zertifikats beschreiben;
- wesentliche Prüfungen eines Webserverzertifikats nennen;
- den vereinfachten TLS-1.3-Ablauf und die hybride Arbeitsweise erklären;
- typische Schlüssel- und Zertifikatsfehler in Prüfungsfällen erkennen.

## 2. Prüfungsminimum — 15 Minuten

1. Hashing ist eine Einwegabbildung für Fingerabdruck/Vergleich; Verschlüsselung ist mit passendem Schlüssel umkehrbar.
2. Passwörter werden mit einer geeigneten langsamen Passwort-Hashfunktion und individuellem Salt gespeichert, nicht im Klartext.
3. Salt ist individuell und nicht geheim; Pepper ist optional, geheim und getrennt gespeichert.
4. Symmetrisch: gleicher geheimer Schlüssel, schnell; asymmetrisch: Public-/Private-Key-Paar, rechenintensiver.
5. Vertraulich senden: mit Public Key des Empfängers verschlüsseln; mit dessen Private Key entschlüsseln.
6. Signieren: Private Key des Absenders; prüfen: Public Key des Absenders.
7. Signatur unterstützt Integrität, Authentizität und Zurechenbarkeit, aber nicht Vertraulichkeit.
8. Zertifikat verbindet Identität/Domain mit Public Key und wird von einer CA signiert; der Private Key steht nicht darin.
9. Browser prüft unter anderem Hostname, Zeitgültigkeit, Kette, Zweck und Widerrufsstatus soweit verfügbar.
10. TLS schützt den Kanal durch Authentisierung, Vertraulichkeit und Integrität; es beweist nicht die Ehrlichkeit des Inhalts.

> Der Absender signiert mit seinem Private Key, während der Empfänger die Signatur mit dem Public Key des Absenders prüft.

## 3. Hashing und Passwortspeicherung

### 3.1 Kryptografische Hashfunktion

Eine Hashfunktion bildet Daten beliebiger Länge auf einen Wert fester Länge ab. Für kryptografische Anwendungen sind unter anderem wichtig:

- Einweg-Eigenschaft: Eingabe aus Hash nicht praktikabel zurückrechnen;
- Preimage-Resistenz: zu einem Hash keine passende Eingabe finden;
- Kollisionsresistenz: schwer, zwei verschiedene Eingaben mit gleichem Hash zu finden;
- Avalanche-Effekt: kleine Eingabeänderung verändert den Hash stark.

```text
Dokument → Hashfunktion → Hashwert
Dokument verändert → anderer Hashwert
```

Ein unverändert gebliebener Hash beweist Integrität nur, wenn Algorithmus und Referenzwert vertrauenswürdig geschützt beziehungsweise authentisiert sind.

### 3.2 Hashing ist keine Verschlüsselung

| Verfahren | umkehrbar? | Schlüssel? | Hauptzweck |
|---|---|---|---|
| Hashing | konzeptionell nein | normalerweise nein | Integritätsvergleich, Fingerabdruck |
| Verschlüsselung | ja, mit Schlüssel | ja | Vertraulichkeitsschutz |
| digitale Signatur | prüfbar, nicht „entschlüsseln des Dokuments“ | Schlüsselpaar | Integrität und Authentizität |

Ein Angreifer kann schwache Passwörter dennoch erraten, jeden Kandidaten hashen und vergleichen. Einweg bedeutet nicht „gegen Ausprobieren immun“.

### 3.3 Sichere Passwortspeicherung

```text
Passwort + individueller Salt + Parameter
→ Passwort-Hashfunktion/KDF
→ gespeicherter Wert
```

Geeignete Verfahren sind beispielsweise Argon2id, scrypt, bcrypt oder passend konfigurierte PBKDF2. Eine schnelle allgemeine Hashfunktion wie SHA-256 allein ist für Passwortspeicherung ungeeignet, weil massenhaftes Raten billig bleibt.

`Salt`:

- zufällig und für jeden Datensatz individuell;
- wird mit Hash und Parametern gespeichert;
- macht gleiche Passwörter im Datensatz nicht direkt erkennbar;
- erschwert vorberechnete Tabellen, verhindert aber kein Raten pro Datensatz.

`Pepper`:

- optionales gemeinsames oder systematisch verwaltetes Geheimnis;
- getrennt von der Passwortdatenbank, etwa in Secret Store/HSM;
- ersetzt den individuellen Salt nicht;
- benötigt Rotations- und Ausfallkonzept.

## 4. Verschlüsselung, Signatur und PKI

### 4.1 Symmetrische Verschlüsselung

Dasselbe geheime Schlüsselmaterial wird zum Ver- und Entschlüsseln verwendet.

Vorteile: schnell, effizient für große Datenmengen. Herausforderung: Schlüssel sicher verteilen, speichern, rotieren und sperren. Beispiele auf Grundniveau: AES, ChaCha20.

### 4.2 Asymmetrische Verschlüsselung

```text
Public Key  → darf verteilt werden
Private Key → bleibt geheim beim Eigentümer
```

Für Vertraulichkeit:

```text
Alice verschlüsselt für Bob → Bobs Public Key
Bob entschlüsselt           → Bobs Private Key
```

Asymmetrische Verfahren lösen nicht automatisch das Vertrauensproblem: Alice muss wissen, dass der Public Key tatsächlich Bob gehört.

### 4.3 Hybrid

Hybride Verfahren verbinden asymmetrische Authentisierung/Schlüsselvereinbarung mit schneller symmetrischer Nutzdatenverschlüsselung. Moderne Protokolle leiten Sitzungsschlüssel häufig aus einem Schlüsselaustausch ab, statt einen fertigen symmetrischen Schlüssel direkt zu übertragen.

### 4.4 Digitale Signatur

Vereinfachtes Modell:

```text
Signieren: Dokument → Hash → Signatur mit Private Key des Absenders
Prüfen:    Dokument → Hash + Signaturprüfung mit Public Key des Absenders
```

Schutzziele:

- Integrität: Änderung wird bei korrekter Prüfung erkannt;
- Authentizität/Zurechenbarkeit: Signatur passt zum kontrollierten Private Key;
- Nichtabstreitbarkeit nur zusammen mit verlässlicher Identitätsbindung, Schlüsselkontrolle und Prozessen.

Die Signatur verschlüsselt den Dokumentinhalt nicht. Für Vertraulichkeit ist zusätzliche Verschlüsselung nötig.

### 4.5 Zertifikat und CA

Ein X.509-Zertifikat enthält typischerweise:

- Inhaber beziehungsweise Domainnamen (`Subject Alternative Name`);
- Public Key;
- Aussteller;
- Gültigkeitszeitraum und Seriennummer;
- erlaubte Verwendungszwecke;
- digitale Signatur des Ausstellers.

Der Private Key des Servers steht niemals im Zertifikat. Die CA signiert mit ihrem Private Key; geprüft wird mit dem Public Key der CA.

```text
Serverzertifikat → Intermediate CA → vertrauenswürdige Root CA
```

Eine Kette ist nur dann brauchbar, wenn Signaturen, Namen, Gültigkeit, Verwendungszwecke und weitere Regeln passen. Ein selbstsigniertes Zertifikat kann verschlüsseln, besitzt aber ohne separat eingerichtetes Vertrauen keine öffentlich bestätigte Identitätskette.

## 5. Anwendungsfall: signiertes Dokument und HTTPS

### 5.1 Vertraulich und signiert von Alice an Bob

```text
1. Alice signiert mit Alices Private Key.
2. Alice verschlüsselt für Bob beziehungsweise vereinbart Schutz
   unter Verwendung von Bobs vertrauenswürdigem Public Key.
3. Bob entschlüsselt mit Bobs Private Key.
4. Bob prüft Alices Signatur mit Alices Public Key.
```

Merkschema:

| Zweck | Schlüssel |
|---|---|
| für Empfänger verschlüsseln | Public Key des Empfängers |
| entschlüsseln | Private Key des Empfängers |
| signieren | Private Key des Absenders |
| Signatur prüfen | Public Key des Absenders |

### 5.2 Browserprüfung bei HTTPS

Der Browser prüft typischerweise:

1. passt der aufgerufene Hostname zum Zertifikat?
2. liegt der Zeitpunkt im Gültigkeitszeitraum?
3. führt die Signaturkette zu einer vertrauten Root CA?
4. ist das Zertifikat für Serverauthentifizierung verwendbar?
5. ist es nach verfügbaren Informationen nicht widerrufen?
6. weist der Server den Besitz des zugehörigen Private Keys im Handshake nach?

Ein gültiges Zertifikat bestätigt die kontrollierte Schlüssel-/Domainzuordnung, nicht die moralische Vertrauenswürdigkeit der Website.

### 5.3 Vereinfachter TLS-1.3-Ablauf

```text
ClientHello: unterstützte Versionen, Parameter, Schlüsselaustauschanteil
ServerHello: Auswahl und eigener Schlüsselaustauschanteil
Server: Zertifikatskette + kryptografischer Besitznachweis
Client: Kette, Hostname und Nachweis prüfen
beide: gemeinsames Schlüsselmaterial und Sitzungsschlüssel ableiten
danach: Anwendungsdaten symmetrisch authentifiziert verschlüsseln
```

Nach aktuellem Stand 11.09.2026 spezifiziert RFC 9846 TLS 1.3 und ersetzt RFC 8446. Für AP1 bleibt das Kernmodell gleich: Handshake authentisiert und vereinbart Schlüsselmaterial; der Record-Layer schützt Nutzdaten effizient symmetrisch.

Gewöhnliches HTTPS authentifiziert den Server. Clientzertifikate oder andere Anmeldeverfahren sind für Clientauthentifizierung separat einzurichten.

## 6. Prüfungsformulierungen

> Ein individueller Salt muss nicht geheim sein; er sorgt dafür, dass gleiche Passwörter unterschiedliche gespeicherte Hashwerte erzeugen.

> Die Datei wird mit dem Public Key des Empfängers verschlüsselt, da nur der zugehörige Private Key die vertraulichen Daten entschlüsseln soll.

> Die digitale Signatur gewährleistet keine Vertraulichkeit, weil der Dokumentinhalt dadurch nicht verborgen wird.

> Das Zertifikat enthält den Public Key und die Signatur der CA, aber nicht den Private Key des Servers.

> TLS schützt die Verbindung gegen Mitlesen und unbemerkte Veränderung, beweist jedoch nicht, dass der Inhalt der Website ehrlich oder ungefährlich ist.

## 7. Typische Prüfungsfallen

- Hashing als umkehrbare Verschlüsselung bezeichnen.
- Salt geheim halten wollen oder einen Salt für alle Konten verwenden.
- SHA-256 allein als ideale Passwortspeicherung nennen.
- Public und Private Key nach „Absender immer privat“ ohne Zweck zuordnen.
- mit dem Public Key des Absenders vertraulich an den Empfänger verschlüsseln.
- Signatur mit Vertraulichkeit verwechseln.
- annehmen, der Private Key werde im Zertifikat übertragen.
- nur das Ablaufdatum des Zertifikats prüfen.
- gültiges Zertifikat mit seriösem Websiteinhalt gleichsetzen.
- symmetrische Nutzdatenverschlüsselung in TLS übersehen.
- normales HTTPS automatisch als Benutzerauthentifizierung ansehen.
- RFC 8446 nach seiner Ablösung 2026 als aktuellen TLS-1.3-Stand ausgeben.

## 8. Selbsttest

1. Grenze Hashing und Verschlüsselung ab.
2. Warum genügt SHA-256 allein nicht für Passwörter?
3. Erkläre Salt und Pepper.
4. Vergleiche symmetrische und asymmetrische Verschlüsselung.
5. Mit welchem Schlüssel verschlüsselt Alice vertraulich für Bob?
6. Mit welchem Schlüssel entschlüsselt Bob?
7. Mit welchem Schlüssel signiert Alice und womit prüft Bob?
8. Welche Schutzziele unterstützt eine Signatur, welches nicht?
9. Nenne sechs typische Zertifikatsinhalte.
10. Welche Prüfungen führt der Browser durch?
11. Warum arbeitet TLS hybrid?
12. Bewerte: „Das Schloss-Symbol beweist, dass der Shop ehrlich ist.“

<details>
<summary>Lösungen anzeigen</summary>

1. Hashing ist Einweg-Fingerabdruck; Verschlüsselung ist mit Schlüssel umkehrbar und schützt Vertraulichkeit.
2. Es ist zu schnell und erleichtert massenhaftes Raten; nötig ist eine Passwort-KDF mit Salt und Parametern.
3. Salt individuell/nicht geheim gegen gleiche Hashes und Tabellen; Pepper optional/geheim/getrennt.
4. Symmetrisch schnell mit gemeinsamem Geheimnis; asymmetrisch Schlüsselpaar und aufwendiger.
5. Bobs Public Key.
6. Bobs Private Key.
7. Alices Private Key; Alices Public Key.
8. Integrität, Authentizität, Zurechenbarkeit; keine Vertraulichkeit.
9. Inhaber/Domain, Public Key, Aussteller, Zeitraum, Seriennummer, Zweck, CA-Signatur; sechs genügen.
10. Hostname, Zeitraum, Kette/Vertrauen, Zweck, Widerruf soweit verfügbar und Besitznachweis im Handshake.
11. Asymmetrisch für Authentisierung/Schlüsselvereinbarung, symmetrisch für effiziente Nutzdaten.
12. Falsch; es belegt einen geschützten Kanal zur geprüften Domain, nicht ehrlichen Inhalt.

</details>

## 9. Quellen und Abgleich

- [RFC 9846 — TLS 1.3](https://datatracker.ietf.org/doc/html/rfc9846) — aktuelle TLS-1.3-Spezifikation seit Juli 2026; ersetzt RFC 8446.
- [RFC 5280 — X.509 PKI](https://datatracker.ietf.org/doc/html/rfc5280) — Zertifikats- und Sperrlistenprofil.
- [RFC 9106 — Argon2](https://datatracker.ietf.org/doc/html/rfc9106) — speicherintensive Funktion für Passwort-Hashing; konkrete Parameter müssen aktuell festgelegt werden.
- [NIST SP 800-63B-4](https://csrc.nist.gov/pubs/sp/800/63/b/4/final) — Speicherung und Prüfung von Passwörtern sowie Authentifikatoranforderungen.

## 10. Offene Prüfpunkte für den Unterricht

- Welche Algorithmen müssen im WBS-Aufgabensatz namentlich zugeordnet werden?
- Wird nur die Zertifikatskette oder auch CRL/OCSP geprüft?
- Soll der vereinfachte TLS-Handshake gezeichnet oder nur beschrieben werden?
