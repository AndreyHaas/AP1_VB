---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Passwortspeicherung, Hashing, Salt und Pepper

## Richtige Speicherung

Passwörter werden nicht als Klartext und normalerweise nicht mit einer umkehrbaren Standardverschlüsselung gespeichert. Stattdessen verwendet man eine speziell für Passwörter geeignete, langsame Hashfunktion/KDF:

```text
Passwort + individueller Salt
→ Passwort-Hashfunktion
→ gespeicherter Passwort-Hash
```

Geeignete moderne Verfahren sind beispielsweise `Argon2id`, `scrypt`, `bcrypt` oder passend konfigurierte `PBKDF2`. Eine schnelle allgemeine Hashfunktion wie SHA-256 allein ist für Passwortspeicherung ungeeignet, weil sie massenhaftes Ausprobieren erleichtert.

## Anmeldung

```text
1. Das System erhält das eingegebene Passwort.
2. Es liest Salt und Verfahrensparameter aus dem gespeicherten Datensatz.
3. Es berechnet den Passwort-Hash erneut.
4. Es vergleicht den berechneten Wert sicher mit dem gespeicherten Wert.
```

## Salt

`Salt` ist ein zufälliger, individueller Wert. Er ist nicht geheim und wird zusammen mit dem Hash gespeichert.

Wirkung:

- gleiche Passwörter erzeugen unterschiedliche Hashwerte;
- vorberechnete Rainbow Tables werden weitgehend unbrauchbar;
- одинаковые Passwörter в одной базе не узнаются напрямую по одинаковым Hashes.

Salt verhindert nicht, dass ein Angreifer Passwortkandidaten für jeden Datensatz ausprobiert. Deshalb braucht man zusätzlich ein langsames, speicherintensives Verfahren und starke Passwörter.

## Pepper

`Pepper` ist ein optionales geheimes Zusatzmerkmal. Es wird getrennt von der Passwortdatenbank, например in einem Secret Store oder HSM, verwahrt. Pepper ersetzt Salt nicht.

## Hashing und Verschlüsselung

```text
Verschlüsselung → mit Schlüssel umkehrbar; schützt Vertraulichkeit
Hashing         → Einwegfunktion; Vergleich/Fingerabdruck
```

Aus einem sicheren Hashwert lässt sich das Passwort nicht direkt zurückrechnen. Ein Angreifer kann aber Kandidaten raten und deren Hashwerte vergleichen. Kenntnis des Algorithmus allein erlaubt keine direkte Wiederherstellung; sichere Kryptografie muss auch bei bekanntem Verfahren sicher bleiben.

## IHK-Merksätze

> Passwörter werden als gesalzene Passwort-Hashes mit einem dafür geeigneten Verfahren gespeichert.

> Der Salt muss nicht geheim sein; er sorgt dafür, dass gleiche Passwörter unterschiedliche Hashwerte erhalten.

> Ein Passwort kann nicht direkt aus einem kryptografischen Hashwert entschlüsselt werden, aber schwache Passwörter können durch Ausprobieren gefunden werden.

## Selbsttest

1. Warum ist verschlüsselter Klartext für eine Passwortdatenbank riskant?
2. Muss Salt geheim bleiben?
3. Welches Schutzziel wird beim Vergleich eines Datei-Hashwertes geprüft?

## Lösungen

```text
1. Bei Verlust des Entschlüsselungsschlüssels können alle Passwörter offengelegt werden.
2. Nein; Salt wird üblicherweise mit dem Hash gespeichert.
3. Integrität.
```

## Offene Punkte / Korrekturen

- Passwort-Policy und Passphrasen in Endpoint-Security ergänzen.
