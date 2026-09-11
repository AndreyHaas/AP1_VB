---
pruefung: AP1
thema: Technisches Englisch, Client-Server, Remotezugriff, Shell und UI-Entwurf
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Deutsch
gegenstueck: ../ru/09-technisches-englisch-client-server-remote-shell-und-ui-ru.md
---

# Technisches Englisch, Client-Server, Remotezugriff, Shell und UI-Entwurf

## 1. Lernziele

Du kannst:

- technische und kaufmännische englische Texte zielgerichtet auswerten;
- Client-Server, Peer-to-Peer und zentrale Dienste unterscheiden;
- Remotezugriff sicher auswählen und begründen;
- Diagnosebefehle unter Windows und Linux nach Aussagekraft einsetzen;
- einfache Shell-Skripte lesen, erklären und korrigieren;
- Mockup, Wireframe, Ausgabemaske und Corporate Design einordnen;
- betriebliche Social-Media-Nutzung nach Zielgruppe, Sicherheit und Datenschutz bewerten.

## 2. Prüfungsminimum — 15 Minuten

1. Erst Operator und gesuchte Information markieren, dann den englischen Text gezielt lesen.
2. Client fordert einen Dienst an; Server stellt ihn nach Regeln bereit. Eine Rolle kann je nach Vorgang wechseln.
3. Peer-to-Peer verteilt Rollen direkt zwischen Teilnehmern; zentrale Steuerung und Sicherung sind oft schwieriger.
4. VPN schützt einen Netzwerkpfad, ersetzt aber weder sichere Endgeräte noch Authentisierung und Berechtigung.
5. RDP überträgt einen grafischen Desktop; SSH bietet typischerweise verschlüsselte textbasierte Administration.
6. `ping` prüft IP-Erreichbarkeit per ICMP Echo, aber keinen Anwendungsport.
7. `tracert/traceroute` zeigt beobachtbare Hops über TTL/Hop Limit; ausbleibende Antworten beweisen keinen Leitungsfehler.
8. `ipconfig` zeigt Windows-IP-Konfiguration; unter Linux ist `ip addr`/`ip route` üblich, `ifconfig` gilt als älter.
9. Ein Shell-Skript muss Eingaben, Rückgabecode, Fehlerpfad, Rechte und Nebenwirkungen berücksichtigen.
10. Wireframe strukturiert Bedienung grob; Mockup zeigt die visuelle Gestaltung; ein Prototyp kann Interaktion simulieren.

## 3. Technisches Englisch und Informationsrecherche

### 3.1 Fünf-Schritt-Methode

1. Operator erkennen: `name`, `describe`, `explain`, `calculate`, `justify`, `evaluate`.
2. Gesuchte Einheit oder Entscheidung markieren.
3. Text überfliegen und Schlüsselwörter finden.
4. Relevante Aussage mit Zahl, Bedingung und Einschränkung extrahieren.
5. Antwort in der verlangten Sprache als vollständigen Satz formulieren.

| Englisch | deutsche Fachbedeutung |
|---|---|
| requirement | Anforderung |
| constraint | Randbedingung/Einschränkung |
| throughput | Durchsatz |
| availability | Verfügbarkeit |
| maintenance | Wartung |
| liability | Haftung |
| warranty | Gewährleistung oder Nutzungssicherheit je Kontext |
| eventually | schließlich, nicht eventuell |
| current | aktuell, nicht Strom |
| provision | Bereitstellung oder Rückstellung je Kontext |

Bei Recherche werden Autor, Aktualität, Primärquelle, Zweck, Belege und mögliche Interessen geprüft. Suchtreffer oder KI-Ausgabe sind Hinweise, keine Quelle an sich.

## 4. Client-Server, Peer-to-Peer und Social Media

| Modell | Stärke | Risiko |
|---|---|---|
| Client-Server | zentrale Regeln, Daten, Backup und Skalierung | Server-/Netzabhängigkeit, zentraler Angriffspunkt |
| Peer-to-Peer | einfache direkte Ressourcenteilung | schwerere Verwaltung, Konsistenz und Sicherung |
| Cloud-Service | elastische bereitgestellte Ressourcen | Providerabhängigkeit, Datenschutz, Kostensteuerung |

`Client` und `Server` sind Rollen, nicht zwingend feste Gerätetypen. Ein Browser ist HTTP-Client; ein Rechner kann zugleich einen Druckdienst bereitstellen.

Bei einem betrieblichen Social-Media-System werden Zielgruppe, Kommunikationsziel, Freigabeprozess, Rollen, Moderation, Barrierefreiheit, Urheberrecht, Datenschutz, Aufbewahrung und Incident-Prozess geplant. Private Accounts und Unternehmenszugänge werden getrennt; MFA und geregeltes Offboarding sind Pflichtbestandteile des Konzepts.

## 5. Remotezugriff und sichere Auswahl

| Verfahren | geeignet für | zentrale Prüfung |
|---|---|---|
| RDP | grafische Windows-Sitzung | Gateway/VPN, MFA, Rechte, Protokollierung |
| SSH | Shell, Tunneling, sichere Administration | Schlüssel, Hostprüfung, Least Privilege |
| Remote-Support-Tool | betreute Endnutzerhilfe | Einwilligung, Sitzungsanzeige, Freigabe, Logs |
| VPN | geschützter Netzpfad | starke Authentisierung, erlaubte Netze, Client-Sicherheit |
| Web-Konsole | anwendungsbezogene Verwaltung | HTTPS, Rollen, Session-Schutz |

RDP oder SSH sollte nicht unnötig offen aus dem Internet erreichbar sein. Zugriff wird auf benötigte Quellen, Identitäten und Zeiten beschränkt; administrative Konten werden getrennt, MFA und Logging aktiviert, Software aktuell gehalten.

## 6. Diagnosebefehle und systematischer Ablauf

| Zweck | Windows | Linux | Aussage und Grenze |
|---|---|---|---|
| lokale IP-Konfiguration | `ipconfig /all` | `ip addr`, `ip route` | Adresse, Maske, Gateway, DNS; beweist keine Ende-zu-Ende-Verbindung |
| IP-Erreichbarkeit | `ping ziel` | `ping ziel` | ICMP-Antwort und Laufzeit; keine Prüfung eines TCP-Dienstes |
| Pfad/Hops | `tracert ziel` | `traceroute ziel` oder `tracepath` | sichtbare Router-Hops; Filter können Sterne erzeugen |
| Pfad plus Verlust | `pathping ziel` | Kombination geeigneter Messwerkzeuge | statistische Beobachtung; Messung benötigt Zeit |
| DNS-Auflösung | `nslookup name` | `dig name` oder `nslookup` | DNS-Antwort; nicht automatisch Erreichbarkeit des Zielservices |
| Listener/Verbindungen | `netstat -ano` | `ss -tulpen` | lokale Ports/Sockets; Rechte können Details begrenzen |
| Nachbartabelle | `arp -a` | `ip neigh` | IPv4-ARP bzw. Nachbarn; nur lokales Segment/Cache |
| Routingtabelle | `route print` | `ip route` | Routen und Gateway; nicht die entfernte Rückroute |
| Identität | `whoami` | `whoami`, `id` | aktueller Benutzer/Kontext |
| Gerätename | `hostname` | `hostname` | lokaler Hostname, nicht zwingend DNS-FQDN |
| TCP-Porttest | `Test-NetConnection host -Port 443` | `nc -vz host 443` | TCP-Verbindungsversuch; noch kein vollständiger Anwendungstest |
| HTTP-Test | `curl -I https://host` | `curl -I https://host` | HTTP/TLS-Antwort; Inhalt und Berechtigung separat prüfen |

### Reihenfolge der Fehlersuche

```text
Strom/Link → lokale Konfiguration → eigener Stack → Gateway
→ Ziel-IP → DNS-Name → Port → Protokoll/Anwendung → Logs
```

Beispiele:

- `ping 127.0.0.1` prüft den lokalen IP-Stack, nicht die Netzwerkkarte zum Switch.
- Gateway antwortet, Ziel nicht: Route, Firewall, Gegenstelle oder Rückweg untersuchen.
- Ziel-IP funktioniert, Name nicht: DNS-Konfiguration und DNS-Antwort prüfen.
- Ping funktioniert, HTTPS nicht: TCP 443, TLS, Proxy und Webdienst prüfen.

## 7. Shell, UI und Prüfungsformulierungen

### 7.1 Einfaches Bash-Beispiel

```bash
#!/usr/bin/env bash
target="${1:-example.org}"
if ping -c 1 "$target" >/dev/null 2>&1; then
  printf '%s\n' "Host erreichbar"
  exit 0
else
  printf '%s\n' "Keine ICMP-Antwort"
  exit 1
fi
```

Zu erklären sind Parameter, Defaultwert, Anführungszeichen, Umleitung, Bedingung und Exitcode. „Keine ICMP-Antwort“ wird bewusst nicht als „Host ist aus“ formuliert.

### 7.2 PowerShell-Beispiel

```powershell
param([string]$Target = "example.org")
if (Test-Connection -ComputerName $Target -Count 1 -Quiet) {
    Write-Output "Host erreichbar"
    exit 0
}
Write-Output "Keine ICMP-Antwort"
exit 1
```

Eingaben werden nicht ungeprüft in Befehlsstrings eingebaut. Skripte laufen mit minimalen Rechten, protokollieren relevante Ergebnisse und behandeln Fehlerpfade.

### 7.3 UI-Entwurf

| Artefakt | Detailgrad | Zweck |
|---|---|---|
| Wireframe | niedrig | Struktur, Inhalte und Bedienweg |
| Mockup | mittel/hoch | visuelle Gestaltung und Corporate Design |
| Prototyp | variabel, interaktiv | Abläufe und Bedienbarkeit testen |
| Ausgabemaske | konkrete Ausgabeansicht | Daten verständlich und zielgruppengerecht darstellen |

Abnahmekriterien betreffen Inhalt, Pflichtfelder, Validierung, Fehlermeldungen, Tastaturbedienung, Kontrast, Lesereihenfolge, responsive Darstellung und Corporate-Design-Vorgaben.

### 7.4 Webgrundlagen

| Baustein | Aufgabe |
|---|---|
| HTML | semantische Struktur und Inhalte |
| CSS | Darstellung, Layout und responsive Anpassung |
| JavaScript | Verhalten und dynamische Änderungen im Browser |
| HTTP/HTTPS | Request und Response zwischen Client und Server; HTTPS zusätzlich transportverschlüsselt und authentisiert den Server per Zertifikat |

`GET` fordert typischerweise eine Darstellung/Ressource an; `POST` übermittelt Daten zur Verarbeitung. Statuscodes zeigen nur Klassen: `2xx` Erfolg, `3xx` Umleitung, `4xx` Clientproblem, `5xx` Serverproblem. Eingaben sind serverseitig zu validieren und kontextgerecht zu codieren. Gegen **XSS** hilft unter anderem korrektes Output-Encoding; gegen **CSRF** unter anderem ein CSRF-Token und passende Cookie-Einstellungen. Responsive Design, Tastaturbedienung, Alternativtexte und ausreichender Kontrast gehören zu prüfbaren Qualitätskriterien.

### 7.5 Recherche, Quellen und Präsentation

Suchoperatoren wie Anführungszeichen für eine exakte Phrase, `site:` für eine Domain und ein Minuszeichen zum Ausschluss schärfen eine Recherche. Belastbare Quellen sind aktuell, fachlich zuständig, nachvollziehbar und möglichst primär. Aussage, Autor/Herausgeber, Datum und Geltungsbereich müssen zusammenpassen.

Eine Präsentation beginnt mit Zielgruppe und Kernbotschaft. Pro Folie soll eine klare Aussage dominieren; Schriftgröße, Kontrast, Farbwirkung, Quellen und verfügbare Zeit sind zu prüfen. Die Folie unterstützt den Vortrag und ersetzt ihn nicht.

> `ping` allein bestätigt den Webdienst nicht, da ICMP-Erreichbarkeit weder einen offenen TCP-Port 443 noch eine erfolgreiche TLS- und HTTP-Verarbeitung beweist.

> Der SSH-Zugriff wird auf administrative Quellnetze und Schlüsselkonten beschränkt, weil ein offen erreichbarer Administrationsdienst die Angriffsfläche erhöht.

## 8. Selbsttest

1. Übersetze sinngemäß: `The current device does not meet the throughput requirement.`
2. Grenze Client-Server und Peer-to-Peer ab.
3. Welcher Befehl prüft DNS, welcher Hops, welcher lokale Listener?
4. Ping funktioniert, HTTPS nicht. Nenne vier nächste Prüfungen.
5. Erkläre die Exitcodes im Bash-Beispiel.
6. Grenze Wireframe, Mockup und Prototyp ab.
7. Welche Aufgaben haben HTML, CSS und JavaScript?
8. Nenne drei Kriterien für eine belastbare Onlinequelle.

<details>
<summary>Lösungen anzeigen</summary>

1. Das aktuelle Gerät erfüllt die Durchsatzanforderung nicht.
2. Client-Server zentralisiert Dienst und Regeln; Peer-to-Peer lässt Teilnehmer direkt Dienste füreinander bereitstellen.
3. `nslookup/dig`, `tracert/traceroute`, `netstat/ss`.
4. TCP 443, Firewall/Proxy, TLS/Zertifikat/Zeit, Webdienst und Logs.
5. 0 signalisiert in diesem Skript Erfolg; 1 bedeutet, dass keine ICMP-Antwort erkannt wurde.
6. Wireframe: grobe Struktur; Mockup: visuelles Bild; Prototyp: testbare Interaktion.
7. HTML strukturiert Inhalte, CSS gestaltet sie, JavaScript ergänzt Verhalten und dynamische Änderungen.
8. Zum Beispiel fachliche Zuständigkeit, Aktualität, nachvollziehbare Belege und klarer Geltungsbereich.

</details>

## 9. Quellen und Abgleich

- Microsoft Learn: Windows-Netzwerkbefehle, PowerShell und Remote Desktop.
- Linux-Manpages/iproute2, OpenSSH-Dokumentation und curl-Dokumentation.
- BIBB-Umsetzungshilfe: englische Quellen, Systemeinrichtung, Test und Kundenkommunikation.
- Historische AP1-Themenübersicht: Englisch, ping, Remotearbeit, Netzwerkkonfiguration und Codeanalyse; sekundäre Übersicht, Stand 11.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Welche Befehlsoptionen müssen bei WBS auswendig beherrscht werden?
- Werden PowerShell, Bash oder beide Shells eingesetzt?
- Muss eine englische Antwort auf Deutsch oder Englisch formuliert werden?
