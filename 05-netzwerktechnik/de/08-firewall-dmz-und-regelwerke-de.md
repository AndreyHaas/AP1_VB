---
pruefung: AP1
thema: Netzwerktechnik
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Deutsch
gegenstueck: ../ru/08-firewall-dmz-und-regelwerke-ru.md
---

# Firewall, DMZ und Regelwerke

## 1. Lernziele

Du kannst:

- Paketfilter, Stateful Firewall, Proxy/Application Firewall und Host-Firewall unterscheiden;
- Regeln nach Quelle, Ziel, Protokoll, Port, Richtung und Zustand lesen;
- Default Deny und Least Privilege anwenden;
- eine DMZ erklären und öffentlich erreichbare Dienste sinnvoll platzieren;
- einen minimalen Regelsatz entwerfen, testen und dokumentieren.

## 2. Prüfungsminimum — 15 Minuten

1. Eine Firewall kontrolliert Verkehrsflüsse zwischen Zonen oder Hosts nach Regeln.
2. Ein Paketfilter bewertet Headerfelder; eine Stateful Firewall berücksichtigt zusätzlich den Verbindungszustand.
3. Regeln werden häufig von oben nach unten verarbeitet; oft entscheidet die erste passende Regel. Das konkrete Produktverhalten muss geprüft werden.
4. `Default Deny`: nur ausdrücklich benötigte Verbindungen erlauben.
5. Regeln benötigen konkrete Quelle, Ziel, Protokoll/Port, Richtung und Aktion.
6. Eine DMZ ist ein getrenntes Netzsegment für öffentlich erreichbare Systeme.
7. Die interne Datenbank wird nicht direkt aus dem Internet veröffentlicht.
8. NAT, VLAN, VPN und Firewall sind verschiedene Funktionen.
9. Änderungen werden mit Positiv- und Negativtests geprüft und protokolliert.

> Nach dem Default-Deny-Prinzip werden nur die für den Geschäftsprozess erforderlichen Verbindungen freigegeben, wodurch die Angriffsfläche reduziert wird.

## 3. Grundlagen

### 3.1 Firewalltypen

| Typ | Entscheidungsebene | Stärke | Grenze |
|---|---|---|---|
| Paketfilter | IP, Protokoll, Port, Richtung | schnell und klar | kennt Anwendungskontext nur begrenzt |
| Stateful Firewall | zusätzlich Verbindungszustand | ordnet Antwortverkehr zu | verschlüsselter Inhalt bleibt ohne Zusatzfunktion unsichtbar |
| Proxy/Application Firewall | anwendungsspezifische Vermittlung/Analyse | feinere Kontrolle | höherer Aufwand, protokollspezifisch |
| WAF | HTTP(S)-Webanwendungen | Schutz vor Webangriffsmustern | ersetzt keine allgemeine Netzwerk-Firewall |
| Host-Firewall | einzelnes Endsystem | schützt auch innerhalb eines Netzes | muss zentral gepflegt und überwacht werden |

Eine Next-Generation-Firewall kann mehrere Funktionen kombinieren. Die Produktbezeichnung beweist jedoch keine konkrete Erkennungsqualität.

### 3.2 Regelbestandteile

```text
Quelle:       10.5.0.0/24
Ziel:         10.6.0.10
Protokoll:    TCP
Zielport:     22
Richtung:     Admin-Netz → Servernetz
Zustand:      neue Verbindung
Aktion:       erlauben
Logging:      nach Vorgabe
```

Ein Port ist nur eine technische Zuordnung. TCP 443 beweist nicht, dass tatsächlich ein vertrauenswürdiger HTTPS-Dienst läuft.

### 3.3 Stateless und stateful

Ein stateless Paketfilter beurteilt einzelne Pakete. Für Rückverkehr können explizite Regeln nötig sein.

Eine Stateful Firewall führt eine Zustandstabelle. Wird eine ausgehende Verbindung erlaubt, kann passender Rückverkehr als Teil dieser Verbindung erkannt werden. Ein beliebiges neues eingehendes Paket wird dadurch nicht automatisch erlaubt.

### 3.4 Regelreihenfolge

Beispiel mit First-Match-Verarbeitung:

```text
1 DENY  beliebig       → 10.6.0.10 TCP 22
2 ALLOW 10.5.0.0/24    → 10.6.0.10 TCP 22
```

Regel 2 wird nie wirksam, weil Regel 1 bereits passt. Deshalb sind Reihenfolge, Überschneidung und implizite Abschlussregel zu prüfen.

## 4. Vertiefung und Zusammenhänge

### 4.1 DMZ

Eine `Demilitarized Zone` ist eine eigene Sicherheitszone zwischen einem weniger vertrauenswürdigen Netz und dem internen Netz.

Typisch in der DMZ:

- Reverse Proxy oder Web-Frontend;
- Mail-Gateway;
- öffentlicher DNS-Server;
- VPN-Gateway.

Typisch intern:

- Domain Controller;
- Datenbank mit Kunden- oder Personaldaten;
- Datei- und Managementserver;
- Arbeitsplatznetze.

Ziel: Die Kompromittierung eines öffentlich erreichbaren Servers darf keinen freien Weg in das interne Netz eröffnen.

### 4.2 DMZ-Varianten

- dreibeinige Firewall mit Interfaces für Internet, DMZ und intern;
- zwei Firewalls mit DMZ dazwischen;
- virtuelle Zonen auf geeigneter, getrennt administrierter Infrastruktur.

Die Architektur allein genügt nicht. Patchstand, Hardening, Identitäten, Monitoring, Backups und minimale Berechtigungen bleiben erforderlich.

### 4.3 Egress-Filter und Logging

Nicht nur eingehender Verkehr ist relevant. Egress-Regeln begrenzen ausgehende Verbindungen, zum Beispiel einen DMZ-Webserver nur zum benötigten Datenbankziel und Update-Repository.

Logging muss zweckmäßig sein: zu wenig erschwert Analyse, zu viel erzeugt Rauschen und Datenschutz-/Speicherfragen. Protokolliert werden Regel-ID, Zeit, Quelle, Ziel, Aktion und gegebenenfalls Zustand; sensible Inhalte gehören nicht pauschal ins Log.

### 4.4 Change- und Testprozess

1. fachlichen Bedarf und Datenfluss beschreiben;
2. konkrete minimale Regel entwerfen;
3. Risiko, Abhängigkeiten und Rückfallplan prüfen;
4. Änderung freigeben und zeitlich nachvollziehbar umsetzen;
5. erlaubten Verkehr positiv testen;
6. nicht erlaubten Verkehr negativ testen;
7. Logging, Monitoring und Dokumentation kontrollieren;
8. temporäre Regeln befristen und entfernen.

## 5. Anwendungsfall: Webanwendung in der DMZ

```text
Internet
   |
Firewall
   |
DMZ: Web-Frontend 172.16.10.20
   |
Firewall/Zone
   |
Intern: DB 10.0.20.30, Admin-Netz 10.0.5.0/24
```

Anforderungen:

- Kunden nutzen das Web-Frontend per HTTPS;
- Frontend erreicht nur die Datenbank auf TCP 5432;
- Administration erfolgt nur aus dem Admin-Netz per SSH;
- alles andere bleibt blockiert.

Regelentwurf:

| Nr. | Quelle | Ziel | Dienst | Aktion | Begründung |
|---:|---|---|---|---|---|
| 1 | Internet | 172.16.10.20 | TCP 443 | Allow | öffentlicher HTTPS-Dienst |
| 2 | 172.16.10.20 | 10.0.20.30 | TCP 5432 | Allow | notwendiger DB-Zugriff |
| 3 | 10.0.5.0/24 | 172.16.10.20 | TCP 22 | Allow | Administration |
| 4 | beliebig | beliebig | alle neuen | Deny | Default Deny |

Tests:

- Internet → Frontend:443 muss funktionieren;
- Internet → Frontend:22 muss scheitern;
- Internet → DB:5432 muss scheitern;
- Frontend → DB:5432 muss funktionieren;
- Frontend → andere interne Ziele muss scheitern;
- Admin-Netz → Frontend:22 muss funktionieren.

## 6. Prüfungsformulierungen

> Die Datenbank wird im internen Netz betrieben und nur vom Web-Frontend auf TCP-Port 5432 freigegeben, damit sie nicht direkt aus dem Internet erreichbar ist.

> Eine Stateful Firewall kann Antwortpakete einer erlaubten Verbindung anhand ihrer Zustandstabelle zuordnen, ohne beliebige neue eingehende Verbindungen freizugeben.

> Die Regel muss vor einer allgemeineren Sperrregel stehen, da bei einer First-Match-Auswertung sonst die frühere passende Regel entscheidet.

> Nach der Änderung werden sowohl erlaubte als auch verbotene Datenflüsse getestet, damit Funktion und wirksame Begrenzung nachgewiesen sind.

## 7. Typische Prüfungsfallen

- NAT ersetzt keine Firewall und verschlüsselt nicht.
- Stateful bedeutet nicht automatische Inhaltsprüfung.
- Eine WAF schützt Webanwendungen, aber nicht alle Netzwerkdienste.
- `any → any` nur wegen schneller Fehlerbehebung schafft eine große Angriffsfläche.
- „Administrator“ ist keine Quelladresse; das Admin-Netz oder ein authentisierter Zugang muss konkretisiert werden.
- DMZ ist eine Zone, kein einzelnes Produkt.
- Freigabe nur nach Port beweist keine sichere Anwendung.
- Regelreihenfolge und implizite Regeln nicht übersehen.
- Nur Positivtest genügt nicht; verbotener Verkehr muss ebenfalls geprüft werden.
- IPv4- und IPv6-Regeln müssen beide berücksichtigt werden, wenn beide Protokolle aktiv sind.

## 8. Selbsttest

1. Was kontrolliert eine Firewall?
2. Unterscheide Paketfilter und Stateful Firewall.
3. Erkläre Default Deny.
4. Warum gehört eine Personaldatenbank nicht in die öffentliche DMZ?
5. Lies: `ALLOW 10.5.0.0/24 → 10.6.0.10 TCP 22`. Wer darf wohin?
6. Warum kann eine allgemeine Deny-Regel eine spätere Allow-Regel unwirksam machen?
7. Entwirf eine Regel für DNS-Clients `10.10.0.0/24` zum Resolver `10.20.0.53`.
8. Nenne drei Negativtests für den DMZ-Fall.
9. Bewerte: „Portweiterleitung macht die Firewall überflüssig.“
10. Warum sollten temporäre Regeln ein Ablaufdatum haben?

<details>
<summary>Lösungen anzeigen</summary>

1. Netzwerkverkehr zwischen Zonen/Hosts nach definierten Kriterien.
2. Paketfilter bewertet einzelne Header; Stateful berücksichtigt Verbindungszustände.
3. Alles ist verboten, was nicht ausdrücklich erforderlich und erlaubt ist.
4. Sie enthält besonders schützenswerte Daten und soll nicht direkt aus dem Internet erreichbar sein.
5. Quellen aus `10.5.0.0/24` dürfen per SSH zum Server `10.6.0.10`.
6. Bei First Match entscheidet die frühere passende Regel.
7. Quelle `10.10.0.0/24`, Ziel `10.20.0.53`, UDP/TCP 53 nach Bedarf, Allow; übriger Verkehr nach Policy.
8. Internet→SSH, Internet→DB, Frontend→andere interne Ziele.
9. Falsch: Portweiterleitung übersetzt/ordnet Verkehr zu; die Zugriffspolitik bleibt Aufgabe der Firewall.
10. Damit Ausnahmen nach dem Bedarf nicht unbemerkt dauerhaft bestehen bleiben.

</details>

## 9. Quellen und Abgleich

- [NIST SP 800-41 Rev. 1](https://csrc.nist.gov/pubs/sp/800/41/r1/final) — Firewalltechnologien und Firewallpolicy.
- [BSI IT-Grundschutz-Kompendium](https://www.bsi.bund.de/grundschutz-kompendium) — Sicherheitskonzeption, Netzarchitektur und Betrieb.
- Abgleich mit Routing/NAT und VLAN im Projekt; Stand 10.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Wird konkrete Syntax eines Firewallprodukts verlangt oder nur herstellerneutrale Regeln?
- Welche DMZ-Architektur nutzt WBS in seinen Fällen?
- Wie tief sollen Proxy, WAF und IPv6-Filterung behandelt werden?
