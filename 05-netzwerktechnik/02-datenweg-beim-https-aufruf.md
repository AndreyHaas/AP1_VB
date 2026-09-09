---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Datenweg beim Aufruf einer HTTPS-Website

## Lernziele

- Порядок DNS, Subnetzprüfung, ARP/NDP, Routing, TCP, TLS и HTTP объяснять.
- Для первого Frame правильно определять Ziel-MAC и Ziel-IP.
- Понимать, какие адреса меняются на маршруте.

## Ausgangssituation

```text
Client-IP:       192.168.10.25/24
Default Gateway: 192.168.10.1
DNS-Server:      192.168.10.1
URL:             https://example.de/
```

## Ablauf

1. `DNS-Auflösung`: браузеру нужен IP-адрес для `example.de`.
2. `Subnetzprüfung`: клиент определяет, находится ли Ziel-IP в своей подсети.
3. Если цель удалённая, следующим узлом становится `Default Gateway`.
4. `ARP` определяет MAC-Adresse Gateway по его IPv4-Adresse. При IPv6 используется `NDP`.
5. Клиент создаёт Ethernet-Frame, содержащий IP-Paket и TCP-Segment.
6. Switch пересылает Frame по Ziel-MAC к Router.
7. Router удаляет старый Layer-2-заголовок, выбирает маршрут и создаёт новый Frame для следующего участка. При выходе из частной IPv4-сети может выполняться NAT/PAT.
8. TCP устанавливает соединение: `SYN → SYN-ACK → ACK`.
9. TLS проверяет сервер и формирует защищённое соединение.
10. Браузер отправляет HTTP-запрос внутри TLS, например `GET /`.

## Adressen im ersten Frame

Если Webserver находится в другой подсети:

```text
Source MAC:      MAC-Adresse des Clients
Destination MAC: MAC-Adresse des Default Gateways
Source IP:       IP-Adresse des Clients
Destination IP:  IP-Adresse des Webservers
Source Port:     dynamischer Client-Port
Destination Port: 443/TCP
```

Главное:

```text
MAC  = следующая локальная остановка
IP   = конечная сетевая цель
Port = приложение на конечном устройстве
```

На каждом Router MAC-Adressen меняются. Destination IP обычно остаётся IP-Adresse конечного сервера. NAT может изменить Source IP и Source Port.

## IHK-Merksätze

> Befindet sich das Ziel außerhalb des eigenen Subnetzes, trägt der erste Ethernet-Frame die MAC-Adresse des Default Gateways als Zieladresse.

> Die Ziel-IP-Adresse im IP-Paket bleibt die Adresse des entfernten Servers.

## Typische Prüfungsfallen

- ARP не ищет MAC удалённого Webserver; он ищет MAC следующего устройства в локальном сегменте.
- DNS нужен до TCP-Verbindung, если IP ещё не известен из Cache.
- Успешный DNS не означает, что Port 443 доступен.
- При HTTPS HTTP-запрос передаётся после создания TLS-защиты.

## Selbsttest

DNS работает, но Firewall блокирует исходящий TCP-Port 443. Что может и чего не может сделать браузер?

## Lösungen

> Der Browser kann den Domainnamen in eine IP-Adresse auflösen. Er kann jedoch keine TCP-Verbindung zum HTTPS-Dienst auf Port 443 aufbauen und deshalb die Website nicht über HTTPS abrufen.

## Offene Punkte / Korrekturen

- При использовании HTTP/3 вместо TCP применяется QUIC поверх UDP; для типовой AP1-задачи без такого указания исходить из HTTPS через TCP.
