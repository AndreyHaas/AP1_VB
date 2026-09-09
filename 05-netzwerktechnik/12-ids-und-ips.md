---
pruefung: AP1
prioritaet: P2
status: Entwurf
stand: 2026-09-09
---

# IDS und IPS

## Begriffe

`IDS (Intrusion Detection System)` erkennt verdächtige Aktivitäten, protokolliert sie und erzeugt Warnungen. Es blockiert den Verkehr normalerweise nicht selbst.

`IPS (Intrusion Prevention System)` befindet sich aktiv im Datenpfad und kann erkannte Angriffe automatisch blockieren.

`Firewall` entscheidet vor allem anhand definierter Verkehrsregeln. IDS/IPS bewertet zusätzlich Muster oder Verhalten, das auf Angriffe hindeutet.

## Erkennungsfehler

```text
False Positive:
Normale Aktivität wird fälschlich als Angriff erkannt.

False Negative:
Ein echter Angriff bleibt unerkannt.
```

## IHK-Merksätze

> Ein IDS erkennt und meldet verdächtige Aktivitäten; ein IPS kann erkannte Angriffe zusätzlich blockieren.

> Ein False Positive ist ein Fehlalarm, ein False Negative ein übersehener Angriff.

## Selbsttest

1. Ein Backup wird fälschlich als Datenabfluss gemeldet.
2. Ein Exploit wird erkannt und die Verbindung beendet.
3. Schadverkehr passiert unbemerkt.

## Lösungen

```text
1. False Positive
2. IPS
3. False Negative
```

## Offene Punkte / Korrekturen

- `P2`: genaue Erkennungsverfahren (Signatur/Anomalie) nur nach P1 behandeln.
