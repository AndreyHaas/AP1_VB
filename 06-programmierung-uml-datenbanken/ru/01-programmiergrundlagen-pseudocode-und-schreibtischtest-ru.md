---
pruefung: AP1
thema: Programmierung
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Russisch
gegenstueck: ../de/01-programmiergrundlagen-pseudocode-und-schreibtischtest-de.md
---

# Основы программирования, Pseudocode и Schreibtischtest

## 1. Lernziele

Ты сможешь:

- объяснять Variablen, Datentypen, Operatoren и Ausdrücke;
- читать и писать Sequenz, Verzweigung и Schleife;
- применять Arrays/Listen, Funktionen, Parameter и Rückgabewerte;
- превращать нейтральный Pseudocode в последовательность действий;
- полностью проводить Schreibtischtest;
- различать Syntax-, Laufzeit-, Logik- и Randfallfehler.

## 2. Prüfungsminimum — 15 Minuten

1. Variable = именованное место/значение с Datentyp.
2. Zuweisung изменяет значение; Vergleich проверяет Bedingung.
3. `AND` требует обе Bedingungen, `OR` — хотя бы одну, `NOT` инвертирует.
4. `if/else` выбирает путь; Schleife повторяет Anweisungen.
5. `for` удобен при известном числе повторов, `while` — при зависимости от условия.
6. `MOD` возвращает остаток целочисленного деления; `zahl MOD 2 = 0` проверяет чётность.
7. Funktion инкапсулирует обработку; Parameter — входы, `RETURN` — результат.
8. В Schreibtischtest значения записываются после каждой важной Anweisung.
9. Schleifengrenzen и Indexbasis берутся из условия, а не угадываются.
10. Testdaten включают Normal-, Grenz-, ungültige и leere Fälle.

> Der Schreibtischtest wird zeilenweise durchgeführt, damit jede Änderung der Variablen und die tatsächliche Ausgabe nachvollziehbar bleiben.

## 3. Grundlagen

### 3.1 Datentypen и Variablen

| Datentyp | Пример | Применение |
|---|---|---|
| Integer | `42` | целые числа, счётчики |
| Decimal/Real | `19.95` | числа с дробной частью |
| Boolean | `true` | истина/ложь |
| Character | `'A'` | отдельный символ |
| String | `"AP1"` | строка символов |
| Date/Time | `2026-09-30` | дата/время, формат зависит от языка |

Datentyp задаёт допустимые значения и операции. Для денег бинарные Gleitkommazahlen часто непригодны; в реальном коде применяют Decimal-Typ или минимальные денежные единицы.

### 3.2 Zuweisung и Vergleich

В этой главе:

```text
x ← 5        // Zuweisung
x = 5        // Vergleich in einer Bedingung
```

Конкретные Programmiersprachen используют другие символы. Важно понять: значение сохраняют или сравнивают.

### 3.3 Operatoren

| Группа | Operatoren | Пример |
|---|---|---|
| arithmetisch | `+ - * / MOD` | `rest ← 17 MOD 5` даёт `2` |
| Vergleich | `= ≠ < ≤ > ≥` | `alter ≥ 18` |
| logisch | `AND OR NOT` | `aktiv AND NOT gesperrt` |

Скобки делают порядок однозначным. Без указания нельзя придумывать собственный Operatorrangfolge.

### 3.4 Три базовые структуры

`Sequenz`:

```text
preisNetto ← 100
preisBrutto ← preisNetto * 1,19
AUSGABE preisBrutto
```

`Verzweigung`:

```text
WENN bestand > 0
    AUSGABE "lieferbar"
SONST
    AUSGABE "nicht lieferbar"
ENDE WENN
```

`Schleife`:

```text
summe ← 0
FÜR i VON 1 BIS 5
    summe ← summe + i
ENDE FÜR
```

Здесь `VON 1 BIS 5` включает обе границы. В настоящем Code верхняя граница может исключаться. Решает условие задачи.

## 4. Vertiefung und Zusammenhänge

### 4.1 Kopfgesteuerte и fußgesteuerte Schleifen

```text
SOLANGE bedingung
    anweisungen
ENDE SOLANGE
```

Bedingung проверяется до первого прохода; Schleife может выполниться ноль раз.

```text
WIEDERHOLE
    anweisungen
BIS bedingung
```

Тело выполняется минимум один раз. Точное значение `BIS` нужно уточнять в используемой Notation.

Типичная Endlosschleife:

```text
i ← 0
SOLANGE i < 10
    AUSGABE i
    // i wird nicht verändert
ENDE SOLANGE
```

### 4.2 Arrays и Listen

Array или Liste хранит несколько значений. Важно:

- начинается Index с `0` или `1`?
- включена ли верхняя Grenze?
- что происходит при leere Liste?
- можно ли обратиться к Index вне диапазона?

```text
werte ← [4, 7, 2]
summe ← 0
FÜR jedes element IN werte
    summe ← summe + element
ENDE FÜR
```

Итерация по Elementen избегает некоторых Indexfehler, но подходит не для всех операций.

### 4.3 Funktionen, Parameter и Rückgabe

```text
FUNKTION maximum(a, b)
    WENN a > b
        RETURN a
    SONST
        RETURN b
    ENDE WENN
ENDE FUNKTION

groesser ← maximum(8, 5)
```

`a` и `b` — Parameter. `8` и `5` — Argumente при Aufruf. Funktion возвращает `8`.

Seiteneffekte изменяют состояние вне Rückgabe, например globale Variable или Datei. В Schreibtischtest они тоже фиксируются.

### 4.4 Objektorientierte Grundbegriffe

| Begriff | Значение |
|---|---|
| Klasse | шаблон для Objekte |
| Objekt | конкретный экземпляр Klasse |
| Attribut | состояние/свойство |
| Methode | поведение/операция |
| `private` | доступ только внутри предусмотренной Kapselung |
| `public` | доступный снаружи Schnittstelle |

Понятия помогают читать Code и UML. Vererbung здесь не углубляется как AP1-Kern, пока Prüfungskatalog/WBS не требуют иного.

### 4.5 Типы ошибок

| Fehlerart | Значение | Пример |
|---|---|---|
| Syntaxfehler | нарушены правила языка | отсутствует скобка |
| Laufzeitfehler | ошибка при выполнении | деление на ноль |
| Logikfehler | Code работает, результат неверен | Rabatt прибавлен вместо вычитания |
| Randfallfehler | пропущен особый/граничный случай | пустая Liste, последний Index |

Compiler или Interpreter не найдёт автоматически каждый Logikfehler.

### 4.6 Выбор Programmiersprache: Compiler, Interpreter и JIT

**Compiler** переводит Quellcode в Zielcode до выполнения. **Interpreter** обрабатывает Anweisungen во время выполнения; реальные реализации могут сочетать оба подхода. **JIT-Compilation** переводит часто используемые части в Laufzeit. Поэтому по словам «компилируемый» или «интерпретируемый» нельзя автоматически судить о скорости или безопасности.

| Kriterium | Вопрос для экзамена |
|---|---|
| Problem и Paradigma | подходит prozedural, objektorientiert, funktional или ereignisgesteuert? |
| Zielplattform | поддерживаются Betriebssystem, Browser, Mobile, Embedded или Cloud? |
| Bibliotheken и Schnittstellen | доступны нужные Frameworks, Treiber и APIs? |
| Qualität | Typprüfung, Tests, Debugger, sichere Bibliotheken, Wartbarkeit? |
| Betrieb | Laufzeitumgebung, Deployment, Performance, Ressourcenbedarf? |
| Organisation | знания Team, Lizenz, Community, Support, Lebenszyklus? |

Хороший ответ сначала называет Anforderung, затем выбирает Sprache и обосновывает связь. «Язык X всегда быстрее» — не надёжное обоснование.

## 5. Schreibtischtest und Modellierung

### 5.1 Алгоритм работы

1. Записать Eingaben и Anfangswerte.
2. Сделать столбцы для изменяемых Variablen, Bedingung и Ausgabe.
3. Выполнять Code точно по порядку.
4. Перед каждым проходом проверять Schleifenbedingung.
5. После каждой Zuweisung записывать новое значение.
6. Учитывать только действительно выполненный Zweig.
7. Проверить Endbedingung и Ausgabe.
8. Сверить результат на Plausibilität.

### 5.2 Пример 1: сумма чётных чисел

```text
summe ← 0
FÜR i VON 1 BIS 5
    WENN i MOD 2 = 0
        summe ← summe + i
    ENDE WENN
ENDE FÜR
AUSGABE summe
```

| i | `i MOD 2 = 0` | summe после шага |
|---:|---|---:|
| Start | — | 0 |
| 1 | falsch | 0 |
| 2 | wahr | 2 |
| 3 | falsch | 2 |
| 4 | wahr | 6 |
| 5 | falsch | 6 |

Ausgabe: `6`.

### 5.3 Пример 2: Anzahl и Maximum

```text
werte ← [7, 3, 9, 9]
maximum ← werte[0]
anzahl ← 0

FÜR jedes x IN werte
    WENN x > maximum
        maximum ← x
    ENDE WENN
    WENN x = maximum
        anzahl ← anzahl + 1
    ENDE WENN
ENDE FÜR
```

Код будто считает частоту Maximum, но ошибается: сначала считает `7`, хотя итоговый Maximum равен `9`. При новом Maximum нужно сбросить `anzahl`.

Исправление:

```text
WENN x > maximum
    maximum ← x
    anzahl ← 1
SONST WENN x = maximum
    anzahl ← anzahl + 1
ENDE WENN
```

### 5.4 Grenzwerttest

Для `alter ≥ 18`:

| Testwert | Цель | Ожидание |
|---:|---|---|
| 17 | прямо ниже Grenze | abgelehnt |
| 18 | на Grenze | akzeptiert |
| 19 | прямо выше Grenze | akzeptiert |
| leer/Text | ungültige Eingabe | Validierungsreaktion |

## 6. Prüfungsformulierungen

> Die Schleife wird beendet, sobald `i` den Wert 10 erreicht, da die Bedingung `i < 10` dann nicht mehr erfüllt ist.

> Es liegt ein Logikfehler vor, weil das Programm ausführbar ist, die Anzahl jedoch beim Finden eines neuen Maximums nicht zurückgesetzt wird.

> Die Werte 17, 18 und 19 werden gewählt, damit der Bereich direkt unter, auf und über der Grenze geprüft wird.

> Eine Funktion verbessert die Wiederverwendbarkeit, da die Verarbeitung einmal definiert und mit unterschiedlichen Argumenten aufgerufen werden kann.

## 7. Typische Prüfungsfallen

- Путать Zuweisung и Vergleich.
- Менять местами `AND` и `OR`.
- Без указания считать Schleifenobergrenze включённой или исключённой.
- Забывать Index `0` или читать за границей Liste.
- Не инициализировать Variable или ошибочно инициализировать её заново в каждом проходе.
- Не изменять Schleifenvariable.
- Путать Integerdivision и Dezimaldivision.
- Давать только Endwert без таблицы.
- Вычислять невыполненный `else`-Zweig.
- Называть Syntaxfehler, когда Code работает, но считает неверно.
- Не тестировать leere Eingabe, Null и Grenzwerte.
- Считать Pseudocode фиксированным языком.

## 8. Selbsttest

1. Различи Variable, Datentyp и Wert.
2. Что возвращает `17 MOD 5`?
3. Когда `while` лучше `for`?
4. В чём разница Parameter и Argument?
5. Выполни: `x ← 3; y ← x * 2; x ← y - 1`. Назови `x` и `y`.
6. Найди Ausgabe:

```text
summe ← 0
FÜR i VON 0 BIS 3
    summe ← summe + i
ENDE FÜR
AUSGABE summe
```

7. Найди ошибку:

```text
i ← 1
SOLANGE i ≤ 5
    AUSGABE i
ENDE SOLANGE
```

8. Классифицируй: Division durch null; falsche Rabattberechnung; fehlende Klammer.
9. Напиши Pseudocode, считающий положительные числа Liste.
10. Составь Grenztests для `passwortLaenge ≥ 12`.
11. Почему leere Liste проблемна для Maximum-Algorithmus?
12. Оцени: «Если Code компилируется, он правильный».

<details>
<summary>Lösungen anzeigen</summary>

1. Variable — именованная ссылка на хранение, Datentyp задаёт значения/операции, Wert — текущее содержимое.
2. `2`.
3. Если число проходов заранее неизвестно и определяется Bedingung.
4. Parameter находится в Funktionsdefinition, Argument передаётся при Aufruf.
5. `x = 5`, `y = 6`.
6. `0 + 1 + 2 + 3 = 6`.
7. `i` не изменяется; Schleife бесконечна. Добавить `i ← i + 1`.
8. Laufzeitfehler; Logikfehler; Syntaxfehler.
9. Инициализировать Zähler нулём, пройти Elemente, при `x > 0` увеличить, вернуть/вывести Zähler.
10. 11, 12 и 13 символов, а также пустое/невалидное значение.
11. Нет первого Element для Initialisierung; случай обрабатывается заранее.
12. Неверно: синтаксически допустимый Code может содержать Logik-, Randfall- и Sicherheitsfehler.

</details>

## 9. Quellen und Abgleich

- [BIBB: Fachinformatiker/Fachinformatikerin – Umsetzungshilfe](https://www.bibb.de/dienst/publikationen/de/16661) — berufliche Handlungskompetenzen и Ausbildungsbezug.
- [The Python Language Reference](https://docs.python.org/3/reference/) — пример официальной Sprachreferenz; notation главы намеренно нейтральна.
- Сверка с AP1-Themenmatrix и Schreibstandard проекта; Stand 10.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Какую Pseudocode-Notation использует WBS?
- Считаются ли верхние Schleifengrenzen включёнными или это всегда указано?
- Какие Datentypen и OOP-Begriffe явно требует текущий Prüfungskatalog?
