---
pruefung: AP1
typ: Musterloesung-und-bewertung
nummer: 01
stand: 2026-09-11
sprache: Deutsch-mit-russischen-lernkommentaren
gesamtpunkte: 100
aufgaben: simulation-01-arbeitsplatz-einrichten.md
---

# Lösungen zu Simulation 01

## Korrekturregeln

- Vergleiche zuerst Inhalt und Begründung, nicht einzelne Wörter.
- Vergib Teilpunkte für einen richtigen Ansatz mit erkennbarem Rechenweg.
- Ein richtiges Endergebnis ohne Rechenweg erhält bei Rechenaufgaben höchstens die Hälfte der vorgesehenen Punkte.
- Folgefehler werden nur einmal abgezogen, wenn der weitere Rechenweg mit dem eigenen Zwischenwert korrekt ist.
- Andere fachlich richtige Lösungen sind gleichwertig, wenn sie zur Situation passen.

| Aufgabe | Punkte |
|---:|---:|
| 1 | 16 |
| 2 | 17 |
| 3 | 20 |
| 4 | 16 |
| 5 | 15 |
| 6 | 16 |
| **Summe** | **100** |

---

## Aufgabe 1 – Kundenbedarf, Hardware und Schnittstellen (16 Punkte)

### 1.1 Anforderungen (4 Punkte)

Je eine passende, prüfbare Anforderung ergibt 1 Punkt, maximal 4 Punkte. Zum Beispiel:

1. Die Dockinglösung muss zwei vorhandene Monitore gleichzeitig mit jeweils `2 560 × 1 440` Pixeln und `60 Hz` ansteuern.
2. Das Notebook muss über ein einziges Dock-Kabel mit Daten, Bildsignalen und mindestens `65 W` Ladeleistung versorgt werden.
3. Der Arbeitsplatz muss eine kabelgebundene Ethernet-Verbindung mit `1 Gbit/s` bereitstellen.
4. Nach Anschluss beider Monitore müssen noch mindestens zwei nutzbare USB-A-Anschlüsse für Scanner und Headset verfügbar sein.
5. Beim Umstecken zwischen Netzteil und Dock darf die laufende Netzwerk- oder Telefonverbindung nicht unerwartet abbrechen.

**Русский комментарий:** требование должно быть проверяемым. Формулировка «хорошая Dockingstation» не содержит критерия приёмки.

### 1.2 Auswahl (4 Punkte)

**Musterantwort:**

`Dock Nord` ist auszuwählen. Es liefert die geforderten 65 W, besitzt Gigabit-Ethernet, stellt mit DisplayPort 1.4 und HDMI 2.0 zwei geeignete Monitorausgänge bereit und bietet genügend USB-A-Anschlüsse. Ein Nachteil ist der um 15,00 € höhere Nettopreis gegenüber Dock Süd.

Bewertung:

- richtige Auswahl: 1 Punkt;
- drei passende Muss-Kriterien: je 1 Punkt;
- ein richtiger Nachteil kann statt eines vierten Vorteils genannt werden; insgesamt maximal 4 Punkte.

Dock Süd verletzt bereits das Muss-Kriterium Ethernet und benötigt für die Monitore zusätzliche Komponenten.

### 1.3 Begriffe abgrenzen (2 Punkte)

- `USB-C` bezeichnet die physische Bauform des Steckers und der Buchse: 0,5 Punkte.
- `USB 3.2` bezeichnet einen Übertragungsstandard beziehungsweise eine mögliche Datenrate, nicht die Steckerform: 0,75 Punkte.
- `DisplayPort Alternate Mode` transportiert ein DisplayPort-Bildsignal über geeignete USB-C-Leitungen; USB-C allein garantiert diese Funktion nicht: 0,75 Punkte.

### 1.4 Abnahmetest (4 Punkte)

Je vollständiges Paar aus Handlung und Soll-Ergebnis 1 Punkt, zum Beispiel:

| Testschritt | Soll-Ergebnis |
|---|---|
| beide Monitore anschließen und Anzeigeeinstellungen prüfen | beide zeigen 2 560 × 1 440 bei 60 Hz, korrekte Anordnung |
| Notebook nur über das Dock betreiben | Ladezustand steigt oder bleibt unter Last stabil; mindestens 65 W werden ausgehandelt |
| Ethernet-Link und Dateiübertragung testen | Link mit 1 Gbit/s, freigegebener Dienst erreichbar, keine auffälligen Fehler |
| Scanner und Headset gleichzeitig per USB-A prüfen | beide Geräte werden erkannt und funktionieren ohne Abbruch |

Nur „Gerät testen“ ohne Sollwert ergibt keinen vollen Punkt.

### 1.5 Einweisung (2 Punkte)

**Musterantwort:**

> Stecken Sie das Dock-Kabel vollständig in den mit USB4 beziehungsweise DisplayPort gekennzeichneten USB-C-Anschluss, weil nur dieser Anschluss Bild und Ladeleistung unterstützt. Beenden Sie vor dem Abziehen laufende Dateiübertragungen und prüfen Sie danach, ob Netzwerk und Headset ordnungsgemäß auf die mobile Verbindung umgeschaltet haben.

- richtige Anschlussinformation: 1 Punkt;
- verständlicher Sicherheits- oder Funktionshinweis: 1 Punkt.

---

## Aufgabe 2 – Beschaffung und Wirtschaftlichkeit (17 Punkte)

### 2.1 Bezugspreis (7 Punkte)

```text
24 × 920,00 €                         = 22.080,00 € Listeneinkaufspreis
− 12 % Liefererrabatt                 =  2.649,60 €
                                        ----------
                                      = 19.430,40 € Zieleinkaufspreis
− 2 % Liefererskonto                  =    388,61 €
                                        ----------
                                      = 19.041,79 € Bareinkaufspreis
+ Bezugskosten                        =    180,00 €
                                        ----------
                                      = 19.221,79 € Bezugspreis netto
```

Bewertung:

- Listeneinkaufspreis: 1 Punkt;
- Rabattbetrag und Zieleinkaufspreis: zusammen 2 Punkte;
- Skontobetrag und Bareinkaufspreis: zusammen 2 Punkte;
- Bezugskosten und Bezugspreis: zusammen 1 Punkt;
- richtige Bezeichnungen, Rechenrichtung und Cent-Rundung: 1 Punkt.

**Русский комментарий:** скидка ведёт от `Listeneinkaufspreis` к `Zieleinkaufspreis`, Skonto — от Ziel к Bar, Bezugskosten затем прибавляются.

### 2.2 Erweiterte Handelskalkulation (5 Punkte)

```text
Bezugspreis                         =   800,91 €
+ 18 % Handlungskosten             =   144,16 €
                                      --------
Selbstkostenpreis                   =   945,07 €
+ 12 % Gewinn                      =   113,41 €
                                      --------
Barverkaufspreis                    = 1.058,48 €

Zielverkaufspreis = 1.058,48 € / 0,98 = 1.080,08 €
Listenverkaufspreis = 1.080,08 € / 0,90 = 1.200,09 € netto
```

- Selbstkostenpreis: 1 Punkt;
- Barverkaufspreis: 1 Punkt;
- Zielverkaufspreis mit Division durch 0,98: 1 Punkt;
- Listenverkaufspreis mit Division durch 0,90: 1 Punkt;
- richtige Zuschlagsbasen, Reihenfolge und Cent-Rundung: 1 Punkt.

**Русский комментарий:** Handlungskosten и Gewinn прибавляются как Zuschläge. Skonto и Rabatt уже содержатся в более высокой продажной цене, поэтому при расчёте вверх нужно делить на `0,98` и `0,90`, а не прибавлять 2 % и 10 %.

### 2.3 Energieeinsparung (3 Punkte)

```text
Leistungsdifferenz = 64 W − 38 W = 26 W = 0,026 kW
Betriebszeit je Gerät = 220 × 8 h = 1.760 h/a
Einsparung = 0,026 kW × 1.760 h × 24 = 1.098,24 kWh/a
Kosteneinsparung = 1.098,24 kWh × 0,36 €/kWh = 395,37 €/a
```

- Leistungsdifferenz, Umrechnung und Betriebszeit: 1 Punkt;
- Energie für 24 Geräte: 1 Punkt;
- Kosten mit Einheit und Rundung: 1 Punkt.

### 2.4 Beschaffungsentscheidung (2 Punkte)

**Musterantwort:**

Anbieter Nord ist auszuwählen, obwohl sein Bezugspreis von 19.221,79 € um 281,79 € über dem Angebot Süd liegt. Anbieter Süd verletzt mit acht Wochen Lieferzeit und nur zwölf Monaten Bring-in-Service beide Muss-Kriterien. Ein günstigeres Angebot, das Muss-Kriterien nicht erfüllt, ist nicht zuschlagsfähig.

- Preisunterschied und Prüfung der Muss-Kriterien: 1 Punkt;
- begründete Entscheidung für Nord: 1 Punkt.

---

## Aufgabe 3 – Netzwerk, VoIP und Diagnose (20 Punkte)

### 3.1 Fehler eingrenzen (5 Punkte)

Die Adresse aus `169.254.0.0/16` ist eine automatisch vergebene Link-Local-Adresse. Ein DHCP-Lease wurde sehr wahrscheinlich nicht bezogen; Gateway und DNS fehlen ebenfalls.

Sinnvolle Reihenfolge, zum Beispiel:

1. Strom, Link-LED, Kabel, Dock und Switchport prüfen.
2. Mit `ipconfig /all` Adapter, DHCP-Status und aktuelle Konfiguration prüfen.
3. Richtige VLAN-Zuordnung des Switchports sowie Erreichbarkeit von DHCP-Server oder DHCP-Relay prüfen; anschließend mit `ipconfig /release` und `ipconfig /renew` einen neuen Lease anfordern.

Bewertung:

- Link-Local/APIPA erkannt: 1 Punkt;
- DHCP als betroffene Funktion erkannt: 1 Punkt;
- drei sinnvolle Schritte in diagnostischer Reihenfolge: je 1 Punkt.

`ping tickets.intern` ist zu diesem Zeitpunkt kein guter erster Schritt, weil noch keine reguläre Adresse, kein Gateway und kein DNS-Server vorhanden sind.

### 3.2 Subnetting (5 Punkte)

| Größe | Ergebnis |
|---|---|
| Präfix/Blockgröße | `/27`, 32 Adressen |
| Netzadresse | `192.168.30.0` |
| erster Host | `192.168.30.1` |
| letzter Host | `192.168.30.30` |
| Broadcast | `192.168.30.31` |
| nutzbare Hosts | 30 |

Das Netz reicht für 24 Telefone aus; sechs nutzbare Hostadressen bleiben für weitere Endpunkte oder Reserven. Das Gateway belegt bereits eine der nutzbaren Adressen, daher bleiben nach Gateway und 24 Telefonen fünf freie Adressen.

- Netz und Broadcast: je 1 Punkt;
- Hostbereich: 1 Punkt;
- Anzahl 30: 1 Punkt;
- richtige Bewertung einschließlich Gateway/Reserve: 1 Punkt.

### 3.3 Dienste und Ports (5 Punkte)

| Funktion | Protokoll | Transport/Port |
|---|---|---|
| Namensauflösung | DNS | UDP 53, bei Bedarf auch TCP 53 |
| automatische IPv4-Konfiguration | DHCPv4 | UDP 67 Server / UDP 68 Client |
| verschlüsselter Webzugriff | HTTPS | TCP 443; HTTP/3 kann UDP 443 verwenden, war hier nicht verlangt |
| VoIP-Signalisierung mit TLS | SIP over TLS | typischerweise TCP 5061 |
| VoIP-Medienstrom | RTP/SRTP | typischerweise dynamisch ausgehandelte UDP-Ports |

Je vollständige, passende Zuordnung 1 Punkt. Bei RTP ist die Aussage „Port 5060“ falsch, weil 5060 typischerweise zur SIP-Signalisierung gehört.

### 3.4 VoIP-Bandbreite (3 Punkte)

```text
Payload je Paket = 64.000 bit/s × 0,020 s ÷ 8 = 160 Byte
Paket auf IP-Ebene = 160 Byte + 40 Byte = 200 Byte
Bandbreite je Richtung = 200 × 8 × 50 = 80.000 bit/s = 80 kbit/s
18 Gespräche je Richtung = 18 × 80 kbit/s = 1.440 kbit/s = 1,44 Mbit/s
aggregiert beide Richtungen = 2 × 1,44 Mbit/s = 2,88 Mbit/s
```

- 80 kbit/s je Richtung: 1 Punkt;
- 1,44 Mbit/s je Richtung sowie 2,88 Mbit/s aggregiert: zusammen 1 Punkt;
- passende QoS-Maßnahme mit Grenze: 1 Punkt.

Eine geeignete QoS-Maßnahme ist, RTP-Verkehr zu klassifizieren, mit einer freigegebenen DSCP-Klasse zu markieren und in einer begrenzten Prioritätswarteschlange zu behandeln. QoS erzeugt keine zusätzliche Bandbreite und wirkt nur, wenn die beteiligten Netzkomponenten die Markierung und Queue-Policy durchgängig umsetzen. Eine reale Planung ergänzt außerdem Layer-2-, Tunnel- und Sicherheits-Overhead sowie Reserve.

### 3.5 Ping und Porttest (2 Punkte)

`ping` prüft ICMP-Erreichbarkeit und Laufzeit, aber weder einen offenen TCP-Port noch TLS oder die HTTPS-Anwendung. Unter Windows kann zum Beispiel folgender Test verwendet werden:

```powershell
Test-NetConnection tickets.intern -Port 443
```

- fachliche Grenze von ping: 1 Punkt;
- passender Porttest: 1 Punkt.

---

## Aufgabe 4 – Sicherheit, Datenschutz und ITSM (16 Punkte)

### 4.1 Schutzziele und Maßnahmen (6 Punkte)

Je Ziel 1 Punkt und je passende, begründete Maßnahme 1 Punkt:

| Schutzziel | Maßnahme und Wirkung |
|---|---|
| Vertraulichkeit | Rollen und Least Privilege, MFA und verschlüsselte Verbindungen verhindern beziehungsweise erschweren unbefugtes Lesen und Administrieren. |
| Integrität | manipulationsgeschützte Protokollierung, geregelte Änderungen und Eingabevalidierung machen unzulässige Änderungen erkennbar oder verhindern sie. |
| Verfügbarkeit | Monitoring, Wiederanlaufplan, getestete Backups und angemessene Redundanz verkürzen Ausfälle und ermöglichen Wiederherstellung. |

Andere fallbezogene Maßnahmen sind möglich. Eine Maßnahme muss zum genannten Ziel passen; „Firewall für alles“ ohne Wirkungsbezug genügt nicht.

### 4.2 Datenschutzgrundsätze (4 Punkte)

Je Grundsatz mit konkreter Umsetzung 2 Punkte, zum Beispiel:

- `Datenminimierung`: Im Ticket werden nur für Bearbeitung und Nachweis erforderliche Kontakt- und Gerätedaten erfasst; freie Textfelder werden nicht für unnötige Privatangaben verwendet.
- `Zweckbindung`: Ticketdaten werden nur für Support, vereinbarte Nachweise und festgelegte Folgeprozesse genutzt, nicht ungeprüft für Leistungsüberwachung.
- `Speicherbegrenzung`: Tickets werden nach festgelegten Fristen gelöscht oder anonymisiert.
- `Integrität und Vertraulichkeit`: rollenbasierter Zugriff, MFA, TLS und Protokollierung schützen die Daten.

**Русский комментарий:** нужно не только назвать принцип DSGVO, но и показать его реализацию именно в данном Ticketsystem.

### 4.3 ITSM-Begriffe (4 Punkte)

| Fall | Begriff |
|---|---|
| genehmigter Standardzugriff | Service Request |
| Ticketanwendung unerwartet nicht erreichbar | Incident |
| wiederkehrende Ausfälle und unbekannte Grundursache | Problem |
| kontrollierter Rollout eines Updates | Change |

Je richtige Zuordnung 1 Punkt.

### 4.4 VPN und MFA (2 Punkte)

Ein VPN verschlüsselt und begrenzt den Netzwerkpfad, bestätigt aber nicht automatisch mit zwei unabhängigen Faktoren die Identität des Administrators. Werden Zugangsdaten gestohlen, reduziert MFA das Risiko einer allein damit möglichen Anmeldung; Berechtigungen und sichere Endgeräte bleiben zusätzlich erforderlich.

- unterschiedliche Schutzwirkung erklärt: 1 Punkt;
- Risiko kompromittierter Zugangsdaten beziehungsweise Identität genannt: 1 Punkt.

---

## Aufgabe 5 – Projektplanung und Qualitätssicherung (15 Punkte)

### 5.1 Netzplan (7 Punkte)

| Vorgang | FAZ | FEZ | spätester Anfang | Gesamtpuffer |
|---|---:|---:|---:|---:|
| A | 0 | 2 | 0 | 0 |
| B | 2 | 5 | 3 | 1 |
| C | 2 | 4 | 4 | 2 |
| D | 2 | 6 | 2 | 0 |
| E | 6 | 9 | 6 | 0 |
| F | 9 | 11 | 9 | 0 |
| G | 11 | 12 | 11 | 0 |

- korrekte Vorwärtsrechnung bis E: 2 Punkte;
- korrekte weitere Vorwärtsrechnung: 1 Punkt;
- Projektdauer 12 Arbeitstage: 1 Punkt;
- kritischer Pfad `A–D–E–F–G`: 1 Punkt;
- Gesamtpuffer B = 1 Tag: 1 Punkt;
- Gesamtpuffer C = 2 Tage: 1 Punkt.

### 5.2 Grenzwertanalyse (4 Punkte)

| Länge | Erwartung |
|---:|---|
| 11 | ungültig |
| 12 | gültig |
| 64 | gültig |
| 65 | ungültig |

Je richtiges Wertepaar aus Eingabe und Erwartung 1 Punkt. Zusätzliche Normalwerte ersetzen keine fehlende Grenzseite.

### 5.3 Testprotokoll (4 Punkte)

Je passende Angabe 1 Punkt, maximal 4 Punkte:

- eindeutige Testfall-ID, Version und Datum;
- Testvoraussetzungen und verwendete Konfiguration;
- konkrete Eingabe oder Testschritte;
- erwartetes Ergebnis als Soll;
- tatsächliches Ergebnis als Ist;
- Status bestanden/nicht bestanden;
- Abweichung, Beleg und Fehler-ID;
- Tester und gegebenenfalls Freigabe.

Mindestens Soll und Ist müssen erkennbar sein, sonst maximal 3 Punkte.

---

## Aufgabe 6 – Code, Zahlensysteme und technisches Englisch (16 Punkte)

### 6.1 Schreibtischtest und Fehler (6 Punkte)

Für die gültigen Indizes:

| i | values[i] | Bedingung `>= 80` | count danach |
|---:|---:|---|---:|
| 0 | 79 | falsch | 0 |
| 1 | 80 | wahr | 1 |
| 2 | 95 | wahr | 2 |
| 3 | 40 | falsch | 2 |

Bei `i = 4` greift der Code außerhalb des Arrays zu. Das ist ein Off-by-one- beziehungsweise Indexfehler. Die Schleife muss lauten:

```text
FOR i = 0 TO LENGTH(values) - 1
```

Die korrigierte Funktion gibt `2` zurück.

Bewertung:

- vier korrekte Tabellenzeilen: zusammen 3 Punkte;
- ungültigen Index 4 erkannt: 1 Punkt;
- Grenze `LENGTH(values) - 1`: 1 Punkt;
- Rückgabewert 2: 1 Punkt.

### 6.2 Zahlensysteme (4 Punkte)

```text
173 = 128 + 32 + 8 + 4 + 1
173₁₀ = 10101101₂
173₁₀ = 255₈
173₁₀ = AD₁₆
```

Kontrolle über Hexadezimal:

```text
A × 16 + D = 10 × 16 + 13 = 173
```

- Dual: 1 Punkt;
- Oktal: 1 Punkt;
- Hexadezimal: 1 Punkt;
- nachvollziehbarer Weg oder Gegenprobe: 1 Punkt.

### 6.3 Parität (2 Punkte)

`1011011` enthält fünf Einsen. Für gerade Parität wird deshalb das Paritätsbit `1` ergänzt, sodass insgesamt sechs Einsen übertragen werden.

- Anzahl der Einsen richtig: 1 Punkt;
- Paritätsbit 1 mit Begründung: 1 Punkt.

### 6.4 Technisches Englisch (2 Punkte)

> Das aktuelle Gerät erfüllt die Durchsatzanforderung nicht und muss vor dem Rollout ersetzt werden.

- `current device` und `throughput requirement` sinngemäß richtig: 1 Punkt;
- Handlungs- und Zeitbezug richtig: 1 Punkt.

### 6.5 ASCII, Unicode und UTF-8 (2 Punkte)

ASCII definiert einen kleinen Zeichenvorrat, in der ursprünglichen Form mit 128 Codepositionen. Unicode ordnet Zeichen aus vielen Schriftsystemen Codepoints zu; UTF-8 ist eine variable Codierung dieser Unicode-Codepoints in Bytefolgen und stimmt für die ersten 128 Zeichen mit ASCII überein.

- Zeichenvorrat ASCII gegenüber Unicode: 1 Punkt;
- UTF-8 als Codierung und ASCII-Kompatibilität: 1 Punkt.

---

## Auswertung nach der Korrektur

Notiere nicht nur die Punktzahl, sondern ordne jeden Verlust einer Ursache zu:

| Fehlerart | Beispiel | Nächste Maßnahme |
|---|---|---|
| Wissen | Port oder Begriff unbekannt | Kapitel und Fachbegriffe aktiv abrufen |
| Anwendung | Anforderung nicht auf Fall übertragen | zwei neue Fallvarianten lösen |
| Rechnen | Einheit, Basis oder Rundung falsch | Schema erneut ohne Zeitdruck und dann unter Zeit |
| Sprache | Begründung unvollständig | Satzmuster `weil … dadurch …` trainieren |
| Zeit | Aufgabe nicht erreicht | feste Zwischenmarken bei Minute 30 und 60 setzen |

Wiederhole nur die fehlerhaften Teilaufgaben nach 24 bis 48 Stunden ohne Blick in diese Datei.
