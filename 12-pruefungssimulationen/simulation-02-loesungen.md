---
pruefung: AP1
typ: Musterloesung-und-bewertung
nummer: 02
stand: 2026-09-11
sprache: Deutsch-mit-russischen-lernkommentaren
gesamtpunkte: 100
aufgaben: simulation-02-netzwerk-und-sicherheit.md
---

# Lösungen zu Simulation 02

## Korrekturregeln

- Andere fachlich richtige und passend begründete Lösungen sind anzuerkennen.
- Bei Rechnungen zählen Ansatz, Einheit, Zwischenschritte und Ergebnis.
- Ein Folgefehler wird nicht in jedem weiteren Schritt erneut vollständig abgezogen.
- Eine Maßnahme ohne Bezug zum beschriebenen Risiko erhält nicht automatisch die volle Punktzahl.
- Rechtliche Antworten werden nur im in der Aufgabe verlangten Grundumfang bewertet; erfundene Fristen oder Rechtsgrundlagen sind kein Vorteil.

| Aufgabe | Punkte |
|---:|---:|
| 1 | 20 |
| 2 | 16 |
| 3 | 19 |
| 4 | 17 |
| 5 | 13 |
| 6 | 15 |
| **Summe** | **100** |

---

## Aufgabe 1 – Außenkamera, Multimedia und Datenschutz (20 Punkte)

### 1.1 Produktauswahl (5 Punkte)

`Kamera A` ist auszuwählen.

| Anforderung | Bewertung Kamera A |
|---|---|
| Auflösung/Bildrate | 2 688 × 1 520 bei 20 Bildern/s erfüllt die Mindestwerte |
| Codec | H.265 wird unterstützt |
| Außenbetrieb | IP66 ist für die direkte Bewitterung geeigneter als IP54 |
| Temperatur | −30 °C bis +55 °C deckt −25 °C bis +45 °C ab |
| Heizung | integriert; geforderter Kältebetrieb und Kondensationsschutz können umgesetzt werden |
| Infrarot | 50 m übertrifft die geforderten 40 m |
| Versorgung | PoE+ ist vorgesehen; Leistungsbudget muss 25,5 W je Port abdecken |

Kamera B ist zwar 140,00 € günstiger, verletzt aber Temperatur-, Schutzart- und Heizungsanforderungen. Ein Produkt, das Muss-Kriterien nicht erfüllt, wird nicht allein wegen des Preises gewählt.

Bewertung:

- Kamera A: 1 Punkt;
- vier richtige Kriterien einschließlich mindestens eines Ausschlussgrunds von B: bis 3 Punkte;
- Preis gegen Muss-Kriterien richtig bewertet: 1 Punkt.

**Русский комментарий:** ключ к задаче — не «какая камера мощнее», а какая выполняет все Muss-Kriterien. Отопление входит в расчёт PoE.

### 1.2 Unkomprimiertes Einzelbild (4 Punkte)

```text
Pixel = 2.688 × 1.520 = 4.085.760 Pixel
Farbtiefe = 24 bit = 3 Byte je Pixel
Größe = 4.085.760 × 3 Byte
      = 12.257.280 Byte
      = 12,25728 MB ≈ 12,26 MB
```

- Pixelzahl: 1 Punkt;
- Umrechnung 24 bit zu 3 Byte: 1 Punkt;
- Byte-Ergebnis: 1 Punkt;
- MB-Ergebnis mit dezimaler Einheit: 1 Punkt.

### 1.3 Speicherbedarf (6 Punkte)

```text
Gesamtbitrate = 6 × 4 Mbit/s = 24 Mbit/s
Zeit = 14 × 24 × 60 × 60 s = 1.209.600 s
Datenmenge = 24 Mbit/s × 1.209.600 s
           = 29.030.400 Mbit
           = 3.628.800 MB
           = 3,6288 TB
mit 15 % Reserve = 3,6288 TB × 1,15
                 = 4,17312 TB
```

Es sind mindestens **5 TB nutzbare Kapazität** bereitzustellen, wenn nur ganze TB gewählt werden können. Bruttokapazität eines Datenträgerverbunds kann wegen Dateisystem, Redundanz und Herstellerangaben höher sein.

- Gesamtbitrate: 1 Punkt;
- Zeit in Sekunden: 1 Punkt;
- Division durch 8 und Ergebnis ohne Reserve: 2 Punkte;
- 15-%-Reserve: 1 Punkt;
- auf mindestens 5 TB nutzbar aufgerundete Auswahl: 1 Punkt.

### 1.4 Datenschutz (2 Punkte)

Je konkrete Maßnahme 1 Punkt, maximal 2 Punkte, zum Beispiel:

- Bildausschnitt und Privacy Masking so konfigurieren, dass öffentliche Wege oder nicht erforderliche Arbeitsbereiche nicht erfasst werden.
- Zweck, Verantwortlichkeit, Zugriffsrollen, Aufbewahrung und Löschung vor Inbetriebnahme festlegen und dokumentieren.
- Betroffene transparent informieren und einen erreichbaren Ansprechpartner nennen.
- Zugriff rollenbasiert begrenzen, protokollieren und technisch schützen.
- Aufbewahrungsdauer auf das erforderliche Maß begrenzen und automatische Löschung testen.

Mindestens eine Maßnahme muss die Kamera- oder Bildeinstellung betreffen.

### 1.5 Sampling, Raster und Vektor (3 Punkte)

- Firmenlogo: Vektorgrafik, weil geometrische Formen ohne Qualitätsverlust skaliert und sauber gedruckt werden können: 1 Punkt.
- Kamerafoto: Rastergrafik, weil komplexe Helligkeits- und Farbwerte als Pixel aufgenommen werden: 1 Punkt.

```text
48.000 Samples/s × 16 bit/Sample × 1 Kanal × 10 s ÷ 8
= 960.000 Byte = 0,96 MB
```

Richtige Samplingrechnung mit Byte- und MB-Ergebnis: 1 Punkt.

---

## Aufgabe 2 – PoE, Leistung und USV (16 Punkte)

### 2.1 Wirkleistung (3 Punkte)

```text
Kameras = 6 × (12 W + 8 W) = 120 W
Switch ohne PoE-Verbraucher = 45 W
NVR = 80 W
Gesamtlast P = 120 W + 45 W + 80 W = 245 W
```

- Kameralast einschließlich Heizung: 1 Punkt;
- Switch und NVR: 1 Punkt;
- Gesamtlast 245 W: 1 Punkt.

### 2.2 Scheinleistung und Auswahl (5 Punkte)

```text
S = P / cos φ = 245 W / 0,80 = 306,25 VA

Wirkleistungsgrenze mit Reserve:
245 W × 1,25 = 306,25 W

Scheinleistungsgrenze mit Reserve:
306,25 VA × 1,25 = 382,8125 VA ≈ 382,82 VA
```

`USV A` erfüllt zwar die VA-Grenze, aber mit 300 W nicht die geforderten 306,25 W. `USV B` ist mit 750 VA und 450 W das kleinste passende Modell. USV C wäre ebenfalls ausreichend, ist aber für die gestellte Auswahl nicht minimal.

- Formel und Scheinleistung: 1 Punkt;
- Wirkleistungsreserve: 1 Punkt;
- Scheinleistungsreserve: 1 Punkt;
- beide Grenzwerte der Modelle geprüft: 1 Punkt;
- USV B richtig gewählt: 1 Punkt.

**Русский комментарий:** VA и W — две разные границы USV. Нельзя выбрать модель только по большей цифре VA.

### 2.3 Laufzeit (5 Punkte)

```text
nominale Energie = 24 V × 18 Ah = 432 Wh
nutzbare Batterieenergie = 432 Wh × 0,70 = 302,4 Wh
nach Wechselrichter = 302,4 Wh × 0,85 = 257,04 Wh
Laufzeit = 257,04 Wh / 245 W = 1,0491 h
         = 62,95 min ≈ 63 min
```

- nominale Energie: 1 Punkt;
- nutzbarer Anteil: 1 Punkt;
- Wirkungsgrad: 1 Punkt;
- Division durch Last: 1 Punkt;
- etwa 63 Minuten mit Einheit: 1 Punkt.

Die Rechnung ist eine Schätzung; reale Laufzeit hängt unter anderem von Batteriealter, Temperatur, Lastkurve und Herstellerkennlinie ab.

### 2.4 Grenzen der USV (3 Punkte)

Je fachlich eigenständiger Hinweis 1 Punkt, zum Beispiel:

- Eine USV ist kein Backup; Aufzeichnungen und Konfigurationen benötigen ein eigenes Sicherungs- und Restorekonzept.
- Batterien müssen überwacht, turnusmäßig getestet und nach Zustand ersetzt werden.
- Für längere Ausfälle werden geregeltes Herunterfahren, Ersatzstrom oder ein Wiederanlaufplan benötigt.
- PoE-Portleistung und Gesamtbudget des Switches müssen unabhängig von der USV geprüft werden.
- Arbeiten an elektrischen Anlagen dürfen nur im zulässigen Rahmen und nach Sicherheitsregeln durchgeführt werden.

---

## Aufgabe 3 – VLAN, Firewall und Diagnose (19 Punkte)

### 3.1 Subnetting (5 Punkte)

| Größe | Ergebnis |
|---|---|
| Netzadresse | `10.40.20.0` |
| erster Host | `10.40.20.1` |
| letzter Host | `10.40.20.14` |
| Broadcast | `10.40.20.15` |
| nutzbare Hosts | 14 |

Nach sechs Kameras und einem Gateway bleiben sieben nutzbare Adressen frei. Das Netz ist für die angegebene Belegung ausreichend.

- Netz und Broadcast: je 1 Punkt;
- Hostbereich: 1 Punkt;
- 14 nutzbare Adressen: 1 Punkt;
- richtige Kapazitätsbewertung: 1 Punkt.

### 3.2 Segmentierung und Firewall (6 Punkte)

VLANs trennen Broadcast-Domänen und ermöglichen getrennte Adressierung sowie differenzierte Regeln. Ein VLAN verschlüsselt aber keine Daten und ist allein keine vollständige Zugriffskontrolle; der Verkehr zwischen Segmenten muss über kontrollierte Layer-3- und Firewallregeln geführt werden.

Mögliche Regeln:

| Quelle | Ziel | Transport/Port | Aktion |
|---|---|---|---|
| `10.40.10.0/27` | `10.40.20.0/28` | TCP 443 | erlauben |
| `10.40.20.0/28` | `10.40.40.10` | TCP 7447 | erlauben |
| `10.40.20.0/28` | `10.40.40.20` | UDP 123 | erlauben |
| `10.40.20.0/28` | Internet/beliebig | alle nicht ausdrücklich erlaubten Verbindungen | verweigern und angemessen protokollieren |

- Nutzen und Grenze von VLAN: zusammen 2 Punkte;
- vier enge, vollständige Regeln: je 1 Punkt.

DNS oder weitere Herstellerdienste müssten bei tatsächlichem Bedarf als eigene, begrenzte Regeln ergänzt werden. Eine pauschale Regel `Kameras → any allow` widerspricht der Anforderung.

### 3.3 Diagnosefall (4 Punkte)

Die lokale Konfiguration, das Gateway, der Layer-3-Pfad zur Kamera und die DNS-Auflösung funktionieren. TCP 80 ist erreichbar, TCP 443 dagegen nicht. Der Fehler liegt daher wahrscheinlich am nicht aktivierten HTTPS-Dienst, an dessen Listener-/Zertifikatskonfiguration oder an einer spezifischen Portregel; ein allgemeiner Routing- oder DNS-Fehler ist unwahrscheinlich.

Sinnvolle nächste Schritte:

1. Kamerakonfiguration und lokale Service-/Systemlogs prüfen, HTTPS aktivieren und ein gültiges Zertifikat beziehungsweise die vorgesehene sichere Verwaltung konfigurieren.
2. Host- und Netzwerkregeln für TCP 443 gezielt prüfen und danach erneut testen; unsicheres HTTP nicht einfach dauerhaft als Ersatz freigeben.

Bewertung:

- Fehler auf HTTPS/Port/Service eingegrenzt: 1 Punkt;
- DNS als weitgehend ausgeschlossen: 0,5 Punkte;
- grundlegendes Routing/Erreichbarkeit als weitgehend ausgeschlossen: 0,5 Punkte;
- zwei passende nächste Maßnahmen: je 1 Punkt.

### 3.4 Diagnosebefehle unterscheiden (4 Punkte)

Je vollständige Aussage aus Zweck und Grenze 1 Punkt:

| Befehl | Aussage | wichtige Grenze |
|---|---|---|
| `ping` | prüft ICMP-Erreichbarkeit und Laufzeit | beweist keinen offenen Anwendungsport; ICMP kann gefiltert sein |
| `tracert` | zeigt sichtbare Hops über ablaufende TTL-Werte | Sterne beweisen keinen Leitungsabbruch; Rückwege können abweichen |
| `nslookup` | fragt DNS-Auflösung ab | richtige Adresse beweist nicht die Erreichbarkeit des Dienstes |
| `Test-NetConnection -Port 443` | versucht eine TCP-Verbindung zu Port 443 | beweist noch keine erfolgreiche TLS-, Anmeldung- oder Anwendungsfunktion |

---

## Aufgabe 4 – Verfügbarkeit, Backup, ITSM und Vertrag (17 Punkte)

### 4.1 SLA-Auswertung (8 Punkte)

```text
Gesamtzeit = 30 × 24 × 60 min = 43.200 min
zulässiger Ausfall = 43.200 min × (1 − 0,995)
                   = 216 min = 3 h 36 min

tatsächlicher Ausfall = 2 h 50 min + 1 h 05 min
                      = 170 min + 65 min
                      = 235 min = 3 h 55 min

Verfügbarkeit = (43.200 − 235) / 43.200 × 100 %
               = 99,4560 % ≈ 99,46 %

Überschreitung = 235 min − 216 min = 19 min
```

Das SLA-Ziel wurde um 19 Minuten verfehlt.

- Gesamtzeit und zulässige Minuten: 2 Punkte;
- Umrechnung zu 3 h 36 min: 1 Punkt;
- tatsächliche Ausfallzeit: 1 Punkt;
- richtige Verfügbarkeitsformel: 1 Punkt;
- Ergebnis etwa 99,46 %: 1 Punkt;
- Zielbewertung: 1 Punkt;
- Abweichung 19 Minuten: 1 Punkt.

### 4.2 Restore-Kette (3 Punkte)

Für den Stand Mittwochabend werden benötigt:

1. Vollsicherung vom Sonntag;
2. inkrementelle Sicherung vom Montag;
3. inkrementelle Sicherung vom Dienstag;
4. inkrementelle Sicherung vom Mittwoch.

Eine inkrementelle Sicherung enthält Änderungen seit der jeweils vorherigen Sicherung. Eine differenzielle Sicherung enthält dagegen alle Änderungen seit der letzten Vollsicherung; für Mittwoch wären dann nur Sonntag und die differenzielle Mittwochssicherung erforderlich.

- vollständige Restore-Kette: 2 Punkte;
- richtige Abgrenzung zur differenziellen Sicherung: 1 Punkt.

### 4.3 ITSM-Zuordnung (4 Punkte)

| Fall | Begriff |
|---:|---|
| 1 | Service Request |
| 2 | Incident |
| 3 | Problem |
| 4 | Change |

Je richtige Zuordnung 1 Punkt.

### 4.4 Vertragsstörung (2 Punkte)

Es liegt eine nicht vertragsgemäße Leistung beziehungsweise ein Sachmangel vor; bei Lieferung eines anderen als des bestellten Modells kann auch von einer Falschlieferung gesprochen werden. Der Käufer dokumentiert und prüft die Abweichung, meldet sie unverzüglich an den Lieferanten und verlangt die vertraglich geschuldete Nacherfüllung innerhalb einer angemessenen Frist.

- Abweichung fachlich richtig eingeordnet: 1 Punkt;
- zwei sinnvolle erste Schritte zusammen: 1 Punkt.

Pauschale Aussagen zu Rücktritt oder Schadensersatz ohne Voraussetzungen waren nicht verlangt.

---

## Aufgabe 5 – Organisation, Change und technisches Englisch (13 Punkte)

### 5.1 Stakeholder (3 Punkte)

Je passendes Paar aus Stakeholder und Interesse/Risiko 1 Punkt, zum Beispiel:

| Stakeholder | Interesse oder Risiko |
|---|---|
| Werkschutz | ausreichende Bildqualität, schnelle Ereignisaufklärung, Bedienbarkeit |
| Datenschutz | Erforderlichkeit, Bildausschnitt, Transparenz, Zugriff und Löschung |
| Netzwerkbetrieb | Adressierung, PoE-Budget, Segmentierung, Monitoring und Wartbarkeit |
| Betriebsrat | Auswirkungen auf Beschäftigte und mögliche Verhaltens- oder Leistungskontrolle |
| Einkauf | Muss-Kriterien, Liefertermin, Preis und Vertragsleistung |
| Beschäftigte | verständliche Information, Schutz vor unnötiger Erfassung, Ansprechpartner |

### 5.2 Change und Rollout (2 Punkte)

Je begründete Maßnahme 1 Punkt, zum Beispiel:

- Ein Pilot an einem Tor deckt technische und organisatorische Fehler mit begrenzter Auswirkung auf.
- Frühzeitige, zielgruppengerechte Kommunikation erklärt Zweck, Änderungen und Ansprechpartner und reduziert Unsicherheit.
- Schulung und kurze Betriebsanweisung reduzieren Bedienfehler.
- Abschnittsweiser Rollout mit Rückfallplan begrenzt Auswirkungen eines Fehlers.

### 5.3 Technisches Englisch (4 Punkte)

Musterantwort:

1. Der Betrieb bis −30 °C ist nur zulässig, wenn die integrierte Heizung über PoE+ versorgt wird.
2. Für die Leistungsdimensionierung sind bei Kälte nicht nur 12 W, sondern zusätzlich 8 W je Kamera, also 20 W je Gerät, zu berücksichtigen.

- Bedingung Heizung/PoE+/Temperatur: 2 Punkte;
- 12 W ohne Heizung plus 8 W beziehungsweise 20 W gesamt: 2 Punkte.

**Русский комментарий:** `only when` задаёт обязательное условие, а `without the heater` запрещает использовать 12 W как полный зимний расход.

### 5.4 Nutzerinformation (2 Punkte)

Beispiel:

> Die gekennzeichnete Videoüberwachung dient dem Schutz des Außengeländes und der Aufklärung sicherheitsrelevanter Vorfälle. Fragen oder Anliegen richten Sie bitte an die in der Datenschutzinformation genannte betriebliche Kontaktstelle.

- Zweck klar und verständlich: 1 Punkt;
- Ansprechpartner ohne erfundene Angaben: 1 Punkt.

### 5.5 Aufbau- und Ablauforganisation (2 Punkte)

Die Aufbauorganisation beschreibt dauerhafte Stellen, Rollen, Zuständigkeiten und Weisungsbeziehungen. Die Ablauforganisation beschreibt Reihenfolge, Übergaben und Bearbeitungswege von Tätigkeiten; der schrittweise Pilot und Rollout gehört daher primär zur Ablauforganisation.

- richtige Abgrenzung: 1 Punkt;
- Rollout richtig zugeordnet: 1 Punkt.

---

## Aufgabe 6 – Datenmodell, Code und Prüfziffer (15 Punkte)

### 6.1 Einfaches ER-Modell (5 Punkte)

Mögliche relationale Umsetzung:

| Entität | Schlüssel und Beispielattribute |
|---|---|
| Standort | `StandortID` PK, Bezeichnung, Adresse |
| Kamera | `KameraID` PK, `StandortID` FK, Modell, IPAdresse |
| Wartung | `WartungID` PK, `KameraID` FK, Datum, Ergebnis |

Kardinalitäten:

```text
Standort 1 ── n Kamera
Kamera   1 ── n Wartung
```

- drei passende Primärschlüssel: zusammen 1,5 Punkte;
- `StandortID` als Fremdschlüssel in Kamera: 1 Punkt;
- `KameraID` als Fremdschlüssel in Wartung: 1 Punkt;
- beide Kardinalitäten: zusammen 1,5 Punkte.

### 6.2 Schreibtischtest und Grenzfehler (6 Punkte)

Vorhandener Code:

| i | Temperatur | Bedingung `<= −20` | count danach |
|---:|---:|---|---:|
| 0 | −18 | falsch | 0 |
| 1 | −24 | wahr | 1 |
| 2 | −20 | wahr | 2 |
| 3 | −27 | wahr | 3 |

Der vorhandene Code gibt `3` zurück. Die Anforderung lautet jedoch „kleiner als −20 °C“; der Grenzwert `−20` darf nicht mitgezählt werden. Die Korrektur lautet:

```text
IF temperatures[i] < -20 THEN
```

Danach ist der Rückgabewert `2`.

- vollständige Tabelle: 3 Punkte;
- alter Rückgabewert 3: 1 Punkt;
- Grenzfehler und Korrektur `< -20`: 1 Punkt;
- neuer Rückgabewert 2: 1 Punkt.

### 6.3 Prüfziffer (4 Punkte)

```text
Ziffern:   4  0  7  1  2  3
Gewichte:  1  3  1  3  1  3
Produkte:  4  0  7  3  2  9

Summe = 4 + 0 + 7 + 3 + 2 + 9 = 25
nächstes Vielfaches von 10 = 30
Prüfziffer = 30 − 25 = 5
```

- richtige Gewichtung: 1 Punkt;
- Produkte: 1 Punkt;
- Summe 25: 1 Punkt;
- Prüfziffer 5: 1 Punkt.

---

## Auswertung nach der Korrektur

Erstelle für jede verlorene Punktgruppe einen kurzen Nacharbeitsauftrag:

```text
Thema:
Fehlerursache: Wissen / Übertragung / Rechnen / Sprache / Zeit
richtige Regel oder Formel:
neue selbst erstellte Variante:
Wiederholung am:
```

Besonders wichtig ist die Trennung:

- Außenfähigkeit ist nicht nur Auflösung, sondern Schutzart, Temperatur und gegebenenfalls Heizung.
- PoE-Leistung je Port, PoE-Gesamtbudget, USV-Wirkleistung und USV-Scheinleistung sind verschiedene Grenzen.
- Ein erfolgreicher Test auf IP-Ebene beweist noch nicht den Anwendungsdienst.
- Verfügbarkeit wird aus der vereinbarten Bezugszeit berechnet, nicht aus einer frei gewählten Jahresdauer.

Wiederhole die fehlerhaften Teilaufgaben nach 24 bis 48 Stunden ohne die Musterlösung.
