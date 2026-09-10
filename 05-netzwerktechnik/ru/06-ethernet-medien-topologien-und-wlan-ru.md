---
pruefung: AP1
thema: Netzwerktechnik
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Russisch
gegenstueck: ../de/06-ethernet-medien-topologien-und-wlan-de.md
---

# Ethernet, среды передачи, топологии и WLAN

## 1. Lernziele

После этой главы ты сможешь:

- объяснять роль Ethernet, WLAN, MAC-Adresse, Switch и Access Point;
- выбирать медь, оптоволокно или радио по дальности, помехоустойчивости, стоимости и применению;
- сравнивать Stern-, Bus-, Ring- и Mesh-Topologie;
- различать Bruttodatenrate, Nettodurchsatz и Duplexbetrieb;
- планировать небольшой LAN/WLAN и системно искать ошибки;
- обосновывать выбор среды или защиты по-немецки.

## 2. Prüfungsminimum — 15 Minuten

1. Ethernet и WLAN в локальной сети относятся прежде всего к OSI-Layer 1 и 2.
2. Switch пересылает Frames по MAC-Adresstabelle.
3. Unicast адресован одному получателю, Broadcast — всем в Broadcast-Domäne.
4. Kupfer недорого и поддерживает PoE; LWL рассчитано на большие расстояния и не чувствительно к электромагнитным помехам.
5. Современный коммутируемый Ethernet-LAN обычно физически построен как Stern.
6. WLAN — общая радиосреда; дальность, помехи, занятость канала и безопасность влияют на Nutzleistung.
7. Bruttodatenrate не равна фактическому Nettodurchsatz.
8. Для предприятия индивидуальная аутентификация WPA2/WPA3-Enterprise с 802.1X предпочтительнее общего PSK.
9. MAC-Filter не является сильной Authentisierung.
10. Диагностика: сначала Link/Funk, затем VLAN/IP, после этого Dienste.

Musterantwort:

> Für die Verbindung zwischen zwei Gebäuden wird Lichtwellenleiter gewählt, weil er große Entfernungen unterstützt, gegen elektromagnetische Störungen unempfindlich ist und keine elektrische Potentialdifferenz überträgt.

## 3. Grundlagen

### 3.1 Ethernet-Frame и MAC-Adresse

Ethernet — семейство LAN-технологий IEEE 802.3. На Layer 2 данные передаются как `Frames`. Frame содержит, среди прочего, Ziel- и Quell-MAC-Adresse, Type-/Längeninformation, Nutzdaten и данные контроля ошибок.

MAC-Adresse обозначает Netzwerkschnittstelle внутри локальной Layer-2-области. Она не заменяет IP-Adresse: MAC используется для локальной доставки, IP — для связи через границы сетей.

### 3.2 Как Switch обучается

Switch читает Quell-MAC-Adresse входящего Frames и запоминает соответствующий Port.

| Ситуация | Реакция Switch |
|---|---|
| Ziel-MAC известен | пересылает только в изученный Port |
| Ziel-MAC неизвестен | Flooding во все подходящие Ports, кроме входного |
| Broadcast | Flooding внутри Broadcast-Domäne |
| Ziel изучен на входном Port | не пересылает в другие Ports |

Записи со временем устаревают. Поэтому Switch не является постоянным каталогом всех устройств.

### 3.3 Unicast, Broadcast и Multicast

- `Unicast`: один Sender — один Empfänger;
- `Broadcast`: один Sender — все участники Broadcast-Domäne;
- `Multicast`: один Sender — заинтересованная группа Empfänger.

Router обычно не пересылает Layer-2-Broadcast в другую сеть. VLAN разделяют одну Switch-Infrastruktur на отдельные Broadcast-Domänen.

### 3.4 Duplex и коллизии

При `Full Duplex` обе стороны могут одновременно отправлять и принимать. Современные Switch-Verbindungen обычно работают именно так; классических Ethernet-Kollisionen на них нет.

При `Half Duplex` стороны разделяют направление передачи во времени. Duplex-Mismatch может вызвать низкий Durchsatz и ошибки. Geschwindigkeit и Duplex обычно согласуются автоматически, но настройки обеих сторон должны совпадать.

## 4. Medien, Topologien und WLAN

### 4.1 Сравнение сред

| Критерий | Twisted-Pair-Kupfer | LWL | WLAN |
|---|---|---|---|
| сигнал | электрический | оптический | радио |
| сильная сторона | цена, простота, PoE | дальность, скорость, помехоустойчивость | мобильность, гибкая установка |
| ограничение | затухание и EM-помехи | цена монтажа/модулей | общая среда, помехи, экранирование |
| электрический потенциал | может иметь значение | galvanisch getrennt | провода между сторонами нет |
| применение | Arbeitsplatz, Access Point | Backbone, здания, Rechenzentrum | мобильные Clients |

Для классического Ethernet по структурированной медной кабельной системе часто планируют максимум 100 m на канал. Точная граница зависит от Ethernet-Verfahren, категории кабеля и стандарта. Для LWL должны совпадать тип волокна (`Multimode`/`Singlemode`), длина волны, Transceiver и Stecker.

### 4.2 PoE

`Power over Ethernet` передаёт данные и питание по одному кабелю, например к Access Point, VoIP-Telefon или Kamera. Проверяются:

- PoE-Standard и Leistungsklasse;
- потребление Endgerät;
- общий Leistungsbudget Switch;
- длина, качество кабеля и нагрев пучка.

Наличие RJ45 не доказывает совместимость по PoE-Leistung.

### 4.3 Топологии

| Topologie | Признак | Преимущество | Недостаток |
|---|---|---|---|
| Stern | Endgeräte у центрального Switch | удобно расширять и диагностировать | Switch — центральная точка отказа |
| Bus | общая линейная среда | исторически мало кабеля | трудно локализовать ошибки и коллизии |
| Ring | узлы соединены кольцом | определённый путь; возможна Redundanz | разрыв мешает без Schutzmechanismus |
| Mesh | несколько путей | высокая Ausfallsicherheit | цена и сложность планирования |

Physische и logische Topologie могут различаться. WLAN с центральным Access Point логически использует общую радиосреду, хотя сам AP подключён кабелем по звезде.

### 4.4 Основы WLAN

Access Point обычно соединяет WLAN-Clients с LAN как Layer-2-Bridge. Все Geräte на радиоканале делят Airtime. Поэтому высокая согласованная Datenrate не означает гарантированную Nutzdatenrate.

На Leistung влияют:

- расстояние, стены и металл;
- Störer и соседние WLAN;
- Kanalbreite и Kanalbelegung;
- число и активность Clients;
- возможности Client и Access Point;
- Protokoll-Overhead и повторные передачи.

`SSID` — имя сети, а не защита. Одинаковые SSID и Sicherheitsparameter помогают Roaming, но не гарантируют бесшовный переход.

### 4.5 WLAN-Sicherheit

| Verfahren | Оценка |
|---|---|
| WEP | устарел и небезопасен |
| WPA/TKIP | устарел |
| WPA2 с AES/CCMP | распространён; нужна безопасная конфигурация |
| WPA3-Personal с SAE | современнее для Personal-Netze |
| Enterprise с 802.1X/RADIUS | индивидуальные Identitäten и централизованная проверка |

Общий PSK прост для маленькой сети, но отдельного пользователя трудно отключить. WPS может создавать дополнительную Angriffsfläche. MAC-Adressen видимы и подделываются; MAC-Filter не заменяет Verschlüsselung и Authentisierung.

## 5. Anwendungsfall: новый офис

Предприятие оборудует 24 рабочих места, четыре Access Points и линию 300 m до Werkhalle.

### 5.1 Выбор

- Arbeitsplätze: структурированная медная разводка до Etagen-Switch;
- Access Points: подходящий медный кабель с PoE при достаточном Leistungsbudget;
- Werkhalle: LWL из-за расстояния, EM-помех и galvanische Trennung;
- WLAN: раздельные Mitarbeiter-/Gastzugänge, сильная Authentisierung, план каналов и покрытия.

### 5.2 Оценка Durchsatz

Access Point показывает `1.200 Mbit/s` Bruttodatenrate. Файл 600 MB передан за 12 s.

```text
600 MB × 8 = 4.800 Mbit
4.800 Mbit / 12 s = 400 Mbit/s Nettodurchsatz
Nutzungsgrad = 400 / 1.200 × 100 % = 33,3 %
```

Это не доказывает ошибку: Funkzugriff, Protokoll-Overhead, Gegenstelle и другие Clients снижают Nutzrate.

### 5.3 Последовательность диагностики

1. Проверить Link-LED, Kabel, Transceiver или WLAN-Assoziation.
2. Проверить Geschwindigkeit, Duplex, Signalstärke, Kanal и Fehlerzähler.
3. Проверить VLAN и IP-Konfiguration.
4. Проверить Gateway, DNS и достижимость Ziel.
5. Задокументировать результат вместе с Gegenstelle и ожидаемой Last.

## 6. Prüfungsformulierungen

> Ein Switch lernt die Zuordnung von MAC-Adressen zu Ports aus den Quelladressen eingehender Frames und leitet bekannte Unicasts dadurch gezielt weiter.

> Die physische Sternstruktur wird gewählt, weil einzelne Leitungsfehler normalerweise nur einen Arbeitsplatz betreffen und Fehler am zentralen Switch gut eingegrenzt werden können.

> WPA2/WPA3-Enterprise ist für Mitarbeiterkonten geeignet, da Benutzer individuell authentisiert und Zugänge einzeln gesperrt werden können.

> Die angegebene WLAN-Bruttodatenrate darf nicht als garantierter Nutzdurchsatz verwendet werden, weil Protokoll-Overhead, geteilte Airtime und Funkbedingungen die Nutzrate reduzieren.

## 7. Typische Prüfungsfallen

- Не смешивать MAC-Adresse и IP-Adresse.
- Switch делит Kollisionsdomänen, но без VLAN не обязательно Broadcast-Domänen.
- `1 Gbit/s` — не `1 GB/s`; в одном Byte восемь Bit.
- RJ45 не гарантирует Geschwindigkeit или PoE-Leistung.
- LWL не автоматически быстрее: конкретный стандарт задают Endgeräte и Transceiver.
- Сильный Signal не доказывает свободный Kanal.
- Большая Kanalbreite в плотной среде может ухудшить общий Durchsatz.
- MAC-Filter и скрытый SSID не заменяют WPA2/WPA3.
- Access Point не обязательно является Router, DHCP-Server и Firewall.
- Успешный Ping не доказывает Durchsatz приложения.

## 8. Selbsttest

1. Какова задача MAC-Adresse в Ethernet-LAN?
2. Что делает Switch при неизвестной Ziel-MAC?
3. Назови по два преимущества Kupfer и LWL.
4. Почему WLAN-Nettodurchsatz ниже Bruttodatenrate?
5. Выбери среду для 500 m между зданиями и обоснуй.
6. Одна сторона работает Full Duplex, другая Half Duplex. Каковы последствия?
7. 750 MB переданы за 20 s. Рассчитай Nettodurchsatz в Mbit/s.
8. Почему общий PSK неудобен для 200 сотрудников?
9. Составь короткую диагностику для «WLAN verbunden, Intranet nicht erreichbar».
10. Оцени: «MAC-Filter достаточно защищает WLAN».

<details>
<summary>Lösungen anzeigen</summary>

1. Для локальной доставки Frame к Netzwerkschnittstelle.
2. Выполняет Flooding во все подходящие Ports той же Broadcast-Domäne, кроме входного.
3. Kupfer: цена и PoE. LWL: дальность и EM-Störfestigkeit.
4. Из-за Protokoll-Overhead, общей Airtime, помех и Wiederholungen.
5. LWL: 500 m превышают типичную длину медного канала, а здания galvanisch getrennt.
6. Возможны ошибки и плохой Durchsatz; параметры сторон должны быть совместимы.
7. `750 MB × 8 / 20 s = 300 Mbit/s`.
8. Нет индивидуального отключения, сложна безопасная смена, ключ знает слишком много людей.
9. Assoziation/Signal → VLAN/IP → Gateway → DNS/Zieldienst → Firewall.
10. Неверно: MAC-Adresse видна и подделывается; нет сильной Authentisierung и Verschlüsselung.

</details>

## 9. Quellen und Abgleich

- [IEEE 802.3](https://standards.ieee.org/ieee/802.3/10422/) — семейство Ethernet; конкретный PHY нужно выбирать отдельно.
- [IEEE 802.11](https://standards.ieee.org/ieee/802.11/10548/) — базовый WLAN-стандарт; возможности продукта сверять с поддерживаемыми Amendments.
- [Wi-Fi Alliance: Security](https://www.wi-fi.org/discover-wi-fi/security) — классификация WPA2/WPA3.
- Сверено с материалом проекта по OSI, Datenweg и Übertragungszeiten; Stand 10.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Какие Ethernet-/WLAN-Geschwindigkeiten требует запоминать WBS-Aufgabensatz?
- Нужны ли PoE-Leistungsklassen или только принцип?
- Какой объём WLAN-Kanalplanung ожидается на экзамене?
