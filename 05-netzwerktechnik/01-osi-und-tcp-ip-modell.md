---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# OSI- und TCP/IP-Modell

## Lernziele

- Семь уровней OSI называть и соотносить с функциями, адресами, PDU и устройствами.
- Отличать MAC-Adresse, IP-Adresse и Portnummer.
- Понимать `Kapselung` и `Entkapselung`.

## OSI-Modell

| Layer | Deutsch / Englisch | Aufgabe | Adressierung / PDU | Beispiele |
|---:|---|---|---|---|
| 7 | Anwendung / Application | сетевые функции приложений | Daten | HTTP(S), DNS, DHCP, SMTP, SSH |
| 6 | Darstellung / Presentation | формат, кодирование, шифрование, сжатие | Daten | UTF-8, JPEG; TLS часто упрощённо относят сюда |
| 5 | Sitzung / Session | создание и управление сеансами | Daten | RPC, NetBIOS Session |
| 4 | Transport | связь между приложениями | Ports; Segment/Datagramm | TCP, UDP |
| 3 | Vermittlung / Network | маршрутизация между сетями | IP; Paket | IPv4, IPv6, ICMP; Router |
| 2 | Sicherung / Data Link | передача в локальном сегменте | MAC; Frame | Ethernet, WLAN, VLAN; Switch |
| 1 | Bitübertragung / Physical | физические сигналы | Bits | Kupfer, LWL, Funk; Hub, Repeater |

В реальных протоколах границы верхних уровней не всегда однозначны. На экзамене применять модель, указанную в условии; для базовых задач использовать таблицу выше.

## TCP/IP-Modell

```text
OSI 7–5 → Anwendungsschicht
OSI 4   → Transportschicht
OSI 3   → Internetschicht
OSI 2–1 → Netzzugangsschicht
```

## Adressen

```text
MAC-Adresse → локальная доставка в текущем Netzsegment, Layer 2
IP-Adresse  → конечное устройство и маршрутизация, Layer 3
Portnummer  → приложение/служба на устройстве, Layer 4
```

`ping` использует ICMP на Layer 3. У ICMP нет TCP- или UDP-Port.

## Kapselung

При отправке данные проходят сверху вниз:

```text
Daten
→ TCP-Segment oder UDP-Datagramm
→ IP-Paket
→ Ethernet-Frame
→ Bits
```

При получении идёт обратный процесс — `Entkapselung`.

## IHK-Merksätze

> Ein Switch arbeitet normalerweise auf Layer 2 und leitet Frames anhand von MAC-Adressen weiter.

> Ein Router arbeitet auf Layer 3 und leitet Pakete anhand von IP-Adressen zwischen Netzen weiter.

> Portnummern gehören zur Transportschicht, auch wenn sie häufig zusammen mit Anwendungsprotokollen gelernt werden.

## Typische Prüfungsfallen

- `HTTPS` — Anwendungsschicht, но `TCP-Port 443` — Transportschicht.
- `DNS` — Anwendungsschicht, хотя он использует UDP или TCP.
- ARP связывает IPv4-Adresse с MAC-Adresse и находится на границе Layer 2/3; в учебных заданиях его часто относят к Layer 2.
- `Access Point` соединяет WLAN с LAN и в основной функции работает как Layer-2-Bridge.

## Selbsttest

Ordne zu: TCP, IPv6, Ethernet-Frame, Port 443, Router, Switch, ICMP, Netzwerkkabel, DNS.

## Lösungen

```text
TCP              → Layer 4
IPv6             → Layer 3
Ethernet-Frame   → Layer 2
Port 443         → Layer 4
Router           → Layer 3
Switch           → Layer 2
ICMP             → Layer 3
Netzwerkkabel    → Layer 1
DNS              → Layer 7
```

## Offene Punkte / Korrekturen

- TCP/IP-Modell in einer späteren Wiederholung mit konkreten Protokollen festigen.
