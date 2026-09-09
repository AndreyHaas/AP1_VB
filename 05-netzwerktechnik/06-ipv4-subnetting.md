---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# IPv4-Subnetting

## Lernziele

- Aus CIDR-Präfix die Subnetzmaske und Blockgröße bestimmen.
- Netzadresse, Broadcastadresse und Hostbereich berechnen.
- Минимальную подсеть под заданное число Hosts выбирать.

## Grundformeln

```text
Adressen im Subnetz = 2^(32 − Präfix)

nutzbare klassische Hostadressen = Adressen − 2

letzte Adresse = erste Adresse + Blockgröße − 1
```

В типовых AP1-задачах вычитаются Netzadresse и Broadcastadresse. Специальные случаи `/31` и `/32` рассматривать только при явном указании.

## Tabelle für das letzte Oktett

| Präfix | Subnetzmaske | Blockgröße | nutzbare Hosts |
|---:|---|---:|---:|
| /24 | 255.255.255.0 | 256 | 254 |
| /25 | 255.255.255.128 | 128 | 126 |
| /26 | 255.255.255.192 | 64 | 62 |
| /27 | 255.255.255.224 | 32 | 30 |
| /28 | 255.255.255.240 | 16 | 14 |
| /29 | 255.255.255.248 | 8 | 6 |
| /30 | 255.255.255.252 | 4 | 2 |

```text
Blockgröße = 256 − Maskenwert im interessierenden Oktett
```

## Beispiel 1: Adresse einem Netz zuordnen

`172.16.8.100/27`

```text
/27 = 255.255.255.224
Blockgröße = 256 − 224 = 32

100 ÷ 32 = 3 Rest 4
3 × 32 = 96

Netzadresse:       172.16.8.96
Broadcastadresse:  172.16.8.127
Hostbereich:       172.16.8.97–172.16.8.126
nutzbare Hosts:    30
```

## Beispiel 2: 10.0.0.174/28

```text
Blockgröße:        16
Netzadresse:       10.0.0.160
Broadcastadresse:  10.0.0.175
Hostbereich:       10.0.0.161–10.0.0.174
```

Важно: `10.0.0.176` — начало следующей подсети, не Broadcast текущей.

## Subnetz nach Hostanzahl

Для 25 устройств:

```text
25 + 2 = 27 benötigte Adressen
nächste Zweierpotenz = 32 = 2^5
32 − 5 Hostbits = /27
Ergebnis: /27 mit 30 nutzbaren Hostadressen
```

Для 100 устройств:

```text
100 + 2 = 102
nächste Zweierpotenz = 128 = 2^7
32 − 7 = /25
Ergebnis: /25 mit 126 nutzbaren Hostadressen
```

## Typische Prüfungsfallen

- `255.255.255.224` — Subnetzmaske, но не Netzadresse.
- Netzadresse и Broadcastadresse не назначаются обычным Hosts.
- Делить нужно соответствующий Oktett IP-Adresse на Blockgröße.
- При переходе через границу Oktett алгоритм расширяется на предыдущий Oktett; таблица выше — быстрый случай для `/24`–`/30`.

## Selbsttest

Für `192.168.20.210/27` bestimme Subnetzmaske, Netzadresse, Broadcastadresse, Hostbereich und Anzahl nutzbarer Hostadressen.

## Lösungen

```text
Subnetzmaske:      255.255.255.224
Blockgröße:        32
Netzadresse:       192.168.20.192
Broadcastadresse:  192.168.20.223
Hostbereich:       192.168.20.193–192.168.20.222
nutzbare Hosts:    30
```

## Offene Punkte / Korrekturen

- VLSM и расчёты с Präfix меньше /24 добавить после закрепления базового алгоритма.
