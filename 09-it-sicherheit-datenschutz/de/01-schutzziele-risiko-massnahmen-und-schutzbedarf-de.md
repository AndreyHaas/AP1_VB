---
pruefung: AP1
thema: IT-Sicherheit
prioritaet: Kern
status: Entwurf
stand: 2026-09-11
sprache: Deutsch
gegenstueck: ../ru/01-schutzziele-risiko-massnahmen-und-schutzbedarf-ru.md
---

# IT-Sicherheit: Schutzziele, Risiko, Maßnahmen und Schutzbedarf

## 1. Lernziele

Du kannst:

- Vertraulichkeit, Integrität und Verfügbarkeit an Fällen erkennen;
- Authentizität, Zurechenbarkeit und Nichtabstreitbarkeit ergänzend einordnen;
- Schutzobjekt, Bedrohung, Schwachstelle, Angriff, Schaden und Risiko trennen;
- Risiken qualitativ oder mit einer vorgegebenen Matrix bewerten;
- Schutzbedarf je Schutzziel bestimmen und begründen;
- Maximumprinzip, Abhängigkeiten und Kumulationseffekt anwenden;
- technische, organisatorische, personelle und infrastrukturelle Maßnahmen unterscheiden;
- Risiko vermeiden, reduzieren, übertragen oder bewusst akzeptieren;
- Restrisiken dokumentieren und Maßnahmen auf Wirksamkeit prüfen.

## 2. Prüfungsminimum — 15 Minuten

1. `Vertraulichkeit`: Nur Berechtigte erhalten Zugriff.
2. `Integrität`: Unberechtigte oder unbemerkte Veränderung wird verhindert beziehungsweise erkannt.
3. `Verfügbarkeit`: Information und Dienst sind bei Bedarf nutzbar.
4. Eine Bedrohung kann eine Schwachstelle ausnutzen und dadurch einen Schaden verursachen.
5. Risiko verbindet Eintrittswahrscheinlichkeit und Schadensausmaß; eine Risikomatrix ist ein Bewertungsmodell.
6. Schutzbedarf wird je Schutzobjekt und Schutzziel begründet, nicht pauschal aus einem Produktnamen abgeleitet.
7. BSI-Kategorien auf Grundniveau: `normal`, `hoch`, `sehr hoch`.
8. Technische, organisatorische, personelle und infrastrukturelle Maßnahmen wirken gemeinsam.
9. Eine Maßnahme senkt Wahrscheinlichkeit, Auswirkung oder beides; das verbleibende Risiko heißt Restrisiko.
10. Risikoakzeptanz braucht eine befugte Entscheidung, Begründung und Dokumentation.

> Die Vertraulichkeit der Gesundheitsdaten hat einen sehr hohen Schutzbedarf, da eine Offenlegung erhebliche persönliche und rechtliche Folgen für die Betroffenen verursachen kann.

## 3. Grundlagen

### 3.1 Grundlegende Schutzziele

| Schutzziel | Leitfrage | typische Maßnahmen |
|---|---|---|
| Vertraulichkeit | Wer darf lesen oder zugreifen? | Berechtigungen, Verschlüsselung, Sichtschutz |
| Integrität | Sind Daten/Systeme richtig und unverändert? | Signatur, Hash mit geschütztem Referenzwert, Protokollierung |
| Verfügbarkeit | Ist der Dienst rechtzeitig nutzbar? | Redundanz, Backup/Restore, Monitoring, Notfallplanung |

Ein Vorfall kann mehrere Ziele treffen. Ransomware verändert oder verschlüsselt Daten, macht Dienste unbrauchbar und kann zuvor Daten ausleiten.

### 3.2 Ergänzende Schutzziele

- `Authentizität`: Echtheit einer Identität, Nachricht oder Quelle ist überprüfbar.
- `Zurechenbarkeit`: Eine Handlung lässt sich einer Identität zuordnen.
- `Nichtabstreitbarkeit`: Ursprung oder Handlung kann später nicht glaubhaft bestritten werden.

Ein Hashwert allein beweist keinen Urheber. Dafür braucht es einen vertrauenswürdigen Bezug, beispielsweise eine korrekt geprüfte digitale Signatur.

### 3.3 Begriffsfolge

```text
Schutzobjekt → ist einer Bedrohung ausgesetzt
Bedrohung    → kann eine Schwachstelle ausnutzen
Angriff      → konkrete, häufig absichtliche Ausnutzung
Ereignis     → führt möglicherweise zu Schaden
Risiko       → bewertet Wahrscheinlichkeit und Auswirkung
Maßnahme     → verändert das Risiko
Restrisiko   → verbleibt nach der Behandlung
```

Beispiel:

| Begriff | Fall |
|---|---|
| Schutzobjekt | Kundendatenbank |
| Bedrohung | externer Angreifer |
| Schwachstelle | ungepatchte bekannte Lücke |
| Angriff | Ausnutzung der Lücke |
| Schaden | Offenlegung und Ausfall |
| Maßnahme | Patch, Zugriffsbeschränkung, Monitoring |

## 4. Risiko, Schutzbedarf und Maßnahmen

### 4.1 Risikobewertung

Als Lernmodell gilt häufig:

```text
Risiko = Eintrittswahrscheinlichkeit × Schadensausmaß
```

Die Faktoren können Zahlen oder Klassen wie `niedrig/mittel/hoch` sein. Zahlen aus einer firmeneigenen Matrix sind ordinale Bewertungswerte und nicht automatisch Euro oder echte Wahrscheinlichkeiten.

Beispiel einer vorgegebenen Matrix mit Werten 1 bis 3:

| Wahrscheinlichkeit \ Auswirkung | 1 gering | 2 mittel | 3 hoch |
|---|---:|---:|---:|
| 1 gering | 1 | 2 | 3 |
| 2 mittel | 2 | 4 | 6 |
| 3 hoch | 3 | 6 | 9 |

Die Organisation muss Grenzwerte und Behandlung festlegen. Nicht jede Multiplikation führt in verschiedenen Unternehmen zur gleichen Entscheidung.

### 4.2 Schutzbedarfsfeststellung

Der Schutzbedarf wird getrennt für Vertraulichkeit, Integrität und Verfügbarkeit betrachtet. Typische Kategorien des IT-Grundschutzes:

- `normal`: Auswirkungen sind begrenzt und überschaubar;
- `hoch`: Auswirkungen können beträchtlich sein;
- `sehr hoch`: Auswirkungen können ein existenziell bedrohliches oder katastrophales Ausmaß erreichen.

Begründungskriterien können sein:

- Verstoß gegen Gesetze, Verträge oder interne Regeln;
- Beeinträchtigung des informationellen Selbstbestimmungsrechts;
- Personenschäden;
- Beeinträchtigung der Aufgabenerfüllung;
- negative Innen- oder Außenwirkung;
- finanzielle Auswirkungen.

Nicht die Sensibilität eines Begriffs allein entscheidet. Auch notwendige Wiederherstellungszeit, Umfang, Abhängigkeiten und konkrete Folgen gehören in die Begründung.

### 4.3 Vererbung, Maximum und Kumulation

`Maximumprinzip`: Ein unterstützendes System übernimmt grundsätzlich den höchsten Schutzbedarf der darauf angewiesenen Anwendungen, soweit Abhängigkeit und Schutzwirkung dies erfordern.

`Kumulationseffekt`: Viele einzeln weniger kritische Datensätze können zusammen einen höheren Schaden ermöglichen.

`Verteilungseffekt`: Redundante oder verteilte Komponenten können verhindern, dass der volle Schutzbedarf einer Anwendung auf jede Einzelkomponente übergeht. Das muss fachlich begründet werden; es ist keine automatische Herabstufung.

### 4.4 Maßnahmenkategorien

| Kategorie | Beispiele |
|---|---|
| technisch | MFA, Verschlüsselung, Firewall, Backuptechnik |
| organisatorisch | Richtlinie, Berechtigungskonzept, Vier-Augen-Prinzip |
| personell | Schulung, klare Rollen, Sicherheitsüberprüfung |
| infrastrukturell | Zutrittskontrolle, Brandschutz, Klimatisierung |

Eine Awareness-Schulung ist organisatorisch geplant und wirkt personell. In einer Prüfungsantwort wird die gewählte Zuordnung deshalb kurz begründet.

### 4.5 Risikobehandlung

- `vermeiden`: riskante Tätigkeit nicht durchführen oder Verfahren ändern;
- `reduzieren`: Wahrscheinlichkeit oder Schaden durch Maßnahmen senken;
- `übertragen/teilen`: etwa vertraglich oder durch Versicherung; Verantwortung verschwindet nicht vollständig;
- `akzeptieren`: begründetes Restrisiko durch befugte Stelle tragen.

Maßnahmen müssen angemessen sein und überprüft werden. Ein geschriebenes Konzept ohne Umsetzung senkt das reale Risiko nicht.

## 5. Anwendungsfall: mobiler Zugriff auf Personaldaten

Ein Notebook mit Gesundheitsdaten wird regelmäßig im Zug und im Homeoffice verwendet. Die Daten liegen unverschlüsselt lokal; Anmeldung erfolgt nur mit Passwort; das Gerät erhält Updates unregelmäßig.

### 5.1 Analyse

```text
Schutzobjekte: Gesundheitsdaten, Notebook, Benutzerkonto, Zugangsdienst
Bedrohungen: Diebstahl, Einsicht, Schadsoftware, Ausnutzung bekannter Lücken
Schwachstellen: keine Datenträgerverschlüsselung, fehlende MFA,
                sichtbarer Bildschirm, unregelmäßige Updates
Schäden: Offenlegung, Manipulation, Arbeitsausfall, rechtliche Folgen
```

Schutzbedarf:

- Vertraulichkeit: `sehr hoch`, weil besonders sensible Daten und schwere Folgen betroffen sind.
- Integrität: `hoch`, weil falsche Personaldaten Entscheidungen und Betroffene schädigen können.
- Verfügbarkeit: je Geschäftsprozess begründen; bei kurzfristig ersetzbarem Gerät möglicherweise `normal` oder `hoch`, wenn Fristen und Ersatz fehlen.

### 5.2 Maßnahmenpaket

1. technische Datenträgerverschlüsselung und sichere Schlüsselverwaltung;
2. MFA, Least Privilege und getrennte Administratorkonten;
3. zentraler Patchprozess und Gerätemanagement;
4. automatische Bildschirmsperre und Sichtschutz;
5. minimierte lokale Speicherung oder kontrollierter Remote-Zugriff;
6. Backup/Restore und Verfahren für Verlustmeldung/Fernsperre;
7. Schulung für Reisen und öffentliche Umgebungen;
8. Protokollierung und regelmäßige Wirksamkeitskontrolle.

### 5.3 Risikovergleich

Vorgegebene Werte:

```text
vorher: Wahrscheinlichkeit 3 × Auswirkung 3 = Risikowert 9
nachher: Wahrscheinlichkeit 1 × Auswirkung 3 = Restrisikowert 3
```

Die Auswirkung bleibt bei erfolgreicher Offenlegung hoch, aber die Wahrscheinlichkeit sinkt. Ob Wert 3 akzeptabel ist, entscheidet die festgelegte Risikopolitik und die befugte Rolle.

## 6. Prüfungsformulierungen

> Die Integrität ist verletzt, da die Kontonummer unberechtigt verändert wurde.

> Die fehlende Datenträgerverschlüsselung ist eine Schwachstelle, während der Diebstahl des Notebooks ein Bedrohungsszenario beziehungsweise Ereignis darstellt.

> Die Maßnahme reduziert die Eintrittswahrscheinlichkeit, beseitigt jedoch nicht jede mögliche Schadensauswirkung; deshalb bleibt ein dokumentiertes Restrisiko bestehen.

> Der Schutzbedarf wird für jedes Schutzziel getrennt begründet, weil Vertraulichkeit, Integrität und Verfügbarkeit im selben Prozess unterschiedliche Folgen haben können.

## 7. Typische Prüfungsfallen

- Bedrohung, Schwachstelle, Angriff und Schaden gleichsetzen.
- Risiko ausschließlich als Schaden definieren.
- CIA-Ziele nur aufzählen, ohne den Fall zu begründen.
- Verfügbarkeit mit Datenrichtigkeit verwechseln.
- Hashing pauschal als Schutz der Vertraulichkeit nennen.
- Schutzbedarf ohne konkrete Auswirkung einstufen.
- Maximumprinzip blind auf jede Komponente übertragen.
- eine einzige Maßnahme als vollständige Sicherheit darstellen.
- „Risiko übertragen“ mit „Verantwortung beseitigen“ verwechseln.
- Restrisiko verschweigen.
- Risikomatrixwerte als exakte mathematische Wahrscheinlichkeit ausgeben.
- organisatorische Dokumentation mit wirksamer Umsetzung gleichsetzen.

## 8. Selbsttest

1. Definiere Vertraulichkeit, Integrität und Verfügbarkeit.
2. Ordne zu: Gehaltsdatei gelesen, IBAN verändert, Server ausgefallen.
3. Erkläre Schutzobjekt, Bedrohung, Schwachstelle, Angriff und Schaden.
4. Was bedeutet das Lernmodell für Risiko?
5. Nenne die drei Schutzbedarfskategorien.
6. Erkläre Maximumprinzip und Kumulationseffekt.
7. Nenne je zwei technische und organisatorische Maßnahmen.
8. Welche vier grundlegenden Risikobehandlungen gibt es?
9. Eine Matrix bewertet Wahrscheinlichkeit 2 und Auswirkung 3. Berechne den Wert.
10. Warum kann die Auswirkung nach einer Maßnahme unverändert hoch bleiben?
11. Begründe den Schutzbedarf für die Verfügbarkeit eines Notrufsystems.
12. Bewerte: „Mit einer Versicherung ist das Informationssicherheitsrisiko beseitigt.“

<details>
<summary>Lösungen anzeigen</summary>

1. Zugriff nur für Berechtigte; Schutz vor unbemerkter/unberechtigter Änderung; rechtzeitige Nutzbarkeit.
2. Vertraulichkeit; Integrität; Verfügbarkeit.
3. Objekt ist zu schützen; Bedrohung kann schaden; Schwachstelle ermöglicht Ausnutzung; Angriff ist konkrete Ausnutzung; Schaden ist negative Folge.
4. Kombination beziehungsweise modellhaft Produkt aus Wahrscheinlichkeit und Auswirkung.
5. normal, hoch, sehr hoch.
6. Höchster benötigter Schutz wird bei Abhängigkeit vererbt; viele Objekte können zusammen höheren Schaden erzeugen.
7. Technisch etwa MFA/Verschlüsselung; organisatorisch etwa Richtlinie/Vier-Augen-Prinzip.
8. vermeiden, reduzieren, übertragen/teilen, akzeptieren.
9. `2 × 3 = 6` nach der vorgegebenen Matrix.
10. Die Maßnahme kann vor allem die Wahrscheinlichkeit senken; gelingt der Angriff dennoch, bleibt der mögliche Schaden groß.
11. Sehr hoch, da Nichtverfügbarkeit Leib und Leben gefährden kann.
12. Falsch; höchstens finanzielle Folgen werden teilweise übertragen, Betriebs-, Rechts- und Reputationsrisiken bleiben.

</details>

## 9. Quellen und Abgleich

- [BSI IT-Grundschutz-Kompendium](https://www.bsi.bund.de/grundschutz-kompendium) — Schutzziele, Gefährdungen und Anforderungen im IT-Grundschutz; aktuelle Edition jeweils neu prüfen.
- [BSI-Standard 200-2: IT-Grundschutz-Methodik](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Grundschutz/BSI_Standards/standard_200_2.html) — Schutzbedarfsfeststellung, Modellierung und IT-Grundschutz-Check.
- [BSI-Standard 200-3: Risikomanagement](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Grundschutz/BSI_Standards/standard_200_3.html) — risikobezogene Analyse und Behandlung.
- [FIAusbV § 9](https://www.gesetze-im-internet.de/fiausbv/__9.html) — Einrichten unter Beachtung von IT-Sicherheit, Datenschutz und Qualität.

## 10. Offene Prüfpunkte für den Unterricht

- Welche Risikomatrix und welche Grenzwerte verwendet WBS in den Aufgaben?
- Soll der Verteilungseffekt aktiv geprüft oder nur das Maximumprinzip gelernt werden?
- Welche BSI-Schadensszenarien müssen wörtlich beherrscht werden?
