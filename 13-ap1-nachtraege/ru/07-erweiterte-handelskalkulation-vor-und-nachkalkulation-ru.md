---
pruefung: AP1
thema: Erweiterte Handelskalkulation, Vor- und Nachkalkulation
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/07-erweiterte-handelskalkulation-vor-und-nachkalkulation-de.md
---

# Erweiterte Handelskalkulation, Vor- und Nachkalkulation

## 1. Lernziele

После изучения главы нужно уметь:

- строить Bezugskalkulation и полную Handelskalkulation;
- различать Vorwärts-, Rückwärts- и Differenzkalkulation;
- находить Prozentbasis для Rabatt, Skonto, Handlungskosten и Gewinn;
- сравнивать Vor- и Nachkalkulation и объяснять Abweichungen;
- проверять Rechnung по расчётам и факту;
- классифицировать Vertrags- и Lieferstörungen.

## 2. Prüfungsminimum — 15 Minuten

1. `Listenpreis − Liefererrabatt = Zieleinkaufspreis`.
2. `Zieleinkaufspreis − Liefererskonto = Bareinkaufspreis`.
3. `Bareinkaufspreis + Bezugskosten = Bezugspreis`.
4. `Bezugspreis + Handlungskosten = Selbstkosten`.
5. `Selbstkosten + Gewinn = Barverkaufspreis`.
6. Kundenskonto и Vertreterprovision в стандартной схеме считаются от Zielverkaufspreis, Kundenrabatt — от Listenverkaufspreis.
7. Rückwärtsrechnung: процент от более высокой базы восстанавливается делением.
8. Vorkalkulation планирует Kosten/Preis; Nachkalkulation использует Istwerte и определяет Abweichung/Erfolg.
9. Rechnung prüfen: Bestellung, Lieferung, Preise, Mengen, Rabatte, Steuer, расчёт, Pflichtangaben, Freigabe.
10. Lieferstörungen: Nicht-, Spät-, Schlecht-, Falsch- и Minderlieferung; права зависят от случая и предпосылок.

## 3. Vollständiges Kalkulationsschema

```text
Listeneinkaufspreis
− Liefererrabatt
= Zieleinkaufspreis
− Liefererskonto
= Bareinkaufspreis
+ Bezugskosten
= Bezugspreis
+ Handlungskosten
= Selbstkosten
+ Gewinn
= Barverkaufspreis
+ Kundenskonto und ggf. Vertreterprovision
= Zielverkaufspreis
+ Kundenrabatt
= Listenverkaufspreis netto
+ Umsatzsteuer
= Listenverkaufspreis brutto
```

Каждый Prozentsatz требует своей Bezugsgröße. На стороне продажи Rabatt и Skonto не всегда рассчитываются простым прибавлением процента к меньшей сумме.

## 4. Vorwärts-, Rückwärts- и Differenzkalkulation

### 4.1 Vorwärtskalkulation

От закупки рассчитывается необходимый Verkaufspreis.

### 4.2 Rückwärtskalkulation

От заданного Markt-/Listenverkaufspreis определяется максимально допустимый Einkaufspreis.

Пример: `10 %` Kundenrabatt, Listenverkaufspreis `1 000 €`:

```text
Zielverkaufspreis = 1 000 € × 0,90 = 900 €
```

Если Kundenskonto `2 %` и Provision `3 %` считаются от Zielverkaufspreis:

```text
Barverkaufspreis = 900 € × (1 − 0,02 − 0,03) = 855 €
```

### 4.3 Differenzkalkulation

Известны Einkaufskosten и достижимый Marktpreis. Ищется возможный Gewinn/Verlust.

```text
Gewinn = Barverkaufspreis − Selbstkosten
Gewinnsatz = Gewinn / Selbstkosten × 100 %
```

## 5. Vollständiger Anwendungsfall

Дано:

- Listeneinkaufspreis `10 000 €`;
- Liefererrabatt `10 %`;
- Liefererskonto `2 %`;
- Bezugskosten `500 €`;
- Handlungskosten `20 %` от Bezugspreis;
- Gewinn `25 %` от Selbstkosten;
- Kundenskonto `2 %` и Provision `3 %` от Zielverkaufspreis;
- Kundenrabatt `10 %` от Listenverkaufspreis.

```text
Listeneinkaufspreis                         10 000,00 €
− 10 % Liefererrabatt                       1 000,00 €
= Zieleinkaufspreis                         9 000,00 €
− 2 % Liefererskonto                          180,00 €
= Bareinkaufspreis                          8 820,00 €
+ Bezugskosten                                500,00 €
= Bezugspreis                               9 320,00 €
+ 20 % Handlungskosten                     1 864,00 €
= Selbstkosten                             11 184,00 €
+ 25 % Gewinn                              2 796,00 €
= Barverkaufspreis                         13 980,00 €
```

Barverkaufspreis составляет `95 %` Zielverkaufspreis:

```text
Zielverkaufspreis = 13 980 € / 0,95 = 14 715,79 €
Listenverkaufspreis = 14 715,79 € / 0,90 = 16 350,88 € netto
```

Rundung выполняют в конце, если задача не требует иначе.

## 6. Vor-/Nachkalkulation, Rechnung и Vertragsstörungen

### 6.1 Abweichungsanalyse

```text
absolute Abweichung = Ist − Plan
relative Abweichung = (Ist − Plan) / Plan × 100 %
```

Planaufwand `80 h`, Istaufwand `92 h`:

```text
Abweichung = 12 h
relative Abweichung = 12/80 × 100 % = 15 % Mehrbedarf
```

Abweichung становится полезной для управления только с Ursache и Wirkung: Fehlschätzung, Scope-Änderung, Störung или Produktivitätsproblem.

### 6.2 Rechnungsprüfung

- sachlich: Leistung, Menge, Qualität, Lieferdatum и Bestellung совпадают;
- rechnerisch: Einzelpreise, Summen, Nachlässe, Steuer и Zahlbetrag верны;
- formal: Pflichtangaben и eindeutiger Beleg присутствуют;
- organisatorisch: Zuständigkeit, Vier-Augen-Prinzip, Freigabe, Dokumentation.

### 6.3 Liefer- und Vertragsstörungen

| Störung | Beispiel | erste Reaktion |
|---|---|---|
| Nichtlieferung | товар не пришёл | проверить Fälligkeit, Nachfrist и Rechte |
| Spätlieferung | позже Termin | проверить Verzug и Schaden |
| Schlechtlieferung | Gerät с дефектом | задокументировать Mangel, Nacherfüllung |
| Falschlieferung | другая модель | документировать, Nacherfüllung |
| Minderlieferung | мало единиц | Restleistung/Nacherfüllung и последствия |

При Mängel сначала обычно применяется Nacherfüllung; при условиях возможны Rücktritt, Minderung или Schadensersatz. `Vertragsstrafe` не возникает автоматически: нужна действующая Vereinbarung и её Voraussetzungen.

> Die Nachkalkulation zeigt einen Mehrbedarf von 15 Prozent, weil der Istaufwand den Planwert um 12 Stunden überschreitet.

> Die Rechnung wird nicht freigegeben, da die gelieferte Menge von der Bestellung abweicht und die sachliche Prüfung damit nicht bestanden ist.

## 7. Typische Prüfungsfallen

- считать все проценты от Listenpreis;
- путать Lieferer- и Kundenskonto;
- прибавлять Kundenskonto простым процентом к Barverkaufspreis;
- вычитать Bezugskosten;
- смешивать Gewinnsatz и Gewinnspanne без определения;
- смешивать Netto и Brutto;
- слишком рано округлять;
- автоматически считать отрицательную Planabweichung плохой;
- проверять Rechnung только математически;
- при любом Mangel сразу требовать Rücktritt/Schadensersatz;
- предполагать Vertragsstrafe без Klausel.

## 8. Selbsttest

1. Расположи ступени от Listeneinkaufspreis до Bezugspreis.
2. Почему 10-%-Kundenrabatt в Rückwärtsrechnung учитывают через `0,90`?
3. Selbstkosten 8 000 €, Gewinn 20 %. Найди Barverkaufspreis.
4. Plan 120 h, Ist 108 h. Найди absolute/relative Abweichung.
5. Назови четыре уровня Rechnungsprüfung.
6. Различи Falsch- и Minderlieferung.

<details>
<summary>Lösungen anzeigen</summary>

1. Listenpreis минус Rabatt = Zieleinkaufspreis; минус Skonto = Bareinkaufspreis; плюс Bezugskosten = Bezugspreis.
2. Zielverkaufspreis — 90 % более высокого Listenverkaufspreis, поэтому `ZVP/0,90`.
3. `8 000×1,20 = 9 600 €`.
4. `−12 h`; `−12/120×100 = −10 %`, то есть 10 % Minderaufwand.
5. Sachlich, rechnerisch, formal, organisatorisch.
6. Falschlieferung — другой товар; Minderlieferung — правильный вид, но недостаточное количество.

</details>

## 9. Quellen und Abgleich

- BIBB-Umsetzungshilfe: Beschaffung, Wirtschaftlichkeit, Leistungserbringung.
- HGB и BGB, особенно Kaufvertrag, Mängelrechte и Verzug; это не индивидуальная Rechtsberatung.
- UStG для налоговой классификации; в задаче использовать заданный Satz.
- WBS-Kursinhalt erweiterte Handelskalkulation; подтверждено 11.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Использует ли WBS Kalkulationszuschlag, Handelsspanne или Kalkulationsfaktor?
- От какой Basis курс считает Vertreterprovision?
- Какое Rundungsregel применяется в WBS-Musterlösungen?
