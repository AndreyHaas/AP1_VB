---
pruefung: AP1
thema: Technisches Englisch, Client-Server, Remotezugriff, Shell und UI-Entwurf
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/09-technisches-englisch-client-server-remote-shell-und-ui-de.md
---

# Technisches Englisch, Client-Server, Remotezugriff, Shell und UI-Entwurf

## 1. Lernziele

После изучения главы нужно уметь:

- целенаправленно анализировать технические и kaufmännische английские тексты;
- различать Client-Server, Peer-to-Peer и zentrale Dienste;
- безопасно выбирать Remotezugriff;
- применять Diagnosebefehle Windows/Linux по их Aussagekraft;
- читать, объяснять и исправлять простые Shell-Skripte;
- понимать Mockup, Wireframe, Ausgabemaske и Corporate Design;
- оценивать Social-Media-Nutzung по Zielgruppe, Sicherheit и Datenschutz.

## 2. Prüfungsminimum — 15 Minuten

1. Сначала отметить Operator и искомую информацию, затем читать английский текст целенаправленно.
2. Client запрашивает Dienst; Server предоставляет по правилам. Роль может меняться по операции.
3. Peer-to-Peer распределяет роли между участниками; zentrale Steuerung и Sicherung сложнее.
4. VPN защищает Netzwerkpfad, но не заменяет sichere Endgeräte, Authentisierung и Berechtigung.
5. RDP передаёт графический Desktop; SSH обычно даёт зашифрованную текстовую Administration.
6. `ping` проверяет IP-Erreichbarkeit через ICMP Echo, но не Anwendungsport.
7. `tracert/traceroute` показывает наблюдаемые Hops через TTL/Hop Limit; отсутствие ответа не доказывает Leitungsfehler.
8. `ipconfig` показывает Windows-IP-Konfiguration; в Linux обычно `ip addr`/`ip route`, `ifconfig` старше.
9. Shell-Skript должен учитывать Eingaben, Rückgabecode, Fehlerpfad, Rechte и Nebenwirkungen.
10. Wireframe грубо задаёт структуру; Mockup показывает визуальный вид; Prototyp может имитировать интеракцию.

## 3. Technisches Englisch и Informationsrecherche

### 3.1 Fünf-Schritt-Methode

1. Узнать Operator: `name`, `describe`, `explain`, `calculate`, `justify`, `evaluate`.
2. Отметить нужную Einheit или Entscheidung.
3. Просмотреть текст и найти Schlüsselwörter.
4. Извлечь Aussage вместе с Zahl, Bedingung и Einschränkung.
5. Ответить на требуемом языке полным предложением.

| Englisch | deutsche Fachbedeutung |
|---|---|
| requirement | Anforderung |
| constraint | Randbedingung/Einschränkung |
| throughput | Durchsatz |
| availability | Verfügbarkeit |
| maintenance | Wartung |
| liability | Haftung |
| warranty | Gewährleistung или Nutzungssicherheit по контексту |
| eventually | schließlich, не eventuell |
| current | aktuell, не Strom |
| provision | Bereitstellung или Rückstellung по контексту |

При Recherche проверяются Autor, Aktualität, Primärquelle, Zweck, Belege и Interessen. Suchtreffer или KI-Ausgabe — указание, но не источник сами по себе.

## 4. Client-Server, Peer-to-Peer и Social Media

| Modell | Stärke | Risiko |
|---|---|---|
| Client-Server | zentrale Regeln, Daten, Backup, Skalierung | Server-/Netzabhängigkeit, центральная цель атаки |
| Peer-to-Peer | простой прямой обмен | сложнее Verwaltung, Konsistenz, Sicherung |
| Cloud-Service | эластичные ресурсы | Providerabhängigkeit, Datenschutz, Kostensteuerung |

`Client` и `Server` — роли, а не всегда типы устройств. Browser — HTTP-Client; Rechner может одновременно предоставлять Druckdienst.

Для betriebliches Social-Media-System планируют Zielgruppe, Kommunikationsziel, Freigabeprozess, Rollen, Moderation, Barrierefreiheit, Urheberrecht, Datenschutz, Aufbewahrung и Incident-Prozess. Private Accounts и Unternehmenszugänge разделяются; MFA и geregeltes Offboarding обязательны.

## 5. Remotezugriff и sichere Auswahl

| Verfahren | geeignet für | zentrale Prüfung |
|---|---|---|
| RDP | grafische Windows-Sitzung | Gateway/VPN, MFA, Rechte, Protokollierung |
| SSH | Shell, Tunneling, Administration | Schlüssel, Hostprüfung, Least Privilege |
| Remote-Support-Tool | помощь Endnutzer | Einwilligung, Anzeige, Freigabe, Logs |
| VPN | защищённый Netzpfad | starke Authentisierung, Netze, Client-Sicherheit |
| Web-Konsole | anwendungsbezogene Verwaltung | HTTPS, Rollen, Session-Schutz |

RDP/SSH не должны без нужды быть открыты из Интернета. Zugriff ограничивают по Quellen, Identitäten и Zeiten; административные Konten разделяют, включают MFA/Logging, обновляют Software.

## 6. Diagnosebefehle и systematischer Ablauf

| Zweck | Windows | Linux | Aussage und Grenze |
|---|---|---|---|
| lokale IP-Konfiguration | `ipconfig /all` | `ip addr`, `ip route` | Adresse, Maske, Gateway, DNS; не доказывает Ende-zu-Ende |
| IP-Erreichbarkeit | `ping ziel` | `ping ziel` | ICMP-Antwort/Laufzeit; не проверяет TCP-Dienst |
| Pfad/Hops | `tracert ziel` | `traceroute ziel` или `tracepath` | видимые Router-Hops; Filter дают звёздочки |
| Pfad plus Verlust | `pathping ziel` | комбинация Messwerkzeuge | статистика, требует времени |
| DNS-Auflösung | `nslookup name` | `dig name` или `nslookup` | DNS-Antwort; не доступность Service |
| Listener/Verbindungen | `netstat -ano` | `ss -tulpen` | локальные Ports/Sockets; нужны Rechte для деталей |
| Nachbartabelle | `arp -a` | `ip neigh` | IPv4-ARP/соседи только локального сегмента/Cache |
| Routingtabelle | `route print` | `ip route` | Routen/Gateway; не обратный маршрут |
| Identität | `whoami` | `whoami`, `id` | текущий Benutzer/Kontext |
| Gerätename | `hostname` | `hostname` | Hostname, не обязательно DNS-FQDN |
| TCP-Porttest | `Test-NetConnection host -Port 443` | `nc -vz host 443` | TCP-Verbindungsversuch; не полный Anwendungstest |
| HTTP-Test | `curl -I https://host` | `curl -I https://host` | HTTP/TLS-Antwort; Inhalt/Berechtigung отдельно |

### Reihenfolge der Fehlersuche

```text
Strom/Link → lokale Konfiguration → eigener Stack → Gateway
→ Ziel-IP → DNS-Name → Port → Protokoll/Anwendung → Logs
```

Примеры:

- `ping 127.0.0.1` проверяет локальный IP-Stack, не Verbindung к Switch.
- Gateway отвечает, Ziel нет: проверить Route, Firewall, Gegenstelle, Rückweg.
- Ziel-IP работает, Name нет: DNS-Konfiguration и DNS-Antwort.
- Ping работает, HTTPS нет: TCP 443, TLS, Proxy, Webdienst.

## 7. Shell, UI и Prüfungsformulierungen

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

Нужно объяснить Parameter, Defaultwert, Anführungszeichen, Umleitung, Bedingung и Exitcode. `Keine ICMP-Antwort` намеренно не равно `Host ist aus`.

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

Eingaben нельзя без проверки включать в Befehlsstrings. Skripte запускаются с минимальными Rechte, протоколируют результаты и обрабатывают Fehlerpfade.

### 7.3 UI-Entwurf

| Artefakt | Detailgrad | Zweck |
|---|---|---|
| Wireframe | низкий | структура, Inhalte, Bedienweg |
| Mockup | средний/высокий | визуальный вид и Corporate Design |
| Prototyp | переменный, интерактивный | тест Ablauf/Bedienbarkeit |
| Ausgabemaske | конкретное представление | понятный целевой вывод данных |

Abnahmekriterien: Inhalt, Pflichtfelder, Validierung, Fehlermeldungen, Tastaturbedienung, Kontrast, Lesereihenfolge, responsive Darstellung, Corporate Design.

### 7.4 Webgrundlagen

| Baustein | Задача |
|---|---|
| HTML | семантическая структура и Inhalt |
| CSS | Darstellung, Layout и responsive Anpassung |
| JavaScript | Verhalten и динамические изменения в Browser |
| HTTP/HTTPS | Request и Response между Client и Server; HTTPS дополнительно шифрует транспорт и аутентифицирует Server сертификатом |

`GET` обычно запрашивает Darstellung/Ressource, `POST` передаёт данные на обработку. Классы Statuscodes: `2xx` успех, `3xx` перенаправление, `4xx` проблема Client, `5xx` проблема Server. Eingaben нужно проверять на Server и кодировать по контексту. Против **XSS** помогает корректное Output-Encoding, против **CSRF** — CSRF-Token и подходящие Cookie-Einstellungen. Responsive Design, Tastaturbedienung, Alternativtexte и достаточный Kontrast — проверяемые Qualitätskriterien.

### 7.5 Recherche, Quellen и Präsentation

Suchoperatoren: кавычки для точной фразы, `site:` для Domain, минус для исключения. Надёжный источник актуален, компетентен, проверяем и по возможности первичен. Aussage, Autor/Herausgeber, Datum и Geltungsbereich должны соответствовать друг другу.

Презентация начинается с Zielgruppe и Kernbotschaft. На Folie должна доминировать одна ясная мысль; проверяются Schriftgröße, Kontrast, Farbwirkung, Quellen и время. Folie поддерживает Vortrag, а не заменяет его.

> `ping` allein bestätigt den Webdienst nicht, da ICMP-Erreichbarkeit weder einen offenen TCP-Port 443 noch eine erfolgreiche TLS- und HTTP-Verarbeitung beweist.

> Der SSH-Zugriff wird auf administrative Quellnetze und Schlüsselkonten beschränkt, weil ein offen erreichbarer Administrationsdienst die Angriffsfläche erhöht.

## 8. Selbsttest

1. Переведи: `The current device does not meet the throughput requirement.`
2. Различи Client-Server и Peer-to-Peer.
3. Какая команда проверяет DNS, Hops, локальные Listener?
4. Ping работает, HTTPS нет. Назови четыре проверки.
5. Объясни Exitcodes Bash-примера.
6. Различи Wireframe, Mockup, Prototyp.
7. Каковы задачи HTML, CSS и JavaScript?
8. Назови три критерия надёжного Onlinequelle.

<details>
<summary>Lösungen anzeigen</summary>

1. Das aktuelle Gerät erfüllt die Durchsatzanforderung nicht.
2. Client-Server централизует Dienst/Regeln; Peer-to-Peer даёт участникам прямые Dienste друг для друга.
3. `nslookup/dig`, `tracert/traceroute`, `netstat/ss`.
4. TCP 443, Firewall/Proxy, TLS/Zertifikat/Zeit, Webdienst/Logs.
5. 0 — успех; 1 — не получен ICMP-Antwort.
6. Wireframe — грубая структура; Mockup — визуальный вид; Prototyp — тестовая интеракция.
7. HTML структурирует Inhalt, CSS оформляет его, JavaScript добавляет Verhalten и динамические изменения.
8. Например, fachliche Zuständigkeit, Aktualität, nachvollziehbare Belege и ясный Geltungsbereich.

</details>

## 9. Quellen und Abgleich

- Microsoft Learn: Windows-Netzwerkbefehle, PowerShell, Remote Desktop.
- Linux-Manpages/iproute2, OpenSSH- и curl-Dokumentation.
- BIBB-Umsetzungshilfe: английские источники, Systemeinrichtung, Test, Kundenkommunikation.
- Historische AP1-Themenübersicht: Englisch, ping, Remotearbeit, Netzwerkkonfiguration, Codeanalyse; вторичный обзор, Stand 11.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Какие Befehlsoptionen WBS требует наизусть?
- Используются PowerShell, Bash или обе Shells?
- Ответ по английскому тексту нужно писать по-немецки или по-английски?
