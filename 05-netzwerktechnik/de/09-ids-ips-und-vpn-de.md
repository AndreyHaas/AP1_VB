---
pruefung: AP1
thema: Netzwerktechnik
prioritaet: Vertiefung
status: Entwurf
stand: 2026-09-10
sprache: Deutsch
gegenstueck: ../ru/09-ids-ips-und-vpn-ru.md
---

# IDS, IPS und VPN

## 1. Lernziele

Du kannst:

- Firewall, IDS und IPS nach Aufgabe und Position unterscheiden;
- signatur- und anomaliebasierte Erkennung erklären;
- False Positive und False Negative sicher zuordnen;
- Remote-Access-, Site-to-Site- und End-to-End-VPN unterscheiden;
- Schutzwirkung und Grenzen eines VPN bewerten;
- für einen Fall Erkennung, Prävention, sicheren Tunnel und weitere Maßnahmen kombinieren.

## 2. Prüfungsminimum — 15 Minuten

1. Ein IDS erkennt und meldet verdächtige Aktivitäten; es blockiert normalerweise nicht selbst.
2. Ein IPS liegt aktiv im Datenpfad und kann erkannten Verkehr blockieren.
3. Eine Firewall setzt Verkehrsregeln um; IDS/IPS sucht zusätzlich nach Angriffsmustern oder Abweichungen.
4. `False Positive`: normale Aktivität wird fälschlich als Angriff gemeldet.
5. `False Negative`: ein echter Angriff bleibt unerkannt.
6. Signaturerkennung findet bekannte Muster; Anomalieerkennung sucht Abweichungen vom erwarteten Verhalten.
7. Remote Access verbindet einen Client mit einem Netz; Site to Site verbindet Netze.
8. Ein VPN schützt Daten auf dem definierten Übertragungsweg durch kryptografische Verfahren, macht Endgeräte und Inhalte aber nicht automatisch sicher.
9. Starke Authentisierung, minimale Berechtigungen, Patchstand und Monitoring bleiben notwendig.

> Ein IDS eignet sich zur Erkennung und Alarmierung, während ein IPS zusätzlich automatisch eingreifen kann, dafür aber wegen möglicher Fehlalarme sorgfältig getestet werden muss.

## 3. Grundlagen IDS und IPS

### 3.1 Aufgabenvergleich

| System | Hauptaufgabe | typische Reaktion | Position |
|---|---|---|---|
| Firewall | erlaubte Datenflüsse durchsetzen | allow/deny/log | Übergang oder Host |
| IDS | verdächtige Aktivität erkennen | Alarm, Log, Ticket | oft passiv über Sensor/Spiegelport |
| IPS | verdächtige Aktivität erkennen und verhindern | blockieren, verwerfen, Verbindung beenden | inline im Datenpfad |

Die Funktionen können in einem Produkt kombiniert sein. Für die Prüfungsantwort zählt die tatsächlich beschriebene Funktion, nicht der Produktname.

### 3.2 Erkennungsverfahren

`Signaturbasiert`:

- vergleicht Ereignisse mit bekannten Mustern;
- ist bei bekannten Angriffen oft präzise;
- benötigt aktuelle Signaturen;
- kann neue oder stark veränderte Angriffe übersehen.

`Anomaliebasiert`:

- vergleicht Verhalten mit Basiswerten oder Modellen;
- kann bisher unbekannte Abweichungen entdecken;
- benötigt Lern-, Tuning- und Kontextarbeit;
- kann legitime Sonderfälle als Angriff melden.

Weitere Kontextquellen sind Protokollanalyse, Reputation, Datei- oder Verhaltensanalyse. Keine Methode erkennt jeden Angriff.

### 3.3 Erkennungsfehler

| Realität | Meldung | Ergebnis |
|---|---|---|
| kein Angriff | Alarm | False Positive |
| Angriff | kein Alarm | False Negative |
| Angriff | Alarm | True Positive |
| kein Angriff | kein Alarm | True Negative |

False Positives binden Personal und können beim IPS legitimen Verkehr blockieren. False Negatives lassen Angriffe unbemerkt. Schwellenwerte verändern häufig den Zielkonflikt zwischen beiden.

### 3.4 Platzierung und Betrieb

Mögliche Sensorpositionen:

- am Internetübergang;
- zwischen DMZ und internem Netz;
- vor besonders kritischen Serversegmenten;
- auf Hosts als HIDS/HIPS;
- im WLAN oder Cloud-Datenpfad.

Ein verschlüsselter Datenstrom kann Netzwerk-Sensoren nur eingeschränkt analysierbar sein. Analyse kann an einem erlaubten Entschlüsselungspunkt oder auf dem Endsystem erfolgen; Datenschutz und Schlüsselrisiken müssen berücksichtigt werden.

## 4. VPN-Grundlagen und Grenzen

### 4.1 VPN-Typen

| Typ | Endpunkte | Beispiel |
|---|---|---|
| Remote Access / End to Site | Client ↔ Unternehmensgateway | Notebook im Homeoffice |
| Site to Site | Gateway ↔ Gateway | zwei Filialnetze |
| End to End | Anwendung/Host ↔ Anwendung/Host | direkte geschützte Verbindung |

Ein VPN-Tunnel nutzt kryptografische Mechanismen für Vertraulichkeit, Integrität und Authentisierung des Kommunikationspartners, abhängig von Protokoll und Konfiguration.

### 4.2 IPsec und andere VPN-Verfahren

`IPsec` schützt IP-Kommunikation auf der Netzwerkschicht und nutzt gewöhnlich IKE für Aushandlung und Schlüsselmanagement. Im Tunnelmodus kann ein komplettes ursprüngliches IP-Paket geschützt und in ein neues Paket eingebettet werden.

TLS-basierte VPNs und andere Protokolle können Remote Access bereitstellen. „VPN“ allein sagt weder Algorithmus noch Sicherheitsniveau; veraltete Protokolle und schwache Konfigurationen sind zu vermeiden.

### 4.3 Full Tunnel und Split Tunnel

- `Full Tunnel`: der definierte Clientverkehr läuft über das Unternehmensgateway; zentrale Kontrolle ist einfacher, Bandbreitenbedarf höher.
- `Split Tunnel`: nur Unternehmensziele laufen durch den Tunnel; lokale/Internet-Ziele können direkt erreicht werden. Das reduziert Last, erweitert aber die zu bewertenden Datenwege.

Die Entscheidung folgt Risiko, Datenschutz, Leistung und Unternehmensrichtlinie. Keine Variante ist ohne Kontext immer richtig.

### 4.4 Was ein VPN nicht leistet

Ein VPN garantiert nicht:

- ein schadsoftwarefreies Endgerät;
- sichere Berechtigungen nach der Einwahl;
- vertrauenswürdige Webseiten oder Dateien;
- vollständige Anonymität;
- Schutz außerhalb der Tunnelendpunkte;
- Verfügbarkeit des entfernten Dienstes.

Zusätzlich erforderlich sind MFA, Gerätezustandsprüfung, Patchmanagement, Endpoint-Security, minimale Rechte, Firewallregeln, Logging und Incident Response.

## 5. Anwendungsfall: Homeoffice und Filialen

Anforderungen:

- 40 Beschäftigte greifen aus dem Homeoffice auf ERP zu;
- zwei Filialen tauschen Daten dauerhaft aus;
- verdächtige Zugriffe auf das ERP sollen erkannt werden;
- ein Fehlalarm darf nicht unbemerkt den gesamten Betrieb stoppen.

Lösung:

1. Remote-Access-VPN für einzelne Beschäftigte mit MFA.
2. Site-to-Site-VPN zwischen den Filialgateways.
3. rollenbasierte Freigabe nur zu erforderlichen internen Diensten.
4. IDS-Sensor beziehungsweise vorsichtig abgestimmtes IPS vor dem ERP-Segment.
5. IPS zunächst im Erkennungsmodus oder mit gezielten Blockregeln testen.
6. Alarme priorisieren, Verantwortliche und Eskalationsweg definieren.
7. Positivtest, Negativtest, Logging und Wiederherstellungsplan dokumentieren.

Beispielbewertung:

```text
Nächtliches Backup erzeugt ungewöhnlich viel Datenverkehr → möglicher False Positive
Bekannte Exploit-Signatur, Verbindung wird beendet       → IPS-Aktion / True Positive, wenn Angriff bestätigt
Neuer Angriff ohne Alarm                                 → False Negative
```

## 6. Prüfungsformulierungen

> Beim Remote-Access-VPN verbindet sich ein einzelner Client mit dem Unternehmensnetz, während ein Site-to-Site-VPN zwei Netze über ihre Gateways koppelt.

> Die Signaturerkennung eignet sich besonders für bekannte Angriffsmuster, kann jedoch neue oder veränderte Angriffe übersehen, wenn keine passende Signatur vorhanden ist.

> Der Backupverkehr ist ein False Positive, wenn er legitim ist, aber fälschlich als Angriff gemeldet wird.

> Das VPN wird mit MFA und minimalen Firewallfreigaben kombiniert, weil der geschützte Tunnel allein weder die Identität ausreichend absichert noch unbeschränkten internen Zugriff rechtfertigt.

## 7. Typische Prüfungsfallen

- IDS meldet gewöhnlich; IPS kann blockieren.
- Ein IPS ist nicht automatisch besser: Fehlblockierungen und Verfügbarkeit sind zu bewerten.
- False Positive und False Negative nicht vertauschen.
- Kein Alarm beweist nicht, dass kein Angriff stattgefunden hat.
- Signaturdatenbank muss aktuell sein; trotzdem bleibt ein Restrisiko.
- VPN und HTTPS können gleichzeitig sinnvoll sein; Tunnel ersetzt Anwendungsschutz nicht.
- VPN macht den Client nicht vertrauenswürdig.
- Split Tunnel bedeutet nicht unverschlüsselte Unternehmensdaten, wenn Ziele korrekt geroutet sind; es verändert den Weg anderer Daten.
- Verschlüsselter Verkehr kann die Netzwerkerkennung einschränken.
- Ein gemeinsames VPN-Konto verhindert Nachvollziehbarkeit und individuelle Sperrung.

## 8. Selbsttest

1. Unterscheide Firewall, IDS und IPS.
2. Definiere False Positive und False Negative.
3. Vergleiche Signatur- und Anomalieerkennung.
4. Ordne zu: Homeoffice-Notebook; Verbindung zweier Standorte.
5. Warum benötigt ein Remote-Access-VPN zusätzlich MFA?
6. Ein legitimes Backup löst einen Alarm aus. Wie heißt das Ergebnis?
7. Ein IPS blockiert eine neue Fachanwendung. Welche technische und organisatorische Reaktion ist nötig?
8. Nenne vier Grenzen eines VPN.
9. Bewerte Full Tunnel gegenüber Split Tunnel für ein verwaltetes Notebook.
10. Entwirf Schutzmaßnahmen für einen öffentlich erreichbaren VPN-Gateway.

<details>
<summary>Lösungen anzeigen</summary>

1. Firewall setzt Regeln durch; IDS erkennt/meldet; IPS erkennt und kann inline blockieren.
2. False Positive: Fehlalarm. False Negative: echter Angriff bleibt unerkannt.
3. Signatur: bekannte Muster, Updates nötig. Anomalie: Abweichungen, mehr Tuning/Fehlalarme möglich.
4. Remote Access; Site to Site.
5. Damit ein gestohlenes Passwort allein nicht für die Anmeldung genügt.
6. False Positive.
7. Ereignis prüfen, Regel/Schwelle gezielt anpassen, Ausnahme minimieren, testen und dokumentieren; nicht pauschal alles abschalten.
8. Kein Malware-, Berechtigungs-, Inhalts- oder Endpunktschutz; keine Verfügbarkeits- oder Anonymitätsgarantie.
9. Full Tunnel vereinfacht zentrale Kontrolle, braucht mehr Gatewaybandbreite; Split Tunnel reduziert Last, erweitert aber Datenwege/Risiken.
10. Patches, Hardening, MFA, minimale Freigaben, Rate Limits nach Bedarf, Monitoring, sichere Protokolle und Notfallplan.

</details>

## 9. Quellen und Abgleich

- [NIST SP 800-94](https://csrc.nist.gov/pubs/sp/800/94/final) — Grundlagen und Betrieb von IDPS; die Publikation ist älter, die Grundbegriffe werden deshalb produktneutral verwendet.
- [NIST SP 800-77 Rev. 1](https://csrc.nist.gov/pubs/sp/800/77/r1/final) — IPsec und IKE.
- [BSI IT-Grundschutz-Kompendium](https://www.bsi.bund.de/grundschutz-kompendium) — ergänzende aktuelle Sicherheitsanforderungen; Stand 10.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Werden HIDS/NIDS und konkrete Sensorpositionen geprüft?
- Muss IPsec Transport- gegen Tunnelmodus unterschieden werden?
- Welche Full-/Split-Tunnel-Policy verwendet WBS in seinen Fällen?
