---
pruefung: AP1
thema: IPv4-Adressierung und Subnetting
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/03-ipv4-adressierung-und-subnetting-de.md
---

# AP1: IPv4-Adressierung und Subnetting

Subnetting определяет, какие адреса принадлежат одной сети, где находятся границы и сколько узлов можно разместить. Надёжный метод основан на Präfix и двоичной маске, а Blockgröße ускоряет типовые расчёты.

---

## 1. Lernziele

После изучения главы нужно уметь:

- переводить CIDR-Präfix в Subnetzmaske и обратно;
- определять Netzadresse, Broadcastadresse и Hostbereich;
- проверять, находятся ли два Hosts в одной подсети;
- выбирать минимальный Präfix по требуемому числу Hosts;
- планировать несколько подсетей методом VLSM;
- распознавать private, Link-Local, Loopback и Dokumentationsadressen;
- проверять допустимость Host- и Gateway-Adresse;
- объяснять расчёт полными немецкими предложениями.

---

## 2. Prüfungsminimum — 15 Minuten

### Формулы для типовой Host-Subnetz

```text
Adressanzahl = 2^(32 − Präfix)
nutzbare Hostadressen = 2^(32 − Präfix) − 2
Broadcast = Netzadresse + Blockgröße − 1
```

В обычной AP1-задаче Netzadresse и Broadcast не выдаются Hosts. `/31` и `/32` — специальные случаи, только если это явно требуется.

### Быстрая таблица

| Präfix | Maske | Block | nutzbare Hosts |
|---:|---|---:|---:|
| /24 | 255.255.255.0 | 256 | 254 |
| /25 | 255.255.255.128 | 128 | 126 |
| /26 | 255.255.255.192 | 64 | 62 |
| /27 | 255.255.255.224 | 32 | 30 |
| /28 | 255.255.255.240 | 16 | 14 |
| /29 | 255.255.255.248 | 8 | 6 |
| /30 | 255.255.255.252 | 4 | 2 |

### Алгоритм

```text
Präfix → Maske → interessantes Oktett → Blockgröße
→ Netzgrenze → Broadcast → Hostbereich → Kontrolle
```

> Die Adresse `192.168.20.210/27` liegt im Netz `192.168.20.192/27`; der Broadcast lautet `.223` und der nutzbare Hostbereich reicht von `.193` bis `.222`.

---

## 3. Aufbau einer IPv4-Adresse

IPv4 имеет `32 Bit`, разделённые для записи на четыре Oktette:

```text
11000000.10101000.00000001.00010100
192     .168     .1       .20
```

Präfix `/24` означает: первые 24 Bit относятся к Netzanteil, остальные восемь — к Hostanteil. Без Präfix или Maske адрес не определяет размер сети.

---

## 4. Subnetzmaske und CIDR

Subnetzmaske состоит из непрерывной последовательности единиц, затем нулей.

```text
/27
11111111.11111111.11111111.11100000
255      .255      .255      .224
```

Допустимые значения Oktett в корректной непрерывной Maske:

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

Например, `255.255.255.224 = /27`; `255.0.255.0` не является обычной CIDR-Maske.

---

## 5. Netzadresse через bitweises AND

Netzadresse получается операцией AND между IP и Maske:

```text
IP:     11001010 (202)
Maske:  11100000 (224)
AND:    11000000 (192)
```

Для `192.168.20.202/27` первые три Oktette полностью сетевые, в последнем получается `192`. Netzadresse: `192.168.20.192`.

Этот метод универсален и особенно полезен, если граница находится не в последнем Oktett.

---

## 6. Blockgröße

Для Oktett, где заканчивается Präfix:

```text
Blockgröße = 256 − Maskenwert
```

Для `/27`: `256 − 224 = 32`. Границы: `0, 32, 64, 96, 128, 160, 192, 224`.

Адрес `210` находится между `192` и `223`, значит сеть начинается с `.192`, следующая — с `.224`, Broadcast текущей — `.223`.

---

## 7. Netzadresse, Broadcast und Hostbereich

- `Netzadresse`: все Hostbits равны `0`.
- `Broadcastadresse`: все Hostbits равны `1`.
- `Hostbereich`: адреса между ними.

```text
Netz:       192.168.20.192/27
erster Host 192.168.20.193
letzter Host 192.168.20.222
Broadcast:  192.168.20.223
```

Broadcast доставляется всем IPv4-Hosts данного Broadcast-Domain и Router обычно не пересылает его в другие сети.

---

## 8. Anzahl der Adressen

При `/27` остаётся `32 − 27 = 5 Hostbits`:

```text
2^5 = 32 Adressen
32 − Netzadresse − Broadcast = 30 nutzbare Hostadressen
```

Нельзя вычислять `2^27`. Präfix показывает число Netzbits, а степень для размера блока — число оставшихся Bits.

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

`10.0.0.176` — Netzadresse следующей подсети, не Broadcast текущей.

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

Последний Oktett здесь целиком относится к Hostanteil; нельзя искать блок только по `130`.

---

## 12. Prüfung: gleiches Subnetz

Каждый Host применяет свою Maske к собственной и целевой Adresse.

```text
192.168.10.20/26 → Netz 192.168.10.0
192.168.10.70/26 → Netz 192.168.10.64
```

Они не в одной подсети, хотя первые три Oktette одинаковы. Для связи нужен Router и корректные Gateways.

Если Masks на узлах ошибочно различаются, один Host может считать цель локальной, а другой — удалённой, создавая асимметричную проблему.

---

## 13. Private IPv4-Bereiche

| Bereich | Bedeutung |
|---|---|
| `10.0.0.0/8` | private Nutzung |
| `172.16.0.0/12` | private Nutzung (`172.16`–`172.31`) |
| `192.168.0.0/16` | private Nutzung |

Private Adressen не маршрутизируются глобально как öffentliche Ziele. Для типичного Internetzugang используется NAT/PAT, но NAT не является частью определения private Adresse.

`172.32.0.0` уже не входит в `172.16.0.0/12`.

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

Документационные сети безопаснее для учебных примеров, чем реальные публичные адреса.

---

## 15. Minimales Subnetz nach Hostzahl

Для 25 Hosts:

```text
25 + 2 = 27 benötigte Adressen
nächste Zweierpotenz = 32 = 2^5
Hostbits = 5
Präfix = 32 − 5 = /27
Kapazität = 30 nutzbare Hosts
```

Для 60 Hosts: `60 + 2 = 62`, следующий блок `64`, значит `/26` с 62 nutzbaren Adressen.

Нужно учитывать Reserve, Gateway, Drucker и другие реально адресуемые Schnittstellen, если они входят в Anforderung.

---

## 16. Subnetze fester Größe

Исходная сеть `192.168.40.0/24` делится на четыре равных Subnetze.

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

1. Bedarfe inklusive Reserve erfassen.
2. Vom größten zum kleinsten Bedarf sortieren.
3. Für jeden Bedarf kleinsten passenden Block bestimmen.
4. Jeden Block an einer gültigen Grenze beginnen.
5. Überschneidung und freien Rest dokumentieren.

Большие сети сначала уменьшают риск фрагментации Adressraum.

---

## 18. VLSM-Beispiel

Aus `192.168.50.0/24` werden Netze für 100, 50, 20 und 10 Hosts geplant:

| Bedarf | Präfix | Zuweisung | nutzbarer Bereich |
|---:|---:|---|---|
| 100 | /25 | `192.168.50.0/25` | `.1–.126` |
| 50 | /26 | `192.168.50.128/26` | `.129–.190` |
| 20 | /27 | `192.168.50.192/27` | `.193–.222` |
| 10 | /28 | `192.168.50.224/28` | `.225–.238` |

`192.168.50.240/28` bleibt frei. Jede Zuweisung beginnt auf ihrer Blockgrenze.

---

## 19. Gateway-Adresse prüfen

Für Client `192.168.12.70/26` gilt Netz `192.168.12.64/26` und Hostbereich `.65–.126`.

- Gateway `.65` ist lokal und möglich.
- Gateway `.64` ist Netzadresse und unzulässig.
- Gateway `.127` ist Broadcast und unzulässig.
- Gateway `.1` liegt außerhalb des Clientnetzes und ist ohne Sondermechanismus nicht direkt erreichbar.

Gateway muss nicht immer erster oder letzter Host sein; das ist nur eine Konvention.

---

## 20. /31 und /32

- `/32` bezeichnet genau eine IPv4-Adresse, zum Beispiel eine Hostroute.
- `/31` kann auf geeigneten Point-to-Point-Links beide Adressen nutzen (RFC 3021), ohne klassische Netz-/Broadcastrolle.

Für gewöhnliche LAN-Hostaufgaben bleibt die Formel `−2`. Spezialfälle nicht ungefragt auf Standardaufgaben übertragen.

---

## 21. Binäre Kontrolle

Bei Unsicherheit:

1. interessantes Oktett binär schreiben;
2. Maskenbits anwenden;
3. Hostbits für Netz auf `0`, für Broadcast auf `1` setzen;
4. dezimal zurückrechnen.

`210 = 11010010`, `/27` в последнем Oktett: `11100000`.

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

Следующий свободный Block начинается с `.112`. Если нужна Reserve pro Netz, она должна быть добавлена к Hostbedarf до выбора Präfix.

---

## 23. Prüfungsalgorithmus

1. Präfix и Maske переписать.
2. Определить интересующее Oktett.
3. Вычислить Blockgröße.
4. Найти нижнюю границу, содержащую IP.
5. Следующая граница минус один = Broadcast.
6. Hostbereich и количество Hosts вычислить.
7. Проверить исходную IP внутри диапазона.
8. Для VLSM распределять от самого большого Bedarf.

---

## 24. Typische Prüfungsformulierungen

> Bei einem Präfix `/27` bleiben fünf Hostbits; das Subnetz umfasst daher 32 Adressen und im klassischen LAN 30 nutzbare Hostadressen.

> Die beiden Hosts liegen in unterschiedlichen Subnetzen, da die Verknüpfung ihrer Adressen mit der `/26`-Maske unterschiedliche Netzadressen ergibt.

> Das Gateway ist ungültig, weil die Adresse außerhalb des lokalen Subnetzes des Clients liegt.

> Bei VLSM wird das größte Netz zuerst vergeben, damit große zusammenhängende Adressblöcke nicht durch kleine Zuweisungen fragmentiert werden.

---

## 25. Typische Prüfungsfallen

| Ловушка | Исправление |
|---|---|
| gleiche erste drei Oktette = gleiches Netz | Präfix anwenden |
| Maske ist Netzadresse | различать Maskenwert и Adresse |
| `2^Präfix` для размера | `2^(32−Präfix)` |
| последняя IP — всегда Host | обычно Broadcast |
| `.0` никогда не Host | зависит от Präfix; только all-zero Hostteil = Netzadresse |
| Gateway всегда `.1` | только Konvention |
| весь `172.x` private | только `172.16/12` |
| VLSM выдавать с малого | начинать с большого |

---

## 26. Selbsttest

1. Сколько Bits имеет IPv4-Adresse?
2. Что означает `/20`?
3. Переведи `/26` в Maske.
4. Переведи `255.255.255.240` в Präfix.
5. Как получается Netzadresse бинарно?
6. Какова Blockgröße для `/27`?
7. Определи Netz для `192.168.20.210/27`.
8. Определи Broadcast этого Netz.
9. Назови Hostbereich.
10. Сколько nutzbare Hosts имеет `/28`?
11. Рассчитай Netz `10.0.0.174/28`.
12. Почему `.176` в предыдущем примере не Broadcast?
13. Рассчитай Netz `10.20.77.130/20`.
14. В одной ли сети `192.168.10.20/26` и `.70/26`?
15. Назови три private Bereiche.
16. Является ли `172.32.1.1` private по RFC 1918?
17. Что означает `169.254.0.0/16`?
18. Какой минимальный Präfix нужен для 25 Hosts?
19. Какой минимальный Präfix нужен для 60 Hosts?
20. На сколько `/24`-сеть делится при `/27`?
21. Почему VLSM начинают с большого Netz?
22. Проверь Gateway `.64` для `192.168.12.70/26`.
23. Для чего применяется `/32`?
24. Когда `/31` является специальным случаем?
25. Распредели /24 для 100 и 50 Hosts.

<details>
<summary>Lösungen anzeigen</summary>

1. 32 Bit.
2. 20 Netzbits, 12 Hostbits.
3. `255.255.255.192`.
4. `/28`.
5. Bitweises AND zwischen IP und Maske.
6. 32.
7. `192.168.20.192/27`.
8. `192.168.20.223`.
9. `.193–.222`.
10. 14.
11. `10.0.0.160/28`.
12. `.175` — Broadcast; `.176` — следующая Netzgrenze.
13. `10.20.64.0/20`, Broadcast `10.20.79.255`.
14. Нет: сети `.0/26` и `.64/26`.
15. `10/8`, `172.16/12`, `192.168/16`.
16. Нет.
17. IPv4 Link-Local/APIPA.
18. `/27`.
19. `/26`.
20. Восемь Subnetze.
21. Чтобы сохранить большие непрерывные Blöcke и избежать Fragmentierung.
22. Недопустим: это Netzadresse.
23. Для одной Adresse, например Hostroute.
24. На подходящем Point-to-Point-Link.
25. `x.x.x.0/25` и `x.x.x.128/26`; остальное зависит от исходного Präfix.

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
