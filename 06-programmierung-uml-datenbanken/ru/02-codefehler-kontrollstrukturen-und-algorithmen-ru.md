---
pruefung: AP1
thema: Programmierung
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Russisch
gegenstueck: ../de/02-codefehler-kontrollstrukturen-und-algorithmen-de.md
---

# Ошибки кода, управляющие структуры и простые алгоритмы

## 1. Lernziele

Ты сможешь:

- системно читать незнакомый Code;
- отслеживать Bedingungen, Schleifen и вложенные Abläufe;
- находить Syntax-, Laufzeit-, Logik- и Randfallfehler;
- исправлять Off-by-one-, Initialisierungs- и Indexfehler;
- записывать lineare Suche, Zählen, Summe, Mittelwert, Minimum и Maximum;
- обосновывать исправление и Testfälle по-немецки.

## 2. Prüfungsminimum — 15 Minuten

1. Сначала разделить Code на Eingabe, Verarbeitung и Ausgabe.
2. Отметить Startwert, Datentyp и назначение Variables.
3. Bedingung бывает только `wahr` или `falsch`; сложные части проверять отдельно.
4. `AND` требует обе части, `OR` — минимум одну.
5. В Schleife проверять Start, Bedingung, Änderung и Ende.
6. Различать `i < länge` и `i ≤ länge`: при Index от нуля последний обычно `länge - 1`.
7. Akkumulator `summe` и Zähler `anzahl` инициализируются до Schleife.
8. Division durch null, leere Liste и ненайденный Wert требуют явной обработки.
9. Исправление подтверждается Normal-, Grenz- и Fehlerfällen.
10. Schreibtischtest показывает настоящий Ablauf, а не предполагаемое намерение.

> Es liegt ein Off-by-one-Fehler vor, da die Schleife auch den Index `länge` anspricht, obwohl bei nullbasierter Indizierung nur `0` bis `länge - 1` gültig sind.

## 3. Grundlagen

### 3.1 Стратегия чтения незнакомого Code

1. Определить Eingaben и ожидаемую Ausgabe.
2. Записать Namen, Datentypen и Anfangswerte.
3. Отметить Schleifen и Verzweigungen по Einrückung.
4. Проверить Vergleichsgrenzen и logische Operatoren.
5. Отслеживать каждое изменение Variable.
6. Различать Rückgabewert и Seiteneffekte.
7. Симулировать Ablauf на малом Testdatensatz.
8. Сравнить Ergebnis с fachliche Anforderung.

### 3.2 Kontrollstrukturen

| Struktur | Назначение | Типичный вопрос |
|---|---|---|
| Sequenz | Anweisungen по очереди | правильный ли порядок? |
| Verzweigung | альтернативные Pfade | все ли Fälle покрыты без лишних пересечений? |
| Zählschleife | известное число повторов | верны Start и Grenze? |
| Bedingungsschleife | повтор до условия | меняется ли Bedingung? |
| verschachtelte Struktur | комбинация | когда выполняется innerer Block? |

### 3.3 Классы ошибок

| Klasse | Как распознаётся | Пример |
|---|---|---|
| Syntaxfehler | Parser/Compiler не читает Anweisung | отсутствует скобка |
| Laufzeitfehler | ошибка при выполнении | Array за границей, Division durch null |
| Logikfehler | Code работает, результат неверен | Maximum с неверным Vergleich |
| Randfallfehler | неверен особый случай | leere Liste, точная Grenze |

Неясная Anforderung тоже ведёт к fachlich falschem Code. Сначала нужно уточнить Soll.

## 4. Vertiefung und Zusammenhänge

### 4.1 Off-by-one

Liste имеет `länge = 4`, допустимые Indizes `0, 1, 2, 3`.

```text
FALSCH: FÜR i VON 0 BIS länge
RICHTIG: FÜR i VON 0 BIS länge - 1
```

Здесь `BIS` включает границу. В языке с exklusiver Obergrenze `range(0, länge)` может быть правильно. Решает Notation.

### 4.2 Initialisierungsfehler

```text
FALSCH:
FÜR jedes x IN werte
    summe ← 0
    summe ← summe + x
ENDE FÜR
```

`summe` стирается в каждом проходе. Инициализация должна быть до Schleife.

Для Maximum значение `0` корректно только если отрицательные Werte исключены. Надёжно:

```text
WENN werte leer
    FEHLER "kein Maximum"
SONST
    maximum ← werte[0]
ENDE WENN
```

### 4.3 Bedingungen и диапазоны

Число должно лежать между 10 и 20 включительно:

```text
RICHTIG: zahl ≥ 10 AND zahl ≤ 20
```

`zahl ≥ 10 OR zahl ≤ 20` истинно почти для любого числа и является Logikfehler.

### 4.4 Fortschritt Schleife

У bedingungsgesteuerte Schleife должен быть путь к окончанию:

```text
i ← 0
SOLANGE i < 5
    AUSGABE i
    i ← i + 1
ENDE SOLANGE
```

Изменение может происходить через Eingabe или Zustand, но должно влиять на Bedingung.

### 4.5 Простые алгоритмы

`Zählen`:

```text
anzahl ← 0
FÜR jedes x IN werte
    WENN x > 0
        anzahl ← anzahl + 1
    ENDE WENN
ENDE FÜR
```

`Summe und Mittelwert`:

```text
WENN werte leer
    FEHLER "kein Mittelwert"
ENDE WENN
summe ← 0
FÜR jedes x IN werte
    summe ← summe + x
ENDE FÜR
mittelwert ← summe / länge(werte)
```

`Minimum und Maximum`:

```text
minimum ← werte[0]
maximum ← werte[0]
FÜR jedes x IN werte
    WENN x < minimum
        minimum ← x
    ENDE WENN
    WENN x > maximum
        maximum ← x
    ENDE WENN
ENDE FÜR
```

`Lineare Suche`:

```text
gefunden ← falsch
i ← 0
SOLANGE i < länge(werte) AND NOT gefunden
    WENN werte[i] = gesucht
        gefunden ← wahr
    SONST
        i ← i + 1
    ENDE WENN
ENDE SOLANGE
```

Lineare Suche работает и на несортированных данных. В худшем случае проверяет все Elemente.

## 5. Anwendungsfall: ошибочная проверка остатков

Anforderung: посчитать товары с Bestand ниже Mindestbestand. Пустая Liste допустима.

Ошибочный Code:

```text
FUNKTION zaehleKnapp(bestand, minimum)
    anzahl ← 1
    FÜR i VON 0 BIS länge(bestand)
        WENN bestand[i] ≤ minimum
            anzahl ← anzahl + 1
        ENDE WENN
    ENDE FÜR
    RETURN anzahl
ENDE FUNKTION
```

Ошибки:

1. `anzahl` должен начинаться с `0`.
2. «ниже Mindestbestand» означает `<`, не `≤`, если Anforderung буквальна.
3. При включающем `BIS` верхняя Grenze равна `länge - 1`.
4. При leere Liste нельзя обращаться к элементу.

Исправление:

```text
FUNKTION zaehleKnapp(bestand, minimum)
    anzahl ← 0
    FÜR jedes x IN bestand
        WENN x < minimum
            anzahl ← anzahl + 1
        ENDE WENN
    ENDE FÜR
    RETURN anzahl
ENDE FUNKTION
```

Testfälle:

| Bestand | Minimum | Erwartung | Zweck |
|---|---:|---:|---|
| `[8, 3, 5, 1]` | 5 | 2 | Normalfall |
| `[5]` | 5 | 0 | Grenze |
| `[]` | 5 | 0 | leere Liste |
| `[0, -1]` | 0 | 1 | Wertebereich prüfen |

## 6. Prüfungsformulierungen

> Der Zähler muss vor der Schleife mit null initialisiert werden, da noch kein passendes Element gefunden wurde.

> Die Bedingung wird von `≤` zu `<` geändert, weil laut Anforderung nur Bestände unterhalb und nicht genau auf dem Mindestbestand gezählt werden.

> Die Iteration über die Elemente verhindert hier einen ungültigen Index und verarbeitet auch eine leere Liste ohne Arrayzugriff.

> Der Testwert 5 prüft die Grenze, weil er genau dem Mindestbestand entspricht.

## 7. Typische Prüfungsfallen

- Описывать намерение вместо реальных Anweisungen.
- Путать inklusive и exklusive Obergrenze.
- Не замечать `=`/`≠` и `<`/`≤`.
- Заменять `AND` на `OR` в Bereichstest.
- Инициализировать Akkumulator внутри Schleife.
- Начинать Maximum с `0`, хотя разрешены отрицательные Eingaben.
- Не обрабатывать leere Liste при Mittelwert.
- Установить Gefunden-Flag, но зря продолжать Schleife.
- Исправлять ошибку без ссылки на fachliche Anforderung.
- Тестировать только Normalfall.
- Путать Ausgabe и Rückgabewert.
- Переносить синтаксис языка на нейтральный Pseudocode.

## 8. Selbsttest

1. Назови четыре Fehlerklassen и по примеру.
2. Почему `i ≤ länge` обычно неверно для nullbasiertes Array?
3. Составь Bereichstest для 1–100 включительно.
4. Найди ошибку: `maximum ← 0` для `[-8, -3, -12]`.
5. Какие Werte нужны для теста `alter ≥ 18`?
6. Исправь Schleife, где `i` не меняется.
7. Напиши Pseudocode подсчёта чётных чисел.
8. Найди Ergebnis линейного поиска `7` в `[2, 7, 9]`.
9. Почему Mittelwert требует обработки leere Liste?
10. Различи Ausgabe и `RETURN`.
11. Спроектируй Tests для `zaehleKnapp`.
12. Оцени: «После успешного Normaltest алгоритм корректен».

<details>
<summary>Lösungen anzeigen</summary>

1. Syntax, Laufzeit, Logik, Randfall; примеры в разделе 3.3.
2. Index `länge` находится за последним допустимым `länge - 1`.
3. `x ≥ 1 AND x ≤ 100`.
4. Ergebnis останется 0; инициализировать первым Listenelement.
5. 17, 18, 19 и ungültige/leere Eingabe по Schnittstelle.
6. Добавить `i ← i + 1` или другое изменение Fortschritt.
7. Zähler 0; пройти Werte; при `x MOD 2 = 0` увеличить.
8. Gefunden = wahr на Index 1 при nullbasierter Indizierung.
9. Иначе Division durch null; fachlich Mittelwert не определён.
10. Ausgabe показывает данные; `RETURN` отдаёт Wert вызывающему коду.
11. Normalfall, граница, leer, все/ни один подходит, ungültige Werte по Anforderung.
12. Неверно; нужны Grenz-, Fehler-, Sonderfälle и проверка требования.

</details>

## 9. Quellen und Abgleich

- [Python-Dokumentation: Kontrollfluss](https://docs.python.org/3/tutorial/controlflow.html) — официальный пример языка; Prüfungsnotation остаётся нейтральной.
- [BIBB: Fachinformatiker/Fachinformatikerin](https://www.bibb.de/dienst/publikationen/de/16661) — Ausbildungsbezug.
- Сверено с главой 25 по Pseudocode и Schreibtischtest; Stand 10.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Какой конкретный язык встречается в WBS-Aufgaben вместе с Pseudocode?
- Требуются ли названия Such- и Sortieralgorithmen?
- Как обозначаются exklusive Schleifengrenzen?
