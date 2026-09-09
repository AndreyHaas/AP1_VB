---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Schutzbedarfsanalyse, ISMS und Hardening

## Schutzbedarfsanalyse

Для Schutzobjekt оцениваются последствия нарушения Vertraulichkeit, Integrität и Verfügbarkeit.

Типовые Schutzbedarfskategorien BSI:

```text
normal     → Schadensauswirkungen begrenzt und überschaubar
hoch       → Schadensauswirkungen beträchtlich
sehr hoch  → Schadensauswirkungen existenziell oder katastrophal
```

Оценка должна быть обоснована, например через:

```text
Verstoß gegen Gesetze oder Verträge
Beeinträchtigung des informationellen Selbstbestimmungsrechts
Personenschaden
Beeinträchtigung der Aufgabenerfüllung
negative Innen- oder Außenwirkung
finanzielle Auswirkungen
```

Bei Abhängigkeiten kann der höchste Schutzbedarf auf unterstützende Systeme übertragen werden (`Maximumprinzip`). Eine große Datenmenge oder Kombination vieler Einzelfälle kann den Schutzbedarf erhöhen (`Kumulationseffekt`).

## Risikomatrix

Eintrittswahrscheinlichkeit und Schadensausmaß werden kombiniert. Высокое последствие при высокой вероятности даёт высокий Handlungsbedarf. Danach werden Maßnahmen ausgewählt, umgesetzt und erneut bewertet (`Restrisiko`).

## ISMS

`Informationssicherheitsmanagementsystem` ist kein einzelnes Produkt, sondern ein kontinuierlicher Managementprozess:

```text
Sicherheitsziele und Verantwortlichkeiten festlegen
Risiken bewerten
Maßnahmen auswählen und umsetzen
Wirksamkeit kontrollieren
Verbesserungen durchführen
```

## Betriebssystem-Härtung

`Hardening` reduziert Angriffsfläche und schließt vermeidbare Schwachstellen:

- Sicherheitsupdates installieren;
- unnötige Dienste, Konten und Software deaktivieren/entfernen;
- sichere Standardkonfiguration verwenden;
- Least Privilege und getrennte Admin-Konten;
- Firewall und Application Control konfigurieren;
- Festplattenverschlüsselung, MFA и Bildschirmsperre;
- Logging, Monitoring и Backups;
- sichere Remote-Zugänge, например SSH вместо Telnet.

## IHK-Merksätze

> Der Schutzbedarf wird für Vertraulichkeit, Integrität und Verfügbarkeit ermittelt und nachvollziehbar begründet.

> Hardening verringert die Angriffsfläche eines Systems, indem unnötige Funktionen entfernt und sichere Einstellungen umgesetzt werden.

## Selbsttest

Eine Personalabteilung speichert Gesundheitsdaten von Beschäftigten auf einem gemeinsam genutzten Dateiserver. Begründe mindestens für Vertraulichkeit einen Schutzbedarf und nenne drei Maßnahmen.

## Lösungen

Возможный ответ:

> Die Vertraulichkeit hat einen hohen bis sehr hohen Schutzbedarf, weil besondere Kategorien personenbezogener Daten betroffen sind und eine Offenlegung erhebliche persönliche und rechtliche Folgen haben kann. Geeignete Maßnahmen sind ein restriktives Berechtigungskonzept, Verschlüsselung, MFA und eine nachvollziehbare Protokollierung.

## Offene Punkte / Korrekturen

- Genaue BSI-Formulierungen anhand der von WBS verwendeten Unterlage abgleichen.
