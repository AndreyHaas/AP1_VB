---
pruefung: AP1
thema: Netzwerkmodelle, Kapselung, TCP, UDP und Ports
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/01-netzwerkmodelle-kapselung-tcp-udp-und-ports-de.md
---

# AP1: Netzwerkmodelle, Kapselung, TCP, UDP und Ports

Сетевые модели разделяют обмен данными на задачи. Это помогает не только запоминать протоколы, но и локализовать ошибку: кабель, локальный Frame, IP-маршрут, Transportverbindung или Anwendung.

---

## 1. Lernziele

После изучения главы нужно уметь:

- сопоставлять семь уровней OSI с четырьмя уровнями TCP/IP;
- различать Bit, Frame, Paket, Segment, Datagramm и Anwendungsdaten;
- объяснять Kapselung и Entkapselung;
- различать MAC-Adresse, IP-Adresse и Portnummer;
- сравнивать TCP и UDP по свойствам и области применения;
- объяснять TCP-Verbindungsaufbau, подтверждение и повторную передачу;
- выбирать подходящий Transportprotokoll для практического случая;
- распознавать типичные сетевые ошибки по уровню.

---

## 2. Prüfungsminimum — 15 Minuten

### OSI-Kette

```text
7 Anwendung       HTTP, DNS, DHCP
6 Darstellung     Format, Codierung, Verschlüsselung
5 Sitzung         Sitzungssteuerung
4 Transport       TCP/UDP, Ports
3 Vermittlung     IPv4/IPv6, Routing, Paket
2 Sicherung       Ethernet/WLAN, MAC, Frame, Switch
1 Bitübertragung  Kabel, Funk, Signal, Bits
```

### Kapselung

```text
Daten → TCP-Segment/UDP-Datagramm → IP-Paket → Frame → Bits
```

### Адреса

```text
MAC-Adresse → локальная доставка на текущем участке
IP-Adresse  → доставка между сетями до конечного узла
Portnummer  → приложение или служба на узле
```

### TCP и UDP

| TCP | UDP |
|---|---|
| verbindungsorientiert | verbindungslos |
| подтверждает и упорядочивает | не гарантирует доставку и порядок |
| Wiederholung при потере | нет встроенной Wiederholung |
| больше служебных данных | малый Overhead |

> TCP wird verwendet, wenn eine vollständige und geordnete Übertragung wichtiger ist als minimale Verzögerung.

> UDP eignet sich, wenn geringe Latenz oder ein einfacher Nachrichtenaustausch wichtiger ist und die Anwendung Verluste toleriert oder selbst behandelt.

---

## 3. Зачем нужны Schichtenmodelle

Каждый уровень предоставляет услугу вышележащему и использует нижележащий. Модель даёт общий язык для Planung, Dokumentation и Fehlersuche.

Пример: если Link светится, но у клиента нет IP-Konfiguration, физический уровень, возможно, исправен, а проблема находится выше. Если `ping` проходит, но HTTPS нет, достижимость Layer 3 ещё не доказывает работу Layer 4–7.

Модель — это средство анализа. Реальные протоколы не всегда идеально укладываются в одну учебную ячейку.

---

## 4. OSI-Modell

| Layer | Название | Основная задача | Адрес/PDU | Примеры |
|---:|---|---|---|---|
| 7 | Anwendung | сетевые функции приложения | Daten | HTTP, DNS, DHCP, SMTP |
| 6 | Darstellung | формат, кодирование, преобразование | Daten | UTF-8, JSON, JPEG; TLS часто показывают здесь упрощённо |
| 5 | Sitzung | управление логическим сеансом | Daten | Sitzungssteuerung, RPC-Kontext |
| 4 | Transport | связь процессов end-to-end | Port; Segment/Datagramm | TCP, UDP |
| 3 | Vermittlung | логическая адресация и маршрутизация | IP; Paket | IPv4, IPv6, ICMP, Router |
| 2 | Sicherung | передача в локальном сегменте | MAC; Frame | Ethernet, WLAN, VLAN, Switch |
| 1 | Bitübertragung | сигнал и среда | Bits | Kupfer, LWL, Funk, Repeater |

В задании нужно использовать модель, указанную в условии. Не следует спорить о пограничном протоколе, если проверяется основная функция уровня.

---

## 5. TCP/IP-Modell

Практическая Internet-Protokollfamilie обычно представляется четырьмя слоями:

| TCP/IP-Schicht | Примерное соответствие OSI | Примеры |
|---|---|---|
| Anwendung | 7–5 | HTTP, DNS, DHCP, SMTP |
| Transport | 4 | TCP, UDP |
| Internet | 3 | IP, ICMP |
| Netzzugang | 2–1 | Ethernet, WLAN, физическая среда |

OSI удобна для детального анализа, TCP/IP — для реально применяемого Protokollstack. Это не две конкурирующие сети, а два способа описания.

---

## 6. Protokoll, Dienst и Schnittstelle

- `Protokoll` задаёт правила обмена сообщениями.
- `Dienst` — предоставляемая функция, например Namensauflösung.
- `Schnittstelle` связывает уровни или компоненты.

DNS является Anwendungsprotokoll и предоставляет Namensauflösung. Для передачи DNS-Nachricht использует UDP или TCP, а те используют IP.

---

## 7. Protocol Data Units

| Уровень | Типовое имя блока данных |
|---|---|
| Anwendung 7–5 | Daten/Nachricht |
| TCP | Segment |
| UDP | Datagramm |
| IP | Paket |
| Ethernet | Frame |
| Physical | Bits |

Термины в литературе иногда используются шире. В AP1 лучше показывать связь с конкретным уровнем.

---

## 8. Kapselung

При отправке каждый уровень добавляет управляющую информацию:

```text
HTTP-Daten
+ TCP-Header      = TCP-Segment
+ IP-Header       = IP-Paket
+ Ethernet-Header und Trailer = Ethernet-Frame
→ Übertragung als Bits
```

Header может содержать Ports, IP-Adressen, Protokollkennung, Prüfinformationen и другие поля. Trailer Ethernet содержит контроль целостности Frame на локальном участке.

---

## 9. Entkapselung

Получатель выполняет обратную операцию:

1. Netzwerkkarte принимает Bits и проверяет Frame.
2. Layer 2 передаёт содержащийся IP-Paket вверх.
3. IP проверяет Zieladresse и указанное Transportprotokoll.
4. TCP или UDP использует Zielport.
5. Операционная система передаёт Nutzdaten нужному Prozess.

Каждый уровень интерпретирует только релевантный ему Header.

---

## 10. Что меняется на пути

При прохождении Router старый Layer-2-Frame заканчивается. Router извлекает IP-Paket и создаёт новый Frame для следующего канала.

```text
MAC-Adressen  → меняются на каждом маршрутизируемом участке
IP-Adressen   → обычно end-to-end; NAT может изменить их
Ports         → обычно end-to-end; PAT может изменить Quellport
Nutzdaten     → не должны меняться обычным Router
```

---

## 11. MAC, IP и Port

| Идентификатор | Вопрос | Область |
|---|---|---|
| MAC-Adresse | Какому интерфейсу передать Frame на локальном Link? | Layer 2 |
| IP-Adresse | Какой узел/интерфейс является сетевой целью? | Layer 3 |
| Portnummer | Какому приложению передать данные? | Layer 4 |

Если Ziel-IP вне собственной подсети, Ziel-MAC первого Frame принадлежит Default Gateway, а не удалённому серверу.

---

## 12. Switch, Router и Access Point

- `Switch` обучается Source-MAC и пересылает Frames по Ziel-MAC внутри Layer-2-Netz.
- `Router` соединяет IP-Netze и выбирает маршрут по Ziel-IP.
- `Access Point` в основной роли соединяет WLAN-Clients с проводным LAN как Layer-2-Bridge.
- `Layer-3-Switch` дополнительно выполняет Routing; название устройства не отменяет анализ функции.

Hub/Repeater работает на Layer 1 и не принимает решение по MAC- или IP-Adresse.

---

## 13. ARP, NDP и ICMP

- `ARP` определяет MAC-Adresse по IPv4-Adresse внутри локального Broadcast-Domain.
- `NDP` выполняет Nachbarschaftsauflösung и дополнительные функции в IPv6 через ICMPv6.
- `ICMP` сообщает сетевые состояния и используется, например, командой `ping`; TCP/UDP-Port у ICMP нет.

ARP не ищет MAC-Adresse удалённого Webserver через Интернет. Клиент ищет MAC следующего локального Hop.

---

## 14. TCP: соединение и Byte Stream

TCP предоставляет приложению надёжный упорядоченный Bytestrom между двумя Endpunkten. Он не сохраняет границы сообщений приложения: один `send` не обязан соответствовать одному принятому Segment.

Для идентификации соединения важна комбинация:

```text
Quell-IP + Quellport + Ziel-IP + Zielport + Transportprotokoll
```

---

## 15. TCP Three-Way Handshake

```text
Client → SYN     → Server
Client ← SYN-ACK ← Server
Client → ACK     → Server
```

Handshake синхронизирует начальные Sequenznummern и подтверждает двустороннюю достижимость. Он не является TLS-Verschlüsselung и не проверяет личность пользователя.

---

## 16. Sequenznummer, ACK и Wiederholung

TCP нумерует байты, подтверждает полученное и может повторно передать неподтверждённые данные.

- `Sequenznummer` указывает позицию данных в потоке.
- `Acknowledgment` сообщает следующий ожидаемый байт.
- Prüfsumme помогает обнаружить повреждение.
- Empfänger может собрать данные в правильном порядке.

Надёжность означает механизм обнаружения/компенсации потерь, а не обещание бесконечной доставки: соединение может завершиться ошибкой.

---

## 17. Fluss- und Überlastungssteuerung

- `Flusssteuerung` защищает Empfänger от слишком быстрой отправки.
- `Überlastungssteuerung` уменьшает нагрузку при признаках перегрузки сети.

Для AP1 обычно достаточно объяснить, что TCP адаптирует передачу и создаёт больше Overhead/Verzögerung, чем простой UDP-Austausch.

---

## 18. UDP

UDP передаёт отдельные Datagramme без Verbindungsaufbau и без встроенной гарантии доставки, порядка или повторения.

Преимущества:

- малый Header и простой Ablauf;
- нет TCP-Handshake;
- подходит для Multicast и коротких запросов;
- потерянный поздний пакет можно не догонять в Echtzeit-Anwendung.

Приложение может само добавлять Quittierung, Reihenfolge или Wiederholung. Поэтому `UDP` не означает автоматически `unzuverlässige Anwendung`.

---

## 19. Выбор TCP или UDP

| Требование | Подход |
|---|---|
| файл должен прийти полностью | TCP |
| SSH-Sitzung и точный поток команд | TCP |
| короткий DNS-Standardfall | обычно UDP; TCP тоже предусмотрен |
| Live-Audio с приоритетом актуальности | часто UDP |
| HTTP/1.1 или HTTP/2 | TCP |
| HTTP/3 | QUIC поверх UDP |

Выбор объясняется требованиями, а не правилом «TCP хороший, UDP плохой».

---

## 20. Portnummern

Port — 16-битное число от `0` до `65535`. IANA делит диапазон на:

| Диапазон | Название |
|---:|---|
| 0–1023 | System/Well-Known Ports |
| 1024–49151 | User/Registered Ports |
| 49152–65535 | Dynamic/Private Ports |

Конкретная ОС может выбирать temporäre Clientports по своим правилам. Нельзя утверждать, что каждый Clientport обязательно находится только в одном учебном диапазоне, не проверив систему.

---

## 21. Важные Dienste и Ports

| Dienst | Port/Transport | Назначение |
|---|---|---|
| SSH | 22/TCP | защищённое удалённое управление |
| DNS | 53/UDP и TCP | Namensauflösung |
| DHCPv4 | 67/UDP Server, 68/UDP Client | IPv4-Konfiguration |
| HTTP | 80/TCP | Web без TLS |
| HTTPS | 443/TCP; HTTP/3 также 443/UDP | Web с TLS |
| NTP | 123/UDP | Zeitsynchronisation |
| IMAP/IMAPS | 143/993 TCP | Mailzugriff |
| SMTP Submission | 587/TCP | отправка почты клиентом |
| LDAP/LDAPS | 389/636 TCP | Verzeichnisdienst |
| SMB | 445/TCP | Datei-/Druckfreigaben |
| RDP | 3389/TCP/UDP | Remote Desktop |

Открытый Port лишь показывает, что кто-то принимает соединение/Datagramme. Он не доказывает корректность или безопасность ожидаемого Dienst.

---

## 22. Mehrere Verbindungen к одному Serverport

Webserver может обслуживать множество клиентов на `443`, потому что соединения различаются по Endpunkten.

```text
192.168.10.11:53001 → 203.0.113.20:443/TCP
192.168.10.12:53001 → 203.0.113.20:443/TCP
192.168.10.11:53002 → 203.0.113.20:443/TCP
```

Одинаковый Port на разных IP или разный Quellport создают разные потоки.

---

## 23. HTTP-Statuscode не является сетевым Port

Port `443` идентифицирует Endpunkt HTTPS. HTTP-Statuscode — ответ Anwendungsprotokoll после успешной транспортной и TLS-коммуникации.

| Code | Значение |
|---:|---|
| 200 | запрос успешно обработан |
| 201 | ресурс создан |
| 400 | некорректный запрос |
| 401 | действительная Authentifizierung отсутствует |
| 403 | запрос распознан, но доступ запрещён |
| 404 | ресурс не найден |
| 500 | внутренняя ошибка сервера |
| 502 | Gateway получил непригодный ответ Backend |
| 503 | Dienst временно недоступен |
| 504 | Gateway не дождался Backend |

---

## 24. Полный Praxisfall

У клиента Link активен. `ping` до Gateway успешен, `ping` до IP Webserver успешен, но `curl https://server.example` получает `Connection refused`.

Анализ:

1. Layer 1/2 функционируют достаточно для локальной передачи.
2. IP-Routing до сервера работает.
3. DNS нужно проверить отдельно, если использовалось имя.
4. `Connection refused` обычно означает, что Zielhost достижим, но TCP-Port не слушается либо активно отклоняется.
5. Нужно проверить Dienststatus, Binding, Zielport и Firewall.

Вывод «Netzwerk kaputt» слишком общий.

---

## 25. Prüfungsalgorithmus

1. Определи требуемую Funktion.
2. Назови Schicht и Protokoll.
3. Укажи PDU и релевантный адрес.
4. Для Transport выбери TCP/UDP и обоснуй требованием.
5. Для удалённой цели отличи Ziel-MAC следующего Hop от Ziel-IP конечного узла.
6. Проверь, что результат нижнего уровня не используется как доказательство верхнего.

---

## 26. Typische Prüfungsformulierungen

> Ein Switch leitet Frames innerhalb eines lokalen Netzes anhand von MAC-Adressen weiter, während ein Router Pakete anhand von IP-Netzen zwischen Netzen vermittelt.

> Beim Senden werden die Anwendungsdaten schrittweise um Transport-, IP- und Sicherungsinformationen ergänzt; dieser Vorgang heißt Kapselung.

> TCP ist hier geeignet, da die Datei vollständig und in der richtigen Reihenfolge ankommen muss.

> Ein erfolgreicher Ping weist IP-Erreichbarkeit nach, aber nicht, dass der benötigte TCP-Port und der Anwendungsdienst funktionieren.

---

## 27. Typische Prüfungsfallen

| Ловушка | Исправление |
|---|---|
| Switch всегда Layer 2, название решает всё | анализировать фактическую функцию; Layer-3-Switch маршрутизирует |
| DNS относится к Transport | DNS — Anwendung, использует TCP/UDP |
| Port 443 относится к Layer 7 | Port — Layer 4; HTTPS — Anwendung |
| ping использует Port | ICMP не использует TCP/UDP-Port |
| TCP гарантирует успех | TCP обнаруживает/компенсирует, но может завершиться ошибкой |
| UDP всегда быстрее | зависит от Anwendung, сети и реализации |
| MAC удалённого сервера нужен клиенту | нужен MAC локального Next Hop |
| TLS всегда Layer 6 | это допустимое учебное упрощение, реальные границы сложнее |

---

## 28. Selbsttest

1. Назови уровни OSI снизу вверх.
2. Сопоставь четыре слоя TCP/IP с OSI.
3. Какая PDU соответствует Ethernet?
4. Что добавляется при Kapselung?
5. Что происходит с Layer-2-Header на Router?
6. Какую задачу решает MAC-Adresse?
7. Какую задачу решает IP-Adresse?
8. Какую задачу решает Portnummer?
9. На каком Layer обычно работает Switch?
10. Почему `ping` не проверяет HTTPS?
11. Опиши TCP Three-Way Handshake.
12. Для чего нужны Sequenznummern и ACK?
13. Сохраняет ли TCP границы сообщений приложения?
14. Какие гарантии не предоставляет UDP?
15. Почему Live-Audio часто использует UDP?
16. Какой Transport обычно использует SSH?
17. Может ли DNS использовать TCP?
18. Какие Ports использует DHCPv4?
19. Чем различаются Serverport и temporärer Clientport?
20. Почему несколько клиентов могут использовать Serverport 443 одновременно?
21. К какому Layer относится ICMP?
22. Что ищет ARP для удалённой цели?
23. Выбери TCP или UDP для передачи резервной копии и обоснуй.
24. Определи уровень проблемы: Link отсутствует.
25. Определи уровень проблемы: IP доступен, TCP 443 закрыт.

<details>
<summary>Lösungen anzeigen</summary>

1. Bitübertragung, Sicherung, Vermittlung, Transport, Sitzung, Darstellung, Anwendung.
2. Netzzugang = OSI 1–2; Internet = 3; Transport = 4; Anwendung = 5–7.
3. Frame.
4. Управляющие Header и на Layer 2 также Trailer.
5. Старый Frame удаляется, для следующего Link создаётся новый.
6. Локальную доставку Frame интерфейсу.
7. Логическую end-to-end-адресацию и Routing.
8. Передачу данных нужному Prozess/Dienst.
9. Layer 2.
10. Ping использует ICMP и не проверяет TCP, TLS и HTTP.
11. SYN, SYN-ACK, ACK.
12. Порядок байтов, подтверждение и обнаружение необходимости Wiederholung.
13. Нет, TCP предоставляет Bytestrom.
14. Встроенной гарантии доставки, порядка, защиты от дублирования и Wiederholung.
15. Актуальность и низкая задержка могут быть важнее поздней повторной передачи.
16. TCP.
17. Да, DNS использует UDP и TCP.
18. 67/UDP Server и 68/UDP Client.
19. Serverport обозначает ожидающий Dienst; Clientport различает исходящий Endpunkt.
20. Соединения имеют разные комбинации IP/Ports.
21. Layer 3.
22. MAC-Adresse локального Next Hop, обычно Gateway.
23. TCP, так как требуется полная и упорядоченная передача.
24. Сначала Layer 1, затем локальный Layer 2.
25. Layer 3 работает; проверять Layer 4 и Dienst/Firewall выше.

</details>

---

## 29. Quellen und Abgleich

- [RFC 1122 – Requirements for Internet Hosts](https://datatracker.ietf.org/doc/html/rfc1122)
- [RFC 8200 – Internet Protocol, Version 6](https://datatracker.ietf.org/doc/html/rfc8200)
- [RFC 9293 – Transmission Control Protocol](https://datatracker.ietf.org/doc/html/rfc9293)
- [RFC 768 – User Datagram Protocol](https://datatracker.ietf.org/doc/html/rfc768)
- [IANA – Service Name and Transport Protocol Port Number Registry](https://www.iana.org/assignments/service-names-port-numbers/)

OSI-Zuordnungen oberhalb der Transportschicht sind didaktische Modelle. В задании приоритет имеет указанная модель. Portliste — ориентир, а не доказательство реально запущенной службы.

---

## 30. Offene Prüfpunkte für den Unterricht

- Требует ли WBS точного запоминания всех семи PDU-Bezeichnungen?
- Какой вариант TCP/IP-Modell используется: четыре или пять слоёв?
- Какие Ports обязательны для запоминания?
- Нужно ли детально разбирать TCP-Flags кроме SYN и ACK?
- Рассматривается ли HTTP/3/QUIC в актуальном Umfang AP1?
- Как WBS относит TLS и ARP к OSI-Schichten в своих заданиях?
