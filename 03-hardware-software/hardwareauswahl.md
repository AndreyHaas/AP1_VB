---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Hardware auswählen und begründen

## Lernziele

- Компоненты выбирать по Kundenbedarf, а не по принципу «самое мощное».
- Обосновывать выбор через `Leistungsparameter`, `Kompatibilität`, `Erweiterbarkeit`, `Energieeffizienz` и `Kosten`.
- Различать SSD и HDD, integrierte и dedizierte GPU.

## Основные компоненты

| Komponente | Aufgabe | Wichtige Kriterien |
|---|---|---|
| `CPU` | выполняет инструкции | Kerne/Threads, Takt, Cache, Energiebedarf |
| `RAM` | хранит активные данные | Kapazität, DDR-Generation, Takt, Aufrüstbarkeit |
| `SSD/HDD` | постоянное хранение | Kapazität, Geschwindigkeit, Zuverlässigkeit, Preis |
| `GPU` | графика и параллельные вычисления | integriert/dediziert, VRAM, потребление |
| `Mainboard` | соединяет компоненты | Sockel, Chipsatz, RAM-Slots, Anschlüsse |
| `Netzteil` | электропитание | Leistung, Wirkungsgrad, Reserven, Anschlüsse |
| `Netzwerkkarte` | подключение к сети | Ethernet/WLAN, Datenrate, Standard |
| `Peripherie` | ввод/вывод | Ergonomie, Barrierefreiheit, Schnittstellen |

## SSD und HDD

`SSD`:

- быстрый произвольный доступ;
- нет движущихся частей;
- низкий шум и обычно меньшее энергопотребление;
- выше цена за GB.

`HDD`:

- высокая ёмкость за меньшую цену;
- механические части, шум и чувствительность к ударам;
- заметно медленнее при случайных обращениях.

Для системного диска, виртуальных машин и Entwicklungsumgebung обычно предпочтительна SSD. HDD остаётся разумным вариантом для дешёвого массового хранения, если скорость не критична.

## Bedarfsgerechte Auswahl

Beispiel: Arbeitsplatz für FIAE mit IDE, lokaler Datenbank, Docker-Containern, zwei virtuellen Maschinen und vielen Browser-Tabs; keine 3D-Anwendungen.

Высокий приоритет:

- `32 GB RAM` или больше — VMs, Container и Browser одновременно занимают память.
- `Mehrkernprozessor` — несколько рабочих нагрузок выполняются параллельно.
- `NVMe-SSD` — ускоряет запуск VMs, работу с Container-Images, Datenbankdateien и проектами.

Низкий приоритет:

- дорогая `dedizierte Grafikkarte`, если нет 3D, CAD, ML-вычислений или других GPU-Aufgaben.

## Kompatibilität prüfen

Перед Beschaffung проверить:

```text
CPU-Sockel ↔ Mainboard
RAM-Typ ↔ Mainboard/CPU
Netzteil-Leistung und Anschlüsse ↔ Komponenten
Gehäusegröße ↔ Mainboard/GPU/Kühlung
Schnittstellen ↔ Peripherie und Netzwerk
Betriebssystem ↔ Treiber und Software
```

## IHK-Merksätze

> Die Hardwareauswahl muss aus dem Kundenbedarf abgeleitet und wirtschaftlich begründet werden.

> Eine höhere technische Leistung ist nur dann vorteilhaft, wenn sie für den vorgesehenen Einsatz benötigt wird.

## Typische Prüfungsfallen

- IDE как программа сама по себе не обосновывает дорогой многоядерный CPU; важна общая параллельная нагрузка.
- Большой объём памяти не заменяет быстрый накопитель и наоборот.
- Максимальная мощность Netzteil не является его постоянным Verbrauch.
- Проверять Anschlüsse и совместимость, а не только производительность.

## Selbsttest

Ein mobiler Außendienstmitarbeiter nutzt Office, Videokonferenzen und eine webbasierte CRM-Anwendung. Nenne vier Auswahlkriterien für ein geeignetes Notebook und begründe sie.

## Lösungen

Возможный ответ:

> Das Notebook sollte eine lange Akkulaufzeit, ein geringes Gewicht, eine integrierte Webcam mit Mikrofon und eine zuverlässige WLAN-Unterstützung besitzen. Für den mobilen Einsatz sind außerdem robuste Bauweise, Festplattenverschlüsselung und ein entspiegeltes Display sinnvoll.

## Offene Punkte / Korrekturen

- `BIOS/UEFI`, Geräteklassen и интерфейсы раскрываются в отдельных будущих файлах.
