---
pruefung: AP1
thema: Hardwareauswahl, Komponenten, Kennzahlen und Kompatibilität
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Deutsch
gegenstueck: ../ru/02-hardwareauswahl-komponenten-kennzahlen-und-kompatibilitaet-ru.md
---

# AP1: Hardwareauswahl, Komponenten, Kennzahlen und Kompatibilität

Eine sachgerechte Hardwareauswahl beginnt nicht bei einem Prozessormodell, sondern beim `Kundenbedarf` und der tatsächlichen `Arbeitslast`. Eine starke Prüfungsantwort verknüpft jede Eigenschaft mit dem Einsatzzweck, prüft das Gesamtsystem und berücksichtigt Kosten, Sicherheit, Support und Lebenszyklus.

Leitgedanke:

> Nicht die höchste Kennzahl gewinnt, sondern die nachweislich geeignete Gesamtlösung.

---

## 1. Lernziele

Nach dieser Einheit kannst du:

- Hardwareanforderungen aus einem Einsatzszenario ableiten;
- Muss-, Soll- und Kann-Kriterien unterscheiden;
- Aufgaben von CPU, RAM, Massenspeicher, GPU, Mainboard, Netzteil und Netzwerkadapter erklären;
- Kennzahlen beurteilen, ohne aus einer Einzelzahl falsche Schlüsse zu ziehen;
- Kapazität, Latenz, Datendurchsatz und IOPS unterscheiden;
- SATA, NVMe, PCIe und M.2 korrekt einordnen;
- mögliche Engpässe erkennen und messen;
- mechanische, elektrische, protokollarische und softwareseitige Kompatibilität prüfen;
- Betriebssystem, Treiber, Firmware und Sicherheitsfunktionen berücksichtigen;
- RAM- und Speicherbedarf überschlägig berechnen;
- Desktop, Notebook, Workstation und Thin Client vergleichen;
- Entscheidungen mit Nutzwert, TCO, Support und Nachhaltigkeit begründen.

---

## 2. Prüfungsrahmen

Eine typische AP1-Situation:

1. Die Arbeit eines Nutzers wird beschrieben.
2. Mehrere Konfigurationen oder Komponenten sind gegeben.
3. Eine Lösung soll ausgewählt, verglichen oder begründet werden.
4. Kompatibilität muss geprüft werden.
5. Der Preis ist nur eines von mehreren Kriterien.

§ 9 FIAusbV verlangt, Hard- und Software unter Berücksichtigung von Kundenbedarf, Wirtschaftlichkeit und Qualität auszuwählen und zu beschaffen. Der Ausbildungsrahmenplan verlangt außerdem, IT-Systeme nach Leistungsfähigkeit, Wirtschaftlichkeit und Einsatzgebiet zu beurteilen sowie technische Spezifikationen zu vergleichen.

Die Aussage `„CPU B ist wegen mehr GHz besser“` reicht deshalb nicht.

---

## 3. Vom Bedarf zur Spezifikation

Zuerst werden Fragen geklärt:

- Welche Anwendungen werden eingesetzt?
- Welche Anwendungen laufen gleichzeitig?
- Gibt es virtuelle Maschinen, Container, lokale Datenbanken oder Build-Prozesse?
- Welche Datenmengen und Zugriffsmuster entstehen?
- Sind 3D, Video, KI-Modelle oder nur einfache Büro-Grafik nötig?
- Wie viele Monitore mit welcher Auflösung und Bildwiederholrate?
- Stationäre oder mobile Nutzung?
- Welche Schnittstellen und Netzwerke sind vorhanden?
- Welche Sicherheits-, Verfügbarkeits- und Supportanforderungen gelten?
- Wie lange soll das Gerät genutzt werden?

Anschließend wird überprüfbar formuliert:

> Das Gerät muss zwei virtuelle Maschinen mit jeweils 6 GB RAM parallel zur Entwicklungsumgebung und Datenbank ausführen können, ohne dass das Betriebssystem dauerhaft auf den Massenspeicher auslagert.

---

## 4. Muss, Soll und Kann

| Kategorie | Bedeutung | Beispiel |
|---|---|---|
| Muss | ohne Erfüllung ist die Lösung unzulässig | TPM 2.0 für das gewählte Betriebssystem |
| Soll | wichtig, begründete Abweichung möglich | 36 Monate Garantie |
| Kann | zusätzlicher Nutzen | integrierter Kartenleser |

Zuerst werden alle Muss-Kriterien geprüft. Nur zulässige Alternativen werden anschließend nach Kosten und Nutzwert verglichen.

> Das billigste Angebot ist nicht wirtschaftlich, wenn es ein Muss-Kriterium verfehlt.

---

## 5. Übersicht der Komponenten

| Komponente | Hauptaufgabe | Typische Auswahlfragen |
|---|---|---|
| CPU | Befehle verarbeiten | Workload, Kerne, Single-/Multi-Thread, Plattform |
| RAM | aktive Daten vorhalten | Kapazität, Generation, Takt, ECC |
| Massenspeicher | Daten dauerhaft speichern | Kapazität, Latenz, Durchsatz, Haltbarkeit |
| GPU | Grafik und parallele Berechnungen | iGPU/dGPU, VRAM, Softwareunterstützung |
| Mainboard | Komponenten verbinden | Sockel, Chipsatz, Slots, Anschlüsse, Firmware |
| Netzteil | elektrische Energie bereitstellen | Leistung, Anschlüsse, Effizienz, Reserve |
| Kühlung | Wärme abführen | Last, Lautstärke, Gehäuse |
| Netzwerkadapter | Netzverbindung herstellen | Ethernet/WLAN, Geschwindigkeit, Standards |
| Peripherie | Ein- und Ausgabe | Aufgabe, Ergonomie, Barrierefreiheit |

Eine schnelle CPU kompensiert weder dauerhaften RAM-Mangel noch einen für den Workload ungeeigneten Massenspeicher.

---

## 6. CPU: Was wird wirklich verglichen?

Wichtige Merkmale:

- Anzahl der Kerne und Threads;
- Taktfrequenz;
- Architektur und IPC;
- Cache;
- unterstützte Befehlssätze;
- Leistungsaufnahme und thermische Grenzen;
- integrierte Grafik;
- Plattform, Sockel und RAM-Unterstützung;
- reale Benchmarks für einen passenden Workload.

Die Taktfrequenz nennt Takte pro Sekunde, nicht die nützliche Arbeit pro Takt. CPUs unterschiedlicher Architekturen lassen sich deshalb nicht zuverlässig allein nach GHz ordnen.

---

## 7. Single-Thread und Multi-Thread

Vor allem von einem schnellen Thread profitieren beispielsweise:

- Teile einer Benutzeroberfläche;
- sequenzielle Programmabschnitte;
- einzelne ältere Anwendungen.

Gut parallelisierbar sind häufig:

- mehrere virtuelle Maschinen;
- parallele Builds;
- Rendering oder Encoding;
- viele gleichzeitig laufende Dienste.

Grundidee:

> Bleibt ein Teil der Aufgabe sequenziell, verkürzen zusätzliche Kerne nicht die gesamte Laufzeit proportional.

Für AP1 genügt meist die begründete Zuordnung von Kernzahl und Arbeitslast.

---

## 8. CPU-Benchmarks

Ein Benchmark ist aussagekräftig, wenn:

- er eine ähnliche Aufgabe misst;
- Einstellungen und Versionen vergleichbar sind;
- Kühlung, Speicher und Leistungsgrenzen bekannt sind;
- Ergebnisse reproduzierbar sind.

Nicht belastbar ist es:

- Single-Core- und Multi-Core-Werte zu vermischen;
- verschiedene Testversionen ungekennzeichnet zu vergleichen;
- kurze Burst-Tests auf Dauerlast zu übertragen;
- einen synthetischen Gesamtwert als Garantie für jede Anwendung zu behandeln.

> Für die Auswahl ist ein anwendungsnaher Benchmark aussagekräftiger als die Taktfrequenz allein.

---

## 9. RAM: Kapazität vor Geschwindigkeit

RAM hält Daten und Code für schnellen Zugriff bereit. Reicht die Kapazität nicht, nutzt das Betriebssystem verstärkt Auslagerungsdatei beziehungsweise Swap. Die deutlich höhere Massenspeicherlatenz kann die Arbeit stark verlangsamen.

Zu prüfen sind:

- Gesamtkapazität;
- gleichzeitiger Bedarf aller Anwendungen;
- Reserve;
- Generation, etwa DDR4 oder DDR5;
- Bauform DIMM oder SO-DIMM;
- unterstützter Takt;
- Modulanzahl und Speicherkanäle;
- maximale Kapazität von CPU und Mainboard;
- gegebenenfalls ECC.

Eine hohe RAM-Frequenz ersetzt keine ausreichende Kapazität.

---

## 10. RAM-Bedarf berechnen

Übungsszenario:

| Verbraucher | Bedarf |
|---|---:|
| Betriebssystem und Hintergrunddienste | 6 GB |
| IDE, Browser und Kommunikation | 5 GB |
| lokale Datenbank | 3 GB |
| zwei VMs mit je 6 GB | 12 GB |
| Container und Werkzeuge | 4 GB |
| **Zwischensumme** | **30 GB** |

Mit 20 % Reserve:

```text
30 GB × 1,20 = 36 GB
```

Gewählt wird die nächste tatsächlich unterstützte Konfiguration mit mindestens 36 GB, beispielsweise 48 oder 64 GB abhängig von Mainboard, Modulen, Kanälen und Unternehmensstandard.

> Die Rechnung ist eine Bedarfsschätzung. Monitoring oder ein Pilotbetrieb müssen die Annahmen bestätigen.

---

## 11. Speicherkanäle und gemischte Module

Mehrere Kanäle können die Speicherbandbreite erhöhen. Entscheidend sind:

- die laut Mainboard-Handbuch richtigen Slots;
- kompatible Module;
- Unterstützung durch CPU und Mainboard;
- abgestimmte Parameter;
- korrekte Firmwareeinstellungen.

Gemischte Module können:

- nur mit den Werten des langsamsten Moduls arbeiten;
- Mehrkanalbetrieb teilweise verlieren;
- instabil sein;
- einen Start verhindern.

`Mechanisch einsetzbar` bedeutet noch nicht `vollständig kompatibel`.

---

## 12. ECC

`Error-Correcting Code Memory` kann bestimmte Speicherfehler erkennen und korrigieren.

ECC kommt in Betracht, wenn:

- unerkannte Datenfehler hohe Schäden verursachen;
- das System lange und kritisch läuft;
- CPU, Mainboard und Firmware ECC unterstützen;
- die Zusatzkosten gerechtfertigt sind.

ECC ersetzt weder Backup noch Tests und andere Maßnahmen der Datenintegrität.

---

## 13. Massenspeicher: vier unterschiedliche Größen

| Größe | Bedeutung | Einheit |
|---|---|---|
| Kapazität | speicherbare Datenmenge | GB, TB |
| Latenz | Zeit bis zum Beginn einer Operation | µs, ms |
| Datendurchsatz | Datenmenge pro Sekunde | MB/s, GB/s |
| IOPS | Ein-/Ausgabeoperationen pro Sekunde | IOPS |

Hoher sequenzieller Durchsatz hilft bei großen Dateien. Niedrige Latenz und hohe IOPS sind bei vielen kleinen zufälligen Zugriffen wichtig, etwa für VM oder Datenbank.

Eine einzelne MB/s-Angabe beschreibt einen Speicher nicht vollständig.

---

## 14. HDD, SATA-SSD und NVMe-SSD

| Typ | Stärke | Grenze | Typische Nutzung |
|---|---|---|---|
| HDD | viel Kapazität zu niedrigem Preis | Mechanik, hohe Latenz | Archiv, große sequenzielle Daten |
| SATA-SSD | niedrige Latenz, breite Kompatibilität | SATA-Grenzen | Standardclient, Upgrade |
| NVMe-SSD | hohe Parallelität, niedrige Latenz | Kosten, Wärme, PCIe/Lanes | Builds, VM, intensiver I/O |

Für IDE, Datenbank, Container und VM ist eine SSD meist sinnvoll. Ein NVMe-Spitzenmodell bringt jedoch nicht in jedem Office-Workload einen wahrnehmbaren Vorteil.

---

## 15. M.2 ist nicht gleich NVMe

`M.2` bezeichnet vor allem Bauform und Steckverbinder. Ein M.2-Laufwerk kann unter anderem SATA oder PCIe mit NVMe verwenden.

Vor der Auswahl:

- Protokoll des konkreten Slots prüfen;
- unterstützte Modullänge und Keying prüfen;
- PCIe-Generation und Lanes prüfen;
- mögliche Lane-Teilung mit anderen Anschlüssen prüfen;
- Bootunterstützung prüfen;
- Kühlung prüfen.

> Die Bauform M.2 garantiert weder NVMe noch eine bestimmte Geschwindigkeit.

---

## 16. Endurance und Zuverlässigkeit von SSD

Bei schreibintensiver Nutzung sind relevant:

- TBW oder DWPD laut Hersteller;
- Garantiebedingungen;
- tatsächliches Schreibprofil;
- Over-Provisioning;
- Temperatur;
- Firmware und Monitoring;
- Backup und Austauschkonzept.

Eine hohe Endurance macht die SSD nicht zum Backup. Ausfall, Fehlbedienung, Schadsoftware oder Diebstahl bleiben eigene Risiken.

---

## 17. GPU und VRAM

Eine `integrierte GPU` genügt häufig für:

- Office und Browser;
- normale Softwareentwicklung;
- mehrere unterstützte Displays;
- Videowiedergabe.

Eine `dedizierte GPU` kann nötig sein für:

- 3D-CAD;
- GPU-Rendering;
- Videoeffekte;
- lokale KI-Workloads;
- Spezialberechnungen.

Neben Rechenleistung und VRAM sind Softwareunterstützung, Displayausgänge, Energiebedarf, Netzteil, Platz und Kühlung zu prüfen. Ohne passenden Workload erhöht eine teure dGPU nur Kosten und Verbrauch.

---

## 18. Mainboard, Sockel und Chipsatz

Das Mainboard bestimmt:

- CPU-Sockel und unterstützte Generationen;
- Chipsatz und Firmwareunterstützung;
- RAM-Typ, -Anzahl und -Kapazität;
- PCIe-Slots und Lanes;
- SATA- und M.2-Anschlüsse;
- Netzwerk, Audio und externe Ports;
- TPM-/Secure-Boot-Funktionen;
- Formfaktor und Stromanschlüsse.

Ein identischer Sockel garantiert nicht die Unterstützung jeder CPU. Chipsatz und notwendige Firmwareversion können abweichen.

---

## 19. UEFI, Secure Boot und TPM

`UEFI` beschreibt die Schnittstelle zwischen Plattform-Firmware und Betriebssystem. Praktisch sind zu prüfen:

- Unterstützung der eingebauten CPU;
- Bootmodus;
- Firmwareupdates;
- Secure Boot;
- TPM oder Firmware-TPM;
- Virtualisierungseinstellungen;
- Reihenfolge der Bootmedien.

Firmwareänderungen können BitLocker-Schlüssel, Startfähigkeit und Sicherheit beeinflussen. Herstelleranleitung, Backup, stabile Stromversorgung und Rückfallplan gehören zur Vorbereitung.

---

## 20. Betriebssystemanforderungen

Anforderungen des Betriebssystems sind Muss-Kriterien und müssen zum Beschaffungszeitpunkt anhand der aktuellen Herstellerdokumentation geprüft werden.

Beispiel, Stand 10.09.2026: Microsoft nennt für Windows 11 unter anderem:

- kompatiblen 64-Bit-Prozessor mit 1 GHz und mindestens zwei Kernen;
- 4 GB RAM;
- 64 GB Speicher;
- UEFI mit Secure-Boot-Fähigkeit;
- TPM 2.0.

Das sind Mindestwerte, keine Empfehlung für jeden professionellen Workload. Ein startfähiges System ist noch keine geeignete Entwicklungs- oder Virtualisierungsstation.

---

## 21. Netzteil: Nennleistung und reale Aufnahme

Auswahlkriterien:

- maximale Komponentenlast;
- kurzzeitige Lastspitzen;
- Effizienz;
- erforderliche Stecker;
- Qualität und Schutzfunktionen;
- Formfaktor;
- angemessene Leistungsreserve.

`650 W` auf einem Netzteil bedeuten nicht 650 W Daueraufnahme aus dem Netz.

Beispiel:

```text
Komponenten benötigen 300 W Gleichleistung.
Bei 90 % Wirkungsgrad:
P_Eingang = 300 W ÷ 0,90 = 333,3 W
```

Auch ein unnötig großes Netzteil ist nicht automatisch besser.

---

## 22. Kühlung, Temperatur und Throttling

Kann Wärme nicht ausreichend abgeführt werden, reduzieren Komponenten ihre Leistung:

> Thermal Throttling ist eine automatische Leistungsbegrenzung zur Einhaltung thermischer Grenzen.

Zu prüfen:

- Kühlerfreigabe;
- Luftstrom;
- Gehäuseabmessungen;
- Lüfterkurven;
- Staubfilter und Wartung;
- Geräuschgrenzen;
- Umgebungstemperatur.

Ein kurzer Test im kalten System kann Leistungseinbrüche unter Dauerlast verbergen.

---

## 23. Netzwerkadapter

Bei Ethernet:

- Datenrate;
- Gegenstelle und Standard;
- Kabelkategorie und -qualität;
- möglicher PoE-Bedarf;
- Treiber und Verwaltungsfunktionen.

Bei WLAN:

- Standards und Frequenzbänder;
- Antennen;
- Verschlüsselung und Authentifizierung;
- Funkumgebung;
- Roaming und Treiber.

Die Linkrate ist nicht der Nutzdurchsatz. Protokolloverhead, Gegenstelle, Medium, Entfernung und Störungen wirken mit.

---

## 24. Desktop, Notebook, Workstation oder Thin Client

| Gerätetyp | Vorteile | Grenzen |
|---|---|---|
| Desktop | Reparatur, Upgrade, Preis/Leistung | nicht mobil |
| Notebook | mobil, Akku und Display integriert | weniger Upgrade, thermische Grenzen |
| Workstation | professionelle Komponenten, ECC-/GPU-Optionen | Kosten, Energie |
| Thin Client | zentrale Verwaltung, geringer lokaler Aufwand | abhängig von Backend und Netzwerk |

Ein Thin Client ist nur mit passender zentraler Infrastruktur sinnvoll. Beim Notebook gehören Docking, Akku, Gewicht, Display und Reparierbarkeit in die Entscheidung.

---

## 25. Verfügbarkeit, Support und Lebenszyklus

Zu vergleichen sind:

- Lieferzeit und Ersatzgeräte;
- Garantie und Reaktionszeit;
- Vor-Ort-Service;
- Treiber- und Firmwareversorgung;
- unterstützter Betriebssystemlebenszyklus;
- standardisierte Modellserie;
- Ersatzteilverfügbarkeit;
- Verwaltbarkeit und Inventarisierung.

Ein seltenes Billigmodell kann den Supportaufwand erhöhen. Standardisierung reduziert Images, Treibervarianten und Ersatzteiltypen.

---

## 26. Vier Ebenen der Kompatibilität

| Ebene | Frage | Beispiel |
|---|---|---|
| mechanisch | passt Bauteil oder Stecker? | GPU-Länge, M.2-Bauform |
| elektrisch | stimmen Versorgung und Signale? | Netzteilstecker, Slotleistung |
| logisch/protokollarisch | werden Standard und Modus unterstützt? | SATA oder PCIe/NVMe |
| softwareseitig | gibt es Firmware, Treiber und OS-Support? | TPM, Gerätetreiber |

Hinzu kommen thermische und organisatorische Bedingungen.

---

## 27. Kompatibilitätscheckliste

Vor der Freigabe:

1. CPU ↔ Sockel, Chipsatz, Firmware.
2. RAM ↔ Generation, Bauform, Kapazität, Takt, ECC.
3. SSD ↔ Bauform, Protokoll, Key, Länge, Lanes.
4. GPU ↔ Slot, Abmessungen, Netzteil, Stecker, Kühlung.
5. Gehäuse ↔ Mainboard, Kühler, Laufwerke, Luftstrom.
6. Netzteil ↔ Leistung, Schutz, Anschlüsse, Bauform.
7. Displays ↔ Ausgänge, Auflösung, Bildwiederholrate.
8. Peripherie ↔ Ports, Treiber, Betriebssystem.
9. OS ↔ CPU, RAM, Speicher, UEFI, TPM.
10. Infrastruktur ↔ Netzwerk, Domäne, Verwaltung, Security.

Ergebnis und Prüfquelle werden dokumentiert.

---

## 28. Engpassanalyse

Ein `Engpass` ist die Ressource, die den aktuellen Workload begrenzt.

Mögliche Hinweise:

- CPU dauerhaft ausgelastet, andere Ressourcen frei;
- RAM voll, Swap nimmt zu;
- Datenträger mit hoher aktiver Zeit und Warteschlange;
- GPU oder VRAM begrenzt den Grafikworkload;
- Netzwerk begrenzt die Übertragung;
- Temperatur verursacht Throttling.

Vorgehen:

1. Problem reproduzieren.
2. CPU, RAM, I/O, Netzwerk, GPU und Temperatur messen.
3. Messung dem Workload zuordnen.
4. Hypothese formulieren.
5. Nur einen Faktor verändern.
6. Erneut messen.

Das älteste Bauteil ohne Messung zu ersetzen ist keine Engpassanalyse.

---

## 29. Praxisfall: FIAE-Arbeitsplatz

Anforderungen:

- IDE, Browser, Teams und lokale Datenbank;
- zwei VMs mit je 6 GB;
- mehrere Container;
- zwei QHD-Monitore;
- Gigabit-Ethernet;
- Geräteverschlüsselung und unterstütztes Betriebssystem;
- fünf Jahre geplante Nutzung.

Begründete Auswahl:

- moderne Mehrkern-CPU, mit passendem Build-Workload verglichen;
- mindestens die errechneten 36 GB RAM, praktisch 48/64 GB als unterstützte Konfiguration;
- NVMe-SSD mit ausreichender Kapazität und Endurance;
- iGPU, wenn zwei Displays unterstützt werden und kein GPU-Workload besteht;
- TPM 2.0, Secure Boot und unterstützte Firmware;
- Netzwerk und Dock/Ports passend zur Infrastruktur;
- Garantie, Updateversorgung und Upgradepfad für den Planungszeitraum.

Nicht begründet wären eine dGPU nur wegen ihres Preises, pauschal 32 GB „für Entwickler“ oder 1 TB ohne Datenmengenermittlung.

---

## 30. Vergleichsmatrix

Nach der Muss-Prüfung kann eine Nutzwertanalyse folgen:

| Kriterium | Gewicht | A | B |
|---|---:|---:|---:|
| Workload-Leistung | 30 % | Bewertung | Bewertung |
| RAM-/Upgradefähigkeit | 20 % | Bewertung | Bewertung |
| Sicherheit/OS-Support | 20 % | Bewertung | Bewertung |
| Service/Lebenszyklus | 15 % | Bewertung | Bewertung |
| Energie/Nachhaltigkeit | 10 % | Bewertung | Bewertung |
| Ergonomie/Mobilität | 5 % | Bewertung | Bewertung |

Der Preis bleibt sichtbar: entweder getrennt oder als transparent gewichtetes Kriterium. Jede Bewertung benötigt Skala und sachliche Begründung.

---

## 31. Prüfungsalgorithmus

1. Nutzungsszenario und Zielgruppe markieren.
2. Muss-Kriterien bilden.
3. Parallelität und Datenmenge einschätzen.
4. Anforderungen an CPU, RAM, Speicher, GPU und Netzwerk ableiten.
5. Betriebssystem, Security und Schnittstellen prüfen.
6. Kompatibilität auf allen Ebenen kontrollieren.
7. Energie, Support, Garantie, Upgrade und TCO berücksichtigen.
8. Unzulässige Varianten ausschließen.
9. Restliche Varianten nach Nutzwert und Kosten vergleichen.
10. Entscheidung mit Bedingung und Risiko formulieren.

---

## 32. Typische Prüfungsfallen

| Falle | Korrektur |
|---|---|
| mehr GHz ist immer schneller | Architektur, IPC, Kerne und Workload beachten |
| mehr Kerne beschleunigen alles | Parallelisierbarkeit prüfen |
| schneller RAM ersetzt Kapazität | zuerst ausreichende Kapazität |
| M.2 bedeutet NVMe | Bauform und Protokoll trennen |
| MB/s beschreibt eine SSD vollständig | Latenz, IOPS und Workload ergänzen |
| 650-W-Netzteil verbraucht 650 W | Nennleistung und Aufnahme trennen |
| gleicher Sockel genügt | Chipsatz und Firmware prüfen |
| mechanisch passend heißt kompatibel | alle vier Ebenen prüfen |
| OS-Minimum ist gute Workstation | realen Workload berechnen |
| teure GPU verbessert jede IDE | GPU an Anwendung binden |
| ECC ersetzt Backup | verschiedene Risiken, verschiedene Maßnahmen |
| Upgrade ist immer nachhaltiger | Sicherheit, Ausfall und Bedarf einbeziehen |

---

## 33. Selbsttest

1. Warum beginnt Hardwareauswahl beim Bedarf?
2. Worin unterscheiden sich Muss und Soll?
3. Nenne vier CPU-Merkmale.
4. Warum reichen GHz nicht?
5. Welche Aufgaben profitieren von mehreren Kernen?
6. Welche Grenzen hat ein Benchmark?
7. Was geschieht bei RAM-Mangel?
8. Berechne den Bedarf aus Abschnitt 10 mit 25 % Reserve.
9. Was ist beim Mischen von RAM-Modulen zu prüfen?
10. Wozu dient ECC?
11. Trenne Kapazität, Latenz, Durchsatz und IOPS.
12. Wann kann eine HDD sinnvoll sein?
13. Warum bedeutet M.2 nicht NVMe?
14. Welche SSD-Merkmale sind bei vielen Schreibzugriffen wichtig?
15. Wann wird eine dGPU benötigt?
16. Was ist beim Mainboard zu prüfen?
17. Warum reicht ein gleicher Sockel nicht?
18. Was ist UEFI?
19. Warum genügt das OS-Minimum nicht?
20. Warum bedeutet 650 W Netzteil nicht 650 W Verbrauch?
21. Berechne die Eingangsleistung bei 300 W und 90 % Wirkungsgrad.
22. Was ist Thermal Throttling?
23. Warum ist Linkrate nicht Nutzdurchsatz?
24. Wann ist ein Thin Client geeignet?
25. Nenne vier Support-/Lebenszykluskriterien.
26. Welche vier Kompatibilitätsebenen gibt es?
27. Nenne Hinweise auf einen RAM-Engpass.
28. Wie wird ein Bottleneck geprüft?
29. Begründe den Verzicht auf eine dGPU im FIAE-Szenario.
30. Formuliere eine Entscheidung zwischen zwei Alternativen.

<details>
<summary>Lösungen anzeigen</summary>

1. Nur die Aufgabe bestimmt benötigte Leistung, Anschlüsse und Grenzen.
2. Ohne Muss wird ausgeschlossen; vom Soll darf begründet abgewichen werden.
3. Kerne, Threads, Takt, IPC/Architektur, Cache, Plattform oder Verbrauch.
4. Architekturen leisten pro Takt unterschiedlich viel; der Workload entscheidet.
5. VM, parallele Builds, Rendering, Encoding und mehrere Dienste.
6. Er muss aufgabenbezogen, vergleichbar und reproduzierbar sein.
7. Das Betriebssystem lagert stärker aus; die Latenz steigt.
8. `30 GB × 1,25 = 37,5 GB`; eine unterstützte Konfiguration oberhalb wählen.
9. Generation, Bauform, Takt, Slots, Kanäle und Unterstützung von CPU/Mainboard.
10. Bestimmte Speicherfehler erkennen und korrigieren.
11. Datenmenge; Verzögerung; Daten pro Sekunde; Operationen pro Sekunde.
12. Bei großer günstiger Kapazität und geeignetem Zugriffsmuster.
13. M.2 ist Bauform/Steckverbinder; das Laufwerk kann SATA oder PCIe/NVMe nutzen.
14. TBW/DWPD, Garantie, Temperatur, Firmware und reales Schreibprofil.
15. Bei nachgewiesenem 3D-, Rendering-, Video-, KI- oder Spezialworkload.
16. Sockel, Chipsatz, RAM, Slots/Lanes, Anschlüsse, Formfaktor und Firmware.
17. Chipsatz oder Firmware können die konkrete CPU nicht unterstützen.
18. Die Schnittstelle zwischen Plattform-Firmware und Betriebssystem mit Boot-/Security-Funktionen.
19. Mindestwerte belegen Startfähigkeit, nicht ausreichende Arbeitsleistung.
20. Es ist die mögliche Ausgangsleistung; die Aufnahme folgt Last und Wirkungsgrad.
21. `300 W ÷ 0,90 = 333,3 W`.
22. Leistungsreduktion zur Einhaltung einer Temperaturgrenze.
23. Overhead, Gegenstelle, Medium, Entfernung und Störungen wirken mit.
24. Wenn Backend, Netzwerk und zentrale Verwaltung den Bedarf erfüllen.
25. Garantie, Reaktionszeit, Ersatzgeräte, Updates, Ersatzteile, Standardisierung.
26. Mechanisch, elektrisch, logisch/protokollarisch, softwareseitig.
27. Voller RAM, steigender Swap, hohe Datenträgeraktivität und Wartezeiten.
28. Reproduzieren, messen, Hypothese bilden, einen Faktor ändern, erneut messen.
29. Unterstützt die iGPU beide Monitore und fehlt GPU-Workload, entsteht kein Nutzwert.
30. Beispiel: `Alternative B erfüllt alle Muss-Kriterien und bietet für die parallelen VM ausreichend RAM sowie einen dokumentierten Updatezeitraum. Trotz des höheren Kaufpreises wird B gewählt, weil A wegen fehlender RAM-Kapazität zu Auslagerung und Folgekosten führen würde.`

</details>

---

## 34. Quellen und Abgleich

- [§ 9 FIAusbV – Prüfungsbereich Teil 1](https://www.gesetze-im-internet.de/fiausbv/__9.html)
- [FIAusbV und Ausbildungsrahmenplan – BIBB](https://www.bibb.de/dienst/berufesuche/de/index_berufesuche.php/regulation/VO_Fachinformatiker_2020.pdf)
- [Windows 11 – aktuelle Systemanforderungen](https://www.microsoft.com/windows/windows-11-specifications)
- [UEFI Forum – Specifications](https://uefi.org/specifications)
- [NVM Express – Specifications](https://nvmexpress.org/specifications/)

Konkrete Herstellerdaten, Betriebssystemanforderungen und Kompatibilitätslisten sind zum Beschaffungszeitpunkt erneut zu prüfen. Zahlen in Bedarfsszenarien sind didaktische Annahmen.

---

## 35. Offene Prüfpunkte für den Unterricht

- Wie detailliert vergleicht die WBS CPU-Kennzahlen?
- Werden IPC, Cache und SMT erwartet?
- Muss eine RAM-Reserve berechnet werden?
- Welche Speicherkennzahlen gehören zum Prüfungsstoff?
- Wird die Trennung von SATA, PCIe, NVMe und M.2 verlangt?
- Nutzt die WBS konkrete Windows-11-Anforderungen?
- Wie tief werden UEFI, Secure Boot und TPM behandelt?
- Wird eine Rechnung zum Netzteilwirkungsgrad erwartet?
- Welche Werkzeuge dienen der Engpassanalyse?
- Wo liegt die Grenze zu Schnittstellen und Betriebssystemen?
