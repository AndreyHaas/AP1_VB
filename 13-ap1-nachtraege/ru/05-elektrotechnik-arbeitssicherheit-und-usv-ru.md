---
pruefung: AP1
thema: Elektrotechnik, Arbeitssicherheit und USV
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/05-elektrotechnik-arbeitssicherheit-und-usv-de.md
---

# Elektrotechnik, Arbeitssicherheit und USV

## 1. Lernziele

После изучения главы нужно уметь:

- различать Spannung, Stromstärke, Widerstand, Leistung и Energie;
- понимать Wirk-, Blind- и Scheinleistung;
- рассчитывать Leistungsfaktor, Wirkungsgrad, Last и Reserve;
- выбирать USV-Klassen VFD, VI и VFI;
- оценивать мощность и Laufzeit USV;
- объяснять Schutzzeichen, IP-Schutzart и безопасные границы работы;
- проверять Gerätedatenblatt на пригодность.

## 2. Prüfungsminimum — 15 Minuten

1. `U` Spannung в Volt, `I` Strom в Ampere, `R` Widerstand в Ohm.
2. Gleichstrom: `P = U × I`; Energie: `E = P × t`.
3. Scheinleistung `S = U × I` в VA; Wirkleistung `P` в W.
4. Для синусоидального Wechselstrom упрощённо: `P = S × cos φ`.
5. Wirkungsgrad: `η = Nutzleistung / aufgenommene Leistung`.
6. USV должна выдерживать одновременно границы W и VA.
7. VFD: зависит от сети; VI: влияет на напряжение; VFI: выход почти независим от напряжения и частоты сети.
8. Laufzeit зависит от Batterieenergie, Last, Wirkungsgrad, Alter и Temperatur.
9. CE — Herstellererklärung о Konformität, не независимое Prüfsiegel; GS — добровольный проверенный Sicherheitszeichen.
10. Netzteile и USV содержат опасные напряжения; вмешательство требует квалификации.

## 3. Elektrische Größen и Formeln

| Größe | Zeichen | Einheit | Bedeutung |
|---|---|---|---|
| Spannung | U | Volt V | разность потенциалов |
| Stromstärke | I | Ampere A | заряд за время |
| Widerstand | R | Ohm Ω | сопротивление току |
| Leistung | P | Watt W | энергия за время |
| Energie | E | Wh oder J | работа или потребление |

```text
U = R × I
P = U × I
E_Wh = P_W × t_h
```

Пример: 24-V-Gerät потребляет 2,5 A.

```text
P = 24 V × 2,5 A = 60 W
E bei 8 h = 60 W × 8 h = 480 Wh = 0,48 kWh
```

## 4. Wirk-, Blind- и Scheinleistung

| Größe | Einheit | Aussage |
|---|---|---|
| Wirkleistung P | W | превращается в полезную работу или тепло |
| Blindleistung Q | var | колеблется между источником и реактивной нагрузкой |
| Scheinleistung S | VA | общая нагрузка из Effektivwerte U и I |

Для синусоидальных величин:

```text
S = U × I
P = S × cos φ
S² = P² + Q²
```

Для нелинейных IT-Netzteile общий `Leistungsfaktor` точнее, чем простое приравнивание к Phasenverschiebungsfaktor. В задаче применять данные и упрощения из условия.

Пример: `S = 800 VA`, Leistungsfaktor `0,8`:

```text
P = 800 VA × 0,8 = 640 W
```

## 5. USV-Arten и Auswahl

`USV` — unterbrechungsfreie Stromversorgung.

| IEC-Klasse | gebräuchliche Bezeichnung | Verhalten | typischer Einsatz |
|---|---|---|---|
| VFD | Offline/Standby | нагрузка обычно от сети, Umschaltung при отказе | некритичный Einzelplatz |
| VI | Line-interactive | стабилизирует Spannung, переключается при отказе | Netzgeräte, малые Server |
| VFI | Online/Doppelwandler | выход почти независим от Netzspannung/-frequenz | критичные Systeme |

Выбор зависит от Schutzbedarf, Netzqualität, Umschaltzeit, Wirkungsgrad, Wartung, Geräusch, Kosten и Last. VFI не всегда экономична для простого Arbeitsplatz.

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

USV должна давать больше `825 W` и `965 VA`. Модель `1 000 VA`, но только `600 W`, не подходит.

### Laufzeitabschätzung

```text
t_ideal = Batterieenergie_Wh × η / Last_W
```

При `1 000 Wh`, `η = 0,85`, `660 W`:

```text
t_ideal = 1 000 Wh × 0,85 / 660 W ≈ 1,288 h ≈ 77 min
```

Это оценка. Entladerate, Abschaltspannung, Alter, Temperatur и Eigenverbrauch снижают реальную Laufzeit. Нужны Hersteller-Laufzeitkurven и Lasttest.

## 6. Schutz, Kennzeichnung и Prüfungsformulierungen

- `CE`: Hersteller заявляет соблюдение применимых EU-Anforderungen.
- `GS`: добровольный знак проверенной Sicherheit от zugelassene Stelle.
- `IP-Code`: первая цифра — контакт/частицы, вторая — вода.
- `Schutzklasse I`: Schutzleiter; `II`: двойная/усиленная изоляция; `III`: Schutzkleinspannung.
- `ESD`: elektrostatische Entladung; Erdung и подходящие средства защищают Bauteile.

> Die USV ist ungeeignet, da ihre Wirkleistungsgrenze von 600 Watt bereits unter der geplanten Last von 825 Watt liegt, obwohl die VA-Angabe zunächst ausreichend erscheint.

> Die VFI-USV wird für das kritische System gewählt, weil sie den Ausgang weitgehend von Spannung und Frequenz des Versorgungsnetzes entkoppelt.

> Vor Arbeiten wird das Gerät freigeschaltet und gegen Wiedereinschalten gesichert; das Öffnen des Netzteils gehört nicht zu den Arbeiten eines unqualifizierten Anwenders.

## 7. Typische Prüfungsfallen

- приравнивать Watt, Wattstunde и Voltampere;
- проверять VA, но забывать W;
- непоследовательно добавлять Reserve;
- считать Nennleistung Netzteil реальным Verbrauch;
- сравнивать Ah с Wh без напряжения;
- выдавать ideale Laufzeit за гарантированную;
- считать USV заменой Backup;
- называть CE независимой проверкой качества;
- считать IP67 «водонепроницаемым всегда»;
- рекомендовать опасную работу без квалификации.

## 8. Selbsttest

1. Рассчитай Leistung и Energie: 12 V, 3 A, 5 h.
2. Last требует 720 W при Leistungsfaktor 0,9. Найди S.
3. Почему для USV проверяют W и VA?
4. Сравни VFD и VFI по Schutz и Kosten.
5. Оцени Laufzeit: 600 Wh, η 0,8, 240 W.
6. Различи CE и GS.

<details>
<summary>Lösungen anzeigen</summary>

1. `P = 36 W`; `E = 180 Wh`.
2. `S = 720/0,9 = 800 VA`.
3. Устройства нагружают USV по Wirk- и Scheinleistung; любая граница может быть превышена первой.
4. VFD проще и дешевле, но зависит от сети и переключается; VFI лучше защищает критичную нагрузку, но дороже и имеет потери.
5. `600×0,8/240 = 2 h` идеализированно.
6. CE — Hersteller-Konformitätserklärung; GS — добровольный знак проверки zugelassene Stelle.

</details>

## 9. Quellen und Abgleich

- IEC 62040-3: USV-Leistung, Prüfung и Klassen VFD/VI/VFI.
- DGUV Vorschrift 3 и правила безопасности электрических Betriebsmittel.
- EU-Kommission: CE-Kennzeichnung; Produktsicherheitsgesetz: GS-Zeichen.
- WBS-Kursinhalt USV, Wirk- und Scheinleistung; подтверждено 11.09.2026.

## 10. Offene Prüfpunkte für den Unterricht

- Какие USV-Klassen и Laufzeitmodelle использовал WBS?
- Нужен ли расчёт Blindleistung Q или только понятие?
- Какие Schutzarten и Prüfzeichen надо знать наизусть?
