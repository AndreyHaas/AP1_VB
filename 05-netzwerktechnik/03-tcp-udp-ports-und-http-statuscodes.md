---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# TCP, UDP, Ports und HTTP-Statuscodes

## TCP und UDP

`TCP`:

- verbindungsorientiert;
- bestätigt Empfang и повторяет потерянные Segmente;
- сохраняет порядок;
- надёжен, но имеет дополнительный Overhead.

`UDP`:

- verbindungslos;
- не гарантирует доставку и порядок;
- низкий Overhead и geringe Latenz;
- приложение само решает, нужна ли компенсация потерь.

Примеры:

```text
Dateiübertragung/SSH/klassisches HTTPS → TCP
Live-Audio, einfache DNS-Anfrage       → häufig UDP
```

## TCP Three-Way Handshake

```text
Client → SYN     → Server
Client ← SYN-ACK ← Server
Client → ACK     → Server
```

## Wichtige Ports

| Dienst | Port/Transport | Zweck |
|---|---|---|
| HTTP | 80/TCP | Web ohne TLS |
| HTTPS | 443/TCP | Web über TLS; HTTP/3 nutzt 443/UDP |
| DNS | 53/UDP und TCP | Namensauflösung |
| DHCPv4 | 67/UDP Server, 68/UDP Client | IP-Konfiguration |
| SSH | 22/TCP | sichere Fernadministration |
| SMTP | 25/587/TCP | Mailtransport/Submission |
| IMAP | 143/TCP, 993/TCP mit TLS | Mailzugriff |
| POP3 | 110/TCP, 995/TCP mit TLS | Mailabruf |
| SMB | 445/TCP | Datei-/Druckfreigaben |
| RDP | 3389/TCP/UDP | Remote Desktop |
| NTP | 123/UDP | Zeitsynchronisation |
| LDAP/LDAPS | 389, 636/TCP | Verzeichnisdienst |

Порт идентифицирует службу, но не гарантирует её содержимое: приложение технически может слушать любой свободный Port.

## Gleichzeitige Verbindungen

Несколько клиентов могут одновременно подключаться к одному Serverport. TCP-Verbindung различается как минимум комбинацией:

```text
Quell-IP + Quellport + Ziel-IP + Zielport
```

## Wichtige HTTP-Statuscodes

| Code | Bedeutung | Typischer Fall |
|---:|---|---|
| 200 | OK | запрос успешно обработан |
| 201 | Created | новый ресурс создан |
| 400 | Bad Request | некорректный запрос |
| 401 | Unauthorized | отсутствует/неверна аутентификация |
| 403 | Forbidden | личность известна, но доступа нет |
| 404 | Not Found | ресурс не найден |
| 500 | Internal Server Error | внутренняя ошибка приложения |
| 502 | Bad Gateway | Gateway получил неверный ответ от Backend |
| 503 | Service Unavailable | служба временно недоступна |
| 504 | Gateway Timeout | Gateway не дождался Backend |

## IHK-Merksätze

> TCP eignet sich für eine vollständige und geordnete Datenübertragung, weil verlorene Segmente erneut übertragen werden.

> UDP eignet sich für zeitkritische Übertragungen, wenn geringe Latenz wichtiger ist als die garantierte Zustellung jedes Datagramms.

## Typische Prüfungsfallen

- `401` означает отсутствие действительной Authentifizierung; `403` — запрет несмотря на известную личность.
- Необработанное Exception в самом Backend обычно ведёт к `500`, не автоматически к 502.
- Timeout Reverse Proxy к Backend — `504`.
- DNS может использовать и UDP, и TCP.

## Selbsttest

1. Ein neuer Benutzer wurde per POST erfolgreich angelegt. Welcher Statuscode passt?
2. Der Benutzer ist angemeldet, besitzt aber keine Administratorrolle. Welcher Statuscode passt?
3. Ein Reverse Proxy erhält rechtzeitig eine syntaktisch ungültige Antwort vom Backend. Welcher Statuscode passt?

## Lösungen

```text
1. 201 Created
2. 403 Forbidden
3. 502 Bad Gateway
```

## Offene Punkte / Korrekturen

- Portliste nur in der Tiefe lernen, die in WBS-Unterlagen verlangt wird.
