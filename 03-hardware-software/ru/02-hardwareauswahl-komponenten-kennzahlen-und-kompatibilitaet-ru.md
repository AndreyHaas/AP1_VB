---
pruefung: AP1
thema: Hardwareauswahl, Komponenten, Kennzahlen und Kompatibilität
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/02-hardwareauswahl-komponenten-kennzahlen-und-kompatibilitaet-de.md
---

# AP1: Hardwareauswahl, Komponenten, Kennzahlen und Kompatibilität

Правильный выбор Hardware начинается не с модели процессора, а с `Kundenbedarf` и реальной `Arbeitslast`. Экзаменационно сильный ответ связывает каждую характеристику с задачей, проверяет совместимость всей системы и учитывает стоимость, безопасность, поддержку и жизненный цикл.

Главный принцип:

> Nicht die höchste Kennzahl gewinnt, sondern die nachweislich geeignete Gesamtlösung.

---

## 1. Lernziele

После изучения главы нужно уметь:

- выводить Hardware-Anforderungen из Einsatzszenario;
- различать Muss-, Soll- и Kann-Kriterien;
- объяснять назначение CPU, RAM, Massenspeicher, GPU, Mainboard, Netzteil и Netzwerkadapter;
- оценивать Kennzahlen без ложных выводов по одной цифре;
- различать Kapazität, Latenz, Datendurchsatz и IOPS;
- объяснять различие между SATA, NVMe, PCIe и M.2;
- определять возможный Engpass;
- проверять механическую, электрическую, логическую и программную совместимость;
- учитывать Betriebssystem, Treiber, Firmware и Sicherheitsfunktionen;
- рассчитывать ориентировочную потребность в RAM и Speicher;
- сравнивать Desktop, Notebook, Workstation и Thin Client;
- обосновывать решение с позиции Nutzen, TCO, Support и Nachhaltigkeit.

---

## 2. Prüfungsrahmen

Типичная ситуация AP1:

1. описана работа пользователя;
2. даны несколько конфигураций или Komponenten;
3. нужно выбрать, сравнить или обосновать;
4. возможна проверка Kompatibilität;
5. решение должно учитывать не только цену.

§ 9 FIAusbV требует выбирать и закупать Hardware и Software с учётом Kundenbedarf, Wirtschaftlichkeit и Qualität. Ausbildungsrahmenplan требует оценивать IT-Systeme по Leistungsfähigkeit, Wirtschaftlichkeit и Einsatzgebiet, а также сравнивать technische Spezifikationen.

Поэтому ответ `«процессор B лучше, потому что у него больше GHz»` недостаточен.

---

## 3. От Bedarf к Spezifikation

Сначала задаются вопросы:

- Какие Anwendungen используются?
- Сколько приложений работают одновременно?
- Есть ли virtuelle Maschinen, Container, lokale Datenbanken или Build-Prozesse?
- Каков размер и тип данных?
- Нужны ли 3D, Video, KI-Modelle или только офисная графика?
- Сколько мониторов, какое разрешение и частота?
- Система стационарная или мобильная?
- Какие Schnittstellen и сеть уже используются?
- Каковы требования к Sicherheit, Verfügbarkeit и Support?
- Как долго планируется использовать устройство?

Затем требования формулируются проверяемо:

> Das Gerät muss zwei virtuelle Maschinen mit jeweils 6 GB RAM parallel zur Entwicklungsumgebung und Datenbank ausführen können, ohne dass das Betriebssystem dauerhaft auf den Massenspeicher auslagert.

---

## 4. Muss, Soll и Kann

| Kategorie | Bedeutung | Beispiel |
|---|---|---|
| Muss | без этого решение неприемлемо | TPM 2.0 для выбранной ОС |
| Soll | важно, но допустимо обоснованное отклонение | гарантия 36 месяцев |
| Kann | дополнительная ценность | встроенный Kartenleser |

Сначала проверяются все Muss-Kriterien. Только допустимые варианты сравниваются по цене и Nutzwert.

Типичная ошибка:

> Самый дешёвый вариант не является экономичным, если он не выполняет Muss-Kriterium.

---

## 5. Übersicht der Komponenten

| Komponente | Hauptaufgabe | Typische Auswahlfragen |
|---|---|---|
| CPU | выполняет инструкции | Workload, Kerne, Single-/Multi-Thread, Plattform |
| RAM | хранит активно используемые данные | Kapazität, Generation, Takt, ECC |
| Massenspeicher | долговременно хранит данные | Kapazität, Latenz, Durchsatz, Haltbarkeit |
| GPU | обрабатывает графику и параллельные вычисления | iGPU/dGPU, VRAM, Softwareunterstützung |
| Mainboard | соединяет компоненты | Sockel, Chipsatz, Slots, Anschlüsse, Firmware |
| Netzteil | преобразует и подаёт питание | Leistung, Anschlüsse, Effizienz, Reserve |
| Kühlung | отводит тепло | TDP/Last, Lautstärke, Gehäuse |
| Netzwerkadapter | сетевое соединение | Ethernet/WLAN, Geschwindigkeit, Standards |
| Peripherie | ввод, вывод, взаимодействие | Aufgabe, Ergonomie, Barrierefreiheit |

Компоненты образуют систему. Сильная CPU не компенсирует постоянную нехватку RAM или медленный Massenspeicher.

---

## 6. CPU: что действительно сравнивается

Важные параметры:

- Anzahl der Kerne;
- Anzahl der Threads;
- Taktfrequenz;
- Architektur и IPC;
- Cache;
- поддерживаемые Befehlssätze;
- Leistungsaufnahme и thermische Grenzen;
- интегрированная Grafik;
- Plattform, Sockel и поддержка RAM;
- реальные Benchmarks в подходящем Workload.

`Taktfrequenz` показывает количество тактов в секунду, но не количество полезной работы за такт. Поэтому CPU разных архитектур нельзя надёжно сравнить только по GHz.

---

## 7. Single-Thread и Multi-Thread

Некоторые операции зависят прежде всего от скорости одного потока:

- часть пользовательского интерфейса;
- последовательный Abschnitt программы;
- отдельные старые Anwendungen.

Другие хорошо распараллеливаются:

- несколько виртуальных машин;
- параллельная компиляция;
- Rendering или Encoding;
- множество одновременных Dienste.

Закон Амдала как идея:

> Если часть задачи остаётся последовательной, добавление ядер не ускоряет всю задачу пропорционально.

На AP1 обычно достаточно связать число ядер с параллельной Arbeitslast, не вычисляя формулу Амдала.

---

## 8. CPU-Benchmarks

Benchmark полезен, если:

- измеряет похожую задачу;
- выполнен при сопоставимых настройках;
- известны охлаждение, память и лимиты мощности;
- сравниваются актуальные и воспроизводимые данные.

Нельзя:

- смешивать Single-Core и Multi-Core результаты;
- сравнивать разные версии теста без оговорки;
- переносить короткий Burst-Test на длительную нагрузку;
- считать синтетический балл гарантией конкретной Anwendung.

Prüfungsformulierung:

> Für die Auswahl ist ein anwendungsnaher Benchmark aussagekräftiger als die Taktfrequenz allein.

---

## 9. RAM: Kapazität прежде Geschwindigkeit

RAM хранит данные и код, к которым CPU должен обращаться быстро.

При нехватке RAM Betriebssystem начинает активнее использовать Auslagerungsdatei/Swap на Massenspeicher. Это может резко увеличить задержки.

Проверяются:

- суммарная Kapazität;
- потребность приложений при одновременной работе;
- резерв;
- поколение, например DDR4 или DDR5;
- форм-фактор DIMM или SO-DIMM;
- поддерживаемая частота;
- число модулей и Speicherkanäle;
- максимальная Kapazität Mainboard/CPU;
- необходимость ECC.

Высокая RAM-Frequenz не компенсирует недостаточный объём.

---

## 10. Расчёт потребности в RAM

Учебный сценарий:

| Verbraucher | Bedarf |
|---|---:|
| Betriebssystem и Hintergrunddienste | 6 GB |
| IDE, Browser и Kommunikation | 5 GB |
| lokale Datenbank | 3 GB |
| две VM по 6 GB | 12 GB |
| Container и Werkzeuge | 4 GB |
| **Zwischensumme** | **30 GB** |

Резерв 20 %:

```text
30 GB × 1,20 = 36 GB
```

Нужно выбрать следующую реально поддерживаемую конфигурацию не меньше 36 GB. Это может быть 48 GB или 64 GB в зависимости от Mainboard, модулей, каналов и стандартов организации.

Важно:

> Расчёт — Bedarfsschätzung, а не обещание точного потребления. Его проверяют Monitoring или пилотным тестом.

---

## 11. Speicherkanäle и смешанные Module

Несколько каналов могут увеличить Speicherbandbreite. Для этого важны:

- правильные Slots по руководству Mainboard;
- совместимые Module;
- поддержка CPU и Mainboard;
- одинаковые или согласованные параметры;
- настройка Firmware.

При смешивании модулей система может:

- работать по параметрам самого медленного модуля;
- потерять часть Mehrkanalbetrieb;
- стать нестабильной;
- вообще не запуститься.

Поэтому `«физически вставляется»` ещё не означает `«полностью совместимо»`.

---

## 12. ECC

`Error-Correcting Code Memory` может обнаруживать и исправлять определённые ошибки памяти.

ECC рассматривают, если:

- высока цена незаметного повреждения данных;
- система работает долго и критично;
- это поддерживают CPU, Mainboard и Firmware;
- дополнительные расходы оправданы.

ECC не заменяет Backup, тестирование и другие меры целостности.

---

## 13. Massenspeicher: четыре разные величины

| Größe | Bedeutung | Einheit |
|---|---|---|
| Kapazität | сколько данных помещается | GB, TB |
| Latenz | время до начала операции | µs, ms |
| Datendurchsatz | объём данных в секунду | MB/s, GB/s |
| IOPS | число операций ввода-вывода в секунду | IOPS |

Большой последовательный Durchsatz важен для крупных файлов. Низкая Latenz и IOPS важны для множества небольших случайных операций, например VM или Datenbank.

Одна цифра MB/s не описывает весь Speicher.

---

## 14. HDD, SATA-SSD и NVMe-SSD

| Typ | Stärke | Grenze | Typische Nutzung |
|---|---|---|---|
| HDD | низкая цена за большую Kapazität | механика, высокая Latenz | архивы, большие последовательные данные |
| SATA-SSD | низкая Latenz, зрелая совместимость | ограничение SATA | универсальный клиент, Upgrade |
| NVMe-SSD | высокая Parallelität и низкая Latenz | стоимость, Wärme, PCIe/Lanes | Builds, VM, интенсивный I/O |

Для разработки с IDE, Datenbank, Containern и VM обычно важна SSD. Но NVMe-Topmodell не даёт автоматически заметного выигрыша в каждом офисном Workload.

---

## 15. M.2 не равно NVMe

`M.2` — прежде всего форм-фактор и разъёмная спецификация. Накопитель M.2 может использовать:

- SATA;
- PCIe с NVMe;
- разные ключи, размеры и число Lanes.

Перед покупкой проверяются:

- какой протокол поддерживает конкретный Slot;
- поддерживаемая длина модуля;
- Keying;
- число и поколение PCIe-Lanes;
- возможное разделение линий с другими портами;
- Boot-Unterstützung;
- охлаждение.

Правильный экзаменационный ответ:

> Die Bauform M.2 garantiert weder NVMe noch eine bestimmte Geschwindigkeit.

---

## 16. Endurance и надёжность SSD

При интенсивной записи важны:

- TBW или DWPD как Herstellerangabe;
- Garantiebedingungen;
- тип Workload;
- Over-Provisioning;
- температура;
- Firmware и Monitoring;
- Backup и Austauschkonzept.

Высокая Endurance не делает SSD резервной копией. Отказ, удаление, Malware или кража могут затронуть данные независимо от TBW.

---

## 17. GPU и VRAM

`Integrierte GPU (iGPU)` часто достаточна для:

- Office;
- браузера;
- обычной разработки;
- нескольких дисплеев в пределах поддерживаемой конфигурации;
- видеовоспроизведения.

`Dedizierte GPU (dGPU)` может требоваться для:

- 3D-CAD;
- GPU-Rendering;
- Videoeffekte;
- локальных KI-Workloads;
- специализированных вычислений.

Проверяются не только Rechenleistung и VRAM, но также:

- Software- и Treiberunterstützung;
- число и тип Display-Ausgänge;
- Leistungsaufnahme;
- Netzteil и Anschlüsse;
- Platz и Kühlung.

Дорогая dGPU без соответствующей задачи увеличивает цену и Energiebedarf без Nutzwert.

---

## 18. Mainboard, Sockel и Chipsatz

Mainboard определяет платформу:

- CPU-Sockel и совместимые поколения;
- Chipsatz и Firmware-Unterstützung;
- тип, количество и максимальный объём RAM;
- PCIe-Slots и Lanes;
- SATA- и M.2-Anschlüsse;
- Netzwerk, Audio и externe Schnittstellen;
- TPM/Secure-Boot-Funktionen;
- Formfaktor и питание.

Одинаковый Sockel не всегда гарантирует поддержку конкретной CPU: могут отличаться Chipsatz и требуемая Firmware-Version.

---

## 19. UEFI, Secure Boot и TPM

`UEFI` описывает интерфейс между Plattform-Firmware и Betriebssystem. Практически проверяются:

- поддержка установленной CPU;
- Bootmodus;
- Firmware-Updates;
- Secure Boot;
- TPM или Firmware-TPM;
- настройки виртуализации;
- Reihenfolge der Bootmedien.

Изменение Firmware может влиять на BitLocker/Schlüssel, Bootfähigkeit и безопасность. Перед обновлением нужны Herstelleranweisung, Backup, Stromversorgung и Rollback-Plan.

---

## 20. Betriebssystem-Anforderungen

Требования ОС — Muss-Kriterien. Они могут изменяться, поэтому проверяются по актуальной Herstellerdokumentation.

Пример на 10.09.2026: Microsoft указывает для Windows 11, среди прочего:

- совместимый 64-Bit-Prozessor с 1 GHz и минимум двумя ядрами;
- 4 GB RAM;
- 64 GB Speicher;
- UEFI с Secure-Boot-Fähigkeit;
- TPM 2.0.

Это минимальные, а не рекомендуемые значения для любого профессионального Workload. Установка на минимуме ещё не доказывает пригодность для разработки или VM.

---

## 21. Netzteil: Nennleistung и реальный Verbrauch

Netzteil выбирается по:

- максимальной потребности компонентов;
- кратковременным Lastspitzen;
- эффективности;
- требуемым Steckern;
- качеству и Schutzfunktionen;
- Formfaktor;
- разумному Leistungsreserve.

`650 W` на Netzteil — не постоянное потребление из розетки.

Пример:

```text
Komponenten benötigen 300 W Gleichleistung.
Bei 90 % Wirkungsgrad:
P_Eingang = 300 W ÷ 0,90 = 333,3 W
```

Эффективность зависит от нагрузки. Слишком большое Netzteil не является автоматически лучшим.

---

## 22. Kühlung, Temperatur и Throttling

Если тепло не отводится, компоненты могут снижать частоту:

`Thermal Throttling` = автоматическое ограничение производительности для удержания температуры.

Проверяются:

- Kühlerfreigabe;
- Luftstrom;
- Gehäuseabmessungen;
- Lüfterkurven;
- Staubfilter и Wartung;
- Geräuschgrenzen;
- Umgebungstemperatur.

Короткий Benchmark в холодной системе может скрыть падение производительности при длительной нагрузке.

---

## 23. Netzwerkadapter

Для Ethernet:

- поддерживаемая Datenrate;
- стандарт и совместимость Switch;
- качество и категория Verkabelung;
- возможный PoE-Bedarf;
- Treiber и Verwaltungsfunktionen.

Для WLAN:

- поддерживаемые Standards и Frequenzbänder;
- Antennen;
- Verschlüsselung и Authentifizierung;
- реальная Funkumgebung;
- Roaming и Treiber.

Номинальная Linkrate не равна реальному Nutzdurchsatz: влияют Overhead, Gegenstelle, Medium, Entfernung и Störungen.

---

## 24. Desktop, Notebook, Workstation или Thin Client

| Gerätetyp | Vorteile | Grenzen |
|---|---|---|
| Desktop | ремонт, Upgrade, Preis/Leistung | не мобилен |
| Notebook | мобильность, встроенный Akku/Display | меньше Upgrade, thermische Grenzen |
| Workstation | проверенные профессиональные Komponenten, ECC/GPU-Optionen | цена, энергия |
| Thin Client | централизованное управление, малый lokaler Aufwand | зависит от Backend и Netzwerk |

Thin Client экономичен только при подходящей zentraler Infrastruktur. Notebook требует оценки Docking, Akku, Gewicht, Display и Reparierbarkeit.

---

## 25. Verfügbarkeit, Support и Lebenszyklus

Критерии:

- Lieferzeit и Ersatzgeräte;
- гарантия и Reaktionszeit;
- Vor-Ort-Service;
- Treiber- и Firmwareversorgung;
- поддерживаемый Lebenszyklus ОС;
- стандартизированная модельная серия;
- доступность Ersatzteile;
- управляемость и Inventarisierung.

Покупка редкой дешёвой модели может увеличить Supportaufwand. Стандартизация снижает число Images, Treiberstände и запасных частей.

---

## 26. Четыре уровня Kompatibilität

| Ebene | Frage | Beispiel |
|---|---|---|
| mechanisch | помещается и подходит ли разъём? | GPU длина/высота, M.2-Format |
| elektrisch | достаточно ли питания и правильны ли сигналы? | Netzteilstecker, Slot-Leistung |
| logisch/protokollarisch | поддерживаются ли Standard и режим? | SATA или PCIe/NVMe |
| softwareseitig | есть ли Firmware, Treiber и OS-Support? | TPM, Gerätetreiber |

Дополнительно проверяются thermische и organisatorische условия.

---

## 27. Kompatibilitätscheckliste

Перед Freigabe:

1. CPU ↔ Sockel, Chipsatz, Firmware.
2. RAM ↔ поколение, Formfaktor, Kapazität, Takt, ECC.
3. SSD ↔ Formfaktor, протокол, Key, Länge, Lanes.
4. GPU ↔ Slot, размеры, Netzteil, Stecker, Kühlung.
5. Gehäuse ↔ Mainboard, Kühler, Laufwerke, Luftstrom.
6. Netzteil ↔ Leistung, Schutz, Anschlüsse, Formfaktor.
7. Displays ↔ Ausgänge, Auflösung, Bildwiederholrate.
8. Peripherie ↔ Ports, Treiber, Betriebssystem.
9. OS ↔ CPU, RAM, Speicher, UEFI, TPM.
10. Infrastruktur ↔ Netzwerk, Domäne, Verwaltung, Security.

Ergebnis и источник проверки документируются.

---

## 28. Engpassanalyse

`Bottleneck/Engpass` — компонент или ресурс, ограничивающий выполнение текущей задачи.

Признаки:

- CPU постоянно загружена, остальные ресурсы свободны;
- RAM заполнена и растёт Swap;
- Datenträger имеет высокую Active Time и Warteschlange;
- GPU/VRAM ограничивает графический Workload;
- сеть ограничивает Übertragung;
- температура вызывает Throttling.

Порядок:

1. воспроизвести проблему;
2. измерить CPU, RAM, I/O, Netzwerk, GPU и Temperatur;
3. сопоставить с Workload;
4. сформулировать Hypothese;
5. изменить один фактор;
6. повторно измерить.

Замена «самого старого» компонента без Messung — не анализ.

---

## 29. Praxisfall: FIAE-Arbeitsplatz

Требования:

- IDE, Browser, Teams и lokale Datenbank;
- два VM по 6 GB;
- несколько Container;
- два QHD-монитора;
- Gigabit-Ethernet;
- аппаратное шифрование и поддерживаемая ОС;
- плановая Nutzungsdauer 5 лет.

Обоснованная конфигурация:

- современная многопоточная CPU, проверенная по компиляционному Workload;
- не менее рассчитанных 36 GB RAM, практически поддерживаемая конфигурация 48/64 GB;
- NVMe-SSD достаточной Kapazität и Endurance;
- iGPU, если она поддерживает оба дисплея и нет GPU-Workload;
- TPM 2.0, Secure Boot, поддерживаемая Firmware;
- Netzwerkadapter и Dock/Ports под существующую инфраструктуру;
- гарантия, Updateversorgung и Upgradepfad на плановый срок.

Необоснованно:

- выбирать dGPU только потому, что она дороже;
- обещать, что 32 GB «всегда достаточно программисту»;
- считать 1 TB достаточным без расчёта данных;
- игнорировать два VM при выборе RAM.

---

## 30. Vergleichsmatrix

После Muss-Prüfung можно применить Nutzwertanalyse:

| Kriterium | Gewicht | A | B |
|---|---:|---:|---:|
| Workload-Leistung | 30 % | Bewertung | Bewertung |
| RAM-/Upgradefähigkeit | 20 % | Bewertung | Bewertung |
| Sicherheit/OS-Support | 20 % | Bewertung | Bewertung |
| Service/Lebenszyklus | 15 % | Bewertung | Bewertung |
| Energie/Nachhaltigkeit | 10 % | Bewertung | Bewertung |
| Ergonomie/Mobilität | 5 % | Bewertung | Bewertung |

Цена не должна скрываться: её рассматривают отдельно или как критерий с понятным Gewicht. Bewertung должна иметь шкалу и фактическое обоснование.

---

## 31. Prüfungsalgorithmus

1. Выделить Nutzungsszenario и пользователей.
2. Составить Muss-Kriterien.
3. Оценить параллельность и объём данных.
4. Назначить требования CPU, RAM, Speicher, GPU, Netzwerk.
5. Проверить OS, Security и Schnittstellen.
6. Выполнить Kompatibilitätscheck всех уровней.
7. Учесть Energie, Support, Garantie, Upgrade и TCO.
8. Исключить варианты, нарушающие Muss.
9. Сравнить оставшиеся по Nutzwert и Kosten.
10. Написать Entscheidungssatz с условием и риском.

---

## 32. Typische Prüfungsfallen

| Falle | Korrektur |
|---|---|
| больше GHz = всегда быстрее | Architektur, IPC, Kerne и Workload |
| больше ядер ускоряют всё | учитывать Parallelisierbarkeit |
| быстрый RAM заменит Kapazität | сначала достаточный объём |
| M.2 = NVMe | Formfaktor и протокол различать |
| MB/s описывает всю SSD | добавить Latenz, IOPS, Workload |
| 650-W-Netzteil потребляет 650 W | различать Nennleistung и Aufnahme |
| один Sockel гарантирует CPU | проверить Chipsatz и Firmware |
| физически подходит = совместимо | проверить 4 уровня |
| Minimum ОС = хорошая рабочая станция | рассчитать реальный Workload |
| дорогая GPU улучшает IDE | связать GPU с Anwendung |
| ECC заменяет Backup | меры решают разные риски |
| Upgrade всегда экологичнее | учитывать Security, Ausfall и Bedarf |

---

## 33. Selbsttest

1. Почему Hardwareauswahl начинается с Bedarf?
2. Чем Muss отличается от Soll?
3. Назови четыре параметра CPU.
4. Почему GHz недостаточно?
5. Для каких задач важны mehrere Kerne?
6. Какие ограничения имеет Benchmark?
7. Что происходит при нехватке RAM?
8. Рассчитай Bedarf из раздела 10 с 25 % Reserve.
9. Что нужно проверить при смешивании RAM?
10. Для чего применяется ECC?
11. Различи Kapazität, Latenz, Durchsatz и IOPS.
12. Когда HDD может быть разумным?
13. Почему M.2 не означает NVMe?
14. Какие свойства SSD важны при интенсивной записи?
15. Когда нужна dGPU?
16. Что проверяется у Mainboard?
17. Почему одинаковый Sockel недостаточен?
18. Что делает UEFI?
19. Почему OS-Minimum недостаточен для выбора?
20. Почему Netzteil 650 W не означает Verbrauch 650 W?
21. Рассчитай входную мощность при 300 W и Wirkungsgrad 90 %.
22. Что такое Thermal Throttling?
23. Почему Linkrate не равна Nutzdurchsatz?
24. Когда Thin Client уместен?
25. Назови четыре критерия Support/Lebenszyklus.
26. Какие четыре уровня Kompatibilität нужно проверить?
27. Назови признаки RAM-Engpass.
28. Как проверить Bottleneck?
29. Обоснуй отсутствие dGPU в FIAE-сценарии.
30. Сформулируй решение между двумя вариантами.

<details>
<summary>Показать решения</summary>

1. Только задача определяет необходимую производительность, интерфейсы и ограничения.
2. Без Muss решение исключается; Soll допускает обоснованное отклонение.
3. Kerne, Threads, Takt, IPC/Architektur, Cache, Plattform, Verbrauch.
4. Архитектуры выполняют разный объём работы за такт; важен Workload.
5. VM, parallele Builds, Rendering, Encoding, mehrere Dienste.
6. Он должен соответствовать задаче и выполняться при сопоставимых условиях.
7. ОС активнее использует Swap, задержки растут.
8. `30 GB × 1,25 = 37,5 GB`; выбрать поддерживаемую конфигурацию не меньше результата.
9. Generation, Formfaktor, Takt, напряжение, Slots, Channels и поддержку CPU/Mainboard.
10. Для обнаружения и исправления определённых ошибок памяти.
11. Объём; задержка; данные/секунду; операции/секунду.
12. Для большой недорогой Kapazität и подходящего неслучайного Workload.
13. M.2 — форма/интерфейс разъёма; носитель может быть SATA или PCIe/NVMe.
14. TBW/DWPD, Garantie, Temperatur, Firmware, реальный Schreibworkload.
15. При подтверждённой 3D-, Rendering-, Video-, KI- или Spezialsoftware-нагрузке.
16. Sockel, Chipsatz, RAM, Slots/Lanes, Anschlüsse, Formfaktor, Firmware/Security.
17. CPU может требовать другой Chipsatz или Firmware.
18. Определяет интерфейс Plattform-Firmware и Betriebssystem и предоставляет Boot-/Security-Funktionen.
19. Минимум подтверждает запуск, а не подходящую производительность.
20. Это допустимая Ausgangsleistung; фактическая Aufnahme зависит от нагрузки и Wirkungsgrad.
21. `300 W ÷ 0,90 = 333,3 W`.
22. Снижение производительности из-за температурного ограничения.
23. Есть протокольный Overhead и ограничения Gegenstelle, Medium и Störungen.
24. Если Backend, Netzwerk и централизованное управление обеспечивают нужный Workload.
25. Garantie, Reaktionszeit, Ersatzgerät, Updates, Ersatzteile, стандартизация.
26. Mechanisch, elektrisch, logisch/protokollarisch, softwareseitig.
27. RAM заполнена, Swap и Datenträgeraktivität растут, Anwendung задерживается.
28. Воспроизвести, измерить, выдвинуть Hypothese, изменить один фактор, измерить снова.
29. Если iGPU поддерживает мониторы, а GPU-Workload отсутствует, dGPU не даёт Nutzwert.
30. Например: `Alternative B erfüllt alle Muss-Kriterien und bietet für die parallelen VM ausreichend RAM sowie einen dokumentierten Updatezeitraum. Trotz des höheren Kaufpreises wird B gewählt, weil A wegen fehlender RAM-Kapazität zu Auslagerung und Folgekosten führen würde.`

</details>

---

## 34. Quellen und Abgleich

- [§ 9 FIAusbV – Prüfungsbereich Teil 1](https://www.gesetze-im-internet.de/fiausbv/__9.html)
- [FIAusbV und Ausbildungsrahmenplan – BIBB](https://www.bibb.de/dienst/berufesuche/de/index_berufesuche.php/regulation/VO_Fachinformatiker_2020.pdf)
- [Windows 11 – aktuelle Systemanforderungen](https://www.microsoft.com/windows/windows-11-specifications)
- [UEFI Forum – Specifications](https://uefi.org/specifications)
- [NVM Express – Specifications](https://nvmexpress.org/specifications/)

Конкретные Herstellerdaten, Betriebssystemanforderungen и Kompatibilitätslisten следует проверять заново на момент закупки. Числа в Bedarfsszenarien являются учебными допущениями.

---

## 35. Offene Prüfpunkte für den Unterricht

- Насколько подробно WBS сравнивает CPU-Kennzahlen?
- Ожидаются ли IPC, Cache и Hyper-Threading/SMT?
- Нужно ли рассчитывать RAM-Reserve?
- Какие Speicher-Kennzahlen входят в Prüfungsstoff?
- Требуется ли знать различие SATA, PCIe, NVMe и M.2?
- Использует ли WBS конкретные Windows-11-Anforderungen?
- Насколько подробно рассматриваются UEFI, Secure Boot и TPM?
- Нужен ли расчёт Netzteil-Wirkungsgrad?
- Какие Tools применяются для Engpassanalyse?
- Где проходит граница с темами Schnittstellen и Betriebssysteme?
