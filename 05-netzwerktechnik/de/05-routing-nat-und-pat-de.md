---
pruefung: AP1
thema: Routing, NAT und PAT
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Deutsch
gegenstueck: ../ru/05-routing-nat-und-pat-ru.md
---

# AP1: Routing, NAT und PAT

Routing wählt den Weg zu einem Zielnetz. NAT verändert Adressen, PAT unterscheidet Verbindungen zusätzlich durch Ports. Diese Funktionen befinden sich häufig auf demselben Gerät, lösen aber verschiedene Aufgaben und ersetzen weder Firewall, Verschlüsselung noch DHCP.

---

## 1. Lernziele

Nach dieser Einheit kannst du:

- eine Routingtabelle lesen und per Longest Prefix Match entscheiden;
- direkt verbundene, statische, dynamische und Default Routes unterscheiden;
- Next Hop, Interface und Metrik erklären;
- Routing und Forwarding abgrenzen;
- Source NAT, Destination NAT und PAT unterscheiden;
- NAT- und PAT-Zuordnungen lesen;
- Portweiterleitungen und ihre Risiken erklären;
- Routing- und NAT-Fehler anhand von Symptomen diagnostizieren.

---

## 2. Prüfungsminimum — 15 Minuten

```text
Routing → wählt den Weg nach Ziel-IP/Zielpräfix
Longest Prefix Match → spezifischster passender Eintrag gewinnt
0.0.0.0/0 oder ::/0 → Default Route
Next Hop → nächster Router
Metrik → Auswahl zwischen gleich spezifischen Wegen
```

```text
SNAT → Quelladresse ändern
DNAT → Zieladresse ändern
PAT  → Adressen plus Portzuordnung, viele Clients teilen eine IPv4
```

> Der Router verwendet den Eintrag mit dem längsten passenden Präfix, weil dieser das Zielnetz am spezifischsten beschreibt.

> PAT ermöglicht mehreren internen Clients die gemeinsame Nutzung einer öffentlichen IPv4-Adresse, indem die Verbindungen durch Portzuordnungen unterschieden werden.

---

## 3. Routing und Forwarding

- `Routing` bezeichnet das Ermitteln und Verwalten von Wegen.
- `Forwarding` ist das Weiterleiten eines konkreten Pakets anhand der vorhandenen Tabelle.

In der AP1 werden beide Vorgänge häufig kurz als Routing bezeichnet. Für die Erklärung genügt: Ziel-IP prüfen, besten Eintrag wählen, Next Hop oder Interface bestimmen und einen neuen Frame senden.

---

## 4. Inhalt einer Routingtabelle

Typische Felder:

| Feld | Bedeutung |
|---|---|
| Zielnetz/Präfix | für welche Ziele der Eintrag gilt |
| Next Hop/Gateway | nächster Router |
| Interface | Ausgangsschnittstelle |
| Metrik | Kosten oder Präferenz innerhalb eines Verfahrens |
| Quelle/Protokoll | connected, static, OSPF und weitere |

Nicht jede Tabelle zeigt alle Felder gleich an. Die konkrete Ausgabe muss interpretiert werden.

---

## 5. Direkt verbundene Route

Besitzt ein aktives Routerinterface `192.168.10.1/24`, kennt der Router das Netz `192.168.10.0/24` als direkt verbunden.

Für die Zustellung zum Host ermittelt der Router dessen MAC-Adresse über ARP bei IPv4 oder NDP bei IPv6 und erstellt einen lokalen Frame.

Direkt verbunden bedeutet „über den eigenen Link erreichbar“ und beweist nicht die Funktion jedes Dienstes.

---

## 6. Statische Route

Eine statische Route wird administrativ eingetragen:

```text
Zielnetz: 10.30.0.0/16
Next Hop: 192.168.1.2
```

Vorteile sind Nachvollziehbarkeit und fehlender Routingprotokoll-Overhead. Nachteile sind manueller Pflegeaufwand und geringe automatische Anpassung.

Statische Routen eignen sich für kleine stabile Topologien, Stub-Netze oder gezielte Ersatzwege.

---

## 7. Dynamisches Routing

Dynamische Routingprotokolle tauschen Erreichbarkeitsinformationen aus und reagieren auf Änderungen. Beispiele sind OSPF und BGP; ihre tiefe Konfiguration liegt gewöhnlich außerhalb des AP1-Grundumfangs.

Wichtige Trennung:

- Das Routingprotokoll lernt Wege.
- Das geroutete Protokoll IPv4 oder IPv6 transportiert Nutzpakete.
- Metriken verschiedener Protokolle sind nicht zwingend direkt vergleichbar.

---

## 8. Default Route

```text
IPv4: 0.0.0.0/0
IPv6: ::/0
```

Eine Default Route passt zu allen Zielen, besitzt aber den kürzesten Präfix. Sie wird nur verwendet, wenn kein spezifischerer Eintrag passt.

Auf einem Client erzeugt das Default Gateway gewöhnlich die Standardroute.

---

## 9. Longest Prefix Match

Routingtabelle:

| Zielnetz | Next Hop |
|---|---|
| `10.0.0.0/8` | A |
| `10.20.0.0/16` | B |
| `10.20.30.0/24` | C |
| `0.0.0.0/0` | D |

Ergebnis:

```text
10.20.30.40 → C (/24)
10.20.50.40 → B (/16)
10.50.30.40 → A (/8)
8.8.8.8     → D (/0)
```

Eine kleine Metrik macht die Default Route nicht stärker als einen spezifischen Präfix. Zuerst entscheidet die Spezifität, anschließend die Auswahl zwischen gleich spezifischen Kandidaten.

---

## 10. Metrik und gleiche Präfixlänge

Passen mehrere Routen mit gleicher Präfixlänge, verwendet der Router Protokollpräferenz und Metrik nach seiner Implementierung.

Eine Prüfungsantwort muss auf der gegebenen Tabelle beruhen. „Die kleinste Metrik gewinnt immer“ ist ohne Regeln falsch, wenn unterschiedliche Routingquellen verglichen werden.

---

## 11. Next Hop und rekursive Auflösung

Der Next Hop muss selbst über eine direkt verbundene oder weitere Route erreichbar sein. Der Router bestimmt Ausgangsinterface und lokale Layer-2-Adresse des nächsten Systems.

Ein falscher Next Hop kann konfiguriert sein, ohne erfolgreiches Forwarding zu ermöglichen. Route zum Ziel und Erreichbarkeit des nächsten Hops sind zu prüfen.

---

## 12. TTL und Hop Limit

Jeder IPv4-Router reduziert die `TTL`, jeder IPv6-Router das `Hop Limit`. Bei null wird das Paket verworfen und üblicherweise eine ICMP-Fehlermeldung erzeugt.

Dies verhindert endlose Weiterleitung in einem Routing Loop. `traceroute` und `tracert` nutzen den Mechanismus, um Zwischenstationen zu erkennen.

Diese TTL ist nicht die DNS-TTL. Die gleiche Abkürzung hat zwei unterschiedliche Kontexte.

---

## 13. Kein passender Weg

Fehlen sowohl spezifische Route als auch Default Route, kann der Router das Paket nicht weiterleiten. Mögliche Beobachtungen:

- ICMP Destination Unreachable;
- Timeout, wenn die Meldung gefiltert wird;
- lokale Fehlermeldung am Host.

Ein Timeout allein beweist nicht, an welchem Hop das Paket verloren ging.

---

## 14. Rückweg

Kommunikation benötigt einen Weg in beide Richtungen. Der Hinweg kann funktionieren, während der Rückweg fehlt oder falsch verläuft.

Asymmetrisches Routing ist nicht immer ein Fehler, aber stateful Firewall und NAT können verlangen, dass der Rückverkehr dasselbe zustandsführende Gerät durchläuft.

Bei der Diagnose werden Quell- und Zielnetz, beide Routingtabellen und Zustandsgeräte geprüft.

---

## 15. NAT-Grundidee

`Network Address Translation` verändert IP-Adressen beim Übergang durch ein Übersetzungsgerät. Häufiger Internetfall:

```text
intern 10.0.0.25 → öffentliche Quelladresse 203.0.113.10
```

Das Gerät speichert eine Zuordnung, damit Antwortverkehr dem internen Endpunkt zugeordnet werden kann.

NAT spart öffentliche IPv4-Adressen und verbindet Adressräume, ist aber weder Verschlüsselung noch vollständige Sicherheitsrichtlinie.

---

## 16. Source NAT

Bei `Source NAT (SNAT)` wird die Quelladresse eines ausgehenden Pakets geändert.

```text
vorher: 10.0.0.25:53000 → 198.51.100.20:443
nachher: 203.0.113.10:40001 → 198.51.100.20:443
```

Die Antwort erreicht die öffentliche Zuordnung und wird anschließend zum internen Client zurückübersetzt.

`Masquerading` ist eine häufig bei dynamischer öffentlicher Adresse verwendete Form von SNAT; konkrete Produktbegriffe können abweichen.

---

## 17. PAT/NAPT

`Port Address Translation` verändert zusätzlich Portnummern. Mehrere interne Verbindungen können eine öffentliche IPv4-Adresse teilen:

```text
10.0.0.25:53000 → 203.0.113.10:40001 → Server:443
10.0.0.26:53000 → 203.0.113.10:40002 → Server:443
```

Eine Zuordnung enthält Protokoll und Endpunkte. TCP- und UDP-Zustände sind getrennt.

PAT wird umgangssprachlich häufig nur NAT genannt. In einer präzisen Antwort wird die Portänderung beschrieben.

---

## 18. Destination NAT und Portweiterleitung

Bei `Destination NAT (DNAT)` wird die Zieladresse geändert. Eine Portweiterleitung veröffentlicht einen internen Dienst:

```text
203.0.113.10:443 → 10.0.0.50:443
```

Der externe Client adressiert die öffentliche Adresse; das NAT-Gerät übersetzt das Ziel auf den internen Server.

Die Regel muss Transportprotokoll, Port, Zielhost und Firewallfreigabe berücksichtigen. Veröffentlichung erhöht die Angriffsfläche.

---

## 19. Statisches NAT und dynamisches NAT

- `statisches NAT`: feste 1:1-Zuordnung.
- `dynamisches NAT`: Zuordnung aus einem Adresspool.
- `PAT`: viele interne Endpunkte teilen Adressen über Ports.

Hersteller können Begriffe unterschiedlich verwenden. In einer Aufgabe zählt die tatsächliche Transformation und nicht nur ein Label.

---

## 20. NAT-Tabelle lesen

| Innen lokal | Innen global | Außen | Protokoll |
|---|---|---|---|
| `10.0.0.25:53000` | `203.0.113.10:40001` | `198.51.100.20:443` | TCP |

Die Antwort `198.51.100.20:443 → 203.0.113.10:40001` wird zugeordnet und nach `→ 10.0.0.25:53000` übersetzt.

Ist der Zustand abgelaufen, kann eine späte Antwort verworfen werden. UDP benötigt Zeitlimits, da es kein TCP-Verbindungsende besitzt.

---

## 21. NAT und Protokolle

NAT verändert Headerfelder und muss passende Prüfsummen korrigieren. Protokolle, die IP-Adressen oder Ports in ihren Nutzdaten transportieren, können Sondermechanismen benötigen und schlecht mit NAT zusammenarbeiten.

Die Ende-zu-Ende-Erreichbarkeit wird verringert. Eingehende Verbindungen benötigen eine ausdrückliche Zuordnung oder Traversal-Verfahren.

Auch deshalb ist NAT nicht nur als Sicherheitsfunktion zu betrachten.

---

## 22. Abgrenzung der Funktionen

| Funktion | Aufgabe |
|---|---|
| DHCP | Netzwerkkonfiguration vergeben |
| DNS | Namen und Records auflösen |
| Routing | Weg zwischen Netzen wählen |
| NAT/PAT | Adressen und Ports übersetzen |
| Firewall | Verkehr nach Regeln erlauben oder blockieren |
| TLS/VPN | Datenübertragung kryptografisch schützen |

Ein Gerät kann mehrere Funktionen gleichzeitig ausführen; in der Antwort bleiben sie getrennt.

---

## 23. NAT ist keine Firewall

Ausgehendes PAT besitzt gewöhnlich keine Zuordnung für ein unerwartetes eingehendes Paket. Dies entspricht trotzdem nicht einer vollständigen Firewallpolicy.

Eine Firewall kann Richtung, Zustand, Adressen, Ports, Anwendung und Logging bewerten. NAT übersetzt lediglich.

Korrekte Formulierung: Sicherheit entsteht durch Regeln, Härtung und begrenzte Exposition; NAT kann die Erreichbarkeit indirekt beeinflussen.

---

## 24. Portweiterleitung sicher planen

Vor der Veröffentlichung:

1. geschäftlichen Bedarf nachweisen;
2. minimalen Zielport und Transport wählen;
3. Quellnetze nach Möglichkeit begrenzen;
4. TLS oder VPN und starke Authentisierung verwenden;
5. Dienst patchen und härten;
6. protokollieren und überwachen;
7. Verantwortliche und Ablaufdatum festlegen;
8. extern und intern testen.

`Any → internes Administrationsinterface` ohne Notwendigkeit ist ein ungeeignetes Design.

---

## 25. Vollständiger Routingfall

Tabelle:

| Ziel | Next Hop | Metrik |
|---|---|---:|
| `10.20.0.0/16` | `192.168.1.2` | 20 |
| `10.20.30.0/24` | `192.168.1.3` | 50 |
| `0.0.0.0/0` | `192.168.1.1` | 10 |

Für `10.20.30.44` wird `/24` über `.3` gewählt, obwohl dessen Metrik 50 größer ist. Die Spezifität `/24` hat Vorrang vor `/16` und `/0`.

Für `10.20.40.44` gilt `/16`, für `8.8.8.8` die Default Route.

---

## 26. Vollständiger NAT-Fall

Client `10.10.1.25:51500` ruft `198.51.100.80:443` auf. Das Gateway besitzt die öffentliche IP `203.0.113.5`.

```text
LAN: 10.10.1.25:51500 → 198.51.100.80:443
WAN: 203.0.113.5:42001 → 198.51.100.80:443
```

Antwort:

```text
198.51.100.80:443 → 203.0.113.5:42001
Translation → 10.10.1.25:51500
```

Ist die Regel vorhanden, aber das Internet funktioniert nicht, werden Route, DNS, Firewall, NAT-Zustand und Provider getrennt geprüft. NAT erzeugt nicht automatisch eine Route.

---

## 27. Diagnosefälle

### Nur entfernte Netze nicht erreichbar

Präfix, Default Gateway, Routingtabelle und Rückweg prüfen.

### Internet per IP erreichbar, intern veröffentlichter Dienst von außen nicht

Öffentliche Adresse, DNAT-Regel, Firewall, Service Binding, Rückweg und Providersperre prüfen.

### Einige Verbindungen funktionieren, neue nicht

NAT-Zustandstabelle, Port- und Adresspool, Zeitlimits und Ressourcen prüfen.

### traceroute endet an einem Hop

Dies ist eine Grenzbeobachtung und kein automatischer Beweis für einen Defekt dieses Routers. ICMP kann gefiltert werden und der weitere Weg kann abweichen.

---

## 28. Prüfungsalgorithmus

1. Ziel-IP und alle passenden Präfixe bestimmen.
2. Den längsten Präfix auswählen.
3. Bei gleicher Länge angegebene Präferenz oder Metrik verwenden.
4. Next Hop und Ausgangsinterface prüfen.
5. Rückweg separat prüfen.
6. Bei NAT die Header vor und nach der Übersetzung notieren.
7. Richtung, Protokoll, Ports und Zustand angeben.
8. Firewall und Dienst nicht durch eine NAT-Regel als bewiesen ansehen.

---

## 29. Typische Prüfungsformulierungen

> Die Route über `10.20.30.0/24` wird gewählt, da sie unter allen passenden Einträgen den längsten und damit spezifischsten Präfix besitzt.

> Die Default Route wird nur verwendet, wenn kein spezifischerer Eintrag zur Zieladresse passt.

> PAT ersetzt die private Quelladresse und den Quellport durch eine öffentliche Zuordnung, damit mehrere interne Verbindungen eine öffentliche IPv4-Adresse gemeinsam nutzen können.

> NAT verschlüsselt keine Nutzdaten und ersetzt keine Firewall, weil es lediglich Adress- und gegebenenfalls Portfelder übersetzt.

---

## 30. Typische Prüfungsfallen

| Falle | Korrektur |
|---|---|
| kleinste Metrik gewinnt immer zuerst | zuerst Longest Prefix Match |
| Default Route ist am stärksten | sie ist am wenigsten spezifisch |
| eine Route beweist den Rückweg | Rückweg separat prüfen |
| NAT vergibt die Client-IP | dies macht DHCP |
| NAT verschlüsselt | nein |
| NAT ersetzt eine Firewall | nein |
| Portweiterleitung öffnet nur die Firewall | gewöhnlich DNAT plus Freigabe |
| traceroute-Hop ohne Antwort ist defekt | ICMP kann gefiltert sein |

---

## 31. Selbsttest

1. Unterscheide Routing und Forwarding.
2. Nenne vier Felder einer Routingtabelle.
3. Was bedeutet eine direkt verbundene Route?
4. Nenne Vorteil und Nachteil einer statischen Route.
5. Was macht ein dynamisches Routingprotokoll?
6. Wie lautet die IPv4 Default Route?
7. Erkläre Longest Prefix Match.
8. Was wird für `10.20.30.40` in Abschnitt 9 gewählt?
9. Wann wird die Metrik bewertet?
10. Was ist ein Next Hop?
11. Wozu dient die IPv4-TTL?
12. Warum wird ein Rückweg benötigt?
13. Was verändert SNAT?
14. Was verändert DNAT?
15. Was macht PAT zusätzlich?
16. Wie teilen zwei Clients eine öffentliche IP?
17. Was ist eine Portweiterleitung?
18. Warum hat eine NAT-Tabelle Zeitlimits?
19. Kann NAT Daten verschlüsseln?
20. Unterscheide NAT und Firewall.
21. Unterscheide NAT und DHCP.
22. Welche Route gewinnt: `/16` Metrik 10 oder `/24` Metrik 50?
23. Nenne vier Prüfungen einer externen Portweiterleitung.
24. Warum beweist ein traceroute-Timeout nicht den genauen Fehlerort?
25. Notiere ein beliebiges PAT-Beispiel vor und nach der Übersetzung.

<details>
<summary>Lösungen anzeigen</summary>

1. Wege ermitteln und verwalten; konkretes Paket weiterleiten.
2. Zielpräfix, Next Hop, Interface, Metrik oder Quelle.
3. Das Zielnetz liegt an einem eigenen aktiven Interface.
4. Einfach und kontrollierbar; manuelle Pflege und keine automatische Anpassung.
5. Es tauscht Erreichbarkeitsinformationen aus und lernt Wege.
6. `0.0.0.0/0`.
7. Der längste passende Präfix ist der spezifischste und gewinnt.
8. `/24` über C.
9. Zwischen gleich langen passenden Präfixen nach Tabellen- oder Protokollregeln.
10. Der nächste Router auf dem Weg.
11. Sie begrenzt die Hopzahl und verhindert endlose Schleifen.
12. Die Antwort muss zur Quelle gelangen; stateful Geräte müssen den Zustand sehen.
13. Quell-IP und gegebenenfalls eine Portzuordnung.
14. Ziel-IP und gegebenenfalls Zielport.
15. Es unterscheidet Datenströme durch geänderte Portnummern.
16. Durch getrennte PAT-Zuordnungen.
17. Eine DNAT-Regel, die öffentliche Adresse und Port auf einen internen Dienst abbildet.
18. Um inaktive Zustände zu löschen und Ressourcen sowie Ports freizugeben.
19. Nein.
20. Übersetzung gegenüber Zugriffskontrolle.
21. Übersetzung gegenüber Vergabe der Netzkonfiguration.
22. `/24`, weil er spezifischer ist.
23. Adresse und DNS, DNAT, Firewall, Dienst und Binding, Rückweg oder Provider.
24. ICMP kann gefiltert sein und der Antwortweg kann abweichen.
25. Beispiel: `10.0.0.5:50000 → 203.0.113.5:40000 → Ziel:443`.

</details>

---

## 32. Quellen und Abgleich

- [RFC 1812 – Requirements for IPv4 Routers](https://datatracker.ietf.org/doc/html/rfc1812)
- [RFC 4632 – Classless Inter-domain Routing](https://datatracker.ietf.org/doc/html/rfc4632)
- [RFC 3022 – Traditional IP Network Address Translator](https://datatracker.ietf.org/doc/html/rfc3022)
- [RFC 4787 – NAT Behavioral Requirements for UDP](https://datatracker.ietf.org/doc/html/rfc4787)
- [RFC 5382 – NAT Behavioral Requirements for TCP](https://datatracker.ietf.org/doc/html/rfc5382)
- [RFC 6888 – Common Requirements for Carrier-Grade NATs](https://datatracker.ietf.org/doc/html/rfc6888)

Routingauswahl und NAT-Begriffe können herstellerspezifisch dargestellt werden. Für die AP1 sind Zielpräfix, Richtung und Transformation korrekt zu zeigen.

---

## 33. Offene Prüfpunkte für den Unterricht

- Verlangt die WBS eine terminologische Trennung von Routing und Forwarding?
- Welche Arten statischer und dynamischer Routen gehören zum Umfang?
- Wie werden Administrative Distance und Metrik in Unterrichtsaufgaben dargestellt?
- Müssen SNAT, DNAT, PAT und Masquerading getrennt werden?
- Wird Carrier-Grade NAT behandelt?
- Welche Felder einer NAT-Tabelle müssen in der Prüfung gelesen werden?
