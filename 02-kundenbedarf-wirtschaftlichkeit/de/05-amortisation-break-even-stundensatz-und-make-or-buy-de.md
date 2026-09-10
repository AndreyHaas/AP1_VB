---
pruefung: AP1
thema: Amortisation, Break-even, Stundensatz und Make-or-Buy
prioritaet: Vertiefung
status: Entwurf
stand: 2026-09-10
sprache: Deutsch
gegenstueck: ../ru/05-amortisation-break-even-stundensatz-und-make-or-buy-ru.md
---

# AP1: Amortisation, Break-even, Stundensatz und Make-or-Buy

Eine Wirtschaftlichkeitsrechnung ist nur dann nützlich, wenn ihre Formel die gestellte Frage beantwortet. Die `Amortisation` beschreibt die Rückflussdauer einer Investition, der `Break-even` die Grenze zwischen Verlust und Gewinn, der `Deckungsbeitrag` den Beitrag einer Einheit zur Deckung fixer Kosten und der `Stundensatz` die Kosten oder den Preis einer produktiven Stunde. Diese Kennzahlen sind nicht austauschbar.

Leitgedanke:

> Zuerst werden Entscheidungsfrage, relevante Zahlungs- oder Kostengrößen, Zeitraum und Einheiten festgelegt. Nach der Berechnung wird das Ergebnis anhand seiner Annahmen, Grenzen, Qualität, Risiken und verfügbaren Ressourcen bewertet.

---

## 1. Lernziele

Nach der Bearbeitung dieses Kapitels solltest du:

- `Umsatz`, `variable Kosten`, `Fixkosten`, `Deckungsbeitrag` und `Gewinn` unterscheiden;
- Stückdeckungsbeitrag und Gesamtdeckungsbeitrag berechnen;
- `Break-even-Menge` und `Break-even-Umsatz` bestimmen;
- die erforderliche Absatzmenge für einen Zielgewinn berechnen;
- die Gewinnschwelle interpretieren und nicht nur Zahlen einsetzen;
- bei mehreren Produkten oder knapper Kapazität die geeignete Methode wählen;
- `Make` und `Buy` anhand entscheidungsrelevanter Kosten vergleichen;
- Qualität, Know-how, Datenschutz, Abhängigkeit und Kapazität einbeziehen;
- `sunk costs`, entscheidungsrelevante Kosten und Opportunitätskosten unterscheiden;
- Zweck und Grenzen der `Amortisationsrechnung` erläutern;
- die statische Amortisationsdauer bei gleichmäßigen Rückflüssen berechnen;
- die Amortisation bei ungleichmäßigen Zahlungsüberschüssen bestimmen;
- Gewinn, Abschreibung, Einsparung und Zahlungsüberschuss nicht unbegründet gleichsetzen;
- Kauf, Miete und Leasing über einen einheitlichen Zeitraum vergleichen;
- einen internen Kostenstundensatz und einen externen Verrechnungssatz berechnen;
- realistische produktive Stunden bestimmen;
- Gewinnzuschlag und Gewinnmarge unterscheiden;
- die Ergebnisse mit TCO und Nutzwertanalyse aus dem vorherigen Kapitel verbinden;
- eine nachprüfbare Empfehlung mit Bedingungen formulieren.

---

## 2. Prüfungsrahmen und Status Vertiefung

§ 9 `FIAusbV` verlangt, Hard- und Software auszuwählen und ihre Beschaffung einzuleiten. Der `Ausbildungsrahmenplan` verlangt, IT-Systeme nach `Leistungsfähigkeit` und `Wirtschaftlichkeit` zu beurteilen, Angebote einzuholen und zu bewerten sowie Konditionen zu vergleichen.

Damit ist die wirtschaftliche Bewertung einer Lösung zuverlässig begründet. Aus der allgemeinen öffentlichen Formulierung folgt jedoch nicht, dass jede AP1 zwingend sämtliche Verfahren dieses Kapitels prüft.

Deshalb gilt:

- `Amortisation`, `Break-even`, `Deckungsbeitrag` und `Stundensatz` dienen als vertiefte Rechenvorbereitung;
- die genaue Tiefe muss mit dem aktuellen `Prüfungskatalog` und der WBS abgestimmt werden;
- die Methoden sind besonders für gemischte praxisbezogene Aufgaben geeignet;
- sie schaffen außerdem eine Grundlage für eine spätere Wirtschaftlichkeitsbetrachtung im Projekt;
- dieses Kapitel baut noch keinen separaten AP2-Bereich auf.

Kapitel 06 hat bereits Bezugspreis, TCO und Nutzwertanalyse behandelt. Rabatt und Skonto werden hier nicht erneut berechnet, wenn sie in der vorgegebenen Investition bereits enthalten sind.

---

## 3. Auswahl der passenden Methode

| Entscheidungsfrage | Geeignete Methode |
|---|---|
| Welche Gesamtkosten entstehen über drei Jahre? | TCO |
| Welche Alternative erfüllt qualitative Kriterien besser? | Nutzwertanalyse |
| Bei welcher Menge endet der Verlust? | Break-even-Analyse |
| Welchen Beitrag liefert eine verkaufte Einheit? | Stückdeckungsbeitrag |
| Nach wie vielen Jahren fließt die Investition zurück? | Amortisationsrechnung |
| Intern erstellen oder extern beziehen? | Make-or-Buy-Vergleich |
| Welchen Preis muss eine produktive Stunde tragen? | Stundensatzkalkulation |
| Welcher Gewinn steht dem eingesetzten Kapital gegenüber? | Rentabilitätsrechnung |

Eine falsche Methode kann eine mathematisch korrekte, aber sachlich unbrauchbare Zahl erzeugen.

Beispiel:

> Dreijährige Gesamtkosten lassen sich nicht allein anhand der Amortisationsdauer vergleichen. Sie beschreibt die Rückflussgeschwindigkeit, nicht die gesamten Kosten oder den qualitativen Nutzen.

---

## 4. Bezeichnungen und Einheiten

Vor der Berechnung sollten die verwendeten Größen notiert werden:

| Zeichen | Bedeutung | Einheit |
|---|---|---|
| `p` | Verkaufspreis je Einheit | €/Stück |
| `k_v` | variable Kosten je Einheit | €/Stück |
| `K_f` | fixe Kosten der Periode | €/Periode |
| `x` | Menge | Stück/Periode |
| `U` | Umsatz | €/Periode |
| `DB` | Deckungsbeitrag | € |
| `G` | Gewinn | €/Periode |
| `I_0` | Anfangsinvestition | € |
| `R` | jährlicher Rückfluss | €/Jahr |
| `t_A` | Amortisationsdauer | Jahre |
| `h_p` | produktive Stunden | h/Jahr |

Alle Größen müssen sich auf einen einheitlichen Zeitraum beziehen.

Folgende Addition ist unzulässig:

```text
monatliche Kosten + jährlicher Umsatz
```

bis beide Werte auf dieselbe Periode umgerechnet wurden.

---

## 5. Umsatz, Kosten und Gewinn

Für ein einzelnes Produkt gilt:

```text
Umsatz U = Preis p × Menge x
Variable Gesamtkosten K_v = variable Stückkosten k_v × Menge x
Gesamtkosten K = Fixkosten K_f + variable Gesamtkosten K_v
Gewinn G = Umsatz U − Gesamtkosten K
```

Damit:

```text
G = p × x − (K_f + k_v × x)
```

Bei `G < 0` entsteht ein Verlust. Bei `G = 0` liegt der Break-even vor. Bei `G > 0` wird ein Gewinn erzielt.

Der Begriff `Umsatz` bedeutet nicht Gewinn. Aus den Erlösen müssen variable und fixe Kosten noch gedeckt werden.

---

## 6. Fixe und variable Kosten im Modell

### Fixkosten

Sie hängen innerhalb des betrachteten Bereichs nicht von der Menge ab:

- Miete;
- jährlicher Basis-Support;
- feste Entwicklungskosten;
- Server-Grundgebühr;
- Abschreibungs- oder Kapitalkosten innerhalb des Periodenmodells.

### Variable Kosten

Sie verändern sich mit der Menge:

- Material je Gerät;
- Lizenz je Benutzer;
- Versand je Einheit;
- Transaktionsgebühr;
- auftragsabhängige Arbeitszeit.

### Gültigkeitsbereich

Fixkosten sind nur im relevanten Beschäftigungsbereich konstant.

Beispiel:

> Bis 500 Kunden genügt ein Server. Ab dem 501. Kunden wird ein zweiter Server benötigt. An dieser Stelle entstehen Sprungfixkosten.

Die lineare Break-even-Formel bildet diesen Sprung ohne Anpassung nicht ab.

---

## 7. Stückdeckungsbeitrag

Der `Stückdeckungsbeitrag` zeigt, welcher Betrag nach Deckung der variablen Kosten einer Einheit zur Deckung der Fixkosten und anschließend zum Gewinn beiträgt.

```text
db = Verkaufspreis p − variable Stückkosten k_v
```

Beispiel:

```text
p = 1.200 €
k_v = 720 €
db = 1.200 € − 720 € = 480 € je Stück
```

Interpretation:

> Jedes zusätzlich verkaufte und erbrachte Gerät trägt innerhalb des Modells 480 € zur Deckung der Fixkosten bei. Nach vollständiger Fixkostendeckung erhöht dieser Betrag den Gewinn.

Ist `db ≤ 0`, kann eine höhere Absatzmenge die Fixkosten im linearen Modell nicht decken. Dann müssen Preis oder variable Kosten überprüft werden.

---

## 8. Gesamtdeckungsbeitrag und Betriebsergebnis

```text
Gesamtdeckungsbeitrag DB = Stückdeckungsbeitrag db × Menge x
Betriebsergebnis G = Gesamtdeckungsbeitrag DB − Fixkosten K_f
```

Für 260 Einheiten:

```text
DB = 480 € × 260 = 124.800 €
G = 124.800 € − 96.000 € = 28.800 €
```

Kontrolle über die vollständige Formel:

```text
U = 1.200 € × 260 = 312.000 €
K_v = 720 € × 260 = 187.200 €
G = 312.000 € − 187.200 € − 96.000 € = 28.800 €
```

Beide Rechenwege müssen dasselbe Ergebnis liefern.

---

## 9. Break-even-Point

Am `Break-even-Point`, an der `Gewinnschwelle` oder am `Kostendeckungspunkt` gilt:

```text
Umsatz = Gesamtkosten
Gewinn = 0
Gesamtdeckungsbeitrag = Fixkosten
```

Unterhalb des Break-even zeigt das lineare Modell einen Verlust, oberhalb einen Gewinn.

Break-even bedeutet nicht:

- Rückfluss einer Anfangsinvestition im Zeitverlauf;
- positiver Zahlungsstrom zu jedem Zeitpunkt;
- hoher Gewinn;
- ausreichende Liquidität;
- Erfüllung qualitativer Anforderungen.

Er bezeichnet eine Ergebnisgrenze für eine bestimmte Periode und festgelegte Annahmen.

---

## 10. Break-even-Menge

Aus `Gewinn = 0` folgt:

```text
p × x − k_v × x − K_f = 0
(p − k_v) × x = K_f
x_BE = K_f / (p − k_v)
x_BE = K_f / db
```

Beispiel:

```text
K_f = 96.000 € pro Jahr
db = 480 € je Stück
x_BE = 96.000 € / 480 € = 200 Stück
```

Ergibt die Berechnung 200,2 Einheiten, muss bei unteilbaren Produkten normalerweise aufgerundet werden:

```text
201 Stück
```

Eine Abrundung würde das Unternehmen unterhalb der Gewinnschwelle belassen.

---

## 11. Vollständiger Break-even-Praxisfall

Ein Unternehmen konfiguriert und verkauft IT-Appliances.

Gegeben:

- Verkaufspreis: 1.200 € je Stück;
- variable Hardware-, Lizenz- und Rolloutkosten: 720 € je Stück;
- jährliche Fixkosten: 96.000 €;
- erwartete Absatzmenge: 260 Stück.

### 1. Stückdeckungsbeitrag

```text
db = 1.200 € − 720 € = 480 €
```

### 2. Break-even-Menge

```text
x_BE = 96.000 € / 480 € = 200 Stück
```

### 3. Ergebnis bei 260 Stück

```text
DB = 260 × 480 € = 124.800 €
G = 124.800 € − 96.000 € = 28.800 €
```

### 4. Sicherheitsabstand

```text
260 − 200 = 60 Stück
```

Die Absatzmenge kann um 60 Stück sinken, bevor die Gewinnschwelle erreicht wird.

In Prozent der Planmenge:

```text
60 / 260 × 100 % = 23,08 %
```

---

## 12. Absatzmenge für einen Zielgewinn

Wird ein bestimmter Gewinn verlangt:

```text
x = (Fixkosten + Zielgewinn) / Stückdeckungsbeitrag
```

Für einen Zielgewinn von 24.000 €:

```text
x = (96.000 € + 24.000 €) / 480 €
x = 120.000 € / 480 €
x = 250 Stück
```

Kontrolle:

```text
250 × 480 € − 96.000 € = 24.000 €
```

Bei einem nicht ganzzahligen Ergebnis wird üblicherweise aufgerundet, wenn nur ganze Einheiten verkauft werden können.

---

## 13. Break-even-Umsatz

Die `Deckungsbeitragsquote` lautet:

```text
DB-Quote = Stückdeckungsbeitrag / Verkaufspreis
```

Im Beispiel:

```text
DB-Quote = 480 € / 1.200 € = 0,40 = 40 %
```

Der Break-even-Umsatz:

```text
U_BE = Fixkosten / DB-Quote
U_BE = 96.000 € / 0,40
U_BE = 240.000 €
```

Kontrolle:

```text
200 Stück × 1.200 € = 240.000 €
```

Bei der Berechnung darf für 40 % nicht die Zahl 40 anstelle der Dezimalzahl 0,40 eingesetzt werden.

---

## 14. Grafische Interpretation

In einem klassischen Diagramm:

- zeigt die x-Achse die Absatzmenge;
- zeigt die y-Achse Kosten und Erlöse;
- verläuft die Fixkostenlinie horizontal;
- beginnt die Gesamtkostenlinie bei den Fixkosten und steigt je Einheit um `k_v`;
- beginnt die Umsatzlinie im Ursprung und steigt je Einheit um `p`;
- liegt der Break-even am Schnittpunkt von Umsatz- und Gesamtkostenlinie.

Vor dem Schnittpunkt:

```text
Gesamtkosten > Umsatz
```

Nach dem Schnittpunkt:

```text
Umsatz > Gesamtkosten
```

Ist `p ≤ k_v`, kann die Umsatzlinie die Gesamtkostenlinie im einfachen linearen Modell nicht dauerhaft überholen.

---

## 15. Annahmen der einfachen Break-even-Analyse

Das einfache Modell unterstellt:

- einen konstanten Verkaufspreis je Einheit;
- konstante variable Kosten je Einheit;
- unveränderte Fixkosten;
- Übereinstimmung von produzierter und verkaufter Menge;
- ein Produkt oder einen konstanten Produktmix;
- keine Kapazitätsgrenze innerhalb des betrachteten Bereichs;
- einen einheitlichen Zeitraum;
- eine ausreichend belastbare Absatzprognose.

In der Realität können auftreten:

- Mengenrabatte;
- Überstundenzuschläge;
- Sprungfixkosten;
- Preisänderungen;
- Rücksendungen;
- Saisonalität;
- unterschiedliche Tarife;
- begrenzte Kapazität.

Das Ergebnis ist daher als Modellwert und nicht als Garantie zu bezeichnen.

---

## 16. Mehrere Produkte

Verkauft ein Unternehmen mehrere Produkte mit unterschiedlichen Deckungsbeiträgen, beschreibt folgende einfache Rechnung den gesamten Break-even nicht:

```text
Fixkosten / Deckungsbeitrag eines Produkts
```

Mögliche Vorgehensweisen:

- getrennte Berechnung, wenn Fixkosten eindeutig trennbar sind;
- gewichteter durchschnittlicher Deckungsbeitrag bei stabilem Absatzmix;
- softwaregestützte Szenarioanalyse;
- Optimierung nach einem Engpassfaktor.

Beispiel für einen Absatzmix:

> Auf zwei Basic-Lizenzen entfällt eine Premium-Lizenz.

Dann kann ein Paket im Verhältnis 2:1 gebildet und dessen Deckungsbeitrag berechnet werden. Ändert sich der Mix, verändert sich auch der Break-even.

---

## 17. Engpassfaktor

Ist eine Ressource begrenzt, muss neben dem Deckungsbeitrag je Stück auch der Deckungsbeitrag je Engpasseinheit betrachtet werden.

```text
relativer Deckungsbeitrag =
Stückdeckungsbeitrag / benötigte Engpasseinheiten
```

Beispiel:

| Leistung | db je Auftrag | Adminzeit | db je Adminstunde |
|---|---:|---:|---:|
| Standard-Rollout | 300 € | 5 h | 60 €/h |
| Spezial-Rollout | 420 € | 10 h | 42 €/h |

Bei knapper Adminzeit liefert der Standard-Rollout einen höheren Beitrag je Stunde, obwohl der Deckungsbeitrag je Auftrag beim Spezial-Rollout höher ist.

Diese Priorisierung darf nicht mechanisch angewendet werden, wenn Vertragsverpflichtungen, strategische Ziele oder andere in der Aufgabe genannte Einschränkungen entgegenstehen.

---

## 18. Make-or-Buy: Grundfrage

`Make-or-Buy` vergleicht:

- `Make`: Eigenfertigung, Eigenentwicklung oder Eigenbetrieb;
- `Buy`: Fremdbezug eines Produkts oder einer Dienstleistung.

IT-Beispiele:

- eigene Anwendungsentwicklung oder SaaS;
- eigener Helpdesk oder Managed Service;
- lokale Infrastruktur oder Cloud-Service;
- interner Rollout oder Dienstleister;
- eigene Backup-Plattform oder externer Dienst.

Die Entscheidung ist nicht nur eine Preisfrage. Sie betrifft:

- strategisches Know-how;
- Kontrolle;
- Datenschutz;
- Informationssicherheit;
- Skalierbarkeit;
- Zeit;
- Qualität;
- Abhängigkeit;
- Reversibilität;
- verfügbare Kapazität.

---

## 19. Make-or-Buy-Kostenvergleich

Beispiel:

### Make

```text
K_Make(x) = 8.000 € + 65 € × x
```

8.000 € stehen für einmalige Einrichtung und Tooling, 65 €/h für entscheidungsrelevante variable interne Kosten.

### Buy

```text
K_Buy(x) = 105 € × x
```

Indifferenzpunkt:

```text
8.000 € + 65 €x = 105 €x
8.000 € = 40 €x
x = 200 Stunden
```

Ergebnis:

- Unter 200 Stunden ist Buy günstiger.
- Bei 200 Stunden sind die Kosten gleich.
- Über 200 Stunden ist Make günstiger.
- Dies gilt nur im festgelegten Bereich und bei ausreichender interner Kapazität.

---

## 20. Make-or-Buy bei 320 Stunden

```text
K_Make(320) = 8.000 € + 65 € × 320
K_Make(320) = 28.800 €

K_Buy(320) = 105 € × 320
K_Buy(320) = 33.600 €

Differenz = 33.600 € − 28.800 € = 4.800 €
```

Rein nach den entscheidungsrelevanten Kosten ist Make um 4.800 € günstiger.

Vollständige Begründung:

> Bei einem Umfang von 320 Stunden verursacht Make nach dem vorgegebenen Modell Kosten von 28.800 €, während Buy 33.600 € kostet. Make ist damit rechnerisch um 4.800 € günstiger. Die Eigenleistung ist jedoch nur vorzuziehen, wenn die erforderliche Kapazität, Kompetenz und termingerechte Umsetzung intern gesichert sind und keine höherwertige alternative Verwendung der Ressourcen verdrängt wird.

---

## 21. Entscheidungsrelevante Kosten und sunk costs

Für eine Entscheidung werden zukünftige Kosten berücksichtigt, die sich zwischen den Alternativen unterscheiden und durch die Entscheidung verursacht werden.

### Entscheidungsrelevante Kosten

- zusätzliche Personalkosten;
- neue Lizenz;
- externer Angebotspreis;
- vermeidbare Wartung;
- zusätzliche Infrastrukturkosten;
- tatsächlich freisetzbare Ressourcen.

### Sunk Costs

`Sunk Costs` sind bereits entstanden und werden durch die aktuelle Entscheidung nicht mehr verändert.

Beispiel:

> Für einen abgebrochenen Prototyp wurden bereits 12.000 € ausgegeben. Dieser Betrag darf nicht automatisch zur Fortsetzung einer unwirtschaftlichen Lösung zwingen.

### Vorsicht bei Fixkosten

Wird das Gehalt einer Person in beiden Alternativen weitergezahlt und kann freie Zeit nicht anders eingesetzt werden, verändert es möglicherweise den kurzfristigen Zahlungsmittelvergleich nicht. Für langfristige Vollkostenrechnung, Kapazitätsplanung oder Preisbildung können die Personalkosten dennoch relevant sein.

Perspektive und Zeitraum müssen genannt werden.

---

## 22. Opportunitätskosten

`Opportunitätskosten` sind der entgangene Vorteil der besten verworfenen Alternative.

Beispiel:

- Das interne Team kann die Migration durchführen.
- Dadurch kann es eine abrechenbare Funktion nicht ausliefern.
- Der entgangene Deckungsbeitrag dieser Funktion beträgt 9.000 €.

Auch wenn direkte interne Auszahlungen unverändert bleiben, besitzt die gebundene Kapazität einen wirtschaftlichen Wert.

In einer Lernaufgabe werden Opportunitätskosten berücksichtigt, wenn:

- sie angegeben sind;
- sie belastbar ermittelt werden können;
- eine wirtschaftliche und nicht nur buchhalterische Entscheidung verlangt wird.

Ein beliebiger Betrag darf ohne Datengrundlage nicht erfunden werden.

---

## 23. Qualitative Make-or-Buy-Kriterien

| Kriterium | Frage |
|---|---|
| Kernkompetenz | Muss das Wissen im Unternehmen erhalten bleiben? |
| Kapazität | Stehen tatsächlich freie Fachkräfte zur Verfügung? |
| Termin | Welche Alternative hält den Termin verlässlich ein? |
| Qualität | Wer gewährleistet das geforderte Niveau und geeignete Nachweise? |
| Datenschutz | Darf der externe Anbieter die Daten rechtmäßig und sicher verarbeiten? |
| IT-Sicherheit | Wie werden Zugänge, Geheimnisse und Lieferkette kontrolliert? |
| Abhängigkeit | Entsteht ein Vendor Lock-in? |
| Skalierung | Welche Alternative kann an den Umfang angepasst werden? |
| Reversibilität | Können Lösung und Daten später migriert werden? |
| Haftung/SLA | Welche vertraglichen Zusagen und Störungsreaktionen gelten? |

Kosten können mit TCO, qualitative Kriterien mit einer Nutzwertanalyse betrachtet werden. Die Entscheidung verbindet die Methoden, ohne deren Einheiten zu vermischen.

---

## 24. Bedeutung der Amortisation

Die `Amortisationsdauer` zeigt, nach welcher Zeit eine Anfangsinvestition durch die zugehörigen Rückflüsse gedeckt ist.

Leitfrage:

> Nach welchem Zeitraum entspricht der kumulierte Rückfluss der ursprünglichen Investition?

Je kürzer die Dauer:

- desto früher fließt das Kapital zurück;
- desto kürzer ist der Zeitraum der Unsicherheit;
- aber desto höher sind nicht zwangsläufig Gesamtgewinn oder Nutzen.

Amortisation ist nicht gleichbedeutend mit:

- Break-even-Menge;
- TCO;
- Rentabilität;
- bilanzieller Abschreibungsdauer;
- technischer Lebensdauer.

---

## 25. Statische Amortisationsformel

Bei einem gleichmäßigen jährlichen Rückfluss:

```text
Amortisationsdauer t_A =
Anfangsinvestition I_0 / jährlicher Rückfluss R
```

Gibt die Aufgabe jährliche Einsparung und zusätzliche Betriebskosten vor:

```text
R = jährliche Einsparung − zusätzliche jährliche Auszahlungen
```

Beispiel:

```text
I_0 = 48.000 €
jährliche Einsparung = 22.000 €
zusätzliche Betriebsauszahlungen = 6.000 €
R = 16.000 € pro Jahr
t_A = 48.000 € / 16.000 € = 3 Jahre
```

Antwort:

> Die Investition amortisiert sich unter den angegebenen konstanten Annahmen nach drei Jahren.

---

## 26. Rückfluss, Gewinn, Einsparung und Abschreibung

Hier liegt eine besonders häufige Fehlerquelle.

Je nach schulischem Schema kann gelten:

```text
Rückfluss = Gewinn + Abschreibung
```

wenn ein buchhalterischer Gewinn nach Abschreibung vorgegeben ist und daraus ein angenäherter Zahlungsrückfluss abgeleitet werden soll.

Bei einem Einsparprojekt kann dagegen vorgegeben sein:

```text
Rückfluss = vermiedene Auszahlungen − zusätzliche Auszahlungen
```

Nicht zulässig ist:

- die Investition automatisch durch den Umsatz zu teilen;
- jeden Gewinn vollständig als Zahlungsstrom zu behandeln;
- Kaufpreis und Abschreibung als zwei Auszahlungen zu erfassen;
- einen vorgegebenen Rückfluss ohne Prüfung durch Einsparung zu ersetzen;
- Abschreibung zu addieren, obwohl die Aufgabe bereits einen Cashflow nennt.

Regel:

> Zuerst muss geklärt werden, welche Bedeutung jede vorgegebene Größe in der Aufgabe besitzt.

---

## 27. Vollständiger Amortisations-Praxisfall

Ein Unternehmen erwägt die Automatisierung seiner Ticketbearbeitung.

Gegeben:

- Einführung und Lizenzerwerb: 48.000 €;
- Arbeitszeitersparnis: 1.100 Stunden pro Jahr;
- entscheidungsrelevanter Stundensatz: 20 €;
- zusätzlicher Betrieb und Support: 6.000 € pro Jahr;
- gleichmäßige Wirkung;
- keine Berücksichtigung des Zeitwerts des Geldes.

### 1. Bruttoeinsparung

```text
1.100 h × 20 €/h = 22.000 € pro Jahr
```

### 2. Netto-Rückfluss

```text
22.000 € − 6.000 € = 16.000 € pro Jahr
```

### 3. Amortisationsdauer

```text
48.000 € / 16.000 € = 3 Jahre
```

### 4. Interpretation

Das Ergebnis gilt nur, wenn:

- 1.100 Stunden tatsächlich eingespart werden;
- die freigesetzte Zeit wirtschaftlich genutzt werden kann;
- 20 €/h ein relevanter Wert sind;
- die Betriebskosten nicht steigen;
- das System ausreichend lange verwendet wird;
- keine wesentlichen Folgeinvestitionen fehlen.

---

## 28. Ungleichmäßige Rückflüsse

Unterscheiden sich die jährlichen Rückflüsse, kann eine einfache Division durch einen Durchschnitt die zeitliche Verteilung verdecken. Die Beträge werden kumuliert.

Beispiel:

| Jahr | Rückfluss | kumuliert |
|---:|---:|---:|
| 0 | −65.000 € | −65.000 € |
| 1 | +18.000 € | −47.000 € |
| 2 | +24.000 € | −23.000 € |
| 3 | +28.000 € | +5.000 € |
| 4 | +16.000 € | +21.000 € |

Die Amortisation erfolgt im dritten Jahr.

Vor Beginn des dritten Jahres fehlen:

```text
65.000 € − 18.000 € − 24.000 € = 23.000 €
```

Bei einem gleichmäßig innerhalb des dritten Jahres anfallenden Rückfluss:

```text
23.000 € / 28.000 € = 0,8214 Jahre
t_A ≈ 2,82 Jahre
```

Die Interpolation innerhalb des Jahres ist eine Annahme. Erfolgt die Zahlung ausschließlich am Jahresende, darf keine Amortisation nach 2,82 Jahren behauptet werden.

---

## 29. Grenzen der Amortisationsrechnung

Die einfache statische Amortisationsrechnung:

- ignoriert Zahlungsströme nach dem Amortisationszeitpunkt;
- berücksichtigt den Zeitwert des Geldes normalerweise nicht;
- misst nicht den gesamten Gewinn;
- bewertet keine Qualität;
- hängt von prognostizierten Rückflüssen ab;
- kann einen zu kurzen Betrachtungshorizont begünstigen;
- ersetzt keine Risikoanalyse;
- weist keine ausreichende Liquidität nach.

Beispiel:

- Projekt A amortisiert sich nach zwei Jahren und erzeugt danach nur geringe Vorteile.
- Projekt B amortisiert sich nach drei Jahren und liefert danach wesentlich höhere Vorteile.

Nach der Amortisationsdauer wirkt A besser. Über den vollständigen Lebenszyklus kann B trotzdem wirtschaftlicher sein.

---

## 30. Rentabilität und ROI

Eine vereinfachte Formel lautet:

```text
Rentabilität = Gewinn / eingesetztes Kapital × 100 %
```

Beispiel:

```text
durchschnittlicher Jahresgewinn = 12.000 €
eingesetztes Kapital = 48.000 €
Rentabilität = 12.000 € / 48.000 € × 100 % = 25 %
```

Als Bezugsgröße können jedoch verwendet werden:

- Anfangskapital;
- durchschnittlich gebundenes Kapital;
- Gesamtkapital;
- Eigenkapital;
- Investitionskosten;
- ein ausdrücklich definierter ROI.

Gibt die Aufgabe eine Formel vor, ist diese anzuwenden. Andernfalls muss die verwendete Bezugsgröße benannt werden.

Eine Rentabilität von 25 % bedeutet nicht automatisch eine Amortisation nach genau vier Jahren, wenn Gewinn und Rückfluss unterschiedlich definiert sind.

---

## 31. Kauf, Miete und Leasing

### Kauf

- Der Käufer erwirbt üblicherweise Eigentum.
- Es entsteht ein hoher anfänglicher Zahlungsmittelabfluss.
- Ein Restwert kann vorhanden sein.
- Obsoleszenz- und Entsorgungsrisiken liegen beim Eigentümer.
- Die Nutzungsfreiheit hängt weiterhin von Lizenzen und Vertrag ab.

### Miete

- Zeitlich begrenzte Nutzung gegen Entgelt.
- Das Eigentum verbleibt üblicherweise beim Vermieter.
- Eine höhere Flexibilität kann möglich sein.
- Wartung kann enthalten sein.
- Eine lange Nutzung kann insgesamt teurer werden.

### Leasing

- Langfristige Nutzungsüberlassung zu vertraglichen Bedingungen.
- Sonderzahlung, Laufzeit, Raten und Rückgabe können vereinbart sein.
- Eigentum geht nicht automatisch über.
- Die Folgen hängen vom konkreten Vertrag ab.
- Ein vorzeitiger Ausstieg kann eingeschränkt oder teuer sein.

Leasing ist nicht automatisch billiger, steuerlich immer günstiger oder zwingend mit einem späteren Kauf verbunden.

---

## 32. Vergleich von Kauf, Miete und Leasing

Verglichen werden dieselbe Leistungsanforderung und ein einheitlicher Zeitraum von 36 Monaten. Alle Werte sind netto; der Zeitwert des Geldes bleibt unberücksichtigt.

### Kauf

```text
Kaufpreis                 36.000 €
Einrichtung                2.000 €
Wartung 3 × 2.400 €        7.200 €
Restwert                  −6.000 €
Gesamtkosten              39.200 €
```

### Miete

```text
Bereitstellung               800 €
36 × 1.150 €              41.400 €
Rückgabe                     500 €
Gesamtkosten              42.700 €
```

### Leasing

```text
Sonderzahlung              3.000 €
36 × 950 €                34.200 €
Wartung 3 × 1.200 €        3.600 €
Rückgabe                     600 €
Gesamtkosten              41.400 €
```

In diesem vereinfachten Modell ist der Kauf günstiger:

- um 2.200 € gegenüber Leasing;
- um 3.500 € gegenüber Miete.

Die Entscheidung hängt zusätzlich von Liquidität, Obsoleszenzrisiko, Flexibilität, Serviceumfang und Belastbarkeit des Restwerts ab.

---

## 33. Fallen bei Kauf, Miete und Leasing

Für einen korrekten Vergleich sind zu prüfen:

- einheitlicher Zeitraum;
- gleiche Menge und Qualität;
- enthaltene Leistungen;
- Wartung und Versicherung;
- Sonderzahlungen;
- Gebühren;
- Liefer- und Rückgabekosten;
- Restwert oder Kaufoption;
- Nutzungs- oder Schadensregeln;
- Vertragsbindung;
- Kündigung;
- steuerliche und bilanzielle Behandlung;
- Zeitwert des Geldes;
- Netto-/Brutto-Basis.

In der AP1 genügt üblicherweise eine Berechnung anhand der gegebenen Daten und ein qualitativer Vergleich. Ein realer Vertrag erfordert professionelle rechtliche und steuerliche Prüfung.

---

## 34. Bedeutung des Stundensatzes

Der Begriff kann unterschiedliche Größen bezeichnen.

### Kostenstundensatz

Interne Kosten einer produktiven Stunde:

```text
Kostenstundensatz =
relevante Jahreskosten / produktive Stunden
```

### Verrechnungssatz

Satz, mit dem Zeit intern zwischen Kostenstellen oder Projekten verrechnet wird.

### Angebotspreis oder externer Stundensatz

Preis, der einem Kunden berechnet wird. Er kann enthalten:

- Selbstkosten;
- Risiko;
- Gewinn;
- Marktanpassung;
- gegebenenfalls Umsatzsteuer.

Die Aussage „Eine Mitarbeiterstunde kostet 30 €“ ist deshalb ohne Definition unvollständig.

---

## 35. Vollständige Personalkosten

Das Bruttogehalt ist nur ein Teil der Arbeitgeberkosten.

In das Modell können einfließen:

- Bruttolohn oder Bruttogehalt;
- Arbeitgeberanteile;
- Sonderzahlungen;
- Urlaubsgeld;
- Weiterbildung;
- Recruiting;
- Arbeitsplatz;
- Hardware und Software;
- Verwaltung;
- Führung;
- Büro;
- Versicherung;
- Ausfallzeiten.

Welche Positionen einzubeziehen sind, hängt vom Zweck ab:

- kurzfristiger Entscheidungsvergleich;
- langfristige Vollkostenrechnung;
- interner Verrechnungssatz;
- externer Angebotspreis.

Ein Gemeinkostenblock darf nicht doppelt addiert werden.

---

## 36. Produktive Stunden

Bezahlte Arbeitszeit ist nicht identisch mit der tatsächlich abrechenbaren oder leistungserzeugenden Zeit.

Von möglichen Arbeitstagen werden abgezogen:

- Urlaub;
- Feiertage, wenn sie noch nicht ausgeschlossen sind;
- Krankheit als Planannahme;
- Weiterbildung;
- interne Besprechungen;
- Administration;
- Vertrieb;
- Angebotsarbeit;
- Zeiten ohne Auftrag;
- technische Störungen.

Beispiel:

```text
250 mögliche Arbeitstage
− 30 Urlaubstage
− 15 Tage Krankheit und Weiterbildung
− 25 Tage interne Aufgaben und Vertrieb
= 180 produktive Tage

180 Tage × 7,5 h = 1.350 produktive Stunden
```

Jeder Abzug muss zur Aufgabenstellung passen. Feiertage dürfen nicht doppelt abgezogen werden, wenn die 250 Tage sie bereits nicht enthalten.

---

## 37. Vollständiger Kostenstundensatz

Jahreskosten:

| Kostenblock | Betrag |
|---|---:|
| Personalkosten | 72.000 € |
| Arbeitsplatz, Hardware, Software | 18.000 € |
| anteilige Verwaltung und Gemeinkosten | 31.500 € |
| **relevante Jahreskosten** | **121.500 €** |

Produktive Stunden:

```text
1.350 h pro Jahr
```

Kostenstundensatz:

```text
121.500 € / 1.350 h = 90,00 €/h
```

Interpretation:

> Jede produktive Stunde muss im Durchschnitt 90 € an relevanten Kosten decken, bevor ein Gewinn berücksichtigt wird.

Dies ist ein Durchschnittssatz des Modells und nicht zwangsläufig die zusätzliche Auszahlung jeder einzelnen Stunde.

---

## 38. Gewinnzuschlag und Gewinnmarge

### Gewinnzuschlag auf Selbstkosten

15 % Zuschlag auf einen Kostenstundensatz von 90 €:

```text
Angebotspreis = 90 € × 1,15 = 103,50 €/h
```

Gewinn:

```text
103,50 € − 90,00 € = 13,50 €
```

13,50 € entsprechen 15 % der Selbstkosten.

### Gewinnmarge vom Umsatz

Soll der Gewinn 15 % des Verkaufspreises betragen:

```text
Preis = Selbstkosten / (1 − Marge)
Preis = 90 € / 0,85
Preis = 105,88 €/h
```

Hier gilt:

```text
105,88 € − 90,00 € = 15,88 €
15,88 € / 105,88 € ≈ 15 %
```

Zuschlag und Marge führen zu unterschiedlichen Ergebnissen. Die Aufgabenstellung bestimmt das Verfahren.

---

## 39. Externer Stundensatz und Umsatzsteuer

Wird ein Preis für einen Kunden verlangt:

```text
Netto-Angebotspreis
+ Umsatzsteuer
= Brutto-Rechnungsbetrag
```

Bei 103,50 €/h netto und 19 %:

```text
103,50 € × 1,19 = 123,165 €
≈ 123,17 € brutto
```

Die Umsatzsteuer:

- ist kein Gewinn;
- deckt keine internen Kosten;
- wird normalerweise getrennt ausgewiesen;
- ist nach den Vorgaben und dem Steuersatz der Aufgabe anzuwenden.

Im Wirtschaftlichkeitsvergleich eines vorsteuerabzugsberechtigten Unternehmens werden häufig Nettowerte verwendet. Auf einer Rechnung für einen Endverbraucher kann der Bruttowert entscheidend sein.

---

## 40. Auslastung und Sensitivität des Stundensatzes

Bei unveränderten Jahreskosten von 121.500 €:

| Produktive Stunden | Kostenstundensatz |
|---:|---:|
| 1.500 h | 81,00 €/h |
| 1.350 h | 90,00 €/h |
| 1.200 h | 101,25 €/h |

Je weniger produktive Stunden zur Verfügung stehen, desto mehr Kosten muss eine einzelne Stunde decken.

Dies verdeutlicht ein Risiko:

- Eine zu optimistisch geplante Auslastung führt zu einem zu niedrigen Satz.
- Ein zu niedriger Satz deckt die Jahreskosten nicht.
- Ein zu hoher Satz kann am Markt nicht wettbewerbsfähig sein.

Eine Sensitivitätsanalyse sollte mindestens einen Basisfall sowie ein optimistisches und ein vorsichtiges Szenario prüfen.

---

## 41. Verbindung von Stundensatz und Make-or-Buy

In einer Make-or-Buy-Entscheidung darf nicht automatisch Folgendes verglichen werden:

```text
Bruttogehalt je Stunde
mit
externem Verkaufspreis je Stunde
```

Zu bestimmen sind:

- entscheidungsrelevanter interner Grenzkostensatz;
- Vollkostenstundensatz;
- verfügbare Kapazität;
- Opportunitätskosten;
- enthaltene Leistungen des externen Anbieters;
- Risiko und Qualität.

Eine kurzfristige Entscheidung bei freier Kapazität kann zusätzliche relevante Kosten verwenden. Eine langfristige strategische Entscheidung erfordert üblicherweise Vollkosten und den Kapazitätseffekt.

Eine gute Antwort benennt die gewählte Perspektive.

---

## 42. Verbindung der Methoden

| Methode | Messgröße | Kein Nachweis für |
|---|---|---|
| Bezugspreis | Kosten des Warenbezugs | Betriebskosten |
| TCO | Lebenszykluskosten | qualitativen Nutzen |
| Nutzwertanalyse | bewerteten Nutzen | Einhaltung des Budgets |
| Deckungsbeitrag | Beitrag zu Fixkosten und Gewinn | Rückfluss einer Investition im Zeitverlauf |
| Break-even | Menge oder Umsatz bei Gewinn = 0 | gesamten Lebenszyklusgewinn |
| Amortisation | Rückflussdauer einer Investition | Gesamtvorteil nach der Amortisation |
| Rentabilität | Ergebnis im Verhältnis zum Kapital | Liquidität |
| Stundensatz | Kosten oder Preis einer Stunde | verfügbare Kapazität und Qualität |

Eine vertiefte Entscheidung kann mehrere Methoden nacheinander einsetzen. Jedes Ergebnis bleibt dennoch eine eigenständige Größe.

---

## 43. Vollständiger integrierter Praxisfall

Ein Unternehmen entscheidet, ob 320 Stunden Migrationsarbeit intern oder durch einen Dienstleister ausgeführt werden.

### Make

- Einrichtung: 8.000 €;
- entscheidungsrelevanter Satz: 65 €/h;
- erwarteter Umfang: 320 h;
- verfügbare interne Kapazität: vorläufig bestätigt.

### Buy

- 105 €/h;
- Einrichtung enthalten;
- SLA und Datenschutzvertrag noch zu prüfen.

### Kostenrechnung

```text
Make = 8.000 € + 320 × 65 € = 28.800 €
Buy = 320 × 105 € = 33.600 €
Vorteil Make = 4.800 €
```

### Indifferenzpunkt

```text
8.000 € / (105 € − 65 €) = 200 h
```

### Entscheidung

Bei 320 Stunden besitzt Make einen rechnerischen Kostenvorteil. Vor der Empfehlung ist jedoch zu bestätigen:

- dass 65 €/h tatsächlich die entscheidungsrelevanten Kosten enthalten;
- dass das Team keine höherwertige Arbeit verdrängt;
- dass Termin und Qualität intern erreichbar sind;
- dass die erforderliche Kompetenz vorhanden ist;
- dass Buy keine zusätzlichen enthaltenen Vorteile bietet, die den Vergleich verändern;
- dass die Sicherheitsrisiken beider Alternativen vertretbar sind.

---

## 44. Prüfungsalgorithmus

1. Gesuchte Größe bestimmen.
2. Daten mit Einheiten notieren.
3. Alle Werte auf denselben Zeitraum beziehen.
4. Fixe und variable Kosten trennen.
5. Stückdeckungsbeitrag berechnen.
6. Für den Break-even Fixkosten durch db teilen.
7. Für einen Zielgewinn diesen zu den Fixkosten addieren.
8. Bei der Amortisation den relevanten Rückfluss und nicht automatisch den Umsatz verwenden.
9. Ungleichmäßige Rückflüsse kumulieren.
10. Beim Stundensatz produktive und nicht nur bezahlte Stunden einsetzen.
11. Zuschlag und Marge unterscheiden.
12. Bei Make-or-Buy denselben Umfang und entscheidungsrelevante Kosten vergleichen.
13. Kapazität, Qualität und Risiken prüfen.
14. Eine erforderliche ganze Stückzahl aufrunden.
15. Antwort mit Interpretation und Gültigkeitsbedingung abschließen.

---

## 45. Typische Prüfungsformulierungen

### Deckungsbeitrag

> Berechnen Sie den Stückdeckungsbeitrag und erläutern Sie seine Bedeutung.

### Break-even

> Ermitteln Sie die Absatzmenge, ab der das Produkt kostendeckend angeboten werden kann.

### Zielgewinn

> Berechnen Sie die erforderliche Absatzmenge, um einen Jahresgewinn von 24.000 € zu erzielen.

### Amortisation

> Berechnen Sie die statische Amortisationsdauer der Investition und nennen Sie zwei Grenzen des Verfahrens.

### Make-or-Buy

> Ermitteln Sie den kritischen Beschäftigungsumfang und begründen Sie die Entscheidung bei 320 Stunden.

### Stundensatz

> Berechnen Sie auf Basis der produktiven Jahresstunden den kostendeckenden Stundensatz.

### Kauf/Miete/Leasing

> Vergleichen Sie die drei Finanzierungs- beziehungsweise Nutzungsalternativen über den vorgegebenen Zeitraum.

---

## 46. Typische Prüfungsfallen

1. Umsatz mit Gewinn gleichsetzen.
2. Fixkosten je Stück ohne Bezugsmenge angeben.
3. Deckungsbeitrag mit Gewinn verwechseln.
4. Break-even berechnen, obwohl db negativ ist.
5. Monats- und Jahreswerte mischen.
6. Beim Zielgewinn den Zielbetrag nicht zu Fixkosten addieren.
7. Eine Stückzahl mit Nachkommastellen abrunden.
8. Bei 40 % Quote durch 40 statt durch 0,40 teilen.
9. Mehrproduktfall wie einen Einproduktfall behandeln.
10. Sprungfixkosten ignorieren.
11. Kapazitätsengpass nicht berücksichtigen.
12. Gesamten internen Vollkostensatz als kurzfristigen Geldabfluss interpretieren.
13. Bruttogehalt mit externem Stundensatz vergleichen.
14. Sunk Costs als Begründung für Fortsetzung verwenden.
15. Opportunitätskosten ohne Daten erfinden.
16. Amortisation mit Break-even-Menge verwechseln.
17. Investition durch Umsatz statt Rückfluss teilen.
18. Gewinn, Einsparung und Rückfluss ungeprüft austauschen.
19. Abschreibung doppelt berücksichtigen.
20. Ungleichmäßige Rückflüsse mit einfachem Durchschnitt verschleiern.
21. Teiljahr interpolieren, obwohl Cashflow erst am Jahresende kommt.
22. Schnelle Amortisation automatisch mit höchstem Gewinn gleichsetzen.
23. Kauf, Miete und Leasing über unterschiedliche Zeiträume vergleichen.
24. Restwert vergessen oder doppelt abziehen.
25. Beim Leasing einen Eigentumsübergang unterstellen.
26. In produktiven Stunden Urlaub und Ausfall nicht berücksichtigen.
27. Feiertage doppelt abziehen.
28. Gewinnzuschlag und Gewinnmarge verwechseln.
29. Umsatzsteuer als Gewinn behandeln.
30. Ergebnis ohne Einheit oder Zeitraum nennen.
31. Rechenergebnis ohne qualitative Entscheidung verwenden.
32. Eine Vertiefungsmethode als garantiertes AP1-Thema ausgeben.

---

## 47. Selbsttest

### A. Begriffe und Verständnis

1. Erläutere den Unterschied zwischen Umsatz und Gewinn.
2. Was beschreibt der Stückdeckungsbeitrag?
3. Wann entspricht der Gesamtdeckungsbeitrag den Fixkosten?
4. Was bedeutet Break-even?
5. Wodurch unterscheiden sich Break-even und Amortisation?
6. Nenne vier Voraussetzungen des einfachen Break-even-Modells.
7. Was sind Sprungfixkosten?
8. Wann wird der relative Deckungsbeitrag verwendet?
9. Was vergleicht Make-or-Buy?
10. Was sind Sunk Costs?
11. Was sind Opportunitätskosten?
12. Was beschreibt die Amortisationsdauer?
13. Nenne drei Grenzen der statischen Amortisationsrechnung.
14. Wodurch unterscheidet sich Kauf grundsätzlich von Miete?
15. Warum ist Leasing nicht automatisch ein Ratenkauf?
16. Was sind produktive Stunden?
17. Wodurch unterscheiden sich Kostenstundensatz und externer Angebotspreis?
18. Erläutere den Unterschied zwischen Gewinnzuschlag und Gewinnmarge.

### B. Berechnen

19. Der Preis eines Produkts beträgt 1.200 €, die variablen Kosten betragen 720 €. Berechne db.
20. Die Fixkosten betragen 96.000 €. Berechne die Break-even-Menge.
21. Berechne den Gewinn bei 260 Einheiten.
22. Berechne die erforderliche Menge für einen Zielgewinn von 24.000 €.
23. Berechne DB-Quote und Break-even-Umsatz.
24. Die Planmenge beträgt 260, der Break-even 200 Einheiten. Berechne den Sicherheitsabstand in Stück und Prozent.
25. Make: 8.000 € + 65 €/h; Buy: 105 €/h. Berechne den Indifferenzpunkt.
26. Berechne Make- und Buy-Kosten bei 320 Stunden.
27. Eine Investition beträgt 48.000 €, die jährliche Einsparung 22.000 € und zusätzliche Auszahlungen 6.000 €. Berechne die Amortisationsdauer.
28. Investition 65.000 €, Rückflüsse 18.000 €, 24.000 €, 28.000 € und 16.000 €. Bestimme Amortisationsjahr und interpolierte Dauer.
29. Jahreskosten betragen 121.500 €, produktive Stunden 1.350. Berechne den Kostenstundensatz.
30. Addiere einen Gewinnzuschlag von 15 %.
31. Berechne den Preis bei einer Gewinnmarge von 15 %.
32. Berechne den Bruttowert von 103,50 € netto bei 19 %.

### C. Anwenden und begründen

33. Erläutere, warum ein schneller Rückfluss keine niedrigen TCO beweist.
34. Warum dürfen 1.100 eingesparte Stunden nicht ohne weitere Frage als reale Einsparung behandelt werden?
35. Nenne vier qualitative Make-or-Buy-Kriterien.
36. Wann kann Buy bei 320 Stunden dennoch vorzuziehen sein?
37. Warum kann bei einem Engpass db je Engpassstunde wichtiger als db je Auftrag sein?
38. Nenne fünf Positionen für den Vergleich von Kauf, Miete und Leasing.
39. Warum dürfen 1.800 bezahlte Stunden nicht automatisch als produktive Stunden verwendet werden?
40. Formuliere eine Empfehlung zum Make-or-Buy-Praxisfall.

<details>
<summary>Lösungen anzeigen</summary>

1. Umsatz ist Preis multipliziert mit Absatzmenge. Gewinn verbleibt nach Abzug variabler und fixer Kosten.
2. Den Betrag je Einheit, der nach den variablen Kosten zur Deckung der Fixkosten und anschließend zum Gewinn beiträgt.
3. Am Break-even, wenn der Gewinn null beträgt.
4. Absatzmenge oder Umsatz, bei dem Umsatz und Gesamtkosten gleich sind und der Gewinn null beträgt.
5. Break-even bezieht sich auf Ergebnis und Menge oder Umsatz einer Periode. Amortisation beschreibt den zeitlichen Rückfluss einer Anfangsinvestition.
6. Beispielsweise konstante p und k_v, unveränderte Fixkosten, ein Produkt oder stabiler Mix, Produktion gleich Absatz und kein Engpass.
7. Fixkosten, die beim Überschreiten eines Beschäftigungsbereichs sprunghaft steigen.
8. Wenn eine Ressource begrenzt ist und Produkte unterschiedlich viel von dieser Ressource benötigen.
9. Interne Leistung und externen Bezug anhand entscheidungsrelevanter quantitativer und qualitativer Kriterien.
10. Bereits entstandene Kosten, die durch die aktuelle Entscheidung nicht mehr verändert werden.
11. Entgangener Nutzen der besten verworfenen Alternative.
12. Die Zeit, in der kumulierte Rückflüsse die Anfangsinvestition decken.
13. Beispielsweise fehlende Berücksichtigung von Zahlungsströmen nach der Amortisation, Zeitwert des Geldes, Qualität und Gesamtrisiko.
14. Beim Kauf wird üblicherweise Eigentum erworben. Miete gewährt eine zeitlich begrenzte Nutzung ohne Eigentumsübergang.
15. Eigentumsübergang, Kaufoption, Laufzeit und Rückgabe hängen vom konkreten Vertrag ab.
16. Tatsächlich für leistungserzeugende oder abrechenbare Arbeit verfügbare Stunden nach Ausfall- und Gemeinzeiten.
17. Der Kostenstundensatz deckt relevante interne Kosten. Der externe Preis kann zusätzlich Gewinn, Risiko und Marktanpassung enthalten.
18. Ein Zuschlag wird von den Selbstkosten berechnet, eine Marge als Anteil des Verkaufspreises.
19. `1.200 € − 720 € = 480 € je Stück`.
20. `96.000 € / 480 € = 200 Stück`.
21. `260 × 480 € − 96.000 € = 28.800 €`.
22. `(96.000 € + 24.000 €) / 480 € = 250 Stück`.
23. `480 / 1.200 = 0,40 = 40 %`; `96.000 / 0,40 = 240.000 €`.
24. `260 − 200 = 60 Stück`; `60 / 260 × 100 % = 23,08 %`.
25. `8.000 / (105 − 65) = 200 Stunden`.
26. Make: `8.000 + 65 × 320 = 28.800 €`. Buy: `105 × 320 = 33.600 €`. Make ist um 4.800 € günstiger.
27. `R = 22.000 − 6.000 = 16.000 €`; `48.000 / 16.000 = 3 Jahre`.
28. Nach zwei Jahren sind 42.000 € kumuliert, 23.000 € fehlen. Amortisation im dritten Jahr; bei gleichmäßigem Rückfluss: `2 + 23.000 / 28.000 ≈ 2,82 Jahre`.
29. `121.500 € / 1.350 h = 90,00 €/h`.
30. `90,00 € × 1,15 = 103,50 €/h`.
31. `90,00 € / 0,85 = 105,88 €/h`.
32. `103,50 € × 1,19 = 123,165 € ≈ 123,17 €`.
33. Die Amortisation berücksichtigt nur die Geschwindigkeit des Investitionsrückflusses. TCO erfassen Kosten des gesamten festgelegten Lebenszyklus.
34. Es ist zu prüfen, ob Kapazität tatsächlich abgebaut, Auszahlungen vermieden oder freigesetzte Zeit produktiv verwendet wird. Nominale Stunden sind sonst keine Geldeinsparung.
35. Beispielsweise Know-how, Kapazität, Termin, Qualität, Datenschutz, Sicherheit, Abhängigkeit, Skalierung und Reversibilität.
36. Wenn interne Kapazität oder Kompetenz fehlen, der Termin nicht erreichbar ist, Opportunitätskosten über 4.800 € liegen oder der externe Anbieter wesentlich geringere Risiken oder zusätzliche Leistungen bietet.
37. Bei einem Engpass soll mit jeder Einheit der knappen Ressource der größtmögliche Deckungsbeitrag erzielt werden.
38. Beispielsweise Anfangszahlungen, laufende Raten, Wartung, Service, Restwert, Rückgabe, Sonderzahlung, Gebühren und Vertragsbindung.
39. Urlaub, Krankheit, Weiterbildung, Administration, Vertrieb und Zeiten ohne Auftrag reduzieren die tatsächlich produktive Zeit.
40. Beispielsweise: `Bei einem Umfang von 320 Stunden verursacht Make nach dem vorgegebenen Modell Kosten von 28.800 €, Buy dagegen 33.600 €. Make ist damit rechnerisch um 4.800 € günstiger. Die Eigenleistung ist zu empfehlen, sofern interne Kapazität, Kompetenz und Termine gesichert sind und keine höheren Opportunitätskosten entstehen. Andernfalls ist trotz des rechnerischen Kostennachteils ein Fremdbezug zu prüfen.`

</details>

---

## 48. Quellen und Abgleich

- [§ 9 FIAusbV – Prüfungsbereich Teil 1](https://www.gesetze-im-internet.de/fiausbv/__9.html)
- [FIAusbV und Ausbildungsrahmenplan – BIBB](https://www.bibb.de/dienst/berufesuche/de/index_berufesuche.php/regulation/VO_Fachinformatiker_2020.pdf)
- [§ 7 BHO – Wirtschaftlichkeit und Sparsamkeit](https://www.gesetze-im-internet.de/bho/__7.html)
- [KOINNO – Lebenszykluskosten-Rechner](https://www.koinno.de/oeffentliche-auftraggeber/services/lzk-rechner/)
- [KOINNO – Bewertungsmethoden-Lotse](https://www.koinno.de/oeffentliche-auftraggeber/bewertungsmethoden-lotse/)

§ 7 BHO und KOINNO beziehen sich auf den öffentlichen Sektor. Sie werden hier als methodische Belege für Variantenvergleich, Annahmen und Lebenszyklus verwendet, nicht als allgemeine Rechtsvorschrift für jedes private Unternehmen.

Die Formeln dieses Kapitels sind statische Standard-Lernmodelle. Eine reale Investition kann Kapitalwert, Zinsen, Steuern, Preisänderungen und professionelle Vertragsprüfung erfordern.

Alle Geldbeträge und Szenarien sind fiktive Lerndaten.

---

## 49. Offene Prüfpunkte für den Unterricht

- Umfasst der aktuelle WBS-Plan Deckungsbeitrag und Break-even in der AP1?
- Welche genaue Rückflussformel verwendet die WBS für die statische Amortisation?
- Muss die Abschreibung im verwendeten Unterrichtsschema zum Gewinn addiert werden?
- Wird die Interpolation eines Teiljahres erwartet?
- Wird der Break-even-Umsatz oder nur die Break-even-Menge verlangt?
- Werden Mehrproduktfälle und Engpassrechnung behandelt?
- Welche Tiefe wird bei Make-or-Buy erwartet?
- Müssen Grenz-, Teil- und Vollkosten unterschieden werden?
- Welches Schema wird für den Stundensatz verwendet?
- Müssen Gewinnzuschlag und Gewinnmarge unterschieden werden?
- Gehören Kauf, Miete und Leasing zum aktiven AP1-Stoff?
- Wird Rentabilität verlangt oder bleibt sie zusätzliche Vertiefung?
