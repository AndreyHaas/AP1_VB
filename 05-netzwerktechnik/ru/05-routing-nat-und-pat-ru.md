---
pruefung: AP1
thema: Routing, NAT und PAT
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/05-routing-nat-und-pat-de.md
---

# AP1: Routing, NAT und PAT

Routing выбирает путь к Zielnetz. NAT изменяет адреса, PAT дополнительно различает Verbindungen по Ports. Эти функции часто находятся на одном Gerät, но решают разные задачи и не заменяют Firewall, Verschlüsselung или DHCP.

---

## 1. Lernziele

После изучения главы нужно уметь:

- читать Routingtabelle и выбирать маршрут по Longest Prefix Match;
- различать direkt verbunden, statisch, dynamisch и Default Route;
- объяснять Next Hop, Interface и Metrik;
- отличать Routing от Forwarding;
- различать Source NAT, Destination NAT и PAT;
- читать NAT-/PAT-Zuordnung;
- объяснять Portweiterleitung и её Risiken;
- диагностировать Routing- и NAT-Fehler по Symptom.

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

Обычно в AP1 оба процесса кратко называют Routing. Для объяснения достаточно: Ziel-IP prüfen, besten Eintrag wählen, Next Hop/Interface bestimmen, neuen Frame senden.

---

## 4. Inhalt einer Routingtabelle

Typische Felder:

| Feld | Bedeutung |
|---|---|
| Zielnetz/Präfix | für welche Ziele der Eintrag gilt |
| Next Hop/Gateway | nächster Router |
| Interface | Ausgangsschnittstelle |
| Metrik/K | Kosten/Präferenz innerhalb eines Verfahrens |
| Quelle/Protokoll | connected, static, OSPF usw. |

Не каждая таблица показывает все поля одинаково. Интерпретировать следует по конкретному выводу.

---

## 5. Direkt verbundene Route

Wenn ein Routerinterface `192.168.10.1/24` besitzt und aktiv ist, kennt Router das Netz `192.168.10.0/24` als direkt verbunden.

Для передачи конечному Host Router определяет dessen MAC-Adresse через ARP (IPv4) или NDP (IPv6) и создаёт локальный Frame.

Direkt verbunden означает «доступно через собственный Link», а не «весь Dienst гарантированно работает».

---

## 6. Statische Route

Statische Route wird administrativ eingetragen:

```text
Zielnetz: 10.30.0.0/16
Next Hop: 192.168.1.2
```

Vorteile: nachvollziehbar, kein Routingprotokoll-Overhead. Nachteile: manueller Pflegeaufwand, geringe automatische Anpassung.

Подходит для небольших стабильных Topologien, Stub-Netze или gezielte резервные Wege.

---

## 7. Dynamisches Routing

Dynamische Routingprotokolle tauschen Erreichbarkeitsinformationen aus und reagieren auf Änderungen. Beispiele sind OSPF oder BGP; их глубокая конфигурация обычно выходит за базовый Umfang AP1.

Важно различать:

- Routingprotokoll lernt Wege;
- routed protocol (IPv4/IPv6) transportiert Nutzpakete;
- Metriken verschiedener Protokolle sind nicht zwangsläufig direkt vergleichbar.

---

## 8. Default Route

```text
IPv4: 0.0.0.0/0
IPv6: ::/0
```

Default Route подходит ко всем Zielen, но имеет самый короткий Präfix. Она используется только если нет более конкретной подходящей Route.

На Client Default Gateway обычно является источником Default Route.

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

Маленькая Metrik не делает Default Route сильнее более конкретного Präfix. Сначала Spezifität, затем Auswahl между равными Kandidaten.

---

## 10. Metrik und gleiche Präfixlänge

Если несколько маршрутов подходят с одинаковой Präfixlänge, Router использует Protokollpräferenz и/или Metrik согласно своей реализации.

Экзаменационная формулировка должна опираться на предоставленную Tabelle. Нельзя всегда утверждать «меньшая Metrik выигрывает», если сравниваются разные Routingquellen без заданных правил.

---

## 11. Next Hop und rekursive Auflösung

Next Hop сам должен быть достижим через direkt verbundene или другую Route. Router определяет выходной Interface и локальную Layer-2-Adresse следующего узла.

Неверный Next Hop может присутствовать в конфигурации, но не приводить к успешному Forwarding. Нужно проверять Route к Ziel и Erreichbarkeit des Next Hop.

---

## 12. TTL und Hop Limit

Jeder IPv4-Router reduziert die `TTL`, jeder IPv6-Router das `Hop Limit`. Bei null wird Paket verworfen und обычно отправляется ICMP-Fehlermeldung.

Это предотвращает бесконечное движение при Routing Loop. `traceroute`/`tracert` использует этот механизм для обнаружения промежуточных Hops.

TTL здесь не является DNS-TTL; одинаковая аббревиатура имеет разные контексты.

---

## 13. Kein passender Weg

Если ни spezifische Route, ни Default Route отсутствует, Router не может переслать Paket. Возможны:

- ICMP Destination Unreachable;
- Timeout, если Meldung фильтруется;
- локальная Fehlermeldung на Host.

Timeout сам по себе не доказывает, на каком Hop пропал Paket.

---

## 14. Rückweg

Связь требует маршрута в обе стороны. Hinweg может работать, а Rückweg идти неправильно или отсутствовать.

Asymmetrisches Routing не всегда ошибка, но stateful Firewall/NAT могут требовать, чтобы обратный трафик прошёл через то же zustandsführende Gerät.

При диагностике проверять Quell- и Zielnetz, обе Routingtabellen и Zustandsgeräte.

---

## 15. NAT-Grundidee

`Network Address Translation` verändert IP-Adressen beim Übergang через Übersetzungsgerät. Частый Internetfall:

```text
intern 10.0.0.25 → öffentliche Quelladresse 203.0.113.10
```

Gerät speichert eine Zuordnung, damit Antwortverkehr dem internen Endpunkt zugeordnet werden kann.

NAT spart öffentliche IPv4-Adressen und trennt Adressräume, ist aber keine Verschlüsselung und keine vollständige Sicherheitsrichtlinie.

---

## 16. Source NAT

Bei `Source NAT (SNAT)` wird die Quelladresse eines ausgehenden Pakets geändert.

```text
vorher: 10.0.0.25:53000 → 198.51.100.20:443
nachher: 203.0.113.10:40001 → 198.51.100.20:443
```

Ответ приходит на öffentliche Zuordnung и затем возвращается внутреннему Client.

`Masquerading` — форма SNAT, часто используемая при dynamischer öffentlicher Adresse; конкретные Produktbegriffe могут отличаться.

---

## 17. PAT/NAPT

`Port Address Translation` verändert zusätzlich Portnummern. Несколько внутренних Verbindungen могут использовать одну öffentliche IPv4-Adresse:

```text
10.0.0.25:53000 → 203.0.113.10:40001 → Server:443
10.0.0.26:53000 → 203.0.113.10:40002 → Server:443
```

Zuordnung enthält Protokoll und Endpunkte. TCP- и UDP-Zustände разделены.

PAT часто разговорно называют просто NAT; в точном ответе следует описать изменение Ports.

---

## 18. Destination NAT und Portweiterleitung

Bei `Destination NAT (DNAT)` wird die Zieladresse geändert. Portweiterleitung публикует внутренний Dienst:

```text
203.0.113.10:443 → 10.0.0.50:443
```

Внешний Client адресует öffentliche Adresse; NAT-Gerät переводит Ziel на внутренний Server.

Правило должно учитывать Transportprotokoll, Port, Zielhost и Firewallfreigabe. Публикация увеличивает Angriffsfläche.

---

## 19. Statisches NAT und dynamisches NAT

- `statisches NAT`: feste 1:1-Zuordnung.
- `dynamisches NAT`: Zuordnung aus einem Adresspool.
- `PAT`: viele interne Endpunkte teilen Adressen über Ports.

Термины у производителей могут различаться. В задаче важна реальная Transformation, а не только Label.

---

## 20. NAT-Tabelle lesen

| Innen lokal | Innen global | Außen | Protokoll |
|---|---|---|---|
| `10.0.0.25:53000` | `203.0.113.10:40001` | `198.51.100.20:443` | TCP |

Ответ `198.51.100.20:443 → 203.0.113.10:40001` сопоставляется и переводится в `→ 10.0.0.25:53000`.

Если состояние истекло, поздний ответ может быть отброшен. UDP требует Zeitlimits без TCP-Verbindungsende.

---

## 21. NAT und Protokolle

NAT verändert Headerfelder и должен корректировать соответствующие Prüfsummen. Протоколы, несущие IP/Port внутри Nutzdaten, могут требовать специальных Mechanismen и плохо сочетаться с NAT.

Ende-zu-Ende-Erreichbarkeit уменьшается: входящие Verbindungen требуют explizite Zuordnung или Traversal-Verfahren.

Это ещё одна причина не считать NAT чисто Security Feature.

---

## 22. Abgrenzung der Funktionen

| Funktion | Aufgabe |
|---|---|
| DHCP | Netzwerkkonfiguration vergeben |
| DNS | Namen/Records auflösen |
| Routing | Weg zwischen Netzen wählen |
| NAT/PAT | Adressen/Ports übersetzen |
| Firewall | Verkehr nach Regeln erlauben/blockieren |
| TLS/VPN | Datenübertragung kryptografisch schützen |

Одно Gerät может выполнять всё сразу, но при ответе функции не смешиваются.

---

## 23. NAT ist keine Firewall

Исходный PAT обычно не имеет Zuordnung для неожиданного входящего Pakets, но это не равнозначно полной Firewallpolicy.

Firewall может оценивать Richtung, Zustand, Adressen, Ports, Anwendung и Logging. NAT только переводит.

Нужно формулировать: безопасность обеспечивается Regeln, Härtung и ограничением экспозиции; NAT может косвенно влиять на Erreichbarkeit.

---

## 24. Portweiterleitung sicher planen

Перед публикацией:

1. доказать geschäftlichen Bedarf;
2. выбрать минимальный Zielport/Protokoll;
3. ограничить Quellnetze, если возможно;
4. использовать TLS/VPN и starke Authentisierung;
5. patchen/härten Dienst;
6. логировать и мониторить;
7. определить Verantwortliche и Ablaufdatum;
8. протестировать снаружи и изнутри.

`Any → Internal Admin Interface` без необходимости — плохой Design.

---

## 25. Vollständiger Routingfall

Tabelle:

| Ziel | Next Hop | Metrik |
|---|---|---:|
| `10.20.0.0/16` | `192.168.1.2` | 20 |
| `10.20.30.0/24` | `192.168.1.3` | 50 |
| `0.0.0.0/0` | `192.168.1.1` | 10 |

Für `10.20.30.44` wird `/24` über `.3` gewählt, obwohl его Metrik 50 больше. Spezifität `/24` имеет приоритет перед `/16` и `/0`.

Für `10.20.40.44` gilt `/16`; für `8.8.8.8` Default Route.

---

## 26. Vollständiger NAT-Fall

Client `10.10.1.25:51500` ruft `198.51.100.80:443` auf. Gateway hat öffentliche IP `203.0.113.5`.

```text
LAN: 10.10.1.25:51500 → 198.51.100.80:443
WAN: 203.0.113.5:42001 → 198.51.100.80:443
```

Antwort:

```text
198.51.100.80:443 → 203.0.113.5:42001
Translation → 10.10.1.25:51500
```

Если правило есть, но Internet не работает, отдельно проверять Route, DNS, Firewall, NAT-State и Provider. NAT не создаёт маршрут автоматически.

---

## 27. Diagnosefälle

### Nur entfernte Netze nicht erreichbar

Проверять Präfix, Default Gateway, Routingtabelle и Rückweg.

### Internet per IP erreichbar, intern veröffentlichter Dienst von außen nicht

Проверять öffentliche Adresse, DNAT-Regel, Firewall, Service Binding, Rückweg и Provider-Sperre.

### Einige Verbindungen funktionieren, neue nicht

Проверять NAT-State-Tabelle, Port-/Adresspool, Zeitlimits и Ressourcen.

### traceroute endet an einem Hop

Это Grenzbeobachtung, не автоматическое доказательство поломки именно этого Router: ICMP может фильтроваться, а дальнейший Weg отличаться.

---

## 28. Prüfungsalgorithmus

1. Ziel-IP и все passenden Präfixe определить.
2. Самый длинный Präfix выбрать.
3. При равной Länge использовать указанную Präferenz/Metrik.
4. Next Hop и Ausgangsinterface проверить.
5. Rückweg отдельно проверить.
6. Если NAT, записать Header vor/nach Translation.
7. Указать Richtung, Protokoll, Ports и Zustand.
8. Firewall и Dienst не считать доказанными NAT-Regel.

---

## 29. Typische Prüfungsformulierungen

> Die Route über `10.20.30.0/24` wird gewählt, da sie unter allen passenden Einträgen den längsten und damit spezifischsten Präfix besitzt.

> Die Default Route wird nur verwendet, wenn kein spezifischerer Eintrag zur Zieladresse passt.

> PAT ersetzt die private Quelladresse und den Quellport durch eine öffentliche Zuordnung, damit mehrere interne Verbindungen eine öffentliche IPv4-Adresse gemeinsam nutzen können.

> NAT verschlüsselt keine Nutzdaten und ersetzt keine Firewall, weil es lediglich Adress- und gegebenenfalls Portfelder übersetzt.

---

## 30. Typische Prüfungsfallen

| Ловушка | Исправление |
|---|---|
| kleinste Metrik всегда первая | сначала Longest Prefix Match |
| Default Route сильнее всего | она наименее spezifisch |
| Route доказывает Rückweg | обратный путь проверять отдельно |
| NAT выдаёт IP клиенту | это DHCP |
| NAT шифрует | нет |
| NAT заменяет Firewall | нет |
| Portweiterleitung только открывает Firewall | обычно DNAT плюс Freigabe |
| traceroute-Hop без ответа сломан | ICMP может фильтроваться |

---

## 31. Selbsttest

1. Различи Routing и Forwarding.
2. Назови четыре поля Routingtabelle.
3. Что означает direkt verbundene Route?
4. Назови Vorteil и Nachteil statischer Route.
5. Что делает dynamisches Routingprotokoll?
6. Как выглядит IPv4 Default Route?
7. Объясни Longest Prefix Match.
8. Что выбирается для `10.20.30.40` в таблице раздела 9?
9. Когда оценивается Metrik?
10. Что такое Next Hop?
11. Для чего IPv4-TTL?
12. Почему нужен Rückweg?
13. Что изменяет SNAT?
14. Что изменяет DNAT?
15. Что дополнительно делает PAT?
16. Как два Clients делят одну öffentliche IP?
17. Что такое Portweiterleitung?
18. Почему NAT-Tabelle имеет Zeitlimits?
19. Может ли NAT шифровать данные?
20. Различи NAT и Firewall.
21. Различи NAT и DHCP.
22. Какая Route выбирается: `/16` Metric 10 или `/24` Metric 50?
23. Назови четыре проверки внешней Portweiterleitung.
24. Почему traceroute-Timeout не доказывает точный Fehlerort?
25. Запиши PAT до/после для любого примера.

<details>
<summary>Lösungen anzeigen</summary>

1. Wege ermitteln/verwalten; konkretes Paket weiterleiten.
2. Zielpräfix, Next Hop, Interface, Metrik/Quelle.
3. Zielnetz liegt an eigenem aktiven Interface.
4. Einfach/kontrollierbar; manuelle Pflege/keine automatische Anpassung.
5. Tauscht Erreichbarkeitsinformationen aus und lernt Wege.
6. `0.0.0.0/0`.
7. Der längste passende Präfix ist der spezifischste und gewinnt.
8. `/24` über C.
9. Между равными passenden Präfixlängen согласно таблице/Protokollregeln.
10. Nächster Router auf dem Weg.
11. Ограничивает число Hops и предотвращает бесконечные Loops.
12. Ответ должен вернуться к Quelle; stateful Geräte должны видеть passenden Zustand.
13. Quell-IP, gegebenenfalls mit Portzuordnung.
14. Ziel-IP, gegebenenfalls Zielport.
15. Различает потоки через изменённые Portnummern.
16. Через отдельные PAT-Zuordnungen.
17. DNAT-Regel, die öffentliche Adresse/Port auf internen Dienst abbildet.
18. Чтобы удалять неактивные Zustände и освобождать Ressourcen/Ports.
19. Нет.
20. Übersetzung против Zugriffskontrolle.
21. Übersetzung против Vergabe von Netzkonfiguration.
22. `/24`, потому что spezifischer.
23. Adresse/DNS, DNAT, Firewall, Dienst/Binding, Rückweg, Provider.
24. ICMP может блокироваться и Weg ответа может отличаться.
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

Routing-Auswahl und NAT-Begriffe können herstellerspezifisch dargestellt werden. Для AP1 важно правильно показать Zielpräfix, Richtung и Transformation.

---

## 33. Offene Prüfpunkte für den Unterricht

- Требует ли WBS различать Routing и Forwarding терминологически?
- Какие виды statische/dynamische Route входят в Umfang?
- Как представлены Administrative Distance и Metrik в учебных Aufgaben?
- Нужно ли различать SNAT, DNAT, PAT и Masquerading?
- Рассматривается ли Carrier-Grade NAT?
- Какие поля NAT-Tabelle должны быть прочитаны на экзамене?
