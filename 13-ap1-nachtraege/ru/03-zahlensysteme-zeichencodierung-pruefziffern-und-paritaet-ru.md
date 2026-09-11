---
pruefung: AP1
thema: Zahlensysteme, Zeichencodierung, Prüfziffern und Parität
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/03-zahlensysteme-zeichencodierung-pruefziffern-und-paritaet-de.md
---

# Zahlensysteme, Zeichencodierung, Prüfziffern und Parität

## 1. Lernziele

После изучения главы нужно уметь:

- объяснять Dual-, Oktal-, Dezimal- и Hexadezimalsystem;
- переводить целые числа между четырьмя Zahlensysteme;
- применять Stellenwertverfahren, wiederholte Division и Bitgruppierung;
- различать ASCII, Unicode, Codepoint и UTF-8;
- определять простые UTF-8-Bytefolgen;
- рассчитывать Paritätsbit и Prüfziffer и оценивать их границы.

## 2. Prüfungsminimum — 15 Minuten

1. Basis 2: `0–1`; Basis 8: `0–7`; Basis 10: `0–9`; Basis 16: `0–9, A–F`.
2. Stellenwert: цифра умножается на основание в степени позиции; справа начинается позиция 0.
3. Из Dezimal в другую Basis: повторно делить на Basis и читать остатки снизу вверх.
4. Dual↔Oktal: группы по три бита справа; Dual↔Hex: по четыре.
5. `45₁₀ = 101101₂ = 55₈ = 2D₁₆`.
6. ASCII — 7-Bit-Zeichencodierung с 128 кодовыми позициями.
7. Unicode назначает символам Codepoints вроде `U+20AC`; UTF-8 кодирует их 1–4 Bytes.
8. ASCII-Zeichen имеют в UTF-8 те же Bytewerte от `00` до `7F`.
9. Parität обнаруживает все ошибки с нечётным количеством изменённых битов, но не каждый Mehrbitfehler.
10. Prüfziffer обнаруживает ошибки по своему алгоритму, но не доказывает Echtheit или отсутствие умышленного изменения.

## 3. Zahlensysteme и Stellenwert

| System | Basis | Ziffern | typische Verwendung |
|---|---:|---|---|
| Dual | 2 | 0, 1 | Bits, Masken |
| Oktal | 8 | 0–7 | Unix-Rechte, компактные Bitgruppen |
| Dezimal | 10 | 0–9 | повседневные и kaufmännische Werte |
| Hexadezimal | 16 | 0–9, A–F | Bytes, Adressen, Farben |

Пример `2D₁₆`:

```text
2 × 16¹ + 13 × 16⁰ = 32 + 13 = 45₁₀
```

Пример `101101₂`:

```text
1×2⁵ + 0×2⁴ + 1×2³ + 1×2² + 0×2¹ + 1×2⁰
= 32 + 8 + 4 + 1 = 45₁₀
```

## 4. Umrechnungsverfahren

### 4.1 Dezimal в Zielbasis

```text
45 : 2 = 22 Rest 1
22 : 2 = 11 Rest 0
11 : 2 =  5 Rest 1
 5 : 2 =  2 Rest 1
 2 : 2 =  1 Rest 0
 1 : 2 =  0 Rest 1
```

Остатки снизу вверх: `101101₂`.

### 4.2 Dual, Oktal и Hex через Gruppierung

```text
Dual:  0010 1101 = 2D₁₆
Dual:  101 101   = 55₈
```

Слева можно дополнять нулями. Одна Hexziffer соответствует четырём Bits, одна Oktalziffer — трём.

### 4.3 Plausibilitätsprüfung

- последняя Dualziffer 0 означает чётное число;
- `n` Bits без знака представляют `0` до `2ⁿ−1`;
- две Hexziffern представляют Byte от `00` до `FF`;
- обратный перевод должен дать Ausgangswert.

## 5. ASCII, Unicode и UTF-8

`Zeichensatz` определяет набор символов. `Codepoint` — однозначный Unicode-номер символа. `Zeichenkodierung` задаёт, как этот номер хранится или передаётся как Bytes.

| Zeichen | Unicode-Codepoint | UTF-8 hex | Bytes |
|---|---|---|---:|
| A | U+0041 | 41 | 1 |
| ä | U+00E4 | C3 A4 | 2 |
| € | U+20AC | E2 82 AC | 3 |
| 😀 | U+1F600 | F0 9F 98 80 | 4 |

UTF-8 самосинхронизируется и совместим с ASCII. Число видимых символов не всегда равно числу Codepoints или Bytes: возможны kombinierende Zeichen и Emoji-Sequenzen.

## 6. Prüfziffern, Parität и Anwendungsfall

### 6.1 Gerade и ungerade Parität

При gerade Parität Paritätsbit выбирают так, чтобы общее число единиц стало чётным.

```text
Daten: 1011001 → четыре единицы → Paritätsbit 0
```

При ungerade Parität бит был бы `1`. Одиночная Bitfehler обнаруживается. Если изменятся два Bits, Parität может остаться прежней. Она не локализует и не исправляет ошибку.

### 6.2 Gewichtete Modulo-10-Prüfziffer на примере EAN-13

Первые 12 цифр слева попеременно умножаются на 1 и 3. Prüfziffer дополняет сумму до следующего кратного 10.

```text
Nutzteil: 400638133393
ungerade Positionen: 4+0+3+1+3+9 = 20
gerade Positionen:   (0+6+8+3+3+3)×3 = 69
Summe = 89
Prüfziffer = (10 − 89 mod 10) mod 10 = 1
EAN-13 = 4006381333931
```

Другие Kennnummern могут использовать другие Gewichte и Moduli. Алгоритм берётся из задания или спецификации.

## 7. Prüfungsformulierungen и typische Fallen

> Die Dezimalzahl 45 entspricht `2D` im Hexadezimalsystem, da `2 × 16 + 13 = 45` gilt.

> Unicode ordnet dem Eurozeichen den Codepoint U+20AC zu, während UTF-8 diesen Codepoint mit der Bytefolge E2 82 AC codiert.

> Die Paritätsprüfung erkennt den doppelten Bitfehler nicht sicher, weil sich die Anzahl der Einsen wieder um eine gerade Zahl ändern kann.

Типичные ошибки:

- не указывать Basis/индекс результата;
- читать Hexziffern `A–F` как десятичные;
- читать Divisionsreste сверху вниз;
- формировать группы не с правого младшего разряда;
- путать Zeichen, Codepoint, Glyph и Byte;
- называть UTF-8 однобайтовой кодировкой;
- приравнивать Prüfziffer к криптографической Integritätsprüfung.

## 8. Selbsttest

1. Переведи `156₁₀` в Dual, Oktal и Hexadezimal.
2. Переведи `11010110₂` в Dezimal и Hexadezimal.
3. Объясни разницу Unicode и UTF-8.
4. Сколько Bytes занимает `A€` в UTF-8?
5. Добавь к `1100101` бит gerade Parität.
6. Предотвращает ли EAN-Prüfziffer умышленное изменение?

<details>
<summary>Lösungen anzeigen</summary>

1. `156₁₀ = 10011100₂ = 234₈ = 9C₁₆`.
2. `11010110₂ = 214₁₀ = D6₁₆`.
3. Unicode задаёт Codepoints, а UTF-8 — конкретное переменное Bytecodierung этих Codepoints.
4. `A` один Byte, `€` три Bytes, всего четыре.
5. Уже четыре единицы, поэтому Paritätsbit `0`.
6. Нет. Она обнаруживает определённые ошибки ввода/передачи, но не секретна и не защищена криптографически.

</details>

## 9. Quellen und Abgleich

- Unicode Consortium: The Unicode Standard и UTF-8 FAQ.
- RFC 3629: UTF-8, a transformation format of ISO 10646.
- GS1 General Specifications для GTIN/EAN-Prüfziffern.
- WBS-Kursinhalt: Dual, Dezimal, Oktal, Hexadezimal, ASCII, Unicode, UTF-8, Prüfziffern и Parität; подтверждено 11.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Нужны ли negative Dualzahlen и Zweierkomplement в AP1?
- Какие Prüfziffernverfahren кроме EAN/GTIN проходили в WBS?
- Нужно ли строить UTF-8 по Codepoint побитово или достаточно различать термины?
