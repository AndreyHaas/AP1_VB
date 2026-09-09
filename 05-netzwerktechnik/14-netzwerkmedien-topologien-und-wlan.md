---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Netzwerkmedien, Topologien und WLAN

## Übertragungsmedien

`Twisted-Pair-Kupferkabel`:

- preiswert und einfach zu installieren;
- Ethernet über RJ45;
- begrenzte Länge, bei klassischem Ethernet typischerweise bis 100 m pro Kanal;
- elektromagnetische Störungen je nach Schirmung beachten;
- kann PoE übertragen.

`Lichtwellenleiter (LWL)`:

- hohe Datenraten und große Entfernungen;
- unempfindlich gegen elektromagnetische Störungen;
- keine elektrische Potentialübertragung;
- Module, Fasertyp und Steckverbinder müssen zusammenpassen.

```text
Multimode  → kürzere Strecken, z. B. Gebäude/Rechenzentrum
Singlemode → große Strecken
```

`WLAN`:

- flexibel und mobil;
- geteiltes Funkmedium, Störungen und Reichweite beachten;
- tatsächliche Nutzdatenrate liegt unter Bruttodatenrate;
- sichere Authentisierung und Verschlüsselung erforderlich.

## Topologien

`Stern`: Endgeräte verbinden sich mit zentralem Switch. Leicht zu verwalten; Ausfall des Switches betrifft viele Teilnehmer.

`Bus`: gemeinsames Medium; historisch, Fehler schwerer einzugrenzen.

`Ring`: Teilnehmer ringförmig; je nach Technik Ausfallwirkung und Redundanz unterschiedlich.

`Mesh`: mehrere Wege zwischen Knoten; robust, aber aufwendig.

Moderne Ethernet-LANs verwenden meist physische Sternstrukturen.

## WLAN-Sicherheit

```text
WEP          → veraltet und unsicher
WPA/WPA-TKIP → veraltet
WPA2-AES     → verbreitet; sichere Konfiguration nötig
WPA3-SAE     → moderner Schutz für Personal-Netze
Enterprise   → zentrale Authentisierung, häufig über 802.1X/RADIUS
PSK          → gemeinsames Passwort; Verteilung und Wechsel problematisch
```

WPS kann Angriffsfläche schaffen und sollte nur nach Sicherheitsvorgaben verwendet oder deaktiviert werden. Ein MAC-Filter ist kein starker Schutz, weil MAC-Adressen beobachtet und nachgeahmt werden können.

## Access Point und Roaming

Access Points verbinden WLAN-Clients mit dem LAN. Bei mehreren APs müssen Kanalplanung, Sendeleistung, Abdeckung und Übergabe/Roaming berücksichtigt werden. Gleiche SSID allein garantiert keine optimale Verbindung.

## PoE

`Power over Ethernet` überträgt Daten und elektrische Leistung über dasselbe Ethernet-Kabel, например zu Access Points, VoIP-Telefonen oder Kameras. Leistungsklasse, Switch-Budget und Gerätekompatibilität prüfen.

## Selbsttest

1. Welches Medium eignet sich für eine störungsreiche 500-m-Verbindung zwischen Gebäuden?
2. Warum ist ein MAC-Filter kein ausreichender WLAN-Schutz?
3. Welche WLAN-Lösung eignet sich für individuelle Unternehmenskonten statt eines gemeinsamen PSK?

## Lösungen

```text
1. LWL, passend geplant; wegen Reichweite und Störfestigkeit.
2. MAC-Adressen sind sichtbar und können gefälscht werden.
3. WPA2/WPA3-Enterprise mit 802.1X/RADIUS.
```

## Offene Punkte / Korrekturen

- Konkrete IEEE-802.11- und Ethernet-Geschwindigkeiten anhand WBS-Aufgaben ergänzen.
