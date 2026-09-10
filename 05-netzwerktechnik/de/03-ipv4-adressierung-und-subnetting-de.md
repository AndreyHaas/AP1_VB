---
pruefung: AP1
thema: IPv4-Adressierung und Subnetting
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Deutsch
gegenstueck: ../ru/03-ipv4-adressierung-und-subnetting-ru.md
---

# AP1: IPv4-Adressierung und Subnetting

Subnetting bestimmt, welche Adressen zu einem Netz gehören, wo dessen Grenzen liegen und wie viele Hosts hineinpassen. Die sichere Methode verwendet Präfix und Binärmaske; die Blockgröße beschleunigt typische Berechnungen.

---

## 1. Lernziele

Nach dieser Einheit kannst du:

- ein CIDR-Präfix in eine Subnetzmaske und zurück umwandeln;
- Netzadresse, Broadcastadresse und Hostbereich bestimmen;
- prüfen, ob zwei Hosts im gleichen Subnetz liegen;
- den kleinsten passenden Präfix nach Hostbedarf wählen;
- mehrere Netze mit VLSM planen;
- private, Link-Local-, Loopback- und Dokumentationsadressen erkennen;
- Host- und Gateway-Adressen auf Gültigkeit prüfen;
- einen Rechenweg in vollständigen Sätzen begründen.

---

## 2. Prüfungsminimum — 15 Minuten

### Formeln für ein typisches Hostsubnetz

```text
Adressanzahl = 2^(32 − Präfix)
nutzbare Hostadressen = 2^(32 − Präfix) − 2
Broadcast = Netzadresse + Blockgröße − 1
```

In einer gewöhnlichen AP1-Aufgabe werden Netzadresse und Broadcast nicht an Hosts vergeben. `/31` und `/32` sind Sonderfälle und werden nur bei ausdrücklicher Anforderung verwendet.

### Schnelltabelle

| Präfix | Maske | Block | nutzbare Hosts |
|---:|---|---:|---:|
| /24 | 255.255.255.0 | 256 | 254 |
| /25 | 255.255.255.128 | 128 | 126 |
| /26 | 255.255.255.192 | 64 | 62 |
| /27 | 255.255.255.224 | 32 | 30 |
| /28 | 255.255.255.240 | 16 | 14 |
| /29 | 255.255.255.248 | 8 | 6 |
| /30 | 255.255.255.252 | 4 | 2 |

### Algorithmus

```text
Präfix → Maske → interessantes Oktett → Blockgröße
→ Netzgrenze → Broadcast → Hostbereich → Kontrolle
```

> Die Adresse `192.168.20.210/27` liegt im Netz `192.168.20.192/27`; der Broadcast lautet `.223` und der nutzbare Hostbereich reicht von `.193` bis `.222`.

---

## 3. Aufbau einer IPv4-Adresse

IPv4 besitzt `32 Bit`, die zur Darstellung in vier Oktette geteilt werden:

```text
11000000.10101000.00000001.00010100
192     .168     .1       .20
```

Der Präfix `/24` bedeutet: Die ersten 24 Bit gehören zum Netzanteil, die übrigen acht zum Hostanteil. Ohne Präfix oder Maske bestimmt die Adresse keine Netzgröße.

---

## 4. Subnetzmaske und CIDR

Eine Subnetzmaske besteht aus einer lückenlosen Folge von Einsen und anschließenden Nullen.

```text
/27
11111111.11111111.11111111.11100000
255      .255      .255      .224
```

Zulässige Oktettwerte einer zusammenhängenden Maske:

| Bits | Dezimal |
|---|---:|
| 00000000 | 0 |
| 10000000 | 128 |
| 11000000 | 192 |
| 11100000 | 224 |
| 11110000 | 240 |
| 11111000 | 248 |
| 11111100 | 252 |
| 11111110 | 254 |
| 11111111 | 255 |

Beispielsweise gilt `255.255.255.224 = /27`; `255.0.255.0` ist keine gewöhnliche CIDR-Maske.

---

## 5. Netzadresse durch bitweises AND

Die Netzadresse entsteht durch eine AND-Verknüpfung von IP und Maske:

```text
IP:     11001010 (202)
Maske:  11100000 (224)
AND:    11000000 (192)
```

Bei `192.168.20.202/27` sind die ersten drei Oktette vollständig Netzanteil; im letzten ergibt sich `192`. Die Netzadresse lautet `192.168.20.192`.

Die Methode ist universell und besonders hilfreich, wenn die Präfixgrenze nicht im letzten Oktett liegt.

---

## 6. Blockgröße

Für das Oktett, in dem der Präfix endet:

```text
Blockgröße = 256 − Maskenwert
```

Bei `/27`: `256 − 224 = 32`. Grenzen sind `0, 32, 64, 96, 128, 160, 192, 224`.

Die Adresse `210` liegt zwischen `192` und `223`. Das Netz beginnt bei `.192`, das nächste bei `.224`; der Broadcast des aktuellen Netzes ist `.223`.

---

## 7. Netzadresse, Broadcast und Hostbereich

- Bei der `Netzadresse` sind alle Hostbits `0`.
- Bei der `Broadcastadresse` sind alle Hostbits `1`.
- Der `Hostbereich` liegt zwischen diesen Adressen.

```text
Netz:        192.168.20.192/27
erster Host: 192.168.20.193
letzter Host:192.168.20.222
Broadcast:   192.168.20.223
```

Ein Broadcast erreicht alle IPv4-Hosts dieses Broadcast-Domains und wird normalerweise nicht von Routern in andere Netze weitergeleitet.

---

## 8. Anzahl der Adressen

Bei `/27` verbleiben `32 − 27 = 5 Hostbits`:

```text
2^5 = 32 Adressen
32 − Netzadresse − Broadcast = 30 nutzbare Hostadressen
```

Nicht `2^27` berechnen. Der Präfix nennt die Netzbits; die Blockgröße folgt aus den verbleibenden Bits.

---

## 9. Beispiel 1: 172.16.8.100/27

```text
Maske:           255.255.255.224
Blockgröße:      32
Grenzen:         0, 32, 64, 96, 128, ...
Netzadresse:     172.16.8.96
Broadcast:       172.16.8.127
Hostbereich:     172.16.8.97–172.16.8.126
nutzbare Hosts:  30
```

Kontrolle: `100` liegt im Intervall `96–127`.

---

## 10. Beispiel 2: 10.0.0.174/28

```text
/28 = 255.255.255.240
Blockgröße = 16
Netzadresse:     10.0.0.160
Broadcast:       10.0.0.175
Hostbereich:     10.0.0.161–10.0.0.174
nutzbare Hosts:  14
```

`10.0.0.176` ist die Netzadresse des nächsten Subnetzes und nicht der Broadcast des aktuellen.

---

## 11. Grenze im dritten Oktett

`10.20.77.130/20`

```text
/20 = 255.255.240.0
interessantes Oktett = drittes
Blockgröße = 256 − 240 = 16
77 liegt im Block 64–79

Netzadresse: 10.20.64.0
Broadcast:   10.20.79.255
Hostbereich: 10.20.64.1–10.20.79.254
```

Das letzte Oktett gehört hier vollständig zum Hostanteil. Der Block darf nicht nur anhand von `130` gesucht werden.

---

## 12. Prüfung: gleiches Subnetz

Jeder Host verknüpft seine eigene und die Zieladresse mit seiner Maske.

```text
192.168.10.20/26 → Netz 192.168.10.0
192.168.10.70/26 → Netz 192.168.10.64
```

Die Hosts liegen trotz gleicher erster drei Oktette nicht im gleichen Subnetz. Für die Kommunikation werden ein Router und korrekte Gateways benötigt.

Sind auf den Hosts fälschlich unterschiedliche Masken gesetzt, kann ein Host das Ziel als lokal und der andere als entfernt betrachten. So entsteht ein asymmetrischer Fehler.

---

## 13. Private IPv4-Bereiche

| Bereich | Bedeutung |
|---|---|
| `10.0.0.0/8` | private Nutzung |
| `172.16.0.0/12` | private Nutzung (`172.16`–`172.31`) |
| `192.168.0.0/16` | private Nutzung |

Private Adressen werden nicht als öffentliche Ziele global geroutet. Für typischen Internetzugang wird NAT/PAT eingesetzt; NAT ist jedoch kein Bestandteil der Definition einer privaten Adresse.

`172.32.0.0` gehört nicht mehr zu `172.16.0.0/12`.

---

## 14. Besondere Bereiche

| Bereich | Verwendung |
|---|---|
| `127.0.0.0/8` | Loopback |
| `169.254.0.0/16` | IPv4 Link-Local/APIPA |
| `224.0.0.0/4` | Multicast |
| `0.0.0.0` | nicht spezifizierte Adresse/Default-Kontext |
| `255.255.255.255` | Limited Broadcast |
| `192.0.2.0/24`, `198.51.100.0/24`, `203.0.113.0/24` | Dokumentationsbeispiele |

Dokumentationsnetze sind für Lernbeispiele besser geeignet als reale öffentliche Adressen.

---

## 15. Minimales Subnetz nach Hostzahl

Für 25 Hosts:

```text
25 + 2 = 27 benötigte Adressen
nächste Zweierpotenz = 32 = 2^5
Hostbits = 5
Präfix = 32 − 5 = /27
Kapazität = 30 nutzbare Hosts
```

Für 60 Hosts gilt: `60 + 2 = 62`, nächster Block `64`, somit `/26` mit 62 nutzbaren Adressen.

Reserve, Gateway, Drucker und weitere adressierte Schnittstellen sind einzurechnen, wenn sie zur Anforderung gehören.

---

## 16. Subnetze fester Größe

Das Ausgangsnetz `192.168.40.0/24` wird in vier gleich große Subnetze geteilt.

```text
4 = 2^2 → 2 zusätzliche Netzbits
/24 + 2 = /26
Blockgröße 64
```

| Subnetz | Hostbereich | Broadcast |
|---|---|---|
| `192.168.40.0/26` | `.1–.62` | `.63` |
| `192.168.40.64/26` | `.65–.126` | `.127` |
| `192.168.40.128/26` | `.129–.190` | `.191` |
| `192.168.40.192/26` | `.193–.254` | `.255` |

---

## 17. VLSM-Grundidee

`Variable Length Subnet Masking` verwendet unterschiedlich große Präfixe. Vorgehen:

1. Bedarfe einschließlich Reserve erfassen.
2. Vom größten zum kleinsten Bedarf sortieren.
3. Für jeden Bedarf den kleinsten passenden Block bestimmen.
4. Jeden Block an einer gültigen Grenze beginnen.
5. Überschneidungen und freien Rest dokumentieren.

Die Vergabe großer Netze zuerst verringert das Risiko einer Fragmentierung des Adressraums.

---

## 18. VLSM-Beispiel

Aus `192.168.50.0/24` werden Netze für 100, 50, 20 und 10 Hosts geplant:

| Bedarf | Präfix | Zuweisung | nutzbarer Bereich |
|---:|---:|---|---|
| 100 | /25 | `192.168.50.0/25` | `.1–.126` |
| 50 | /26 | `192.168.50.128/26` | `.129–.190` |
| 20 | /27 | `192.168.50.192/27` | `.193–.222` |
| 10 | /28 | `192.168.50.224/28` | `.225–.238` |

`192.168.50.240/28` bleibt frei. Jede Zuweisung beginnt an ihrer Blockgrenze.

---

## 19. Gateway-Adresse prüfen

Für den Client `192.168.12.70/26` gilt das Netz `192.168.12.64/26` mit Hostbereich `.65–.126`.

- Gateway `.65` ist lokal und möglich.
- Gateway `.64` ist die Netzadresse und unzulässig.
- Gateway `.127` ist Broadcast und unzulässig.
- Gateway `.1` liegt außerhalb des Clientnetzes und ist ohne Sondermechanismus nicht direkt erreichbar.

Das Gateway muss nicht immer der erste oder letzte Host sein; dies ist lediglich eine Konvention.

---

## 20. /31 und /32

- `/32` bezeichnet genau eine IPv4-Adresse, beispielsweise eine Hostroute.
- `/31` kann auf geeigneten Point-to-Point-Links beide Adressen verwenden, ohne klassische Netz- und Broadcastrolle (RFC 3021).

Für gewöhnliche LAN-Hostaufgaben bleibt die Formel `−2`. Sonderfälle werden nicht ungefragt auf Standardaufgaben übertragen.

---

## 21. Binäre Kontrolle

Bei Unsicherheit:

1. interessantes Oktett binär schreiben;
2. Maskenbits anwenden;
3. Hostbits für das Netz auf `0`, für den Broadcast auf `1` setzen;
4. dezimal zurückrechnen.

`210 = 11010010`, `/27` im letzten Oktett: `11100000`.

```text
Netz:      11000000 = 192
Broadcast: 11011111 = 223
```

---

## 22. Vollständiger Praxisfall

Für Abteilung A werden 45 Hosts, für B 25 Hosts und für Infrastruktur 10 Hosts benötigt. Adressraum: `10.10.8.0/24`.

```text
A: 45 + 2 ≤ 64 → /26 → 10.10.8.0/26, Hosts .1–.62
B: 25 + 2 ≤ 32 → /27 → 10.10.8.64/27, Hosts .65–.94
I: 10 + 2 ≤ 16 → /28 → 10.10.8.96/28, Hosts .97–.110
```

Der nächste freie Block beginnt bei `.112`. Wird pro Netz eine Reserve verlangt, muss sie vor der Präfixwahl zum Hostbedarf addiert werden.

---

## 23. Prüfungsalgorithmus

1. Präfix und Maske notieren.
2. Interessantes Oktett bestimmen.
3. Blockgröße berechnen.
4. Untere Grenze finden, die die IP enthält.
5. Nächste Grenze minus eins ergibt den Broadcast.
6. Hostbereich und Hostanzahl berechnen.
7. Ausgangs-IP innerhalb des Bereichs kontrollieren.
8. Bei VLSM vom größten Bedarf aus zuweisen.

---

## 24. Typische Prüfungsformulierungen

> Bei einem Präfix `/27` bleiben fünf Hostbits; das Subnetz umfasst daher 32 Adressen und im klassischen LAN 30 nutzbare Hostadressen.

> Die beiden Hosts liegen in unterschiedlichen Subnetzen, da die Verknüpfung ihrer Adressen mit der `/26`-Maske unterschiedliche Netzadressen ergibt.

> Das Gateway ist ungültig, weil die Adresse außerhalb des lokalen Subnetzes des Clients liegt.

> Bei VLSM wird das größte Netz zuerst vergeben, damit große zusammenhängende Adressblöcke nicht durch kleine Zuweisungen fragmentiert werden.

---

## 25. Typische Prüfungsfallen

| Falle | Korrektur |
|---|---|
| gleiche erste drei Oktette bedeuten gleiches Netz | Präfix anwenden |
| Maske ist Netzadresse | Maskenwert und Adresse trennen |
| `2^Präfix` ergibt Blockgröße | `2^(32−Präfix)` |
| letzte IP ist immer Host | im klassischen Netz ist sie Broadcast |
| `.0` ist niemals Host | nur ein vollständig null gesetzter Hostanteil ist Netzadresse |
| Gateway ist immer `.1` | lediglich Konvention |
| der gesamte Bereich `172.x` ist privat | nur `172.16/12` |
| VLSM beginnt mit kleinem Netz | mit größtem Bedarf beginnen |

---

## 26. Selbsttest

1. Wie viele Bit hat eine IPv4-Adresse?
2. Was bedeutet `/20`?
3. Wandle `/26` in eine Maske um.
4. Wandle `255.255.255.240` in einen Präfix um.
5. Wie entsteht die Netzadresse binär?
6. Wie groß ist der Block bei `/27`?
7. Bestimme das Netz für `192.168.20.210/27`.
8. Bestimme dessen Broadcast.
9. Nenne den Hostbereich.
10. Wie viele nutzbare Hosts hat `/28`?
11. Berechne das Netz von `10.0.0.174/28`.
12. Warum ist `.176` im vorherigen Beispiel kein Broadcast?
13. Berechne das Netz von `10.20.77.130/20`.
14. Liegen `192.168.10.20/26` und `.70/26` im gleichen Netz?
15. Nenne die drei privaten Bereiche.
16. Ist `172.32.1.1` nach RFC 1918 privat?
17. Was bedeutet `169.254.0.0/16`?
18. Welcher minimale Präfix wird für 25 Hosts benötigt?
19. Welcher minimale Präfix wird für 60 Hosts benötigt?
20. In wie viele `/27`-Netze zerfällt ein `/24`?
21. Warum beginnt VLSM mit dem größten Netz?
22. Prüfe Gateway `.64` für `192.168.12.70/26`.
23. Wozu wird `/32` verwendet?
24. Wann ist `/31` ein Sonderfall?
25. Teile ein /24 für 100 und 50 Hosts auf.

<details>
<summary>Lösungen anzeigen</summary>

1. 32 Bit.
2. 20 Netzbits und 12 Hostbits.
3. `255.255.255.192`.
4. `/28`.
5. Durch bitweises AND zwischen IP und Maske.
6. 32.
7. `192.168.20.192/27`.
8. `192.168.20.223`.
9. `.193–.222`.
10. 14.
11. `10.0.0.160/28`.
12. `.175` ist Broadcast; `.176` ist die nächste Netzgrenze.
13. `10.20.64.0/20`, Broadcast `10.20.79.255`.
14. Nein: Netze `.0/26` und `.64/26`.
15. `10/8`, `172.16/12`, `192.168/16`.
16. Nein.
17. IPv4 Link-Local beziehungsweise APIPA.
18. `/27`.
19. `/26`.
20. In acht Subnetze.
21. Um große zusammenhängende Blöcke zu erhalten und Fragmentierung zu vermeiden.
22. Ungültig, weil dies die Netzadresse ist.
23. Für genau eine Adresse, beispielsweise eine Hostroute.
24. Auf einem geeigneten Point-to-Point-Link.
25. `x.x.x.0/25` und `x.x.x.128/26`; die konkreten Oktette folgen dem Ausgangsnetz.

</details>

---

## 27. Quellen und Abgleich

- [RFC 791 – Internet Protocol](https://datatracker.ietf.org/doc/html/rfc791)
- [RFC 4632 – Classless Inter-domain Routing](https://datatracker.ietf.org/doc/html/rfc4632)
- [RFC 1918 – Address Allocation for Private Internets](https://datatracker.ietf.org/doc/html/rfc1918)
- [RFC 3927 – IPv4 Link-Local Addresses](https://datatracker.ietf.org/doc/html/rfc3927)
- [RFC 5737 – IPv4 Address Blocks for Documentation](https://datatracker.ietf.org/doc/html/rfc5737)
- [RFC 3021 – 31-Bit Prefixes on IPv4 Point-to-Point Links](https://datatracker.ietf.org/doc/html/rfc3021)

Klassische Hostzahlen gelten für gewöhnliche LAN-Subnetze. Anforderungen an Reserve, Gateway, Netzgeräte und Sonderpräfixe müssen aus der Aufgabe gelesen werden.

---

## 28. Offene Prüfpunkte für den Unterricht

- Werden Binär- und Blockgrößenmethode beide verlangt?
- Sind Präfixe kleiner `/16` Bestandteil der Aufgaben?
- Welche Reserve wird bei einer geforderten Hostzahl erwartet?
- Wird VLSM vollständig geprüft oder nur gleich große Subnetze?
- Sollen `/31` und `/32` erwähnt oder in AP1 ignoriert werden?
- Welche Schreibweise für Rechenweg und Hostbereich verlangt die WBS?
