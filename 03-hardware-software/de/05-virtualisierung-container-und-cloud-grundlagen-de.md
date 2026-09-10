---
pruefung: AP1
thema: Virtualisierung, Container und Cloud-Grundlagen
prioritaet: Abgleich
status: Entwurf
stand: 2026-09-10
sprache: Deutsch
gegenstueck: ../ru/05-virtualisierung-container-und-cloud-grundlagen-ru.md
---

# AP1: Virtualisierung, Container und Cloud-Grundlagen

Virtualisierung trennt logische IT-Ressourcen von physischer Hardware. Cloud Computing stellt standardisierte, vernetzte und messbare Dienste bereit, nimmt dem Kunden aber nicht die Verantwortung für Konfiguration, Identitäten, Daten und Anbieterkontrolle ab.

---

## 1. Lernziele

Nach dieser Einheit kannst du:

- Host, Hypervisor, VM und Gastbetriebssystem erklären;
- Typ-1- und Typ-2-Hypervisor unterscheiden;
- VM, Container, VDI und DaaS vergleichen;
- den Ressourcenbedarf überschlägig berechnen;
- Overcommit, Isolation und Single Point of Failure erklären;
- Snapshot und Backup trennen;
- die fünf Cloud-Merkmale nach NIST nennen;
- IaaS, PaaS, SaaS und DaaS vergleichen;
- Public, Private, Community und Hybrid Cloud unterscheiden;
- Verantwortung zwischen Anbieter und Kunde zuordnen;
- Kosten, Datenschutz, Verfügbarkeit, Portabilität und Exit bewerten;
- ein Betriebsmodell begründet auswählen.

---

## 2. Prüfungsminimum — 15 Minuten

1. Eine `VM` besitzt virtuelle Hardware und ein eigenes Gastbetriebssystem.
2. `Container` teilen den Kernel des Hosts und isolieren Prozesse.
3. Typ 1 arbeitet direkt auf der Hardware, Typ 2 auf einem Hostbetriebssystem.
4. Ein Snapshot hält einen Zustand fest, hängt aber meist von der Plattform ab und ersetzt kein Backup.
5. IaaS = Infrastruktur, PaaS = Plattform, SaaS = fertige Anwendung, DaaS = virtueller Desktop.
6. Je höher die Serviceebene, desto mehr Betrieb übernimmt der Anbieter. Der Kunde bleibt für eigene Daten, Identitäten, Konfiguration und Nutzung verantwortlich.
7. Cloud ist nicht automatisch billiger, sicherer oder verfügbarer.
8. Vor der Auswahl: Bedarf, Daten, Netzwerk, SLA, Kostenmodell, Integration, Backup, Export und Exit.

Musterantwort:

> SaaS eignet sich, weil der Kunde die fertige CRM-Anwendung nutzen möchte, ohne Betriebssystem und Anwendung selbst zu betreiben. Zu prüfen bleiben insbesondere Rollen, Auftragsverarbeitung, Verfügbarkeit, Schnittstellen, Datenexport und Exit-Kosten.

---

## 3. Grundidee der Virtualisierung

Eine physische Ressource wird als mehrere logische Ressourcen dargestellt oder zu einem abstrahierten Pool zusammengefasst.

Ziele:

- Konsolidierung;
- Isolation;
- unterschiedliche Betriebssysteme;
- schnelle Bereitstellung;
- Testumgebungen;
- Portabilität;
- bessere Auslastung.

Virtualisierung erzeugt keine Rechenleistung. CPU, RAM, Speicher und Netzwerk des Hosts bleiben physische Grenzen.

---

## 4. Begriffe

| Begriff | Bedeutung |
|---|---|
| Host | physische oder zugrunde liegende Plattform |
| Hypervisor/VMM | verwaltet VM und Ressourcen |
| VM | logischer Rechner mit virtueller Hardware |
| Guest/Gast | Betriebssystem innerhalb einer VM |
| vCPU | virtuell zugewiesene CPU-Ressource |
| Image | Datei oder Vorlage eines Systemzustands |
| Snapshot | Zustandsmarke in einer virtuellen Datenträgerkette |
| Template | vorbereitete Ausgangsbasis für neue VM |

Eine VM verhält sich wie ein eigener Rechner, bleibt aber von Host und Hypervisor abhängig.

---

## 5. Typ-1- und Typ-2-Hypervisor

| Merkmal | Typ 1 | Typ 2 |
|---|---|---|
| Ausführung | direkt auf der Hardware | als Anwendung auf einem Host-OS |
| Einsatz | Server und Rechenzentrum | Desktop, Labor, Entwicklung |
| Abhängigkeit | Hypervisor und Hardware | zusätzlich Host-OS |
| Verwaltung | spezialisiert | komfortabel lokal |

Das ist eine typische Einordnung, keine Qualitätswertung. Typ 2 kann für Entwicklung, Typ 1 für zentralen Betrieb richtig sein.

---

## 6. Aufbau einer VM

Eine VM erhält:

- vCPU;
- virtuellen RAM;
- virtuelle Datenträger;
- virtuelle Netzwerkadapter;
- virtuelle Firmware;
- virtuelle oder durchgereichte Geräte.

Das Gastbetriebssystem benötigt Updates, Härtung, Monitoring und Lizenzierung wie ein separates System, soweit die Bedingungen nichts anderes festlegen.

---

## 7. Ressourcenplanung

Übungsarbeitsplatz:

- Host-OS und Werkzeuge: 8 GB RAM;
- VM 1: 6 GB;
- VM 2: 6 GB;
- VM 3: 6 GB;
- Reserve: 20 %.

```text
Basis = 8 + 6 + 6 + 6 = 26 GB
Mit Reserve = 26 × 1,20 = 31,2 GB
```

Die nächste unterstützte Konfiguration besitzt mindestens 32 GB. Bei weiteren Anwendungen oder deutlichen Lastspitzen wird zusätzliche Reserve eingeplant. CPU-, Speicher- und I/O-Bedarf werden getrennt bewertet.

---

## 8. Overcommit

Bei `Overcommit` werden logisch mehr Ressourcen zugeteilt, als physisch vorhanden sind, weil nicht alle Gäste gleichzeitig ihr Maximum benötigen sollen.

Vorteil:

- höhere Auslastung.

Risiken:

- Leistungseinbruch bei gleichzeitiger Last;
- Swapping oder Ballooning;
- unvorhersehbare Latenz;
- SLA-Verletzung.

Overcommit erfordert Messung, Grenzwerte, Monitoring und Kapazitätsplanung.

---

## 9. Isolation und Grenzen

VM verbessern die Trennung, bieten aber keine absolute Isolation.

Risiken:

- Hypervisor-Schwachstelle;
- falsche Netzwerksegmentierung;
- gemeinsame Storage- oder Managementebene;
- zu breite Adminrechte;
- kompromittierte Templates;
- gemeinsame Hardware;
- unkontrollierter Datenaustausch.

Die Managementschnittstelle braucht MFA, minimale Rechte, ein geschütztes Netz, Updates und Logging.

---

## 10. Snapshot ist kein Backup

Ein Snapshot ist vor einer kurzfristigen Änderung praktisch, weil er einen VM-/Datenträgerzustand festhält und einen schnellen Rücksprung ermöglichen kann.

Er:

- hängt meist von Ausgangs-VM und Plattform ab;
- liegt oft auf demselben Storage;
- kann als Kette wachsen und Leistung beeinträchtigen;
- ist keine unabhängige Aufbewahrung;
- ersetzt keinen Wiederherstellungstest.

> Snapshot unterstützt einen kurzfristigen Rollback; Backup schützt als unabhängige, wiederherstellbare Kopie gegen weitere Ausfallszenarien.

---

## 11. Clone und Template

Ein `Clone` ist eine Kopie einer vorhandenen VM.  
Ein `Template` ist eine vorbereitete Basis für reproduzierbare Bereitstellung.

Vor dem Klonen:

- Computername und Identitäten erneuern;
- Schlüssel und Zertifikate erneuern;
- Updates einspielen;
- Testdaten und Secrets entfernen;
- Netzwerk und Domänenprozess planen;
- Lizenzierung prüfen;
- Vorgang dokumentieren.

Doppelte Identitäten können Konflikte und Sicherheitsprobleme verursachen.

---

## 12. Virtuelle Netzwerke und Speicher

Netzkomponenten:

- virtueller Switch;
- Portgruppe oder Netzsegment;
- VLAN-Zuordnung;
- NAT oder Bridging;
- Firewall/Filter;
- virtuelle Netzwerkkarte.

Speicher:

- lokaler Hostspeicher;
- gemeinsamer Storage;
- Thin/Thick Provisioning;
- virtuelle Datenträgerdatei;
- Storage-Netzwerk.

Thin Provisioning spart Vorabbelegung, muss aber überwacht werden, damit der physische Pool nicht unerwartet voll wird.

---

## 13. Container

Container:

- isolieren Prozesse;
- nutzen den Hostkernel;
- werden aus Images bereitgestellt;
- laufen als Containerinstanzen;
- starten meist schnell und benötigen weniger Overhead.

Ein Image enthält Anwendung und Abhängigkeiten, aber keinen vollständigen eigenen Gastkernel.

> Container sind keine „kleinen VMs“, obwohl beide Isolation und reproduzierbare Umgebungen unterstützen.

---

## 14. VM gegen Container

| Kriterium | VM | Container |
|---|---|---|
| OS | eigenes Gast-OS | gemeinsamer Hostkernel |
| Isolation | zwischen OS-Instanzen | Prozess-/Namespace-Modell |
| Start | langsamer | meist schneller |
| Ressourcen | höher | meist geringer |
| OS-Vielfalt | verschiedene Gast-OS | abhängig vom Kernel |
| Einsatz | ganze Systeme, Legacy, starke Trennung | Anwendungen, Dienste, CI/CD |

Container laufen häufig innerhalb von VM. Es ist nicht zwingend eine Entweder-oder-Entscheidung.

---

## 15. Containersicherheit

Zu prüfen:

- vertrauenswürdige Registry;
- Signatur und Integrität;
- minimales Base Image;
- bekannte Schwachstellen;
- keine Secrets im Image;
- möglichst nicht als root;
- schreibgeschützte Bereiche;
- Ressourcenlimits;
- Netzwerkregeln;
- regelmäßiger Neubau;
- Logging.

Persistente Daten gehören in einen geeigneten Speicher und dürfen beim Ersetzen der Instanz nicht verloren gehen.

---

## 16. Desktopvirtualisierung

Bei VDI läuft der Desktop zentral; das Endgerät überträgt hauptsächlich Ein- und Ausgabe.

Vorteile:

- zentrale Verwaltung;
- schneller Austausch des Endgeräts;
- kontrollierte Datenhaltung;
- Zugriff von verschiedenen Geräten.

Risiken:

- Netzwerk- und Backendabhängigkeit;
- Latenz bei Audio, Video oder Grafik;
- zentrale Störung trifft viele;
- Lizenzierung;
- Kapazitätsplanung;
- Datenschutz.

---

## 17. DaaS

`Desktop as a Service` stellt virtuelle Desktops als Cloud-Dienst bereit.

Der Anbieter kann Infrastruktur und Plattformanteile verwalten. Der Kunde bleibt typischerweise verantwortlich für:

- Nutzer und Rollen;
- freigegebene Anwendungen;
- Daten;
- Endgeräte;
- Nutzungsregeln;
- Teile der Sicherheitskonfiguration;
- Vertrag, Datenschutz und Exit.

Die genaue Grenze ergibt sich aus dem Vertrag.

---

## 18. Cloud: fünf NIST-Merkmale

| Merkmal | Bedeutung |
|---|---|
| On-demand self-service | Ressourcen ohne manuelle Anbieterhandlung abrufen |
| Broad network access | Zugriff über Netze und Standardmechanismen |
| Resource pooling | Ressourcen für mehrere Kunden bündeln |
| Rapid elasticity | Ressourcen schnell skalieren |
| Measured service | Nutzung messen und steuern |

Nicht jeder fremdbetriebene Server ist automatisch Cloud.

---

## 19. Servicemodelle

| Modell | Kunde nutzt | Anbieter betreibt typischerweise |
|---|---|---|
| IaaS | virtuelle Rechen-, Netz- und Speicherressourcen | Hardware und Virtualisierung |
| PaaS | Plattform/Laufzeit für eigene Anwendungen | Infrastruktur, OS und Runtime |
| SaaS | fertige Anwendung | fast den gesamten technischen Stack |
| DaaS | virtuellen Arbeitsplatz/Desktop | Desktop-Infrastruktur laut Vertrag |

Mit höherer Abstraktion sinkt der eigene technische Betrieb, aber auch die direkte Kontrolle.

---

## 20. Shared Responsibility

Vereinfachte Zuordnung:

| Bereich | IaaS | PaaS | SaaS |
|---|---|---|---|
| physische Infrastruktur | Anbieter | Anbieter | Anbieter |
| Virtualisierung | Anbieter | Anbieter | Anbieter |
| Gast-OS | Kunde | Anbieter | Anbieter |
| eigene Anwendung | Kunde | Kunde | Anbieter |
| Konfiguration/Rollen | Kunde | geteilt | geteilt/Kunde |
| Kundendaten | Kunde | Kunde | Kunde |

Die Tabelle ersetzt keinen Vertrag. Backup, Logs, Verschlüsselung, Incident Response und Löschung sind konkret zu prüfen.

---

## 21. Deploymentmodelle

| Modell | Beschreibung |
|---|---|
| Public Cloud | Anbieterressourcen für viele Kunden |
| Private Cloud | exklusiv für eine Organisation |
| Community Cloud | für eine Gemeinschaft mit gemeinsamen Anforderungen |
| Hybrid Cloud | verbundene Kombination eigenständiger Cloud-Infrastrukturen |

Private Cloud bedeutet nicht zwingend Betrieb im eigenen Gebäude. Public Cloud bedeutet nicht öffentliche Kundendaten.

---

## 22. Vorteile

- schnelle Bereitstellung;
- elastische Kapazität;
- messbare Nutzung;
- weniger eigene Hardwarezyklen;
- globaler Zugang;
- verwaltete Dienste;
- Automatisierung.

Der Nutzen entsteht nur mit geeigneter Architektur, Governance und Qualifikation.

---

## 23. Risiken

- Anbieter- und Netzwerkabhängigkeit;
- Fehlkonfiguration;
- unerwartete variable Kosten;
- Vendor Lock-in;
- begrenzte Einsicht;
- Datenschutz und Drittlandbezug;
- Regions- oder Dienstausfall;
- Datenexport und Löschung;
- veränderte Leistung oder Preise.

Ein Risiko wird als Ursache, Ereignis und Auswirkung beschrieben und mit einer Maßnahme verbunden.

---

## 24. Kosten und Skalierung

Cloudkosten können umfassen:

- laufende Instanzen;
- Speicher;
- Transaktionen;
- Datenübertragung und Egress;
- Support;
- Lizenzen;
- Monitoring und Logs;
- Reserve und Backup;
- Migration;
- Exit.

```text
Monatskosten =
Nutzungsmenge × Preis je Einheit
+ feste Grundkosten
+ Datenübertragung
+ Support
```

Pay per Use kann bei variabler Last passen. Ohne Budgets, Tags, Warnungen und Abschaltung können Kosten unerwartet steigen.

---

## 25. Verfügbarkeit und SLA

Zu prüfen:

- zugesagte Verfügbarkeit;
- Messpunkt und Zeitraum;
- Wartungsfenster;
- Ausschlüsse;
- Service Credits;
- RTO und RPO;
- eigene Redundanz;
- Abhängigkeiten von Internet, DNS und Identitätsdienst.

Eine SLA-Gutschrift ersetzt nicht zwingend den Geschäftsschaden.

---

## 26. Datenschutz und Sicherheit

Fragen:

- Datenarten und Schutzbedarf;
- Verantwortlicher und Auftragsverarbeiter;
- Vertrag und AVV;
- Regionen und Drittlandtransfers;
- Verschlüsselung und Schlüsselkontrolle;
- Identitäten, MFA und Least Privilege;
- Logging und Alarmierung;
- Mandantentrennung;
- Löschung;
- Unterauftragnehmer;
- Incidentprozess.

Cloudangebote können starke Schutzfunktionen besitzen; Fehlkonfigurationen des Kunden bleiben ein Risiko.

---

## 27. Backup, Export und Exit

Vor Einführung:

- Exportformat;
- Vollständigkeit;
- API und Geschwindigkeit;
- Egresskosten;
- Konfigurations- und Metadatenexport;
- unabhängiges Backup;
- Löschbestätigung;
- Kündigungsfristen;
- Übergangszeit;
- Ersatzverfahren.

`„Daten sind exportierbar“` reicht nicht. Wiederherstellbarkeit und Weiterverwendbarkeit müssen getestet werden.

---

## 28. Vollständiger Praxisfall

Anforderung: CRM für 40 Beschäftigte ohne eigenen Serverbetrieb.

- SaaS erfüllt den Wunsch nach fertiger Anwendung.
- SSO/MFA und Rollen werden getestet.
- AVV, Regionen, Unterauftragnehmer und Löschung werden geprüft.
- ERP-Schnittstelle wird mit Testdaten erprobt.
- SLA wird dem Geschäftsprozess gegenübergestellt.
- Lizenz- und Egresskosten fließen in TCO ein.
- Regelmäßiger Export erfolgt in dokumentiertem Format.
- Ein Exittest prüft den Import bei einer Alternative.

> SaaS ist geeignet, sofern die Fachfunktionen und Muss-Kriterien erfüllt sind. Die Freigabe setzt einen geprüften AVV, funktionierende Rollen und Schnittstellen, ein akzeptiertes SLA sowie einen getesteten Datenexport voraus.

---

## 29. Prüfungsalgorithmus

1. Workload und Ziel bestimmen.
2. VM, Container, VDI oder Cloud-Service einordnen.
3. CPU, RAM, Speicher und Netzwerk bewerten.
4. Isolation und Abhängigkeiten prüfen.
5. Verantwortung je Schicht zuordnen.
6. Datenschutz, Security und SLA prüfen.
7. TCO, Skalierung und Egress berechnen.
8. Backup, Export und Exit testen.
9. Entscheidung mit Bedingungen formulieren.

---

## 30. Typische Prüfungsfallen

| Falle | Korrektur |
|---|---|
| VM erzeugt Ressourcen | physische Hostgrenzen bleiben |
| Container ist kleine VM | gemeinsamer Kernel, anderes Isolationsmodell |
| Snapshot ist Backup | Abhängigkeit und fehlende unabhängige Kopie |
| Cloud ist externer Server | fünf Merkmale prüfen |
| SaaS beendet Kundenverantwortung | Daten, Rollen und Konfiguration bleiben |
| Private Cloud ist immer on-premises | Exklusivität statt Standort |
| Public Cloud bedeutet öffentliche Daten | Betriebsmodell statt Datenfreigabe |
| Pay per Use ist immer billiger | Profil, Egress, Support und Dauer |
| SLA verhindert Ausfälle | SLA definiert Niveau und Rechtsfolge |
| Exportfunktion beweist Exit | Wiederherstellung und Nutzung testen |

---

## 31. Selbsttest

1. Was virtualisiert ein Hypervisor?
2. Trenne Typ 1 und Typ 2.
3. Woraus besteht eine VM?
4. Berechne den RAM aus Abschnitt 7.
5. Was ist Overcommit?
6. Warum ist VM-Isolation nicht absolut?
7. Warum ist ein Snapshot kein Backup?
8. Was wird vor dem Klonen geprüft?
9. Was macht ein virtueller Switch?
10. Was bedeutet Thin Provisioning?
11. Wie unterscheidet sich ein Container von einer VM?
12. Nenne fünf Containersicherheitsmaßnahmen.
13. Nenne je zwei Vor- und Nachteile von VDI.
14. Was ist DaaS?
15. Nenne fünf Cloud-Merkmale.
16. Trenne IaaS, PaaS und SaaS.
17. Wer betreibt das Gast-OS bei IaaS?
18. Wer verantwortet Kundendaten bei SaaS?
19. Trenne Public und Private Cloud.
20. Warum ist Private Cloud nicht zwingend on-premises?
21. Nenne fünf Cloudkosten.
22. Was wird in einem SLA geprüft?
23. Nenne fünf Datenschutz-/Securityfragen.
24. Was gehört in einen Exitplan?
25. Begründe SaaS für den Praxisfall.

<details>
<summary>Lösungen anzeigen</summary>

1. Den Zugriff mehrerer logischer VM auf physische Ressourcen.
2. Typ 1 arbeitet auf Hardware, Typ 2 auf einem Hostbetriebssystem.
3. vCPU, RAM, Datenträger, NIC, Firmware und Gast-OS.
4. `31,2 GB`; mindestens die nächste unterstützte 32-GB-Konfiguration, gegebenenfalls mehr.
5. Mehr logische als physisch vorhandene Ressourcen werden vergeben.
6. Hypervisor, Hardware, Netzwerk, Storage und Management werden geteilt.
7. Er hängt von Plattform und Ausgangs-VM ab und liegt oft auf demselben Speicher.
8. Identitäten, Schlüssel, Updates, Secrets, Netzwerk, Lizenz und Dokumentation.
9. Er verbindet virtuelle Netzwerkkarten und Segmente.
10. Logischer Speicher wird vor tatsächlichem Verbrauch zugeteilt; der Pool braucht Monitoring.
11. Container teilt den Hostkernel; VM besitzt ein Gast-OS.
12. Registry, Signatur, kleines Image, Scan, non-root, Limits, keine Secrets, Updates.
13. Zentrale Verwaltung und Datenkontrolle; Netzwerk-/Backendabhängigkeit und zentrale Ausfälle.
14. Ein virtueller Desktop als Dienst.
15. On-demand, broad access, pooling, elasticity und measured service.
16. Infrastruktur, Plattform und fertige Anwendung.
17. Der Kunde.
18. Der Kunde bleibt für seine Daten verantwortlich.
19. Für viele Kunden; exklusiv für eine Organisation.
20. Private beschreibt Exklusivität, nicht den Standort.
21. Compute, Speicher, Transaktionen, Egress, Support, Backup, Logs oder Lizenzen.
22. Messung, Zeitraum, Wartung, Ausnahmen, Credits, RTO/RPO und Abhängigkeiten.
23. AVV, Region, Verschlüsselung, IAM, Logging, Löschung und Unterauftragnehmer.
24. Export, Format, Kosten, Frist, Backup, Löschung und Ersatzbetrieb.
25. Die Musterantwort aus Abschnitt 28 mit Bedingungen verwenden.

</details>

---

## 32. Quellen und Abgleich

- [NIST SP 800-145 – Definition of Cloud Computing](https://csrc.nist.gov/pubs/sp/800/145/final)
- [NIST SP 800-125 – Full Virtualization Security](https://csrc.nist.gov/pubs/sp/800/125/final)
- [BSI – Cloud Computing Grundlagen](https://www.bsi.bund.de/DE/Themen/Unternehmen-und-Organisationen/Informationen-und-Empfehlungen/Cloud-Computing/cloud-computing_node.html)
- [BSI C5 – Cloud Computing Compliance Criteria Catalogue](https://www.bsi.bund.de/c5)
- [Art. 28 DSGVO – Auftragsverarbeiter](https://eur-lex.europa.eu/eli/reg/2016/679/art_28/oj)

NIST SP 800-145 dient als stabile Begriffsgrundlage. Konkrete Verantwortungen und Zusagen ergeben sich aus dem gewählten Dienst und Vertrag.

---

## 33. Offene Prüfpunkte für den Unterricht

- Welche Virtualisierungsbegriffe gehören zum aktuellen WBS-Stoff?
- Muss Typ 1 gegen Typ 2 unterschieden werden?
- Werden Ressourcenreserve und Overcommit berechnet?
- Wie ausführlich werden Container behandelt?
- Sind die fünf NIST-Merkmale erforderlich?
- Welche Servicemodelle außer SaaS und DaaS werden erwartet?
- Sind die vier Deploymentmodelle relevant?
- Wie tief geht Shared Responsibility?
- Werden SLA- oder Cloudkosten berechnet?
- Welche Datenschutzformulierungen erwartet die WBS?
