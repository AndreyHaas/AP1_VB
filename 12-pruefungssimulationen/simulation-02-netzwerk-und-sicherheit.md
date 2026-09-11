---
pruefung: AP1
typ: Pruefungssimulation
nummer: 02
thema: Außenkameras, Netzwerk, Verfügbarkeit und Service
stand: 2026-09-11
sprache: Deutsch
bearbeitungszeit: 90 Minuten
gesamtpunkte: 100
loesungen: simulation-02-loesungen.md
---

# Prüfungssimulation 02 – Netzwerk und Sicherheit am Logistikstandort

## Prüfungsmodus

- Bearbeitungszeit: **90 Minuten**
- Gesamtpunktzahl: **100 Punkte**
- Bearbeite alle Aufgaben auf Deutsch und ohne Blick in die Lösungsdatei.
- Notiere Formeln, Einheiten, Zwischenergebnisse und sinnvolle Rundungen.
- Trenne Beobachtung, Schlussfolgerung und Maßnahme bei Diagnoseaufgaben.
- Verwende nur die Angaben der Aufgabe; fehlende technische oder rechtliche Details dürfen als Annahme gekennzeichnet werden.

Empfohlene Zeitverteilung:

| Aufgabe | Thema | Punkte | Minuten |
|---:|---|---:|---:|
| 1 | Außenkamera, Multimedia und Datenschutz | 20 | 18 |
| 2 | PoE, Leistung und USV | 16 | 14 |
| 3 | VLAN, Firewall und Diagnose | 19 | 17 |
| 4 | Verfügbarkeit, Backup, ITSM und Vertrag | 17 | 16 |
| 5 | Organisation, Change und Englisch | 13 | 12 |
| 6 | Datenmodell, Code und Prüfziffer | 15 | 13 |
| **Summe** |  | **100** | **90** |

## Ausgangssituation

Die `DonauLogistik GmbH` möchte den Außenbereich eines neuen Standorts mit sechs Netzwerkkameras überwachen. Das Gelände ist Wind, Regen und Temperaturen bis `−25 °C` ausgesetzt. Aufzeichnungen werden lokal auf einem NVR gespeichert. Verwaltung, Kameras, Server und Gäste befinden sich in getrennten VLANs.

Du unterstützt Auswahl, Dimensionierung, Netzkonfiguration, Datenschutz, Test und Übergabe. Die folgenden Anlagen gehören zur Aufgabe.

---

## Aufgabe 1 – Außenkamera, Multimedia und Datenschutz (20 Punkte)

### Anlage 1: Muss-Anforderungen

- Auflösung mindestens `2 560 × 1 440` bei `20 Bildern/s`;
- H.265-Unterstützung und durchschnittliche konfigurierte Bitrate `4 Mbit/s`;
- Außenbetrieb bei `−25 °C` bis `+45 °C`, direkte Bewitterung;
- Infrarotreichweite mindestens 40 m;
- Stromversorgung über den vorhandenen PoE+-Switch;
- integrierte Heizung gegen Vereisung und Kondensation;
- Aufbewahrung 14 Tage rund um die Uhr.

### Anlage 2: Kameradaten

| Merkmal | Kamera A | Kamera B |
|---|---|---|
| Auflösung/Bildrate | 2 688 × 1 520 bei 20 Bildern/s | 2 560 × 1 440 bei 25 Bildern/s |
| Codec | H.264/H.265 | H.264/H.265 |
| Schutzart | IP66 | IP54 |
| Temperaturbereich | −30 °C bis +55 °C | −10 °C bis +50 °C |
| Heizung | integriert | nicht vorhanden |
| Infrarot | 50 m | 60 m |
| Versorgung | PoE+, maximal 25,5 W mit Heizung | PoE, maximal 13 W |
| Nettopreis | 469,00 € | 329,00 € |

Für Speicherrechnungen gelten dezimale Einheiten: `1 MB = 1 000 000 Byte`, `1 TB = 1 000 000 MB`. Protokoll- und Dateisystem-Overhead wird nur durch die ausdrücklich verlangte Reserve berücksichtigt.

### 1.1 Produktauswahl (5 Punkte)

Wähle eine Kamera aus. Prüfe mindestens fünf Anforderungen und begründe, warum der niedrigere Preis allein nicht entscheidet.

### 1.2 Unkomprimiertes Einzelbild (4 Punkte)

Berechne die unkomprimierte Größe eines Bildes der Kamera A bei 24 Bit Farbtiefe. Gib das Ergebnis in Byte und MB an.

### 1.3 Speicherbedarf (6 Punkte)

Berechne den Speicherbedarf für sechs Kameras bei jeweils `4 Mbit/s`, 24 Stunden pro Tag und 14 Tagen. Ergänze anschließend 15 % Reserve und nenne eine sinnvolle minimale nutzbare Speicherkapazität in ganzen TB.

### 1.4 Datenschutz (2 Punkte)

Nenne zwei konkrete Maßnahmen, mit denen die Videoüberwachung datenschutzgerechter gestaltet wird. Mindestens eine Maßnahme muss bereits bei der Kamerakonfiguration umgesetzt werden.

### 1.5 Sampling, Raster und Vektor (3 Punkte)

Entscheide, ob ein Firmenlogo und ein Kamerafoto als Raster- oder Vektorgrafik gespeichert werden sollten. Begründe beide Entscheidungen.

Ein mono aufgenommenes Wartungskommentar wird mit `48 kHz` und `16 bit` für 10 Sekunden unkomprimiert gespeichert. Berechne die Datenmenge in Byte und MB.

---

## Aufgabe 2 – PoE, Leistung und USV (16 Punkte)

Im ungünstigsten Winterbetrieb benötigt jede Kamera `12 W` für die Elektronik und zusätzlich `8 W` für die Heizung. Der PoE-Switch benötigt ohne PoE-Verbraucher `45 W`, der NVR `80 W`. Für die USV-Auswahl wird ein Leistungsfaktor von `0,80` und eine Reserve von `25 %` gefordert.

### Anlage 3: USV-Modelle

| Modell | Scheinleistung | Wirkleistung | Batteriesystem |
|---|---:|---:|---|
| USV A | 500 VA | 300 W | 24 V / 12 Ah |
| USV B | 750 VA | 450 W | 24 V / 18 Ah |
| USV C | 1 000 VA | 600 W | 24 V / 18 Ah |

### 2.1 Wirkleistung (3 Punkte)

Berechne die gesamte maximale Wirkleistung von Kameras, Switch und NVR.

### 2.2 Scheinleistung und Auswahl (5 Punkte)

Berechne die erforderliche Scheinleistung und die geforderte Reserve für Wirk- und Scheinleistung. Wähle anschließend das kleinste passende USV-Modell. Beide Leistungsgrenzen müssen eingehalten werden.

### 2.3 Laufzeit (5 Punkte)

Für USV B dürfen 70 % der nominalen Batterieenergie genutzt werden. Der Wechselrichter arbeitet mit 85 % Wirkungsgrad. Schätze die Laufzeit bei der tatsächlichen Last aus Aufgabe 2.1 in Minuten.

### 2.4 Grenzen der USV (3 Punkte)

Nenne drei fachlich unterschiedliche Maßnahmen oder Hinweise, die zusätzlich zur USV für einen sicheren und verfügbaren Betrieb notwendig sind.

---

## Aufgabe 3 – VLAN, Firewall und Diagnose (19 Punkte)

### Anlage 4: Netzsegmente

| VLAN | Zweck | IPv4-Netz | Gateway |
|---:|---|---|---|
| 10 | Verwaltung | `10.40.10.0/27` | `10.40.10.1` |
| 20 | Kameras | `10.40.20.0/28` | `10.40.20.1` |
| 30 | Gäste | `10.40.30.0/26` | `10.40.30.1` |
| 40 | Server | `10.40.40.0/27` | `10.40.40.1` |

Der NVR hat `10.40.40.10`, der interne NTP-Server `10.40.40.20`. Kamerastreams verwenden in dieser Installation TCP 7447. Die Webadministration der Kameras soll ausschließlich per HTTPS erfolgen.

### 3.1 Subnetting (5 Punkte)

Bestimme für das Kameranetz `10.40.20.0/28` Netzadresse, Broadcastadresse, Hostbereich und Zahl der nutzbaren Hostadressen. Bewerte die Kapazität für sechs Kameras und ein Gateway.

### 3.2 Segmentierung und Firewall (6 Punkte)

Erkläre einen Nutzen der VLAN-Trennung und eine Sicherheitsgrenze von VLANs. Formuliere anschließend vier möglichst enge Firewallregeln für folgende Anforderungen:

- Verwaltung darf Kameras per HTTPS administrieren;
- Kameras dürfen Streams an den NVR senden;
- Kameras dürfen die Zeit am internen NTP-Server abfragen;
- Kameras dürfen keine beliebigen Internetverbindungen aufbauen.

Gib jeweils Quelle, Ziel, Transport/Port und Aktion an.

### 3.3 Diagnosefall (4 Punkte)

Von einem Verwaltungs-PC werden folgende Ergebnisse gemeldet:

```text
ipconfig: 10.40.10.22/27, Gateway 10.40.10.1, DNS 10.40.10.2
ping 10.40.10.1: erfolgreich
ping 10.40.20.14: erfolgreich
nslookup cam01.intern: 10.40.20.14
Test-NetConnection cam01.intern -Port 443: TcpTestSucceeded False
Test-NetConnection cam01.intern -Port 80:  TcpTestSucceeded True
```

Grenze den Fehler ein. Nenne zwei unwahrscheinliche Ursachen, die durch die Ergebnisse bereits weitgehend ausgeschlossen werden, und beschreibe zwei sinnvolle nächste Maßnahmen.

### 3.4 Diagnosebefehle unterscheiden (4 Punkte)

Erkläre jeweils die primäre Aussage von `ping`, `tracert`, `nslookup` und `Test-NetConnection -Port 443`. Nenne für jeden Befehl eine wichtige Grenze oder Fehlinterpretation.

---

## Aufgabe 4 – Verfügbarkeit, Backup, ITSM und Vertrag (17 Punkte)

Der Betreiber vereinbart für den Kameradienst eine monatliche Verfügbarkeit von `99,5 %`. Für die Rechnung wird ein Monat mit genau 30 Tagen angenommen. Im betrachteten Monat traten zwei ungeplante Ausfälle von 2 h 50 min und 1 h 05 min auf.

### 4.1 SLA-Auswertung (8 Punkte)

Berechne:

1. die maximal zulässige Ausfallzeit in Minuten und in Stunden/Minuten;
2. die tatsächliche Ausfallzeit;
3. die erreichte Verfügbarkeit in Prozent;
4. ob das Ziel erfüllt wurde und um wie viele Minuten es über- oder unterschritten wurde.

### 4.2 Restore-Kette (3 Punkte)

Am Sonntag wird eine Vollsicherung erstellt, von Montag bis Samstag jeweils eine inkrementelle Sicherung. Welche Sicherungen werden für den Stand Mittwochabend benötigt? Erkläre zusätzlich den Unterschied zu einer differenziellen Sicherung.

### 4.3 ITSM-Zuordnung (4 Punkte)

Ordne die Fälle `Incident`, `Problem`, `Service Request` oder `Change` zu:

1. Ein berechtigter Benutzer bestellt einen standardisierten Kamera-Lesezugriff.
2. Der NVR ist unerwartet ausgefallen.
3. Wiederkehrende NVR-Ausfälle werden auf ihre Grundursache untersucht.
4. Eine neue Firmware wird nach Pilot und Freigabe ausgerollt.

### 4.4 Vertragsstörung (2 Punkte)

Laut Bestellung müssen alle Kameras eine integrierte Heizung besitzen. Geliefert werden Modelle ohne Heizung. Benenne die Art der Abweichung und zwei sachgerechte erste Schritte des Käufers.

---

## Aufgabe 5 – Organisation, Change und technisches Englisch (13 Punkte)

Die Kameras werden zunächst an einem Tor pilotiert und danach abschnittsweise ausgerollt. Beteiligte sind Werkschutz, Datenschutz, Netzwerkbetrieb, Betriebsrat, Einkauf und die Beschäftigten am Standort.

### 5.1 Stakeholder (3 Punkte)

Nenne drei Stakeholder und jeweils ein konkretes Interesse oder Risiko, das im Projekt berücksichtigt werden muss.

### 5.2 Change und Rollout (2 Punkte)

Nenne zwei Maßnahmen, die Widerstand und Betriebsrisiko beim Rollout verringern. Begründe kurz ihre Wirkung.

### 5.3 Technisches Englisch (4 Punkte)

Lies die Herstellerangabe:

> The enclosure supports operation down to −30 °C only when the integrated heater is supplied via PoE+. The listed 12 W refers to the camera without the heater. Allow an additional 8 W per device in cold conditions.

Formuliere auf Deutsch zwei technische Bedingungen, die aus diesem Text für Auswahl und Dimensionierung folgen.

### 5.4 Nutzerinformation (2 Punkte)

Formuliere einen kurzen, zielgruppengerechten Hinweis für Beschäftigte zu Zweck und Ansprechpartner der Videoüberwachung. Erfinde keine konkrete Rechtsgrundlage oder Speicherfrist.

### 5.5 Aufbau- und Ablauforganisation (2 Punkte)

Grenze Aufbauorganisation und Ablauforganisation ab und ordne den schrittweisen Rollout einer der beiden Perspektiven zu.

---

## Aufgabe 6 – Datenmodell, Code und Prüfziffer (15 Punkte)

### 6.1 Einfaches ER-Modell (5 Punkte)

Für die Wartungsdokumentation gelten folgende Regeln:

- Ein Standort besitzt mehrere Kameras; jede Kamera gehört genau zu einem Standort.
- Zu einer Kamera können mehrere Wartungsvorgänge gespeichert werden; jeder Wartungsvorgang gehört genau zu einer Kamera.

Entwirf ein textuelles ER-Modell mit den Entitäten `Standort`, `Kamera` und `Wartung`. Nenne je einen Primärschlüssel, die erforderlichen Fremdschlüssel und beide Kardinalitäten.

### 6.2 Schreibtischtest und Grenzfehler (6 Punkte)

Eine Warnung soll gezählt werden, wenn die Temperatur **kleiner als −20 °C** ist.

```text
FUNCTION countColdWarnings(temperatures)
    count = 0
    FOR i = 0 TO LENGTH(temperatures) - 1
        IF temperatures[i] <= -20 THEN
            count = count + 1
        ENDIF
    ENDFOR
    RETURN count
ENDFUNCTION
```

Eingabe: `[-18, -24, -20, -27]`

Führe einen Schreibtischtest durch. Gib den Rückgabewert des vorhandenen Codes an, benenne den fachlichen Grenzfehler, korrigiere die Bedingung und gib den neuen Rückgabewert an.

### 6.3 Prüfziffer (4 Punkte)

Für eine interne Gerätenummer werden die Ziffern `4 0 7 1 2 3` von links abwechselnd mit `1` und `3` gewichtet. Die Prüfziffer ergänzt die gewichtete Summe auf das nächste Vielfache von 10; ist die Summe bereits durch 10 teilbar, lautet die Prüfziffer 0.

Berechne die Prüfziffer mit vollständigem Rechenweg.

---

## Abgabe

Notiere Bearbeitungsende, offene Teilaufgaben und drei Fachbegriffe, bei denen dir die deutsche Formulierung schwerfiel. Korrigiere anschließend mit `simulation-02-loesungen.md`.
