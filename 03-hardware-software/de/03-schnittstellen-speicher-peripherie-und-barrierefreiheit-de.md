---
pruefung: AP1
thema: Schnittstellen, Speicher, Peripherie und Barrierefreiheit
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Deutsch
gegenstueck: ../ru/03-schnittstellen-speicher-peripherie-und-barrierefreiheit-ru.md
---

# AP1: Schnittstellen, Speicher, Peripherie und Barrierefreiheit

Ein gleicher Stecker garantiert noch keine gleichen Funktionen. Für einen zuverlässigen IT-Arbeitsplatz wird die gesamte Kette aus Gerät, Port, Kabel, Protokoll, Stromversorgung, Treiber, Betriebssystem und Nutzungsanforderung geprüft. Neben der technischen Kompatibilität muss die Lösung für die konkrete Zielgruppe zugänglich sein.

Leitgedanke:

> Form, Signal, Protokoll und Funktion getrennt prüfen — anschließend die Gesamtfunktion testen.

---

## 1. Lernziele

Nach dieser Einheit kannst du:

- Schnittstelle, Anschluss, Steckverbinder und Protokoll unterscheiden;
- mechanische, elektrische, logische und softwareseitige Kompatibilität prüfen;
- USB-A, USB-B, USB-C, Mini-/Micro-USB, Datenrate und USB Power Delivery korrekt erklären;
- DisplayPort, HDMI, Adapter und Dockingstation beurteilen;
- die Bedeutung von PCIe-Lanes einordnen;
- SATA, PCIe, NVMe, M.2 und externe Speicher trennen;
- dezimale und binäre Speichereinheiten umrechnen;
- Ein- und Ausgabegeräte aufgabenbezogen auswählen;
- Treiber, Betriebssystem, Ergonomie und Sicherheit berücksichtigen;
- POUR und wichtige WCAG-Anforderungen erklären;
- WCAG, BITV 2.0 und BFSG nach Rolle und Anwendungsbereich trennen;
- überprüfbare Abnahmekriterien formulieren;
- Funktions- und Barrierefreiheitstests planen.

---

## 2. Prüfungsminimum — 15 Minuten

1. Steckverbinderform, Übertragungsstandard, Signal, Stromversorgung und Funktion werden getrennt geprüft.
2. USB-A/B/C beschreiben Bauformen; aus USB-C allein folgen weder Datenrate noch Video oder Ladeleistung.
3. Die gesamte USB-Kette aus Host, Kabel, Dock/Hub und Endgerät wird vom schwächsten Glied begrenzt.
4. USB PD benötigt passende Quelle, Verbraucher, Profil und Kabel; `P = U × I`.
5. HDMI/DisplayPort werden nach Auflösung, Bildrate, Farbtiefe, Displayzahl, Richtung und Kabel gewählt.
6. SATA, PCIe, NVMe und M.2 sind nicht austauschbare Begriffe; M.2 ist zunächst ein Formfaktor.
7. `1 Byte = 8 bit`; MB/GB sind dezimal, MiB/GiB binär.
8. Peripherie und Oberfläche müssen Zielgruppe, Ergonomie, Sicherheit, Treiber und Barrierefreiheit erfüllen.

> Der USB-C-Anschluss genügt als Nachweis nicht, da Port, Kabel und Dock den geforderten DisplayPort Alt Mode und die notwendige PD-Leistung unterstützen müssen.

## 3. Prüfungsrahmen

Typische Aufgaben:

- einen geeigneten Anschluss auswählen;
- erklären, warum ein Gerät trotz passendem Stecker nicht funktioniert;
- Notebook, Dock und zwei Monitore auf Kompatibilität prüfen;
- Speicher nach Kapazität und Geschwindigkeit vergleichen;
- Peripherie für eine Zielgruppe auswählen;
- Maßnahmen zur Barrierefreiheit vorschlagen;
- Testfälle und Abnahmekriterien formulieren.

In AP1 muss eine Lösung den Kundenbedarf erfüllen, eingerichtet, getestet und dokumentiert werden. Nur den Portnamen zu nennen genügt deshalb nicht.

---

## 4. Fünf Ebenen einer Schnittstelle

| Ebene | Frage | Beispiel |
|---|---|---|
| mechanisch | Passt die Bauform? | USB-C-Stecker passt in die Buchse |
| elektrisch | Stimmen Versorgung und Signal? | erforderliche Spannung/Stromstärke |
| protokollarisch | Nutzen beide Seiten denselben Standard? | USB-Daten, DisplayPort Alt Mode |
| softwareseitig | Gibt es Treiber und OS-Unterstützung? | Docking-Treiber |
| funktional | Wird die konkrete Aufgabe erfüllt? | zwei Displays im geforderten Modus |

Zur vierstufigen Kompatibilitätsprüfung aus Kapitel 09 kommt hier die Funktionsebene hinzu: Eine technisch aufgebaute Verbindung kann ihren Gesamtzweck trotzdem verfehlen.

---

## 5. Begriffstrennung

| Begriff | Bedeutung |
|---|---|
| Schnittstelle | definierter Interaktionspunkt zwischen Komponenten |
| Anschluss/Port | konkrete Verbindungsmöglichkeit am Gerät |
| Steckverbinder | mechanische Form von Stecker und Buchse |
| Signal/Übertragung | elektrische oder optische Übertragung |
| Protokoll | Regeln für den Datenaustausch |
| Dienst/Funktion | nutzbares Ergebnis |

> USB-C beschreibt den Steckverbinder. Abhängig von der Umsetzung können USB-Daten, Strom oder Displaysignale übertragen werden. Die Buchse garantiert diese Funktionen nicht.

---

## 6. Datenrate, Durchsatz und Latenz

Die `Bruttodatenrate` enthält auch Kodierungs- und Protokollanteile.

Der `Nettodurchsatz` ist die tatsächlich pro Zeit übertragene Nutzdatenmenge.

Die `Latenz` ist die Verzögerung bis zur Übertragung oder Antwort.

```text
Nutzdurchsatz ≤ Bruttodatenrate
```

Einfluss haben:

- das langsamste Glied der Kette;
- Protokolloverhead;
- Controller und Endgerät;
- Kabelqualität und -länge;
- parallele Last;
- Treiber und Betriebssystem;
- Art der Daten.

---

## 7. Bit und Byte

```text
1 Byte = 8 bit
```

Netzwerkgeschwindigkeit wird häufig in bit/s, Speichertransfer in Byte/s angegeben.

Ideale theoretische Umrechnung:

```text
1 Gbit/s ÷ 8 = 0,125 GB/s = 125 MB/s
```

Der reale Nutzdurchsatz liegt wegen Overhead und Systemgrenzen darunter.

---

## 8. USB: Versionsname und Vermarktung

Bei USB werden geprüft:

- Steckverbindertyp;
- unterstützte Datenrate;
- Rolle und Richtung;
- Power Delivery;
- Alternate Modes;
- Kabel;
- Treiber und Betriebssystem.

USB-Bezeichnungen wurden im Zeitverlauf geändert. In einer Aufgabe sind explizite Datenrate und Funktion belastbarer als eine Vermutung aus einem Generationsnamen.

---

## 9. USB-A und USB-C

`USB-A` und `USB-C` beschreiben zunächst die Bauform.

USB-C kann je nach Umsetzung unterstützen:

- USB-Daten mit unterschiedlichen Geschwindigkeiten;
- Laden;
- USB Power Delivery;
- DisplayPort Alt Mode;
- Thunderbolt oder USB4;
- nur einen Teil dieser Funktionen.

> USB-C ist kein Leistungsversprechen.

Dokumentation von Port, Gerät und Kabel muss geprüft werden.

### 9.1 USB-B, Mini-USB und Micro-USB

| Bauform | Erkennungsmerkmal | typischer früherer/aktueller Einsatz |
|---|---|---|
| USB-A | flach-rechteckig, nicht verdrehsicher | Host, PC, Hub, Ladegerät |
| USB-B | annähernd quadratisch mit abgeschrägten Ecken | Drucker, Scanner, Messgerät |
| USB 3.x Type-B | Type-B mit zusätzlichem Kontaktbereich | schnellere Drucker-/Speicherverbindung |
| Mini-B | kleiner, trapezähnlich | ältere Kameras und Geräte |
| Micro-B | sehr flach, nicht verdrehsicher | ältere Smartphones und Peripherie |
| USB 3.x Micro-B | breiter Doppelbereich | ältere externe Festplatten |
| USB-C | klein, symmetrisch, verdrehsicher | aktuelle Daten-, Lade- und Displayverbindungen |

Die Buchstaben `A`, `B` und `C` beschreiben die mechanische Steckverbinderfamilie. USB 2.0, USB 3.2 und USB4 beschreiben technische Übertragungsstandards und Funktionen. Deshalb darf aus der Bauform allein keine Datenrate abgeleitet werden.

### 9.2 Datenraten sicher lesen

| explizite Angabe | theoretische Bruttodatenrate |
|---|---:|
| USB 2.0 High-Speed | 480 Mbit/s |
| USB 3.2 Gen 1 | 5 Gbit/s |
| USB 3.2 Gen 2 | 10 Gbit/s |
| USB 3.2 Gen 2×2 | 20 Gbit/s |
| USB4 | je Implementierung, zum Beispiel 20, 40 oder 80 Gbit/s |

USB-Markennamen wurden mehrfach geändert. Prüfungssicher ist die explizite Rate zusammen mit Steckverbinder, Richtung, PD, Alt Mode und Kabelanforderung.

---

## 10. USB-Kette

Eine Funktion steht nur bereit, wenn alle erforderlichen Glieder sie unterstützen:

```text
Host-Port → Kabel → Hub/Dock → Kabel → Endgerät
```

Das schwächste Glied begrenzt die Kette.

Beispiel:

- Notebook unterstützt Video über USB-C;
- Dock unterstützt zwei Displays;
- Kabel überträgt nur USB 2.0 und Strom.

Der Stecker passt, Video kann aber ausbleiben.

---

## 11. USB Power Delivery

Für die Stromversorgung sind relevant:

- USB-PD-Unterstützung beider Geräte;
- Spannungs-/Stromprofile;
- Leistung der Quelle;
- zulässige Kabelleistung;
- Eigenbedarf von Dock und Peripherie.

```text
P = U × I

20 V × 3 A = 60 W
```

Benötigt das Notebook unter Last 65 W und liefert das Dock nur 60 W, kann es langsam laden oder der Akku entlädt sich. Zertifizierte USB-C-Kabel können mit 60 W oder 240 W gekennzeichnet sein; trotzdem ist die vollständige Kette zu prüfen.

---

## 12. HDMI und DisplayPort

Beide übertragen digitale Bildsignale und üblicherweise Audio. Zu prüfen:

- Fähigkeiten beider Endpunkte;
- Auflösung;
- Bildwiederholrate;
- Farbtiefe/Chroma, wenn relevant;
- Displayanzahl;
- Kabel und Länge;
- Audio;
- Kopierschutz oder Spezialfunktionen;
- Unterstützung durch Dock und GPU.

`4K` ohne Frequenz und Farbtiefe ist eine unvollständige Anforderung.

> Zwei externe Monitore müssen gleichzeitig mit 2 560 × 1 440 Pixeln bei 60 Hz betrieben werden.

### 12.1 Bildanschlüsse unterscheiden

| Anschluss | Signal | wichtige Besonderheit |
|---|---|---|
| DisplayPort | digital, Bild und Audio | Full-Size oder Mini DisplayPort; MST/Daisy Chain nur bei Unterstützung |
| USB-C mit DP Alt Mode | DisplayPort-Signal über USB-C | Alt Mode und verfügbare Lanes/Funktionen ausdrücklich prüfen |
| HDMI Type A | digital, Bild und Audio | verbreitet an Monitor, TV und Projektor |
| Mini-/Micro-HDMI | dasselbe Protokoll in kleiner Bauform | Kabelrichtung und mechanische Belastung beachten |
| DVI-D | digital | je Link/Variante begrenzte Modi, Audio nicht generell annehmen |
| DVI-I | digital und analog möglich | konkrete Quelle, Adapter und Display prüfen |
| VGA | analog | störanfälliger, keine digitale Bildübertragung |

`DisplayPort Dual-Mode`, oft mit `DP++` gekennzeichnet, kann bei geeigneter Quelle passive Adapter zu bestimmten HDMI-/DVI-Signalen ermöglichen. Fehlt die Funktion oder wird eine andere Richtung benötigt, ist ein aktiver Wandler erforderlich.

### 12.2 Weitere typische Arbeitsplatzanschlüsse

| Anschluss | Zweck | Prüfpunkt |
|---|---|---|
| 8P8C, umgangssprachlich RJ45 | Ethernet über Twisted Pair | Kategorie, Datenrate, PoE, Belegung |
| 3,5-mm-Klinke TRS/TRRS | analoges Audio, ggf. Mikrofon | Kontaktbelegung und Geräteart |
| TOSLINK | optisches digitales Audio | unterstütztes Audioformat |
| SD/microSD | wechselbarer Flash-Speicher | Formfaktor, Kapazitäts-/Geschwindigkeitsklasse |
| eSATA | ältere externe SATA-Verbindung | keine allgemeine Stromversorgung annehmen |
| PS/2 | ältere Tastatur/Maus | Hot-Plug nicht pauschal voraussetzen |

---

## 13. Adapter: aktiv oder passiv

Ein `passiver Adapter` ändert die physische Verbindung, wenn die Quelle bereits ein geeignetes Signal ausgeben kann.

Ein `aktiver Adapter` wandelt ein Signal elektronisch um.

Zu prüfen:

- Richtung der Wandlung;
- Auflösung und Frequenz;
- Stromversorgung;
- Audio;
- Treiber;
- Unterstützung der Quelle.

Ein Adapter A→B arbeitet nicht zwangsläufig auch B→A.

---

## 14. Dockingstation

Eine Dockingstation bündelt Funktionen. Deshalb hilft eine Matrix:

| Anforderung | Prüfpunkt |
|---|---|
| Notebook laden | PD-Leistung nach Eigenverbrauch des Docks |
| zwei Monitore | Anzahl, Auflösung, Hz, Alt Mode/Thunderbolt/DisplayLink |
| Netzwerk | Datenrate, MAC-Passthrough, Treiber |
| USB-Geräte | Portanzahl, Geschwindigkeit, Strom |
| Audio | Ein-/Ausgänge, Betriebssystem |
| Verwaltung | Firmwareupdates, Inventarisierung |
| Sicherheit | Herstellerupdates, zugelassene Treiber |

`„Dock wird erkannt“` ist kein ausreichender Test. Alle geforderten Dienste müssen gleichzeitig funktionieren.

---

## 15. Thunderbolt und USB4

Diese Techniken können Daten, Display, PCIe-Tunneling und Strom verbinden. Konkrete Fähigkeiten hängen jedoch ab von:

- Generation;
- Host;
- Kabel;
- Dock;
- Betriebssystem;
- Zertifizierung und Herstellerfreigabe.

Prüfungssichere Aussage:

> Die geforderte Funktion wird anhand der Spezifikationen aller Komponenten geprüft; aus der USB-C-Bauform allein wird sie nicht abgeleitet.

---

## 16. PCI Express

PCIe ist eine serielle Hochgeschwindigkeitsschnittstelle für GPU, Netzwerkadapter, NVMe und andere Geräte.

Wichtige Merkmale:

- Generation;
- Anzahl der Lanes: x1, x4, x8, x16;
- physische Slotlänge;
- tatsächlich elektrisch verbundene Lanes;
- Verteilung der Lanes auf Slots und M.2;
- CPU-/Chipsatzunterstützung;
- Platz und Kühlung.

Ein Gerät kann häufig in einem kompatiblen langsameren Modus arbeiten. Die konkrete Abwärtskompatibilität und Lane-Zuordnung ist dennoch zu prüfen.

---

## 17. Lane-Sharing

Ein Mainboard besitzt nur eine begrenzte Zahl PCIe-Lanes. Der Einbau einer M.2-SSD kann:

- einen SATA-Port deaktivieren;
- die Lanes eines anderen Slots verringern;
- den GPU-Modus verändern;
- nur mit einer bestimmten CPU möglich sein.

Das ist an der Steckerform nicht erkennbar. Maßgeblich sind Blockdiagramm oder Tabelle im Mainboard-Handbuch.

---

## 18. SATA, PCIe, NVMe und M.2

| Begriff | Kategorie |
|---|---|
| SATA | Schnittstelle/Übertragungsstandard für Laufwerke |
| PCIe | allgemeine System-Hochgeschwindigkeitsschnittstelle |
| NVMe | Protokoll für nichtflüchtigen Speicher, häufig über PCIe |
| M.2 | Bauform/Steckverbinder für Module |

Mögliche Kombinationen:

- 2,5-Zoll-SATA-SSD;
- M.2-SATA-SSD;
- M.2-PCIe-NVMe-SSD;
- PCIe-Steckkarte mit NVMe.

`„M.2 ist schneller als SATA“` ist ungenau, weil auch ein M.2-Laufwerk SATA nutzen kann.

---

## 19. Interner und externer Speicher

Bei externem Speicher wird die gesamte Kette bewertet:

- internes Speichermedium;
- USB-/SATA-/NVMe-Brücke;
- Port und Kabel;
- Stromversorgung;
- Dateisystem;
- Betriebssystem;
- Verschlüsselung;
- Transport- und Verlustschutz.

Eine schnelle NVMe-SSD kann in einem einfachen USB-Gehäuse durch Brücke oder Port begrenzt werden.

---

## 20. Dezimale und binäre Einheiten

Speicherhersteller nutzen meist Dezimalwerte:

```text
1 kB = 1 000 Byte
1 MB = 1 000 000 Byte
1 GB = 1 000 000 000 Byte
```

Binäre Einheiten:

```text
1 KiB = 1 024 Byte
1 MiB = 1 024 KiB
1 GiB = 1 024 MiB
```

Beispiel:

```text
500 000 000 000 Byte ÷ 1 073 741 824 Byte/GiB
≈ 465,66 GiB
```

Dateisystem, Wiederherstellungspartitionen und Herstellerreserve erzeugen weitere Abweichungen.

---

## 21. Speicherbedarf

```text
Gesamtbedarf =
Betriebssystem
+ Anwendungen
+ Nutzdaten
+ Wachstum
+ temporäre Daten
+ Reserve
```

Übungsbeispiel:

| Anteil | Größe |
|---|---:|
| OS und Anwendungen | 120 GB |
| Projekte | 180 GB |
| VM-Images | 300 GB |
| lokale Datenkopien | 100 GB |
| **Zwischensumme** | **700 GB** |

Mit 25 % Reserve:

```text
700 GB × 1,25 = 875 GB
```

Die nächste geeignete Nennkapazität ist beispielsweise 1 TB. Ein Backup gehört nicht automatisch auf denselben physischen Datenträger.

---

## 22. Dateisystem und Kompatibilität

Ein physisch passender Speicher kann ungeeignet sein durch:

- nicht unterstütztes Dateisystem;
- Dateigrößenbegrenzung;
- Verlust von Rechten oder Metadaten;
- unterschiedliche Groß-/Kleinschreibung;
- Verschlüsselung;
- fehlende Treiber.

Formatieren kann Daten löschen. Vor einer Änderung sind Backup, Zielsystem, Rechte, Verschlüsselung und Abnahme zu klären.

---

## 23. Peripherie klassifizieren

| Kategorie | Beispiele |
|---|---|
| Eingabe | Tastatur, Maus, Scanner, Mikrofon, Kamera |
| Ausgabe | Monitor, Drucker, Lautsprecher, Braillezeile |
| Ein- und Ausgabe | Touchscreen, Headset, Multifunktionsgerät |
| Kommunikation | Netzwerkadapter, Bluetooth-Adapter |
| Speicher | externe SSD, Kartenleser |

Die Zuordnung hängt von der genutzten Funktion ab. Ein Touchscreen zeigt Daten an und nimmt Eingaben entgegen.

---

## 24. Auswahl von Peripheriegeräten

Kriterien:

- Nutzungsszenario und Zielgruppe;
- Ein-/Ausgabequalität;
- Schnittstellen und Treiber;
- Betriebssystem;
- Ergonomie und Barrierefreiheit;
- Lautstärke und Energie;
- Verbrauchsmaterial;
- Wartung und Support;
- Datenschutz und Sicherheit;
- TCO.

Ein billiger Drucker kann beispielsweise hohe Seitenkosten und häufige Wartung verursachen.

### 24.1 Mobile Endgeräte und MDM

Bei Smartphones und Tablets zählen Plattform, Laufzeit, Funkstandards, Kamera/Sensorik, Robustheit, Reparierbarkeit, Updatezeitraum und Unternehmensintegration. Ein **Mobile Device Management (MDM)** kann Registrierung, Gerätekonfiguration, Verschlüsselung, Bildschirmsperre, Zertifikate, App-Regeln, Inventar, Remote-Sperre/-Löschung und geregeltes Offboarding unterstützen.

**BYOD** nutzt private Geräte und verlangt klare Trennung und Datenschutz. **COPE** stellt ein Firmengerät bereit und erlaubt geregelte Privatnutzung; **COBO** beschränkt es auf geschäftliche Nutzung. Die Abkürzung allein ersetzt kein Nutzungs-, Support- und Löschkonzept.

---

## 25. Drucker und Scanner

Beim Drucker:

- Laser oder Tinte;
- Farbe oder monochrom;
- Seitenvolumen und Seitenkosten;
- Geschwindigkeit und Duplex;
- Netzwerk und Berechtigungen;
- Verbrauchsmaterial;
- Datenschutz bei internem Speicher.

Beim Scanner:

- Auflösung und Farbtiefe;
- Dokumenteneinzug und Duplex;
- OCR;
- Format und Geschwindigkeit;
- Zielsystem und Datenschutz.

Ein maximaler dpi-Wert ohne Dokumentart und Ausgabezweck ist kein ausreichendes Kriterium.

Netzwerkdruck benötigt zusätzlich ein Protokoll und einen geregelten Datenweg. **IPP** verwendet typischerweise TCP-Port `631`; eine Druckerwarteschlange beziehungsweise ein **Spooler** puffert und ordnet Aufträge. Ein Printserver zentralisiert Treiber, Berechtigungen und Protokollierung. Bei vertraulichen Dokumenten verhindert **Secure/Pull Printing** die Ausgabe vor der Authentisierung am Gerät. Administrationsoberfläche, Firmware, TLS und Standardkennwörter sind abzusichern.

```text
Seitenkosten = (Toner + anteilige Trommel/sonstige Verbrauchsteile) / Reichweite
```

Herstellerreichweiten gelten unter definierten Testbedingungen. Papier, Energie, Wartung, Ausfall und Fehldrucke gehören für eine TCO-Betrachtung zusätzlich dazu.

---

## 26. Audio, Video und Kommunikation

Für Headset, Webcam und Mikrofon:

- Sprachverständlichkeit;
- Richtcharakteristik und Umgebungsgeräusch;
- Auflösung und Bildrate;
- Lichtverhältnisse;
- Tragekomfort;
- Stummschaltung und sichtbare Statusanzeige;
- Schnittstelle und Treiber;
- Datenschutz.

Das Gerät wird im eingesetzten Konferenzsystem getestet, nicht nur im Gerätemanager.

---

## 27. Ergonomie und individuelle Anpassung

Wichtig sind:

- einstellbarer Bildschirm;
- Skalierung und Schriftgröße;
- geeignete Tastatur und Zeigegerät;
- freie Positionierbarkeit;
- geringe Bedienkraft;
- verständliches Feedback;
- alternative Eingabe;
- Kompatibilität mit Hilfsmitteln.

`Ergonomisch` ist keine absolute Produkteigenschaft. Eignung hängt von Person, Aufgabe und Umgebung ab.

---

## 28. Barrierefreiheit: Ziel

Barrierefreiheit soll Menschen mit unterschiedlichen Fähigkeiten ermöglichen, Informationen und Funktionen:

- wahrzunehmen;
- zu bedienen;
- zu verstehen;
- zuverlässig zu nutzen.

Sie ist keine nachträgliche Sonderfunktion, sondern eine Anforderung, die ermittelt, umgesetzt und getestet wird. Klare Fehlermeldungen, Tastaturbedienung und gute Kontraste helfen oft vielen Nutzern.

---

## 29. POUR

WCAG ordnet Anforderungen vier Prinzipien zu:

| Prinzip | Bedeutung | Beispiel |
|---|---|---|
| Perceivable | wahrnehmbar | Textalternative, Untertitel, Kontrast |
| Operable | bedienbar | Tastatur, Fokus, genügend Zeit |
| Understandable | verständlich | klare Sprache, vorhersehbare Navigation |
| Robust | robust | korrekte Semantik, Assistenztechnik |

POUR ist ein Denkrahmen, kein vollständiger Testplan.

---

## 30. Wahrnehmbar

Mögliche Maßnahmen:

- Textalternativen für inhaltliche Bilder;
- Untertitel oder Transkript für Medien;
- ausreichender Kontrast;
- Information nicht nur über Farbe;
- Vergrößerung und Reflow ohne Funktionsverlust;
- verständliche Überschriftenstruktur;
- Text statt Textgrafik, soweit möglich.

Ein rein dekoratives Bild wird vor Assistenztechnik verborgen und erhält keine nutzlose Beschreibung.

---

## 31. Bedienbar

Zu prüfen:

- alle Funktionen mit Tastatur erreichbar;
- keine Tastaturfalle;
- logische Fokusreihenfolge;
- sichtbarer Fokus;
- geeignete Zielgröße interaktiver Elemente;
- anpassbare Zeitbegrenzungen, soweit erforderlich;
- keine gefährlichen Lichtblitze;
- Navigation und Sprunglinks.

Ein kurzer Test mit der Tab-Taste ersetzt keine vollständige Tastaturprüfung.

---

## 32. Verständlich und robust

`Verständlich`:

- klare Beschriftungen;
- konsistente Navigation;
- nachvollziehbare Anweisungen;
- Fehler nennt Ursache und Korrektur;
- folgenreiche Aktionen werden bestätigt.

`Robust`:

- semantisch passende Elemente;
- zugängliche Namen, Rollen und Zustände;
- Statusmeldungen für Assistenztechnik;
- keine kritischen Strukturfehler;
- Test mit Screenreader.

Ein Placeholder ersetzt kein dauerhaft zugeordnetes Label.

---

## 33. Hardware-Hilfsmittel

Je nach individuellem Bedarf:

- Braillezeile;
- Großschrift- oder kontrastreiche Tastatur;
- alternative Zeigegeräte und Trackball;
- Taster und Switch-Steuerung;
- Spracheingabe;
- Bildschirmvergrößerung;
- Hörunterstützung;
- positionierbare Geräte;
- zusätzliche Eingabehilfen.

Die Auswahl erfolgt mit der betroffenen Person und wird im realen Arbeitsablauf erprobt.

---

## 34. WCAG, BITV 2.0 und BFSG

| Regelwerk | Rolle | Typischer Bereich |
|---|---|---|
| WCAG 2.2 | internationale technische Empfehlung | Webinhalte und digitale Oberflächen |
| BITV 2.0 | deutsches Recht | digitale Angebote öffentlicher Stellen des Bundes |
| BFSG | deutsches Gesetz für bestimmte Produkte/Dienste | genannte Verbraucherprodukte und Dienstleistungen |

Das BFSG gilt seit 28.06.2025 für bestimmte erfasste Produkte und Dienstleistungen, aber nicht automatisch für jeden internen Arbeitsplatz oder jede Website. Auch die BITV 2.0 hat einen definierten Anwendungsbereich.

Vorgehen:

1. Produkt, Dienstleistung, Anbieter und Zielgruppe bestimmen.
2. Anwendbare Rechtsgrundlagen prüfen.
3. Technischen Standard und Prüfverfahren festlegen.

Diese Einordnung ist Lernstoff und keine Rechtsberatung.

---

## 35. Barrierefreiheit testen

Ein automatischer Scanner genügt nicht.

Kombiniert werden:

- automatisierte Prüfungen;
- Tastaturtest;
- Zoom und Reflow;
- Kontrastprüfung;
- Screenreader-Test;
- Prüfung von Formularen und Fehlermeldungen;
- unterschiedliche Eingabemethoden;
- möglichst Tests mit betroffenen Nutzerinnen und Nutzern.

Automatisierung erkennt einige formale Fehler, aber nicht vollständig die Qualität eines Alternativtexts, die logische Reihenfolge oder die Verständlichkeit.

---

## 36. Abnahmekriterien

Zu unbestimmt:

> Die Anwendung ist barrierefrei.

Überprüfbare Beispiele:

- alle Funktionen des Szenarios X sind ausschließlich mit Tastatur ausführbar;
- der Fokusindikator ist an jedem interaktiven Element sichtbar;
- bei 200 % Zoom gehen keine Informationen oder Funktionen verloren;
- Pflichtfelder besitzen ein dauerhaftes Label und eine textliche Fehlermeldung;
- zwei QHD-Monitore laufen gleichzeitig mit 60 Hz über das vorgesehene Dock;
- das Notebook lädt über das Dock auch unter Testvolllast ohne Nettoentladung;
- ein externer Speicher überträgt die Testdatei, wird nach Neustart eingebunden und ist nur für die freigegebene Rolle zugänglich.

Die Abnahme dokumentiert Aufbau, erwartetes und tatsächliches Ergebnis.

---

## 37. Vollständiger Praxisfall

Benötigt werden:

- Notebook und Dockingstation;
- zwei QHD-Monitore mit je 60 Hz;
- Gigabit-Ethernet;
- Headset, Tastatur und Trackball;
- Laden über einen USB-C-Anschluss;
- vollständige Tastaturbedienung der Fachanwendung;
- Vergrößerung auf 200 %.

Vorgehen:

1. Muss-Kriterien erfassen.
2. Videosignal und Docktechnik des Host-Ports prüfen.
3. beide Displaymodi gleichzeitig prüfen.
4. PD-Leistung des Docks mit Notebookbedarf vergleichen.
5. Kabel auf Daten, Video und Strom prüfen.
6. Treiber, Firmware und OS prüfen.
7. Netzwerk und USB-Geräte gleichzeitig anschließen.
8. Last, Ladezustand und Stabilität testen.
9. Tastatur, Fokus, Zoom/Reflow und Trackball prüfen.
10. Soll/Ist, Abweichungen und Abnahme protokollieren.

> Die Dockingstation ist geeignet, wenn Host, Dock und Kabel die zwei geforderten QHD-Signale, Gigabit-Ethernet und die benötigte Ladeleistung gleichzeitig unterstützen. Die technische Freigabe erfolgt erst nach dem dokumentierten Gesamttest einschließlich Tastatur- und Vergrößerungsprüfung.

---

## 38. Fehleranalyse

Wenn Peripherie nicht funktioniert:

1. Fehlerbild und erwartete Funktion genau beschreiben.
2. Gerät, Port, Kabel und Richtung identifizieren.
3. Stromversorgung und Verbindung prüfen.
4. anderes bekannt funktionierendes Kabel oder Port testen.
5. Spezifikationen der gesamten Kette vergleichen.
6. Betriebssystem, Treiber, Firmware und Logs prüfen.
7. Funktion isoliert und anschließend unter Gesamtlast testen.
8. Ergebnis dokumentieren.

Pro Versuch wird nur ein Faktor verändert.

---

## 39. Typische Prüfungsfallen

| Falle | Korrektur |
|---|---|
| USB-C unterstützt alles | Port, Kabel und Gerät getrennt prüfen |
| Version ist Steckertyp | Generation/Datenrate und Bauform trennen |
| Gbit/s ist GB/s | bit durch 8 teilen, dann Overhead beachten |
| 4K genügt als Anforderung | Hz, Displayzahl und Bedingungen ergänzen |
| Adapter arbeitet in beide Richtungen | Richtung und aktive Wandlung prüfen |
| M.2 bedeutet NVMe | Bauform und Protokoll trennen |
| 500 GB sind 500 GiB | dezimale/binäre Einheiten trennen |
| externe NVMe ist immer schnell | gesamte Kette berücksichtigen |
| Gerät erkannt heißt abgenommen | tatsächlichen Dienst prüfen |
| automatischer Scan beweist Barrierefreiheit | manuelle und Nutzertests ergänzen |
| BITV/BFSG gelten immer | erst Anwendungsbereich prüfen |
| Barrierefreiheit ist nur Kontrast | POUR und konkrete Kriterien verwenden |

---

## 40. Selbsttest

1. Nenne fünf Ebenen einer Schnittstelle.
2. Wie unterscheiden sich Steckverbinder und Protokoll?
3. Trenne Bruttodatenrate, Nutzdurchsatz und Latenz.
4. Rechne 1 Gbit/s theoretisch in MB/s um.
5. Warum garantiert USB-C kein Video?
6. Welche Glieder gehören zur USB-Kette?
7. Berechne die Leistung bei 20 V und 3 A.
8. Was kann bei zu geringer PD-Leistung geschehen?
9. Welche Angaben fehlen bei `4K`?
10. Was unterscheidet aktiven und passiven Adapter?
11. Welche Dockfunktionen werden gleichzeitig getestet?
12. Was bedeuten PCIe x4 und x16?
13. Was ist Lane-Sharing?
14. Trenne SATA, PCIe, NVMe und M.2.
15. Warum kann eine externe NVMe langsam sein?
16. Wie viele GiB sind 500 000 000 000 Byte?
17. Berechne den Speicherbedarf aus Abschnitt 20.
18. Warum beeinflusst das Dateisystem die Kompatibilität?
19. Nenne drei Kategorien von Peripherie.
20. Welche Folgekosten besitzt ein Drucker?
21. Warum wird eine Webcam in der Konferenzsoftware getestet?
22. Wofür steht POUR?
23. Nenne drei Anforderungen an Wahrnehmbarkeit.
24. Nenne vier Anforderungen an Bedienbarkeit.
25. Warum ersetzt ein Placeholder kein Label?
26. Nenne drei Hardware-Hilfsmittel.
27. Wie unterscheiden sich WCAG, BITV und BFSG?
28. Warum genügt ein automatischer Scanner nicht?
29. Formuliere ein Abnahmekriterium für zwei Monitore.
30. Wie wird ein Dockingfehler systematisch gesucht?

<details>
<summary>Lösungen anzeigen</summary>

1. Mechanisch, elektrisch, protokollarisch, softwareseitig und funktional.
2. Der Steckverbinder ist die Form; das Protokoll regelt den Austausch.
3. Gesamtsignalrate; Nutzdaten pro Zeit; Verzögerung.
4. Theoretisch `1 000 Mbit/s ÷ 8 = 125 MB/s`.
5. Type-C beschreibt die Bauform; Video benötigt passende Technik in der ganzen Kette.
6. Host-Port, Kabel, Hub/Dock, weiteres Kabel und Endgerät.
7. `20 V × 3 A = 60 W`.
8. Langsames Laden, kein Laden oder Entladen unter Last.
9. Auflösung, Hz, Farbtiefe/Chroma, Displayanzahl und Kette.
10. Aktiv wandelt elektronisch; passiv nutzt ein bereits kompatibles Signal.
11. Display, Laden, Netzwerk, USB, Audio und Verwaltung unter gemeinsamer Last.
12. Anzahl genutzter Daten-Lanes; physische und elektrische Ausführung können abweichen.
13. Gemeinsame Nutzung begrenzter Lanes, gegebenenfalls mit deaktivierten Ports.
14. Laufwerksstandard; Systembus; Speicherprotokoll; Bauform/Stecker.
15. USB-Brücke, Port, Kabel, Strom, Treiber oder Dateisystem können begrenzen.
16. Etwa `465,66 GiB`.
17. `700 GB × 1,25 = 875 GB`; passende Nennkapazität, etwa 1 TB.
18. Das Betriebssystem kann Funktionen, Rechte oder Dateigrößen nicht unterstützen.
19. Eingabe, Ausgabe, Ein-/Ausgabe, Kommunikation oder Speicher.
20. Toner/Tinte, Trommel, Papier, Wartung, Energie und Ausfall.
21. Kompatibilität, Qualität, Rechte und Funktionen müssen im Zielsystem stimmen.
22. Perceivable, Operable, Understandable, Robust.
23. Textalternativen, Untertitel, Kontrast, Reflow oder Information nicht nur per Farbe.
24. Tastatur, keine Falle, logischer/sichtbarer Fokus, genügend Zeit.
25. Er verschwindet bei Eingabe und ist oft semantisch nicht dauerhaft zugeordnet.
26. Braillezeile, Trackball, Spezialtastatur, Taster oder Spracheingabe.
27. WCAG ist technische Empfehlung; BITV betrifft Bundesstellen; BFSG bestimmte Verbraucherprodukte/-dienste.
28. Bedeutung, Reihenfolge, Verständlichkeit und reale Assistenztechnik werden nicht vollständig bewertet.
29. `Beide Monitore zeigen gleichzeitig 2 560 × 1 440 Pixel bei 60 Hz ohne Bildaussetzer im 30-minütigen Lasttest.`
30. Fehlerbild → Kette → Strom/Kabel → Spezifikationen → Treiber/Firmware → Einzeltest → Gesamtlast → Dokumentation.

</details>

---

## 41. Quellen und Abgleich

- [§ 9 FIAusbV – Prüfungsbereich Teil 1](https://www.gesetze-im-internet.de/fiausbv/__9.html)
- [USB-IF – Cables and Connectors](https://www.usb.org/document-library/cables-and-connectors)
- [NVM Express – Specifications](https://nvmexpress.org/specifications/)
- [WCAG 2.2 – W3C Recommendation](https://www.w3.org/TR/WCAG22/)
- [BITV 2.0](https://www.gesetze-im-internet.de/bitv_2_0/)
- [BFSG](https://www.gesetze-im-internet.de/bfsg/)
- [Bundesfachstelle Barrierefreiheit – BFSG](https://www.bundesfachstelle-barrierefreiheit.de/DE/Barrierefreiheitsstaerkungsgesetz)

Rechtsangaben wurden mit Stand 10.09.2026 geprüft. Der konkrete Anwendungsbereich hängt von Produkt, Dienstleistung, Anbieter und Sachverhalt ab.

---

## 42. Offene Prüfpunkte für den Unterricht

- Welche USB-Bezeichnungen verwendet die WBS?
- Wird eine USB-PD-Rechnung erwartet?
- Wie detailliert werden HDMI und DisplayPort behandelt?
- Gehören Thunderbolt und USB4 zum Stoff?
- Werden PCIe-Lanes und Lane-Sharing erwartet?
- Welche dezimalen/binären Umrechnungen werden geprüft?
- Welche Drucker-/Scanner-Kennzahlen sind relevant?
- Welches WCAG-Niveau soll bekannt sein?
- Werden BITV 2.0 und BFSG oder nur Maßnahmen verlangt?
- Mit welchen Hilfsmitteln wird im Unterricht getestet?
- Welche Form von Abnahmekriterien bevorzugt die WBS?
