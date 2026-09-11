# Kontrollblock 03 — Restthemen

```text
Zeit: 30 Minuten
Punkte: 40
Hilfsmittel: Taschenrechner
Antwortsprache: Deutsch
Ziel: mindestens 32 Punkte
```

## Aufgaben

### 1. Marktforschung und SWOT — 5 Punkte

Ein Systemhaus prüft einen Reparaturservice für Tablets. Nennen Sie je eine geeignete Methode der Primär- und Sekundärforschung. Ordnen Sie `erfahrene Techniker`, `fehlende Ersatzteile`, `steigende Nachfrage` und `neuer Billiganbieter` den SWOT-Feldern zu.

### 2. QR-Code — 4 Punkte

Ein QR-Code auf einem Paket ist teilweise verschmutzt, bleibt aber lesbar. Erklären Sie Fehlerkorrektur und begründen Sie, weshalb der enthaltene Link trotzdem geprüft werden muss.

### 3. Programmiersprache — 6 Punkte

Für ein kleines plattformunabhängiges Inventurwerkzeug soll eine Programmiersprache gewählt werden. Grenzen Sie Compiler, Interpreter und JIT ab. Nennen Sie drei fallbezogene Auswahlkriterien.

### 4. Webgrundlagen — 6 Punkte

Ordnen Sie HTML, CSS und JavaScript ihren Hauptaufgaben zu. Grenzen Sie GET und POST ab. Nennen Sie je eine geeignete grundlegende Maßnahme gegen XSS und CSRF.

### 5. Mobile Geräte — 5 Punkte

Ein Unternehmen erlaubt private Smartphones für E-Mail. Erklären Sie BYOD und nennen Sie vier Aufgaben eines MDM, die Sicherheit und geregeltes Offboarding unterstützen.

### 6. Netzwerkdruck — 5 Punkte

Ein Toner kostet 96 Euro und reicht für 8.000 Seiten; die anteilige Trommel kostet 0,8 Cent je Seite. Berechnen Sie die reinen Verbrauchskosten je Seite. Nennen Sie Port und Zweck von IPP sowie einen Datenschutzvorteil von Pull Printing.

### 7. Qualitätsanalyse — 5 Punkte

In 600 geprüften Vorgängen treten 18 Fehler auf. Berechnen Sie Fehleranteil und erwartete Fehlerzahl bei 2.000 vergleichbaren Vorgängen. Erklären Sie, wozu ein Ishikawa-Diagramm dient und warum es eine Ursache nicht beweist.

### 8. Service-Management — 4 Punkte

Ordnen Sie ITIL, ISO/IEC 20000, COBIT und MOF jeweils einem eindeutigen Schwerpunkt zu.

<details>
<summary>Musterlösung und Punkte anzeigen</summary>

1. Primär: zum Beispiel Kundenbefragung; sekundär: vorhandene Branchenstatistik. Stärke: erfahrene Techniker; Schwäche: fehlende Ersatzteile; Chance: steigende Nachfrage; Risiko: neuer Billiganbieter. `1 + 4 = 5 P`.
2. Fehlerkorrektur rekonstruiert begrenzt beschädigte Codeelemente. Sie bestätigt weder Herausgeber noch Wahrheitsgehalt; Domain/Ziel kann manipuliert sein. `2 + 2 = 4 P`.
3. Compiler übersetzt vor der Ausführung, Interpreter verarbeitet zur Laufzeit, JIT übersetzt Teile während der Laufzeit. Kriterien zum Beispiel Zielplattform, Bibliotheken/APIs, Teamkenntnisse, Wartbarkeit, Deployment oder Ressourcenbedarf. `3 + 3 = 6 P`.
4. HTML: Struktur; CSS: Darstellung; JavaScript: Verhalten. GET fordert typischerweise eine Ressource an, POST übermittelt Daten zur Verarbeitung. XSS: kontextgerechtes Output-Encoding; CSRF: CSRF-Token. `3 + 1 + 2 = 6 P`.
5. BYOD ist die betriebliche Nutzung eines privaten Geräts. MDM-Aufgaben zum Beispiel Registrierung, Verschlüsselung, Bildschirmsperre, Zertifikate, App-Regeln, Remote-Sperre/-Löschung und Entfernen betrieblicher Daten beim Offboarding. `1 + 4 = 5 P`.
6. Toner: `96 / 8.000 = 0,012 € = 1,2 Cent`; plus `0,8 Cent = 2,0 Cent/Seite`. IPP: typischerweise TCP 631, Übertragung/Steuerung von Druckaufträgen. Pull Printing gibt erst nach Authentisierung aus. `2 + 2 + 1 = 5 P`.
7. `18/600 = 3 %`; `2.000 × 0,03 = 60`. Ishikawa strukturiert mögliche Ursachen nach Kategorien; die Hypothesen müssen mit Daten/Tests bestätigt werden. `2 + 1 + 2 = 5 P`.
8. ITIL: Best Practices für Servicewert/ITSM; ISO/IEC 20000: Anforderungen an ein Service-Management-System; COBIT: IT-Governance/-Steuerung; MOF: Microsoft-orientiertes Betriebs-/Service-Framework. `je 1 P`.

</details>

## Auswertung

| Punkte | Bedeutung | Nächster Schritt |
|---:|---|---|
| 32–40 | belastbare Basis | volle Simulation schreiben |
| 24–31 | einzelne Lücken | betroffene Kapitel K10/K25/K31/K44/K46/K49/K52 wiederholen |
| 0–23 | noch nicht stabil | Begriffe aktiv lernen, Aufgaben nach 24 Stunden wiederholen |
