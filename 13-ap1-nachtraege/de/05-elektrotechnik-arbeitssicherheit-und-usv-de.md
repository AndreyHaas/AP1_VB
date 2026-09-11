---
pruefung: AP1
thema: Elektrotechnik, Arbeitssicherheit und USV
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Deutsch
gegenstueck: ../ru/05-elektrotechnik-arbeitssicherheit-und-usv-ru.md
---

# Elektrotechnik, Arbeitssicherheit und USV

## 1. Lernziele

Du kannst:

- Spannung, Stromstärke, Widerstand, Leistung und Energie unterscheiden;
- Wirk-, Blind- und Scheinleistung einordnen;
- Leistungsfaktor, Wirkungsgrad, Last und Reserve berechnen;
- USV-Klassen VFD, VI und VFI passend auswählen;
- Leistungs- und Laufzeitanforderungen einer USV abschätzen;
- Schutzzeichen, IP-Schutzart und sichere Arbeitsgrenzen erklären;
- ein Gerätedatenblatt auf betriebliche Eignung prüfen.

## 2. Prüfungsminimum — 15 Minuten

1. `U` Spannung in Volt, `I` Strom in Ampere, `R` Widerstand in Ohm.
2. Gleichstrom: `P = U × I`; Energie: `E = P × t`.
3. Scheinleistung `S = U × I` in VA; Wirkleistung `P` in W.
4. Bei sinusförmiger Wechselspannung vereinfacht: `P = S × cos φ`.
5. Wirkungsgrad: `η = Nutzleistung / aufgenommene Leistung`.
6. USV-Auswahl muss sowohl W-Grenze als auch VA-Grenze einhalten.
7. VFD: netzabhängig; VI: Spannung wird beeinflusst; VFI: Ausgang weitgehend unabhängig von Spannung und Frequenz des Netzes.
8. Laufzeit hängt von Batterieenergie, Last, Wirkungsgrad, Alter und Temperatur ab.
9. CE ist eine Herstellererklärung zur Konformität, kein unabhängiges Prüfsiegel; GS ist ein freiwilliges geprüftes Sicherheitszeichen.
10. Netzteile und USV enthalten gefährliche Spannungen; nur qualifizierte Personen dürfen unzulässige Eingriffe vornehmen.

## 3. Elektrische Größen und Formeln

| Größe | Zeichen | Einheit | Bedeutung |
|---|---|---|---|
| Spannung | U | Volt V | treibende Potentialdifferenz |
| Stromstärke | I | Ampere A | Ladungsmenge je Zeit |
| Widerstand | R | Ohm Ω | Hemmung des Stromflusses |
| Leistung | P | Watt W | Energie je Zeit |
| Energie | E | Wh oder J | verrichtete Arbeit bzw. Verbrauch |

```text
U = R × I
P = U × I
E_Wh = P_W × t_h
```

Beispiel: Ein 24-V-Gerät zieht 2,5 A.

```text
P = 24 V × 2,5 A = 60 W
E bei 8 h = 60 W × 8 h = 480 Wh = 0,48 kWh
```

## 4. Wirk-, Blind- und Scheinleistung

| Größe | Einheit | Aussage |
|---|---|---|
| Wirkleistung P | W | wird in nutzbare Arbeit oder Wärme umgesetzt |
| Blindleistung Q | var | pendelt zwischen Quelle und reaktiven Anteilen |
| Scheinleistung S | VA | Gesamtbelastung aus Effektivwerten von U und I |

Für sinusförmige Größen:

```text
S = U × I
P = S × cos φ
S² = P² + Q²
```

Bei nichtlinearen IT-Netzteilen ist der allgemeine `Leistungsfaktor` aussagekräftiger als eine Gleichsetzung mit reinem Phasenverschiebungsfaktor. In Prüfungsaufgaben die vorgegebenen Größen und Vereinfachungen verwenden.

Beispiel: `S = 800 VA`, Leistungsfaktor `0,8`:

```text
P = 800 VA × 0,8 = 640 W
```

## 5. USV-Arten und Auswahl

`USV` bedeutet unterbrechungsfreie Stromversorgung.

| IEC-Klasse | gebräuchliche Bezeichnung | Verhalten | typischer Einsatz |
|---|---|---|---|
| VFD | Offline/Standby | Last meist direkt am Netz, Umschaltung bei Ausfall | weniger kritischer Einzelplatz |
| VI | Line-interactive | stabilisiert Spannung in Grenzen, schaltet bei Ausfall | Netzwerkgeräte, kleinere Server |
| VFI | Online/Doppelwandler | Ausgang weitgehend unabhängig von Netzspannung und -frequenz | kritische Systeme |

Die Wahl richtet sich nach Schutzbedarf, Netzqualität, Umschaltzeit, Wirkungsgrad, Wartung, Geräusch, Kosten und Last. Eine VFI-USV ist nicht automatisch wirtschaftlich für jeden Arbeitsplatz.

### Dimensionierung

Lasten:

- Server: `420 W`, Leistungsfaktor 0,9;
- Speicher: `180 W`, Leistungsfaktor 0,8;
- Netzwerk: `60 W`, Leistungsfaktor 0,75;
- Reserve: `25 %`.

```text
P_sum = 420 + 180 + 60 = 660 W
S_sum = 420/0,9 + 180/0,8 + 60/0,75
      ≈ 771,7 VA
mit Reserve: P = 825 W; S ≈ 964,6 VA
```

Die USV muss mehr als `825 W` und mehr als `965 VA` liefern. Ein Modell mit `1 000 VA`, aber nur `600 W`, wäre ungeeignet.

### Laufzeitabschätzung

```text
t_ideal = Batterieenergie_Wh × η / Last_W
```

Mit `1 000 Wh`, `η = 0,85` und `660 W`:

```text
t_ideal = 1 000 Wh × 0,85 / 660 W ≈ 1,288 h ≈ 77 min
```

Das ist nur eine Abschätzung. Entladerate, Abschaltspannung, Alter, Temperatur und Eigenverbrauch verringern die reale Laufzeit. Für die Auswahl dienen Hersteller-Laufzeitkurven und ein Lasttest.

## 6. Schutz, Kennzeichnung und Prüfungsformulierungen

- `CE`: Hersteller erklärt die Einhaltung einschlägiger EU-Anforderungen.
- `GS`: freiwilliges Zeichen für geprüfte Sicherheit durch eine zugelassene Stelle.
- `IP-Code`: erste Kennziffer gegen Berührung/Fremdkörper, zweite gegen Wasser.
- `Schutzklasse I`: Schutzleiter; `II`: doppelte/verstärkte Isolierung; `III`: Schutzkleinspannung.
- `ESD`: elektrostatische Entladung; Erdung und geeignete Arbeitsmittel schützen Bauteile.

> Die USV ist ungeeignet, da ihre Wirkleistungsgrenze von 600 Watt bereits unter der geplanten Last von 825 Watt liegt, obwohl die VA-Angabe zunächst ausreichend erscheint.

> Die VFI-USV wird für das kritische System gewählt, weil sie den Ausgang weitgehend von Spannung und Frequenz des Versorgungsnetzes entkoppelt.

> Vor Arbeiten wird das Gerät freigeschaltet und gegen Wiedereinschalten gesichert; das Öffnen des Netzteils gehört nicht zu den Arbeiten eines unqualifizierten Anwenders.

## 7. Typische Prüfungsfallen

- Watt, Wattstunde und Voltampere gleichsetzen.
- VA-Grenze prüfen, aber W-Grenze vergessen.
- Reserve auf einzelne Werte uneinheitlich anwenden.
- Netzteil-Nennleistung als tatsächlichen Verbrauch behandeln.
- Batteriekapazität in Ah ohne Spannung direkt mit Wh vergleichen.
- ideale Laufzeit als garantierte Laufzeit ausgeben.
- USV mit Backup gleichsetzen: Eine USV ersetzt keine Datensicherung.
- CE als unabhängige Qualitätsprüfung bezeichnen.
- IP67 pauschal als „wasserdicht in jeder Situation“ ausgeben.
- Sicherheitsarbeiten ohne Qualifikation empfehlen.

## 8. Selbsttest

1. Berechne Leistung und Energie: 12 V, 3 A, 5 h.
2. Eine Last benötigt 720 W bei Leistungsfaktor 0,9. Bestimme S.
3. Warum müssen bei einer USV W und VA geprüft werden?
4. Vergleiche VFD und VFI anhand von Schutz und Kosten.
5. Schätze die Laufzeit für 600 Wh, η 0,8 und 240 W.
6. Grenze CE und GS ab.

<details>
<summary>Lösungen anzeigen</summary>

1. `P = 36 W`; `E = 180 Wh`.
2. `S = 720/0,9 = 800 VA`.
3. Geräte belasten die USV mit Wirkleistung und Scheinleistung; jede Grenze kann zuerst überschritten werden.
4. VFD ist einfacher und günstiger, aber netzabhängiger und mit Umschaltung; VFI schützt kritische Lasten umfassender, hat jedoch mehr Kosten und Verluste.
5. `600×0,8/240 = 2 h` idealisiert.
6. CE ist eine gesetzlich relevante Hersteller-Konformitätserklärung; GS ist ein freiwilliges, durch zugelassene Stelle geprüftes Sicherheitszeichen.

</details>

## 9. Quellen und Abgleich

- IEC 62040-3: Leistung und Prüfanforderungen von USV, Klassifikation VFD/VI/VFI.
- DGUV Vorschrift 3 und betriebliche Sicherheitsregeln für elektrische Anlagen und Betriebsmittel.
- EU-Kommission: CE-Kennzeichnung; Produktsicherheitsgesetz zum GS-Zeichen.
- WBS-Kursinhalt USV sowie Wirk- und Scheinleistung; bestätigt am 11.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Welche USV-Klassen und Laufzeitmodelle wurden bei WBS verwendet?
- Wird Blindleistung Q rechnerisch verlangt oder nur begrifflich?
- Welche Schutzarten und Prüfzeichen müssen auswendig unterschieden werden?
