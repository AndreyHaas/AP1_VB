---
pruefung: AP1
thema: Schnittstellen, Speicher, Peripherie und Barrierefreiheit
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/03-schnittstellen-speicher-peripherie-und-barrierefreiheit-de.md
---

# AP1: Schnittstellen, Speicher, Peripherie und Barrierefreiheit

Одинаковый разъём ещё не гарантирует одинаковые функции. Для надёжного IT-Arbeitsplatz нужно проверить всю цепочку: устройство, порт, кабель, протокол, питание, Treiber, Betriebssystem и Nutzungsanforderung. Кроме технической совместимости решение должно быть доступно для конкретной Zielgruppe.

Главная идея:

> Form, Signal, Protokoll und Funktion getrennt prüfen — затем подтвердить Gesamtfunktion тестом.

---

## 1. Lernziele

После изучения главы нужно уметь:

- различать Schnittstelle, Anschluss, Steckverbinder и Protokoll;
- проверять механическую, электрическую, логическую и программную совместимость;
- объяснять USB-A, USB-B, USB-C, Mini-/Micro-USB, Datenrate и USB Power Delivery без ложных обобщений;
- оценивать DisplayPort, HDMI, Adapter и Dockingstation;
- понимать роль PCIe-Lanes;
- различать SATA, PCIe, NVMe, M.2 и внешние Speicher;
- работать с decimal и binary Speichereinheiten;
- выбирать Ein- и Ausgabegeräte по задаче;
- учитывать Treiber, Betriebssystem, Ergonomie и Sicherheit;
- объяснять принципы POUR и важные WCAG-Kriterien;
- различать WCAG, BITV 2.0 и BFSG по роли и области применения;
- составлять проверяемые Abnahmekriterien;
- проводить функциональный и barrierearmen Test.

---

## 2. Prüfungsminimum — 15 Minuten

1. Steckverbinderform, Übertragungsstandard, Signal, Stromversorgung и Funktion проверяются отдельно.
2. USB-A/B/C — формы; из USB-C не следуют автоматически Datenrate, Video или Ladeleistung.
3. USB-Kette Host–Kabel–Dock/Hub–Endgerät ограничена слабейшим звеном.
4. USB PD требует совместимых Quelle, Verbraucher, Profil, Kabel; `P = U × I`.
5. HDMI/DisplayPort выбирают по Auflösung, Bildrate, Farbtiefe, Displayzahl, Richtung, Kabel.
6. SATA, PCIe, NVMe и M.2 не взаимозаменяемы; M.2 прежде всего Formfaktor.
7. `1 Byte = 8 bit`; MB/GB — dezimal, MiB/GiB — binär.
8. Peripherie/Oberfläche должны учитывать Zielgruppe, Ergonomie, Sicherheit, Treiber, Barrierefreiheit.

> Der USB-C-Anschluss genügt als Nachweis nicht, da Port, Kabel und Dock den geforderten DisplayPort Alt Mode und die notwendige PD-Leistung unterstützen müssen.

## 3. Prüfungsrahmen

Типичные задания:

- выбрать подходящий Anschluss;
- объяснить, почему Gerät не работает через внешне подходящий Port;
- проверить совместимость Dockingstation, Notebook и двух мониторов;
- сравнить Speicher по Kapazität и Geschwindigkeit;
- подобрать Peripheriegerät для пользователя;
- предложить Maßnahmen zur Barrierefreiheit;
- сформулировать Testfälle и Abnahmekriterien.

В AP1 решение должно соответствовать Kundenbedarf, быть настроено, протестировано и задокументировано. Поэтому назвать Port недостаточно — нужно доказать, что вся функция поддерживается.

---

## 4. Пять уровней Schnittstelle

| Ebene | Frage | Beispiel |
|---|---|---|
| mechanisch | подходит ли форма? | USB-C-Stecker входит в Buchse |
| elektrisch | поддерживаются ли питание и сигнал? | требуемые Spannung/Stromstärke |
| protokollarisch | говорят ли устройства на одном Standard? | USB-Daten, DisplayPort Alt Mode |
| softwareseitig | есть ли Treiber и OS-Unterstützung? | Docking-Treiber |
| funktional | выполняется ли конкретная задача? | два дисплея с нужным режимом |

В теме Hardware использовались четыре уровня Kompatibilität. Здесь добавляется явный функциональный уровень: даже технически установленное соединение может не выполнять требуемый Gesamtzweck.

---

## 5. Begriffstrennung

| Begriff | Bedeutung |
|---|---|
| Schnittstelle | определённая точка взаимодействия компонентов |
| Anschluss/Port | конкретное подключение на устройстве |
| Steckverbinder | механическая форма Stecker/Buchse |
| Signal/Übertragung | электрическая или оптическая передача |
| Protokoll | правила обмена данными |
| Dienst/Funktion | пользовательский результат |

Пример:

> USB-C описывает Steckverbinder. Через него могут, в зависимости от реализации, передаваться USB-Daten, питание и Display-Signale. Наличие Buchse не гарантирует все эти возможности.

---

## 6. Datenrate, Durchsatz и Latenz

`Bruttodatenrate` включает служебные данные кодирования и протокола.

`Nettodurchsatz` — полезные данные, реально переданные за время.

`Latenz` — задержка до передачи или ответа.

Всегда:

```text
Nutzdurchsatz ≤ Bruttodatenrate
```

На результат влияют:

- самая медленная часть цепочки;
- Protokoll-Overhead;
- контроллер и устройство;
- качество/длина кабеля;
- параллельная нагрузка;
- драйвер и ОС;
- тип данных.

---

## 7. Bit и Byte

```text
1 Byte = 8 bit
```

Сетевые скорости часто указываются в bit/s, Speichertransfers — в Byte/s.

Идеальное теоретическое преобразование:

```text
1 Gbit/s ÷ 8 = 0,125 GB/s = 125 MB/s
```

Реальный Nutzdurchsatz ниже из-за Overhead и ограничений системы.

Типичная ловушка: сравнить `1 Gbit/s` и `500 MB/s` как одинаковые единицы.

---

## 8. USB: имя версии и маркетинг

При USB нужно проверять:

- тип Steckverbinder;
- поддерживаемую Datenrate;
- направление/роль устройства;
- Power Delivery;
- Alternate Modes;
- кабель;
- Treiber и Betriebssystem.

Обозначения USB со временем менялись. Поэтому в задаче лучше опираться на явно указанную Datenrate и Funktion, а не угадывать по одному названию поколения.

---

## 9. USB-A и USB-C

`USB-A` и `USB-C` прежде всего описывают Bauform разъёма.

USB-C может поддерживать:

- USB-Daten с различной скоростью;
- Laden;
- USB Power Delivery;
- DisplayPort Alt Mode;
- Thunderbolt или USB4;
- только часть этих функций.

Вывод:

> USB-C ist kein Leistungsversprechen.

Нужно проверять документацию порта, устройства и кабеля.

### 8.1 USB-B, Mini-USB и Micro-USB

| Bauform | Erkennungsmerkmal | typischer früherer/aktueller Einsatz |
|---|---|---|
| USB-A | плоский прямоугольный, несимметричный | Host, PC, Hub, Ladegerät |
| USB-B | почти квадратный со скошенными углами | Drucker, Scanner, Messgerät |
| USB 3.x Type-B | Type-B с дополнительным блоком контактов | более быстрые Drucker/Speicher |
| Mini-B | маленький, похож на трапецию | старые Kameras и Geräte |
| Micro-B | очень плоский, несимметричный | старые Smartphones/Peripherie |
| USB 3.x Micro-B | широкий двойной блок | старые externe Festplatten |
| USB-C | маленький, симметричный | современные Daten-, Lade-, Displayverbindungen |

Буквы `A`, `B`, `C` описывают механическую Steckverbinderfamilie. USB 2.0, USB 3.2 и USB4 описывают technische Übertragungsstandards/Funktionen. Поэтому по форме нельзя определять Datenrate.

### 8.2 Datenraten sicher lesen

| explizite Angabe | theoretische Bruttodatenrate |
|---|---:|
| USB 2.0 High-Speed | 480 Mbit/s |
| USB 3.2 Gen 1 | 5 Gbit/s |
| USB 3.2 Gen 2 | 10 Gbit/s |
| USB 3.2 Gen 2×2 | 20 Gbit/s |
| USB4 | по реализации, например 20, 40 или 80 Gbit/s |

USB-Markennamen неоднократно менялись. На экзамене надёжно опираться на явную Rate вместе с Steckverbinder, Richtung, PD, Alt Mode и Kabelanforderung.

---

## 10. USB-Kette

Функция работает, только если её поддерживают все необходимые звенья:

```text
Host-Port → Kabel → Hub/Dock → Kabel → Endgerät
```

Общая возможность ограничена слабейшим звеном.

Пример:

- Notebook поддерживает Video через USB-C;
- Dock поддерживает два Displays;
- кабель передаёт только USB 2.0 и питание.

Результат: внешний вид соединения правильный, но Video может не работать.

---

## 11. USB Power Delivery

Для питания важны:

- поддержка USB PD обоими устройствами;
- профили Spannung/Strom;
- мощность источника;
- допустимая мощность кабеля;
- резерв для Dock и Peripherie.

Формула:

```text
P = U × I
```

Пример:

```text
20 V × 3 A = 60 W
```

Если Notebook под нагрузкой требует 65 W, а Dock отдаёт только 60 W, возможны медленная зарядка или разряд аккумулятора. Маркировка сертифицированных USB-C-Kabel может указывать 60 W или 240 W, но конкретная цепочка всё равно проверяется полностью.

---

## 12. HDMI и DisplayPort

Оба стандарта передают цифровое Bild и обычно Audio. При выборе проверяются:

- версия и возможности на обеих сторонах;
- Auflösung;
- Bildwiederholrate;
- Farbtiefe/Chroma при необходимости;
- число Displays;
- кабель и длина;
- Audio;
- Kopierschutz или Spezialfunktionen;
- поддержка Dock/GPU.

`4K` без частоты и Farbtiefe — неполное требование.

Пример Muss-Kriterium:

> Zwei externe Monitore müssen gleichzeitig mit 2 560 × 1 440 Pixeln bei 60 Hz betrieben werden.

### 11.1 Bildanschlüsse unterscheiden

| Anschluss | Signal | wichtige Besonderheit |
|---|---|---|
| DisplayPort | digital, Bild und Audio | Full-Size/Mini DP; MST/Daisy Chain только при поддержке |
| USB-C mit DP Alt Mode | DisplayPort-Signal через USB-C | явно проверить Alt Mode и Lanes/Funktionen |
| HDMI Type A | digital, Bild und Audio | распространён у Monitor, TV, Projektor |
| Mini-/Micro-HDMI | тот же Protokoll в меньшей форме | направление кабеля и механическая нагрузка |
| DVI-D | digital | ограничения Link/Variante, Audio не предполагать |
| DVI-I | digital и analog возможно | проверить Quelle, Adapter, Display |
| VGA | analog | больше помех, нет цифровой передачи изображения |

`DisplayPort Dual-Mode` с обозначением `DP++` может при подходящем источнике позволять пассивные Adapter к определённым HDMI-/DVI-Signale. Без этой функции или в другом направлении нужен aktiver Wandler.

### 11.2 Weitere typische Arbeitsplatzanschlüsse

| Anschluss | Zweck | Prüfpunkt |
|---|---|---|
| 8P8C, обычно RJ45 | Ethernet по Twisted Pair | Kategorie, Datenrate, PoE, Belegung |
| 3,5-mm-Klinke TRS/TRRS | analoges Audio, ggf. Mikrofon | Kontaktbelegung и Geräteart |
| TOSLINK | оптическое digitales Audio | поддерживаемый Audioformat |
| SD/microSD | сменный Flash-Speicher | Formfaktor, Kapazitäts-/Geschwindigkeitsklasse |
| eSATA | старое externe SATA-Verbindung | не предполагать общее питание |
| PS/2 | старая Tastatur/Maus | Hot-Plug не считать гарантированным |

---

## 13. Adapter: aktiv или passiv

`Passiver Adapter` меняет физическое соединение, когда источник уже может выдавать подходящий сигнал.

`Aktiver Adapter` преобразует сигнал с помощью электроники.

Проверяются:

- направление преобразования;
- поддерживаемая Auflösung/Frequenz;
- питание;
- Audio;
- Treiber;
- совместимость с источником.

Adapter A→B не обязательно работает как B→A.

---

## 14. Dockingstation

Dockingstation объединяет несколько функций, поэтому нужна матрица:

| Anforderung | Prüfpunkt |
|---|---|
| Notebook laden | PD-Leistung после собственного Verbrauch Dock |
| два Monitore | число, Auflösung, Hz, Alt Mode/Thunderbolt/DisplayLink |
| Netzwerk | Datenrate, MAC-Passthrough, Treiber |
| USB-Geräte | Portanzahl, Geschwindigkeit, Strom |
| Audio | Ein-/Ausgänge, Betriebssystem |
| Verwaltung | Firmwareupdates, Inventarisierung |
| Sicherheit | Herstellerupdates, разрешённые Treiber |

Test `«Dock wird erkannt»` недостаточен. Нужно тестировать каждый требуемый Dienst одновременно.

---

## 15. Thunderbolt и USB4

Эти технологии могут объединять Daten, Display, PCIe-Tunneling и питание, но конкретные возможности зависят от:

- поколения;
- Host;
- Kabel;
- Dock;
- Betriebssystem;
- сертификации и Herstellerfreigabe.

На экзамене безопаснее формулировать:

> Die geforderte Funktion wird anhand der Spezifikationen aller Komponenten geprüft; aus der USB-C-Bauform allein wird sie nicht abgeleitet.

---

## 16. PCI Express

PCIe — последовательная высокоскоростная Schnittstelle для GPU, Netzwerkadapter, NVMe и других устройств.

Параметры:

- Generation;
- число Lanes: x1, x4, x8, x16;
- физическая длина Slot;
- электрически подключённые Lanes;
- распределение Lanes между Slots и M.2;
- поддержка CPU/Chipsatz;
- пространство и охлаждение.

Устройство обычно может работать в совместимом режиме с меньшей скоростью, но конкретная Abwärtskompatibilität и Lane-Zuordnung проверяются по документации.

---

## 17. Lane-Sharing

На Mainboard ограниченное число PCIe-Lanes. Установка M.2-SSD может:

- отключить определённый SATA-Port;
- уменьшить Lanes другого Slot;
- изменить режим GPU;
- быть доступной только с конкретной CPU.

Это не видно по форме разъёма. Нужна Blockdiagram или таблица в Mainboard-Handbuch.

---

## 18. SATA, PCIe, NVMe и M.2

| Begriff | Kategorie |
|---|---|
| SATA | Schnittstelle/Übertragungsstandard для Laufwerke |
| PCIe | универсальная системная Hochgeschwindigkeitsschnittstelle |
| NVMe | Protokoll для Non-Volatile Memory, часто через PCIe |
| M.2 | Bauform/Steckverbinder для модулей |

Возможные Kombinationen:

- 2,5-Zoll-SATA-SSD;
- M.2-SATA-SSD;
- M.2-PCIe-NVMe-SSD;
- PCIe-Steckkarte с NVMe.

Следовательно, `M.2 schneller als SATA` — неточная фраза: M.2-накопитель сам может использовать SATA.

---

## 19. Interner и externer Speicher

Внешний накопитель оценивается по всей цепочке:

- внутренний тип носителя;
- мост USB/SATA/NVMe;
- порт и кабель;
- питание;
- Dateisystem;
- Betriebssystem;
- Verschlüsselung;
- Transport- и Verlustschutz.

Быстрый NVMe внутри дешёвого USB-Gehäuse может быть ограничен мостом или портом.

---

## 20. Decimal и binary Einheiten

Производители Speicher обычно используют десятичные единицы:

```text
1 kB = 1 000 Byte
1 MB = 1 000 000 Byte
1 GB = 1 000 000 000 Byte
```

Двоичные единицы:

```text
1 KiB = 1 024 Byte
1 MiB = 1 024 KiB
1 GiB = 1 024 MiB
```

Пример:

```text
500 000 000 000 Byte ÷ 1 073 741 824 Byte/GiB
≈ 465,66 GiB
```

Дополнительную разницу создают Dateisystem, Recoverybereiche и резерв производителя.

---

## 21. Speicherbedarf

Расчёт начинается с Datenarten:

```text
Gesamtbedarf =
Betriebssystem
+ Anwendungen
+ Nutzdaten
+ Wachstum
+ temporäre Daten
+ Reserve
```

Учебный пример:

| Anteil | Größe |
|---|---:|
| OS и Anwendungen | 120 GB |
| Projekte | 180 GB |
| VM-Images | 300 GB |
| lokale Datenkopien | 100 GB |
| **Zwischensumme** | **700 GB** |

С резервом 25 %:

```text
700 GB × 1,25 = 875 GB
```

Следующая подходящая номинальная Kapazität — например 1 TB. Backup не следует автоматически складывать на тот же физический Datenträger.

---

## 22. Dateisystem и Kompatibilität

Носитель может быть физически совместим, но непригоден из-за:

- неподдерживаемого Dateisystem;
- ограничений размера файла;
- Rechte- и Metadatenverlust;
- различий Groß-/Kleinschreibung;
- Verschlüsselung;
- fehlender Treiber.

Форматирование может удалить данные. Перед изменением проверяются Backup, Zielsystem, Rechte, Verschlüsselung и Abnahme.

---

## 23. Peripherie классификация

| Kategorie | Beispiele |
|---|---|
| Eingabe | Tastatur, Maus, Scanner, Mikrofon, Kamera |
| Ausgabe | Monitor, Drucker, Lautsprecher, Braillezeile |
| Ein- und Ausgabe | Touchscreen, Headset, Multifunktionsgerät |
| Kommunikation | Netzwerkadapter, Bluetooth-Adapter |
| Speicher | externe SSD, Kartenleser |

Классификация зависит от используемой функции. Touchscreen одновременно показывает данные и принимает ввод.

---

## 24. Auswahl von Peripheriegeräten

Критерии:

- Nutzungsszenario и Zielgruppe;
- качество Ein-/Ausgabe;
- Schnittstellen и Treiber;
- Betriebssystem;
- Ergonomie и Barrierefreiheit;
- Lautstärke и Energie;
- расходные материалы;
- Wartung и Support;
- Datenschutz и безопасность;
- TCO.

Пример: дешёвый Drucker может иметь высокую стоимость страницы и малый Wartungszyklus.

---

## 25. Drucker и Scanner

Для Drucker:

- технология Laser/Tinte;
- цвет или монохром;
- Seitenvolumen;
- Seitenkosten;
- Geschwindigkeit;
- Duplex;
- Netzwerk и Rechte;
- Verbrauchsmaterial;
- Datenschutz bei Speicher/Festplatte.

Для Scanner:

- Auflösung;
- Farbtiefe;
- Dokumenteneinzug;
- Duplex;
- OCR;
- Format и Geschwindigkeit;
- Zielsystem и Datenschutz.

Максимальный dpi-Wert без Dokumentart и Outputzweck не является достаточным критерием.

---

## 26. Audio, Video и Kommunikation

Для Headset/Webcam/Mikrofon:

- Sprachverständlichkeit;
- Richtcharakteristik и Umgebungsgeräusch;
- Auflösung/Bildrate;
- Lichtverhältnisse;
- Tragekomfort;
- Stummschaltung и sichtbare Statusanzeige;
- Schnittstelle/Treiber;
- Datenschutz.

Устройство должно тестироваться в используемом Konferenzsystem, а не только в OS-Gerätemanager.

---

## 27. Ergonomie и individuelle Anpassung

Важны:

- регулируемый Bildschirm;
- Skalierung и Schriftgröße;
- подходящие Tastatur и Zeigegerät;
- Positionierbarkeit;
- geringes Bedienmoment;
- Feedback для действий;
- возможность альтернативного ввода;
- совместимость с Hilfsmitteln.

`Ergonomisch` не является абсолютным свойством продукта: пригодность зависит от человека, задачи и среды.

---

## 28. Barrierefreiheit: цель

Barrierefreiheit означает, что люди с различными возможностями могут информацию и функции:

- wahrnehmen;
- bedienen;
- verstehen;
- zuverlässig nutzen.

Это не Sonderfunktion «после разработки», а Anforderung, которую нужно выявить, реализовать и тестировать.

Преимущества часто шире: ясные Fehlertexte, Tastaturbedienung и gute Kontraste помогают многим пользователям.

---

## 29. POUR

WCAG группирует требования по четырём принципам:

| Prinzip | Deutsch | Beispiel |
|---|---|---|
| Perceivable | wahrnehmbar | Textalternative, Untertitel, Kontrast |
| Operable | bedienbar | Tastatur, Fokus, genügend Zeit |
| Understandable | verständlich | klare Sprache, vorhersehbare Navigation |
| Robust | robust | korrekte Semantik, Assistenztechnik |

POUR — Denkrahmen, а не полный Testplan.

---

## 30. Wahrnehmbar

Возможные меры:

- Textalternativen для содержательных изображений;
- Untertitel/Transkript для Medien;
- достаточный Kontrast;
- содержание не кодируется только цветом;
- масштабирование и Reflow без потери функции;
- понятная Struktur заголовков;
- текст вместо изображения текста, где возможно.

Декоративное изображение должно быть скрыто от Assistenztechnik, а не получать бесполезное описание.

---

## 31. Bedienbar

Проверяется:

- все функции доступны с Tastatur;
- нет Tastaturfalle;
- порядок Fokus логичен;
- Fokus видим;
- интерактивные элементы имеют подходящую Zielgröße;
- Zeitbegrenzung управляется, если это требуется;
- отсутствуют опасные вспышки;
- Navigation и Sprunglinks помогают ориентироваться.

Тест Tab-Taste — полезен, но не заменяет полную проверку Tastaturbedienung.

---

## 32. Verständlich и robust

`Verständlich`:

- ясные Beschriftungen;
- последовательная Navigation;
- понятные инструкции;
- Fehler указывает причину и способ исправления;
- важные последствия подтверждаются.

`Robust`:

- semantisch правильные Elemente;
- доступные Name, Rolle и Zustand;
- Statusmeldungen передаются Assistenztechnik;
- нет критичных ошибок структуры;
- проверка с Screenreader.

Placeholder не заменяет постоянный Label поля.

---

## 33. Hardware-Hilfsmittel

В зависимости от индивидуальной потребности:

- Braillezeile;
- Großschrift- или kontrastreiche Tastatur;
- alternative Zeigegeräte/Trackball;
- Taster и Switch-Steuerung;
- Spracheingabe;
- Bildschirmvergrößerung;
- Hörunterstützung;
- höhen- и positionierbare Geräte;
- zusätzliche Eingabehilfen.

Выбор делается вместе с пользователем и тестируется в реальном Arbeitsablauf.

---

## 34. WCAG, BITV 2.0 и BFSG

| Regelwerk | Rolle | Typischer Bereich |
|---|---|---|
| WCAG 2.2 | международная technische Empfehlung | Webinhalte и digitale Oberflächen |
| BITV 2.0 | немецкое правовое регулирование | digitale Angebote öffentlicher Stellen des Bundes |
| BFSG | немецкий закон о доступности определённых продуктов/услуг | перечисленные Verbraucherprodukte и Dienstleistungen |

BFSG применяется с 28.06.2025 к определённым попадающим под закон продуктам и услугам, но не автоматически к каждому внутреннему Arbeitsplatz или любому сайту. BITV 2.0 также имеет определённую область применения.

Правильный подход:

1. определить продукт, услугу, Anbieter и Zielgruppe;
2. проверить применимые Rechtsgrundlagen;
3. затем выбрать технический Standard и Prüfverfahren.

Это учебное разграничение, а не Rechtsberatung.

---

## 35. Barrierefreiheit testen

Один automatischer Scanner недостаточен.

Комбинация:

- automatisierte Prüfungen;
- Tastaturtest;
- Zoom/Reflow;
- Kontrastprüfung;
- Screenreader-Test;
- проверка Formulare и Fehlermeldungen;
- тест с различными Eingabemethoden;
- по возможности Test с betroffenen Nutzerinnen und Nutzern.

Автоматизация хорошо находит некоторые формальные ошибки, но не оценивает полностью качество Alternativtext, логичность Reihenfolge или понятность.

---

## 36. Abnahmekriterien

Плохое требование:

> Die Anwendung ist barrierefrei.

Проверяемые примеры:

- все Funktionen сценария X выполняются только с Tastatur;
- Fokusindikator видим на каждом интерактивном Element;
- при 200 % Zoom информация и функции не теряются;
- Pflichtfelder имеют постоянный Label и текстовую Fehlermeldung;
- два QHD-Monitore одновременно работают при 60 Hz через указанную Dockingstation;
- Notebook заряжается через Dock при тестовой Vollast без Nettoentladung;
- внешний Speicher передаёт Testdatei, монтируется после Neustart и доступен утверждённой Benutzerrolle.

Abnahme фиксирует Testaufbau, ожидаемый результат и фактический результат.

---

## 37. Vollständiger Praxisfall

Для сотрудника нужны:

- Notebook;
- Dockingstation;
- два QHD-Monitore по 60 Hz;
- Gigabit-Ethernet;
- Headset, Tastatur и Trackball;
- зарядка через один USB-C-Anschluss;
- полная Tastaturbedienung Fachanwendung;
- увеличение до 200 %.

Порядок решения:

1. Собрать Muss-Kriterien.
2. Проверить, выводит ли Host-Port Display-Signal и поддерживает ли Dock-Technik.
3. Проверить одновременно два Display-Modi.
4. Сравнить PD-Leistung Dock с потребностью Notebook.
5. Проверить кабель по Daten/Video/Power.
6. Проверить Treiber/Firmware/OS.
7. Подключить Netzwerk и все USB-Geräte одновременно.
8. Провести Lasttest, Ladezustand и стабильность.
9. Проверить Tastatur, Fokus, Zoom/Reflow и Trackball.
10. Запротоколировать Soll/Ist, отклонения и Abnahme.

Entscheidungssatz:

> Die Dockingstation ist geeignet, wenn Host, Dock und Kabel die zwei geforderten QHD-Signale, Gigabit-Ethernet und die benötigte Ladeleistung gleichzeitig unterstützen. Die technische Freigabe erfolgt erst nach dem dokumentierten Gesamttest einschließlich Tastatur- und Vergrößerungsprüfung.

---

## 38. Fehleranalyse

Если периферия не работает:

1. Fehlerbild и ожидаемую Funktion точно описать.
2. Gerät, Port, Kabel и Richtung идентифицировать.
3. питание и физическое соединение проверить.
4. другой известный исправный Kabel/Port протестировать.
5. Spezifikationen всей цепочки сравнить.
6. Betriebssystem, Treiber, Firmware и Logs проверить.
7. функцию изолированно и затем в Gesamtlast протестировать.
8. результат документировать.

Один фактор изменяется за раз. Иначе причина остаётся неясной.

---

## 39. Typische Prüfungsfallen

| Falle | Korrektur |
|---|---|
| USB-C поддерживает всё | Port, Kabel и Gerät проверить отдельно |
| Version = Steckertyp | поколение/скорость и Bauform разделить |
| Gbit/s = GB/s | делить bit на 8, затем учитывать Overhead |
| 4K достаточно как требование | добавить Hz, число дисплеев и условия |
| Adapter работает в обе стороны | направление и активное преобразование |
| M.2 = NVMe | Bauform и протокол разделить |
| 500 GB = 500 GiB | decimal/binary различать |
| внешний NVMe всегда быстрый | вся Kette ограничивает |
| Gerät erkannt = готово | проверить реальный Dienst |
| автоматический Scan доказывает доступность | добавить ручные и Nutzer-Tests |
| BITV/BFSG применяются всегда | сначала область применения |
| Barrierefreiheit = только Kontrast | использовать POUR и конкретные Kriterien |

---

## 40. Selbsttest

1. Назови пять уровней Schnittstelle.
2. Чем Steckverbinder отличается от Protokoll?
3. Различи Bruttodatenrate, Nutzdurchsatz и Latenz.
4. Переведи 1 Gbit/s в теоретические MB/s.
5. Почему USB-C не гарантирует Video?
6. Какие звенья входят в USB-Kette?
7. Рассчитай мощность при 20 V и 3 A.
8. Что произойдёт при недостаточной PD-Leistung?
9. Какие параметры нужны кроме `4K`?
10. Чем активный Adapter отличается от пассивного?
11. Какие функции Dock тестируются одновременно?
12. Что означают PCIe x4 и x16?
13. Что такое Lane-Sharing?
14. Различи SATA, PCIe, NVMe и M.2.
15. Почему внешний NVMe может быть медленным?
16. Сколько GiB в 500 000 000 000 Byte?
17. Рассчитай Speicherbedarf из раздела 20.
18. Почему Dateisystem влияет на совместимость?
19. Назови три категории Peripherie.
20. Какие Folgekosten имеет Drucker?
21. Почему Webcam тестируют в Konferenzsystem?
22. Что означает POUR?
23. Назови три требования Wahrnehmbarkeit.
24. Назови четыре требования Bedienbarkeit.
25. Почему Placeholder не заменяет Label?
26. Назови три Hardware-Hilfsmittel.
27. Как различаются WCAG, BITV и BFSG?
28. Почему автоматический Scanner недостаточен?
29. Сформулируй Abnahmekriterium для двух мониторов.
30. Как системно искать ошибку Dockingstation?

<details>
<summary>Показать решения</summary>

1. Mechanisch, elektrisch, protokollarisch, softwareseitig, funktional.
2. Steckverbinder — физическая форма; Protokoll — правила обмена.
3. Общая сигнальная скорость; полезные данные/время; задержка.
4. Теоретически `1 000 Mbit/s ÷ 8 = 125 MB/s`.
5. Type-C описывает форму, а Video зависит от Alt Mode/Technik всей цепочки.
6. Host-Port, Kabel, Hub/Dock, weiteres Kabel, Endgerät.
7. `20 V × 3 A = 60 W`.
8. Медленная зарядка, отсутствие зарядки или разряд под нагрузкой.
9. Auflösung, Hz, Farbtiefe/Chroma, число Displays и конкретная Kette.
10. Активный преобразует сигнал электроникой; пассивный использует уже совместимый Signal.
11. Displays, Laden, Netzwerk, USB, Audio и управление под совместной нагрузкой.
12. Число используемых Daten-Lanes; физический Slot может иметь другое электрическое подключение.
13. Разделение ограниченных Lanes между Slots/Ports, иногда с отключением функции.
14. Speicherstandard; системная шина; Speicherprotokoll; Bauform/Stecker.
15. Его ограничивают USB-Bridge, Port, Kabel, питание, Treiber или Dateisystem.
16. Около `465,66 GiB`.
17. `700 GB × 1,25 = 875 GB`; выбрать подходящую номинальную Kapazität, например 1 TB.
18. ОС может не поддерживать его функции, Rechte или размер файла.
19. Eingabe, Ausgabe, Ein-/Ausgabe, Kommunikation, Speicher.
20. Toner/Tinte, Trommel, Papier, Wartung, Energie, Ausfall.
21. Требуются совместимость, качество, Rechte и Funktionen в реальном приложении.
22. Perceivable, Operable, Understandable, Robust.
23. Textalternativen, Untertitel, Kontrast, Reflow, информация не только цветом.
24. Tastatur, keine Falle, logischer/sichtbarer Fokus, genügend Zeit, sichere Animation.
25. Placeholder исчезает при вводе и часто имеет недостаточную semantische Zuordnung.
26. Braillezeile, Trackball, Spezialtastatur, Taster, Spracheingabe.
27. WCAG — technische Empfehlung; BITV 2.0 — федеральные öffentliche Stellen; BFSG — определённые Verbraucherprodukte/-dienste.
28. Он не понимает полностью смысл, порядок, удобство и реальное взаимодействие Assistenztechnik.
29. Например: `Beide Monitore zeigen gleichzeitig 2 560 × 1 440 Pixel bei 60 Hz ohne Bildaussetzer im 30-minütigen Lasttest.`
30. Ошибка → Kette → питание/кабель → Specs → Treiber/Firmware → изолированный тест → Gesamtlast → Dokumentation.

</details>

---

## 41. Quellen und Abgleich

- [§ 9 FIAusbV – Prüfungsbereich Teil 1](https://www.gesetze-im-internet.de/fiausbv/__9.html)
- [USB-IF – Cables and Connectors](https://www.usb.org/document-library/cables-and-connectors)
- [NVM Express – Specifications](https://nvmexpress.org/specifications/)
- [WCAG 2.2 – W3C Recommendation](https://www.w3.org/TR/WCAG22/)
- [BITV 2.0](https://www.gesetze-im-internet.de/bitv_2_0/)
- [BFSG](https://www.gesetze-im-internet.de/bfsg/)
- [Bundesfachstelle Barrierefreiheit – BFSG](https://www.bundesfachstelle-barrierefreiheit.de/DE/Barrierefreiheitsstaerkungsgesetz)

Правовые сведения проверены на 10.09.2026. Конкретная область применения зависит от продукта, услуги, Anbieter и Sachverhalt.

---

## 42. Offene Prüfpunkte für den Unterricht

- Какие USB-Bezeichnungen использует WBS?
- Требуется ли USB-PD-Rechnung?
- Насколько подробно рассматриваются HDMI/DisplayPort?
- Входит ли Thunderbolt/USB4?
- Нужно ли знать PCIe-Lanes и Lane-Sharing?
- Какие decimal/binary Umrechnungen ожидаются?
- Какие Drucker-/Scanner-Kennzahlen экзаменационно важны?
- Какой уровень WCAG должен быть известен?
- Ожидается ли знание BITV 2.0 и BFSG или только Maßnahmen?
- С какими Hilfsmitteln проводится Unterrichtstest?
- Какие Abnahmekriterien предпочитает WBS?
