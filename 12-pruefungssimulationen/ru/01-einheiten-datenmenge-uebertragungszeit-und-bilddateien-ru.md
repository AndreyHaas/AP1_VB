---
pruefung: AP1
thema: Einheiten, Datenmenge, Übertragungszeit und Bilddateien
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Russisch
gegenstueck: ../de/01-einheiten-datenmenge-uebertragungszeit-und-bilddateien-de.md
---

# Единицы, объём данных, время передачи и изображения

## 1. Lernziele

Ты умеешь:

- уверенно различать bit и Byte;
- правильно применять десятичные и двоичные префиксы;
- приводить Datenmenge, Datenrate и Zeit к совместимым единицам;
- рассчитывать идеальное и эффективное время передачи;
- учитывать заданные Wirkungsgrad и Overhead;
- находить Datenrate или передаваемый объём по остальным величинам;
- рассчитывать несжатое растровое изображение по разрешению и Farbtiefe;
- различать уменьшение `um` и `auf` заданный процент;
- документировать промежуточные результаты с единицами и проверять их;
- системно решать смешанные задачи на передачу и изображения.

## 2. Prüfungsminimum — 15 Minuten

1. `1 Byte = 8 bit`; не смешивать `B` и `b`.
2. Десятичная система: `1 MB = 1 000 000 B`; двоичная: `1 MiB = 1 048 576 B`.
3. Скорость обычно дана в `Mbit/s` или `Gbit/s`, размер файла — в `MB` или `GB`.
4. `Übertragungszeit = Datenmenge / Nutzdatenrate`.
5. Перед делением числитель и знаменатель должны иметь совместимые единицы.
6. `Nutzdatenrate = Bruttodatenrate × Wirkungsgrad`.
7. `um 20 % reduziert` — осталось 80 %; `auf 20 % reduziert` — осталось 20 %.
8. `Bildgröße in bit = Breite × Höhe × Farbtiefe je Pixel`.
9. Заголовок файла, Metadaten и Kompression учитывать только по условию.
10. Ответ требует единицы, разумного округления и Plausibilitätsprüfung.

> Vor der Berechnung werden Datenmenge und Datenübertragungsrate in zueinander passende Einheiten umgerechnet.

## 3. Einheiten und Grundformeln

### 3.1 bit, Byte и префиксы

| Einheit | Значение |
|---|---:|
| 1 Byte | 8 bit |
| 1 kB | 1 000 B |
| 1 MB | 1 000 kB = 1 000 000 B |
| 1 GB | 1 000 MB = 1 000 000 000 B |
| 1 KiB | 1 024 B |
| 1 MiB | 1 024 KiB = 1 048 576 B |
| 1 GiB | 1 024 MiB = 1 073 741 824 B |

Систему единиц задаёт условие. Нельзя незаметно считать `GB` как `GiB`.

### 3.2 Треугольник передачи

```text
Datenmenge D = Datenrate R × Zeit t
Datenrate R  = Datenmenge D / Zeit t
Zeit t       = Datenmenge D / Datenrate R
```

Проверка единиц:

```text
MB / (MB/s) = s
Mbit / (Mbit/s) = s
```

### 3.3 Частые преобразования

```text
400 Mbit/s / 8 = 50 MB/s
25 MB/s × 8 = 200 Mbit/s
2,5 Gbit/s = 2 500 Mbit/s
120 s = 2 min
2 min 30 s = 150 s
```

## 4. Wirkungsgrad, Overhead und Bilddaten

### 4.1 Brutto и netto

Bruttodatenrate включает не только полезные данные. Если дан Wirkungsgrad:

```text
R_nutz = R_brutto × η
t = D / R_nutz
```

При заданном Overhead 20 % в упрощённой задаче остаётся 80 %:

```text
η = 1 − 0,20 = 0,80
```

Не придумывать собственный Overhead, если задача требует идеальную передачу.

### 4.2 Несжатое растровое изображение

```text
Pixelanzahl = Breite × Höhe
Datengröße_bit = Pixelanzahl × Farbtiefe_bit/Pixel
Datengröße_Byte = Datengröße_bit / 8
```

Farbtiefe относится к каждому Pixel. При `24 bit/Pixel` можно сразу использовать `3 Byte/Pixel`.

### 4.3 Kompression и уменьшение

```text
um x % reduziert: Restfaktor = 1 − x/100
auf x % reduziert: Restfaktor = x/100
neue Größe = alte Größe × Restfaktor
```

Термин Kompressionsrate определяется в задачах по-разному. Использовать определение из условия.

### 4.4 Упрощённая оценка видео

Если не даны Audio, Header или Kompression:

```text
Videogröße = Bildgröße je Frame × Frames/s × Laufzeit
```

Это модель несжатого видео, а не реалистичный прогноз Codec.

## 5. Anwendungsfälle und vollständige Rechnungen

### 5.1 Передача с Wirkungsgrad

Файл `18 GB` передаётся по соединению `600 Mbit/s`. Заданный Wirkungsgrad — `75 %`.

```text
R_nutz = 600 Mbit/s × 0,75 = 450 Mbit/s
R_nutz = 450 / 8 = 56,25 MB/s
D = 18 GB = 18 000 MB
t = 18 000 MB / 56,25 MB/s = 320 s
320 s = 5 min 20 s
```

Plausibilität: идеально получилось бы `600/8 = 75 MB/s` и 240 s. При меньшем Wirkungsgrad результат должен быть дольше.

### 5.2 Несжатое изображение и Reduktion

Изображение имеет `3 840 × 2 160 Pixel` и `24 bit/Pixel`.

```text
Pixel = 3 840 × 2 160 = 8 294 400
Größe = 8 294 400 × 24 bit = 199 065 600 bit
Größe = 199 065 600 / 8 = 24 883 200 B
Größe = 24,8832 MB
```

Файл уменьшается `um 70 %`:

```text
Restfaktor = 0,30
neue Größe = 24,8832 MB × 0,30 = 7,46496 MB ≈ 7,46 MB
```

### 5.3 Требуемая минимальная Datenrate

`4,5 GB` нужно идеально передать максимум за `3 min`.

```text
D = 4,5 GB = 36 Gbit
t = 3 min = 180 s
R = 36 Gbit / 180 s = 0,2 Gbit/s = 200 Mbit/s
```

Это математическая Nutzdatenrate. При выборе реального подключения дополнительно учитываются Overhead и Reserve.

## 6. Prüfungsformulierungen

> Die Nutzdatenrate beträgt 450 Mbit/s, da die Bruttodatenrate mit dem vorgegebenen Wirkungsgrad von 75 Prozent multipliziert wird.

> Die Übertragung dauert 320 Sekunden beziehungsweise 5 Minuten und 20 Sekunden, nachdem Datenmenge und Datenrate in kompatible Einheiten umgerechnet wurden.

> Nach einer Reduzierung um 70 Prozent verbleiben 30 Prozent der ursprünglichen Bildgröße.

> Die berechnete Mindestdatenrate ist ein Nutzdatenwert; für die Auswahl einer realen Verbindung sind Protokollanteile und Reserve zu berücksichtigen.

## 7. Typische Prüfungsfallen

- Смешивать `b` и `B`.
- Делить MB напрямую на Mbit/s.
- Смешивать GB и GiB без указания.
- Не переводить минуты в секунды.
- Подставлять Wirkungsgrad как 75 вместо 0,75.
- Вычесть Overhead, а потом ещё раз делить на Wirkungsgrad.
- Смешивать `um` и `auf`.
- Применять Farbtiefe один раз, а не к каждому Pixel.
- Забыть деление на 8 при 24 bit/Pixel.
- Самостоятельно оценивать Metadaten или Kompression без условия.
- Слишком рано округлять промежуточные числа.
- Давать ответ без единицы или периода.

## 8. Selbsttest

1. Сколько bit содержит Byte?
2. Разграничь MB и MiB.
3. Переведи 320 Mbit/s в MB/s.
4. Файл 12 GB идеально передаётся при 400 Mbit/s. Рассчитай время.
5. Рассчитай Nutzdatenrate при 1 Gbit/s и Wirkungsgrad 82 %.
6. Сколько займут 10 GB при этой Nutzdatenrate?
7. Рассчитай размер изображения 1 920 × 1 080 Pixel и 32 bit/Pixel в MB.
8. Изображение уменьшается um 60 %. Каков новый размер?
9. Объясни разницу между `um 25 %` и `auf 25 %`.
10. Какая Nutzdatenrate нужна для 9 GB за 6 минут?
11. Почему расчёт несжатого видео является только моделью?
12. Назови три Plausibilitätsprüfungen.

<details>
<summary>Lösungen anzeigen</summary>

1. 8 bit.
2. MB — десятичная единица 1 000 000 B; MiB — двоичная 1 048 576 B.
3. `320 / 8 = 40 MB/s`.
4. `12 000 MB / 50 MB/s = 240 s = 4 min`.
5. `1 000 × 0,82 = 820 Mbit/s = 102,5 MB/s`.
6. `10 000 / 102,5 ≈ 97,56 s ≈ 1 min 37,56 s`.
7. `1 920 × 1 080 × 32 / 8 = 8 294 400 B = 8,2944 MB`.
8. `8,2944 × 0,40 = 3,31776 MB ≈ 3,32 MB`.
9. остаётся 75 %; остаётся 25 %.
10. `9 GB = 72 Gbit`; `6 min = 360 s`; `72/360 = 0,2 Gbit/s = 200 Mbit/s`.
11. Не учитываются реальные Codecs, переменный Bitrate, Audio, Metadaten и Container.
12. проверка единиц, порядка величины, сравнение с Ideal-/Grenzwert; допустимы другие разумные проверки.

</details>

## 9. Quellen und Abgleich

- [BIPM — SI Brochure](https://www.bipm.org/en/publications/si-brochure) — SI-префиксы и правила единиц.
- [IEC — Prefixes for binary multiples](https://www.iec.ch/prefixes-binary-multiples) — Ki, Mi и Gi для степеней двойки.
- [FIAusbV § 9](https://www.gesetze-im-internet.de/fiausbv/__9.html) — практический выбор, настройка, тест и контроль результата в AP1.

## 10. Offene Prüfpunkte für den Unterricht

- Как WBS требует округлять Übertragungszeiten?
- Считаются ли единицы десятичными, если задача указывает только `MB/GB`?
- Какие Video- и Kompressionsmodelle входят в текущий Prüfungskatalog?
