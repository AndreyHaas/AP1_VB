---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Identifizierung, Authentisierung, Authentifizierung und Autorisierung

## Ablauf

```text
Benutzername angeben       → Identifizierung
Passwort/Token vorlegen    → Authentisierung
Nachweis durch System prüfen → Authentifizierung
Rechte prüfen              → Autorisierung
```

`Identifizierung`: Benutzer behauptet eine Identität.

`Authentisierung`: Benutzer legt einen Nachweis vor.

`Authentifizierung`: System prüft den Nachweis.

`Autorisierung`: System entscheidet, welche Aktionen erlaubt sind.

## Authentifizierungsfaktoren

```text
Wissen    → Passwort, PIN
Besitz    → Smartcard, Hardware-Token, registriertes Smartphone
Inhärenz  → Fingerabdruck, Gesicht, Iris
```

`MFA` erfordert mindestens zwei unterschiedliche Faktorkategorien.

```text
Passwort + Sicherheitsfrage     → Wissen + Wissen → keine MFA
PIN + Bankkarte                  → Wissen + Besitz → MFA
Fingerabdruck + Gesicht          → Inhärenz + Inhärenz → keine MFA
Passwort + Authenticator-App     → Wissen + Besitz → MFA
Smartcard + Fingerabdruck        → Besitz + Inhärenz → MFA
```

Eine zweite Stufe ist nicht automatisch ein zweiter Faktor. Два пароля — `2-Step`, но не echte MFA.

## IHK-Merksatz

> Mehrfaktor-Authentifizierung kombiniert mindestens zwei voneinander unabhängige Faktoren aus Wissen, Besitz und Inhärenz.

## Selbsttest

Ist `Passwort + per E-Mail zugesandter Code` immer sichere MFA? Begründe differenziert.

## Lösungen

> Passwort ist Wissen. Der E-Mail-Zugriff kann als Besitz-/Zugriffsfaktor behandelt werden, ist aber schwächer als ein getrenntes Hardware-Token oder eine Authenticator-App, insbesondere wenn dasselbe Gerät und dasselbe Konto kompromittiert sind. Die konkrete Umsetzung entscheidet über die Sicherheit.

## Offene Punkte / Korrekturen

- BSI-Begriffssystem mit WBS-Lösungsschema abgleichen; manche Alltagstexte verwenden Authentifizierung als Oberbegriff.
