---
pruefung: AP1
typ: Pruefungssimulation
nummer: 01
thema: Supportarbeitsplätze planen, einrichten und übergeben
stand: 2026-09-11
sprache: Deutsch
bearbeitungszeit: 90 Minuten
gesamtpunkte: 100
loesungen: simulation-01-loesungen.md
---

# Prüfungssimulation 01 – Supportarbeitsplätze einrichten

## Prüfungsmodus

- Bearbeitungszeit: **90 Minuten**
- Gesamtpunktzahl: **100 Punkte**
- Bearbeite die Aufgaben ohne Lernunterlagen und öffne die Lösungsdatei erst nach der Abgabe.
- Gib Rechenweg, Einheit und sinnvolle Rundung an.
- Begründe Entscheidungen mit Anforderung, Eigenschaft und Wirkung.
- Antworten wie „ist besser“, „ist sicherer“ oder eine reine Produktnennung erhalten ohne Begründung keine volle Punktzahl.

Empfohlene Zeitverteilung:

| Aufgabe | Thema | Punkte | Minuten |
|---:|---|---:|---:|
| 1 | Kundenbedarf, Hardware und Schnittstellen | 16 | 14 |
| 2 | Beschaffung und Wirtschaftlichkeit | 17 | 16 |
| 3 | Netzwerk, VoIP und Diagnose | 20 | 18 |
| 4 | Sicherheit, Datenschutz und ITSM | 16 | 15 |
| 5 | Projektplanung und Qualitätssicherung | 15 | 13 |
| 6 | Code, Zahlensysteme und technisches Englisch | 16 | 14 |
| **Summe** |  | **100** | **90** |

## Ausgangssituation

Die `Alpenblick Service GmbH` ersetzt 24 Arbeitsplätze des internen Supports. Die Beschäftigten bearbeiten Tickets, führen nach Freigabe Remote-Sitzungen durch und telefonieren über VoIP. Jeder Arbeitsplatz erhält ein Notebook, eine Dockingstation, zwei Monitore und ein USB-Headset. Der Rollout muss spätestens in vier Wochen abgeschlossen sein.

Die Ticketanwendung wird über `https://tickets.intern` aufgerufen. Für Datenverkehr und VoIP werden getrennte VLANs verwendet. Du unterstützt Bedarfsermittlung, Beschaffung, Netzkonfiguration, Test und Übergabe.

---

## Aufgabe 1 – Kundenbedarf, Hardware und Schnittstellen (16 Punkte)

### Anlage 1: Gesprächsnotiz

> „Wir benötigen an jedem Platz zwei vorhandene Monitore mit 2 560 × 1 440 Pixeln bei 60 Hz. Das Notebook soll mit nur einem Kabel verbunden und mit mindestens 65 W geladen werden. Die Mitarbeitenden brauchen kabelgebundenes Gigabit-Ethernet. Ein älterer Dokumentenscanner und das Headset verwenden USB-A. Für die telefonische Arbeit darf beim Wechsel zwischen Netzteil und Dock keine Verbindung abbrechen.“

Das ausgewählte Notebook besitzt:

- `1 × USB-C/USB4` mit DisplayPort Alternate Mode und Power Delivery;
- `1 × USB-C` nur für Daten, ohne Video und ohne Ladeeingang;
- `1 × USB-A`;
- `1 × HDMI 2.0`;
- keinen RJ45-Anschluss.

### Anlage 2: Dockingstationen

| Merkmal | Dock Nord | Dock Süd |
|---|---|---|
| Anschluss zum Notebook | USB-C, DP Alt Mode | USB-C, Datenmodus |
| Ladeleistung | 65 W Power Delivery | 100 W Power Delivery |
| Monitoranschlüsse | 1 × DP 1.4, 1 × HDMI 2.0 | 2 × HDMI 1.4 |
| USB-A | 3 | 2 |
| Netzwerk | 1 Gbit/s RJ45 | kein Netzwerkanschluss |
| zwei QHD-Monitore bei 60 Hz | unterstützt | unterstützt nur bei zusätzlichem Adapter |
| Preis netto | 119,00 € | 104,00 € |

### 1.1 Anforderungen (4 Punkte)

Formuliere vier prüfbare Anforderungen aus der Gesprächsnotiz. Verwende jeweils eine messbare Eigenschaft oder ein eindeutiges Abnahmekriterium.

### 1.2 Auswahl (4 Punkte)

Wähle eine Dockingstation aus. Begründe die Entscheidung mit mindestens drei Anforderungen aus Anlage 1 und nenne einen Nachteil deiner Auswahl.

### 1.3 Begriffe abgrenzen (2 Punkte)

Grenze `USB-C`, `USB 3.2` und `DisplayPort Alternate Mode` voneinander ab.

### 1.4 Abnahmetest (4 Punkte)

Formuliere vier konkrete Testschritte mit jeweiligem Soll-Ergebnis für einen vollständig aufgebauten Musterarbeitsplatz.

### 1.5 Einweisung (2 Punkte)

Formuliere in zwei vollständigen Sätzen einen zielgruppengerechten Hinweis zum sicheren Anschließen und Entfernen der Dockingstation.

---

## Aufgabe 2 – Beschaffung und Wirtschaftlichkeit (17 Punkte)

### Anlage 3: Angebote für 24 Notebooks

| Merkmal | Anbieter Nord | Anbieter Süd |
|---|---:|---:|
| Listeneinkaufspreis je Notebook netto | 920,00 € | – |
| Liefererrabatt | 12 % | – |
| Liefererskonto bei fristgerechter Zahlung | 2 % | – |
| Bezugskosten gesamt | 180,00 € | im Preis enthalten |
| Gesamtpreis netto | zu berechnen | 18.940,00 € |
| Lieferzeit | 3 Wochen | 8 Wochen |
| Service | 36 Monate Vor-Ort | 12 Monate Bring-in |

Die Lieferzeit von höchstens vier Wochen und mindestens 36 Monate Service sind Muss-Kriterien.

Geldbeträge werden kaufmännisch auf Cent gerundet. Das Skonto wird vom Zieleinkaufspreis berechnet.

### 2.1 Bezugspreis (7 Punkte)

Berechne für Anbieter Nord den Listeneinkaufspreis, Zieleinkaufspreis, Bareinkaufspreis und Bezugspreis der 24 Notebooks.

### 2.2 Erweiterte Handelskalkulation (5 Punkte)

Für die folgende Verkaufskalkulation wird mit einem gerundeten Bezugspreis von `800,91 €` je Notebook gerechnet. Der Handlungskostenzuschlag beträgt 18 % des Bezugspreises, der Gewinnzuschlag 12 % der Selbstkosten, das Kundenskonto 2 % vom Zielverkaufspreis und der Kundenrabatt 10 % vom Listenverkaufspreis.

Berechne vorwärts den Selbstkostenpreis, Barverkaufspreis, Zielverkaufspreis und Netto-Listenverkaufspreis je Notebook.

### 2.3 Energieeinsparung (3 Punkte)

Ein alter Arbeitsplatz nimmt durchschnittlich 64 W auf, ein neuer 38 W. Beide laufen an 220 Arbeitstagen jeweils 8 Stunden. Berechne die jährliche Energie- und Kosteneinsparung für 24 Arbeitsplätze bei `0,36 €/kWh`.

### 2.4 Beschaffungsentscheidung (2 Punkte)

Entscheide dich für einen Anbieter. Berücksichtige Preis und Muss-Kriterien und formuliere eine nachvollziehbare Empfehlung.

---

## Aufgabe 3 – Netzwerk, VoIP und Diagnose (20 Punkte)

### Anlage 4: Netzplanung

| Verwendung | VLAN | IPv4-Netz | Gateway |
|---|---:|---|---|
| Support-PCs | 20 | `192.168.20.0/26` | `192.168.20.1` |
| IP-Telefone | 30 | `192.168.30.0/27` | `192.168.30.1` |

Für VLAN 30 werden 24 Telefonadressen benötigt. Die Ticketanwendung hat die Adresse `192.168.50.20` und den DNS-Namen `tickets.intern`.

Ein neuer PC zeigt nach dem Start:

```text
IPv4-Adresse  . . . . . . . . : 169.254.18.44
Subnetzmaske  . . . . . . . . : 255.255.0.0
Standardgateway . . . . . . . :
DNS-Server . . . . . . . . . :
```

### 3.1 Fehler eingrenzen (5 Punkte)

Interpretiere die Konfiguration. Nenne die wahrscheinlich betroffene Funktion und beschreibe drei Diagnose- oder Korrekturschritte in sinnvoller Reihenfolge. Nenne passende Befehle, sofern möglich.

### 3.2 Subnetting (5 Punkte)

Bestimme für `192.168.30.0/27`:

- Netzadresse;
- Broadcastadresse;
- ersten und letzten nutzbaren Host;
- Anzahl nutzbarer Hostadressen.

Bewerte, ob das Netz für 24 Telefone ausreicht.

### 3.3 Dienste und Ports (5 Punkte)

Ordne den folgenden Funktionen jeweils Protokoll, Transportprotokoll und typischen Port beziehungsweise Portbereich zu:

1. Namensauflösung;
2. automatische IPv4-Konfiguration;
3. verschlüsselter Webzugriff;
4. VoIP-Signalisierung mit TLS;
5. VoIP-Medienstrom.

### 3.4 VoIP-Bandbreite (3 Punkte)

Ein G.711-Strom erzeugt `64 kbit/s` Nutzdaten. Bei 20 ms Paketierungszeit entstehen 50 Pakete pro Sekunde. IPv4-, UDP- und RTP-Header belegen zusammen 40 Byte je Paket.

Berechne die Bandbreite je Richtung auf IP-Ebene sowie den Bedarf für 18 gleichzeitige Gespräche je Richtung und aggregiert für beide Richtungen. Layer-2-Overhead wird nicht berücksichtigt.

Nenne zusätzlich eine geeignete QoS-Maßnahme für die Sprachpakete und eine Grenze dieser Maßnahme.

### 3.5 Ping und Porttest (2 Punkte)

Erkläre, warum ein erfolgreicher `ping` die Funktion von HTTPS nicht beweist. Nenne einen geeigneten Windows-Befehl für den Test von TCP-Port 443.

---

## Aufgabe 4 – Sicherheit, Datenschutz und ITSM (16 Punkte)

Die Tickets enthalten Namen, Telefonnummern, Gerätenamen und Fehlerbeschreibungen. Remote-Sitzungen dürfen nur nach Zustimmung des betroffenen Beschäftigten gestartet werden. Administrationskonten sind getrennt von normalen Benutzerkonten.

### 4.1 Schutzziele und Maßnahmen (6 Punkte)

Nenne die drei klassischen Schutzziele der Informationssicherheit und leite für jedes Ziel eine passende technische oder organisatorische Maßnahme für die Ticket- und Remote-Support-Lösung ab. Begründe kurz die Wirkung.

### 4.2 Datenschutzgrundsätze (4 Punkte)

Nenne zwei einschlägige Datenschutzgrundsätze und beschreibe jeweils eine konkrete Umsetzung im Ticketsystem.

### 4.3 ITSM-Begriffe (4 Punkte)

Ordne jeden Fall genau einem Begriff zu: `Incident`, `Service Request`, `Problem`, `Change`.

| Fall | Begriff |
|---|---|
| Ein Benutzer bittet um Freischaltung eines genehmigten Standardzugriffs. |  |
| Die Ticketanwendung ist unerwartet nicht erreichbar. |  |
| Mehrere Ausfälle werden auf dieselbe noch unbekannte Ursache untersucht. |  |
| Ein getestetes Client-Update soll kontrolliert ausgerollt werden. |  |

### 4.4 VPN und MFA (2 Punkte)

Begründe, warum ein VPN die Mehrfaktor-Authentisierung für Remote-Administratoren nicht ersetzt.

---

## Aufgabe 5 – Projektplanung und Qualitätssicherung (15 Punkte)

### Anlage 5: Vorgänge des Rollouts

| Vorgang | Tätigkeit | Dauer in Arbeitstagen | Vorgänger |
|---|---|---:|---|
| A | Anforderungen freigeben | 2 | – |
| B | Hardware bereitstellen | 3 | A |
| C | VLAN konfigurieren | 2 | A |
| D | Client-Image erstellen | 4 | A |
| E | Pilot installieren und testen | 3 | B, C, D |
| F | Rollout durchführen | 2 | E |
| G | Einweisung und Abnahme | 1 | F |

### 5.1 Netzplan (7 Punkte)

Berechne für jeden Vorgang den frühesten Anfang und das früheste Ende. Bestimme Projektdauer, kritischen Pfad und Gesamtpuffer der Vorgänge B und C. Der erste Vorgang beginnt zum Zeitpunkt 0.

### 5.2 Grenzwertanalyse (4 Punkte)

Ein neues Passwort ist bei einer Länge von 12 bis einschließlich 64 Zeichen gültig. Nenne vier Testwerte, mit denen beide Grenzen möglichst effizient geprüft werden, und gib das erwartete Ergebnis an.

### 5.3 Testprotokoll (4 Punkte)

Nenne vier Angaben, die ein nachvollziehbares Testprotokoll enthalten muss. Mindestens eine Angabe muss den Vergleich von Soll und Ist ermöglichen.

---

## Aufgabe 6 – Code, Zahlensysteme und technisches Englisch (16 Punkte)

### Anlage 6: Pseudocode

```text
FUNCTION countWarnings(values)
    count = 0
    FOR i = 0 TO LENGTH(values)
        IF values[i] >= 80 THEN
            count = count + 1
        ENDIF
    ENDFOR
    RETURN count
ENDFUNCTION
```

Eingabe: `[79, 80, 95, 40]`

### 6.1 Schreibtischtest und Fehler (6 Punkte)

Führe den Ablauf für alle gültigen Indizes aus und notiere nach jedem Durchlauf `i`, `values[i]` und `count`. Benenne anschließend den Fehler, korrigiere die Schleifengrenze und gib den Rückgabewert der korrigierten Funktion an.

### 6.2 Zahlensysteme (4 Punkte)

Wandle die Dezimalzahl `173` in Dual-, Oktal- und Hexadezimaldarstellung um. Ein nachvollziehbarer Rechenweg muss für mindestens eine Umrechnung erkennbar sein.

### 6.3 Parität (2 Punkte)

Ergänze das Datenwort `1011011` um ein Paritätsbit für gerade Parität. Begründe das Ergebnis.

### 6.4 Technisches Englisch (2 Punkte)

Übersetze sinngemäß ins Deutsche:

> The current device does not meet the throughput requirement and must be replaced before rollout.

### 6.5 ASCII, Unicode und UTF-8 (2 Punkte)

Erkläre kurz das Verhältnis zwischen ASCII, Unicode und UTF-8. Gehe dabei auf Zeichenvorrat und Codierung ein.

---

## Abgabe

Notiere deine tatsächliche Bearbeitungszeit und markiere Aufgaben, bei denen du geraten hast. Öffne erst danach `simulation-01-loesungen.md` und korrigiere mit einer anderen Farbe.
