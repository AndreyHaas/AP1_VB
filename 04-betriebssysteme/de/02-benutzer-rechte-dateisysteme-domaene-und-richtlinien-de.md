---
pruefung: AP1
thema: Benutzer, Rechte, Dateisysteme, Domäne und Richtlinien
prioritaet: Kern
status: Entwurf
stand: 2026-09-10
sprache: Deutsch
gegenstueck: ../ru/02-benutzer-rechte-dateisysteme-domaene-und-richtlinien-ru.md
---

# AP1: Benutzer, Rechte, Dateisysteme, Domäne und Richtlinien

Ein Benutzerkonto beantwortet „Wer handelt?“, eine Berechtigung „Was ist erlaubt?“, ein Dateisystem „Wie werden Daten und Metadaten organisiert?“ und Domäne/Richtlinie „Wie wird dies zentral verwaltet?“. Eine Prüfungsantwort zeigt nicht nur die Vergabe, sondern auch Minimalität, Kontrolle und Entzug.

---

## 1. Lernziele

Nach dieser Einheit kannst du:

- Identifizierung, Authentifizierung und Autorisierung unterscheiden;
- lokale, Domänen-, Benutzer-, Gruppen-, Dienst- und Computerkonten erklären;
- Least Privilege, Need to Know und RBAC anwenden;
- grundlegende ACL und Vererbung lesen;
- Rechte in einfachen Freigabe-/Dateisystemfällen bestimmen;
- Linux-Rechte `rwx` und `chmod` erklären;
- FAT32, exFAT, NTFS, ext4 und APFS vergleichen;
- Rechte und Verschlüsselung trennen;
- Arbeitsgruppe, Domäne, Domain Controller, OU und GPO erklären;
- DNS, Zeit und Berechtigung beim Domain Join prüfen;
- sichere Konsolenbefehle auswählen;
- ein Berechtigungskonzept mit Tests entwerfen.

---

## 2. Prüfungsminimum — 15 Minuten

1. Identifizierung = Kennung; Authentifizierung = Nachweis; Autorisierung = Rechteprüfung.
2. Rechte werden über Gruppen/Rollen statt direkt je Benutzer vergeben.
3. `Least Privilege` bedeutet nur minimale Rechte für die erforderliche Zeit.
4. Eine ACL enthält Einträge für Subjekte und Rechte.
5. Bei einer Netzwerkfreigabe können Freigabe- und Dateisystemrechte gleichzeitig gelten; beide Ebenen begrenzen.
6. Linux: `r=4`, `w=2`, `x=1`; `chmod 750` = Besitzer `rwx`, Gruppe `r-x`, andere `---`.
7. FAT32 ist kompatibel, besitzt aber keine modernen ACL und begrenzt einzelne Dateien; NTFS/ext4 unterstützen Rechte und Journaling.
8. Domain Join benötigt passendes DNS und korrekte Zeit. GPO zentralisieren Benutzer-/Computereinstellungen.

Musterantwort:

> Der Benutzer erhält den Zugriff über eine rollenbezogene Gruppe, weil dadurch Berechtigungen nachvollziehbar, einheitlich und beim Rollenwechsel leichter entziehbar sind. Direkte Einzelberechtigungen werden vermieden.

---

## 3. Identifizierung, Authentifizierung, Autorisierung

| Schritt | Frage | Beispiel |
|---|---|---|
| Identifizierung | Wer behauptest du zu sein? | Benutzername |
| Authentifizierung | Wie beweist du das? | Passwort und Token |
| Autorisierung | Was darfst du? | Leserecht auf Projektordner |
| Protokollierung | Was wurde getan? | Zugriff im Log |

Eine erfolgreiche Anmeldung berechtigt nicht zu jeder Ressource.

---

## 4. Kontotypen

| Konto | Zweck |
|---|---|
| Benutzerkonto | personengebundene Nutzung |
| Gruppenobjekt | Berechtigungen bündeln |
| Dienstkonto | Dienst oder Anwendung ausführen |
| Computerkonto | Identität eines verwalteten Geräts |
| lokales Konto | auf einem System gültig |
| Domänenkonto | zentral verwaltete Identität |
| Gastkonto | stark begrenzter Sonderzugang |
| Administratorkonto | privilegierte Verwaltung |

Eine Person kann ein Standardkonto und ein getrenntes Administratorkonto besitzen. Tägliche Arbeit mit Adminrechten erhöht den Schaden bei Fehler oder Kompromittierung.

---

## 5. Lebenszyklus eines Kontos

1. Antrag und Genehmigung.
2. Identität und Rolle prüfen.
3. Konto anlegen.
4. Gruppen und Rechte zuweisen.
5. Erstzugang sicher übergeben.
6. Nutzung und Änderungen protokollieren.
7. Regelmäßig rezertifizieren.
8. Rollenwechsel zeitnah umsetzen.
9. Bei Austritt sperren.
10. Daten und Verantwortung übergeben.
11. Nach Vorgabe löschen oder archivieren.

`Sperren` beendet die Nutzung schnell; `Löschen` kann Zuordnungen und Nachweise beeinflussen. Beide Schritte werden getrennt geplant.

---

## 6. Least Privilege und Need to Know

`Least Privilege`:

> Nur die minimal nötigen Rechte für Aufgabe und Zeitraum.

`Need to Know`:

> Zugriff nur auf Informationen, die für die Rolle erforderlich sind.

Ergänzungen:

- Funktionstrennung;
- zeitlich begrenzte Rechte;
- Vier-Augen-Freigabe;
- regelmäßige Überprüfung;
- Notfallzugang mit verstärktem Logging.

---

## 7. RBAC

Role Based Access Control:

```text
Benutzer → Rolle/Gruppe → Berechtigung → Ressource
```

Vorteile:

- einheitliche Zuweisung;
- einfacheres On-/Offboarding;
- weniger Einzelrechte;
- bessere Prüfbarkeit;
- Vergleich von Soll-Rolle und Ist-Rechten.

Eine Rolle folgt der tatsächlichen Aufgabe, nicht nur einer Stellenbezeichnung.

---

## 8. ACL

Eine `Access Control List` enthält Einträge mit:

- Subjekt, etwa Benutzer oder Gruppe;
- Recht;
- Allow/Deny;
- Geltungsbereich;
- Vererbung.

Effektive Rechte können abhängen von Gruppenmitgliedschaften, expliziten und geerbten Einträgen, Deny, Eigentümer, Freigabe-/Dateisystemkombination, Anwendung und Plattform.

Ein vereinfachtes Regelmodell einer Plattform darf nicht auf alle Betriebssysteme übertragen werden.

---

## 9. Vererbung

Rechte eines übergeordneten Ordners können an untergeordnete Objekte vererbt werden.

Vorteile:

- weniger Administration;
- einheitliche Regeln.

Risiken:

- unbeabsichtigt breiter Zugriff;
- komplexe Ausnahmen;
- unklarer Ursprung.

Beim Abschalten der Vererbung muss festgelegt werden, ob geerbte Einträge kopiert oder entfernt werden.

---

## 10. Effektive Rechte

Ein einfacher Windows-ähnlicher Fall:

- Gruppe `Projekt-Leser`: Lesen — Allow;
- Gruppe `Projekt-Team`: Ändern — Allow;
- der Benutzer ist Mitglied beider Gruppen.

Das Ergebnis enthält üblicherweise Ändern, weil erlaubende Gruppenrechte zusammengeführt werden.

Ein anwendbares Deny kann Zugriff begrenzen. Das genaue Resultat hängt von Plattform, Reihenfolge und Eintragstyp ab. Verständliche Gruppen sind komplexen individuellen Deny-Regeln vorzuziehen.

---

## 11. Freigabe- und Dateisystemrechte

Bei einer Netzwerkfreigabe werden zwei Ebenen geprüft:

1. Freigabeberechtigung;
2. lokale Dateisystem-ACL.

Share Lesen + NTFS Ändern ergibt über das Netz Lesen, weil die Freigabe begrenzt.

Share Ändern + NTFS Lesen ergibt ebenfalls Lesen, weil NTFS begrenzt.

Lokaler Zugriff läuft nicht über die Freigabeebene.

---

## 12. Linux-Grundrechte

Klassen:

- `u` — owner/user;
- `g` — group;
- `o` — others.

Rechte:

- `r` — read;
- `w` — write;
- `x` — execute.

```text
-rwxr-x---  deploy.sh
```

Besitzer hat `rwx`, Gruppe `r-x`, andere keine Rechte.

---

## 13. Numerische Schreibweise

```text
r = 4
w = 2
x = 1
```

`chmod 640 bericht.txt`:

```text
6 = rw-
4 = r--
0 = ---
```

`chmod 750 script.sh`:

```text
7 = rwx
5 = r-x
0 = ---
```

777 ist keine universelle Reparatur, sondern meist eine Überberechtigung.

---

## 14. Rechte an Verzeichnissen

Bei Verzeichnissen:

- `r` — Namen/Inhalt auflisten;
- `w` — Einträge anlegen oder entfernen, wenn weitere Voraussetzungen stimmen;
- `x` — Verzeichnis betreten beziehungsweise durchsuchen.

Ein Dateiname kann bekannt sein, ohne dass der Weg durch ein übergeordnetes Verzeichnis erlaubt ist. Löschen hängt häufig von Verzeichnisrechten ab, nicht nur von Dateirechten.

---

## 15. Eigentümer, Gruppe, umask und sudo

- `chown` ändert bei ausreichenden Rechten Eigentümer oder Gruppe;
- `umask` begrenzt Standardrechte neuer Objekte;
- `sudo` erlaubt eine kontrollierte privilegierte Aktion;
- root besitzt sehr breite Rechte und wird sparsam eingesetzt.

`sudo` macht einen Befehl nicht sicher. Zielpfad und Wirkung werden vorher geprüft.

---

## 16. Windows-Berechtigungen

Typische NTFS-Rechte:

- Vollzugriff;
- Ändern;
- Lesen und Ausführen;
- Ordnerinhalt anzeigen;
- Lesen;
- Schreiben;
- spezielle Berechtigungen.

Praktische Ressourcengruppen:

- `Ressource-R`;
- `Ressource-RW`;
- bei Bedarf administrative Rolle.

Benutzer werden fachlichen Gruppen zugeordnet, die wiederum Zugriff auf Ressourcen erhalten.

---

## 17. Dateisystem: Aufgabe

Ein Dateisystem organisiert:

- Dateien und Verzeichnisse;
- Namen;
- Speicherblöcke;
- Metadaten;
- Zeitstempel;
- Rechte;
- Journaling;
- gegebenenfalls Kompression, Verschlüsselung und Snapshots.

Die Funktionen unterscheiden sich nach Dateisystem und OS.

---

## 18. FAT32

Stärken:

- breite Kompatibilität;
- einfache Struktur;
- UEFI- und Wechselmedienszenarien.

Grenzen:

- keine moderne Datei-ACL;
- einzelne Datei klassisch kleiner als 4 GiB;
- kein modernes Journaling;
- ungeeignet als modernes Windows-Systemlaufwerk.

Für Austauschmedien kann FAT32 passen, für eine geschützte Mehrbenutzerablage nicht.

---

## 19. exFAT

Vorteile:

- große Dateien;
- breite Wechselmedienkompatibilität;
- einfacher als ein Systemdateisystem.

Grenzen:

- keine NTFS-ACL;
- andere Robustheitsfunktionen;
- möglicher Verlust von Rechten oder Metadaten zwischen Systemen.

Beim Austausch steht Kompatibilität, im internen Betrieb stehen Rechte und Zuverlässigkeit stärker im Vordergrund.

---

## 20. NTFS

Typische Funktionen:

- ACL;
- Journaling;
- große Dateien und Volumes;
- Kompression;
- Verschlüsselungsfunktionen;
- Quotas;
- Links und Metadaten.

NTFS eignet sich für Windows-System- und Datenlaufwerke mit Rechtebedarf. Journaling unterstützt Metadatenkonsistenz nach einem Fehler, ersetzt aber kein Backup.

---

## 21. ext4 und APFS

`ext4`:

- verbreitetes Linux-Dateisystem;
- Unix-Rechte und ACL;
- Journaling;
- für viele Server- und Desktopfälle geeignet.

`APFS`:

- modernes Apple-Dateisystem;
- für Flash/SSD ausgelegt;
- unterstützt Verschlüsselungs- und Snapshotfunktionen.

Konkrete Unterstützung hängt von OS-Version und Werkzeug ab.

---

## 22. Journaling

Ein Journal hält geplante Änderungen fest, damit nach einem Abbruch schneller ein konsistenter Zustand hergestellt werden kann.

Es garantiert nicht:

- Fehlerfreiheit der Logik;
- Schutz vor Löschen;
- ein aktuelles Backup;
- Unversehrtheit jeder Nutzdatei.

> Journaling verbessert die Dateisystemkonsistenz; Backup ermöglicht die Wiederherstellung früherer Datenstände.

---

## 23. Rechte gegen Verschlüsselung

`Berechtigungen` steuern Zugriff über ein laufendes System.

`Verschlüsselung` schützt Vertraulichkeit ohne Schlüssel, etwa bei Diebstahl eines Datenträgers.

Beides ergänzt sich:

- ein berechtigter Nutzer kann eine zugängliche verschlüsselte Datei löschen;
- bei unverschlüsseltem ausgebautem Datenträger können OS-Rechte umgangen werden;
- Backup und Recovery bleiben eigene Aufgaben.

---

## 24. Arbeitsgruppe und Domäne

| Merkmal | Arbeitsgruppe | Domäne |
|---|---|---|
| Konten | lokal je Rechner | zentral im Verzeichnisdienst |
| Richtlinien | lokal | zentral über GPO |
| Skalierung | kleine/dezentrale Umgebung | verwaltete Organisation |
| Anmeldung | lokales Konto | Domänenidentität |
| Verwaltung | wiederholt | zentralisiert |

Eine Domäne benötigt Infrastruktur, Betrieb, Security und Verfügbarkeit.

---

## 25. Active-Directory-Grundbegriffe

| Begriff | Bedeutung |
|---|---|
| Domäne | administrative und Identitätsgrenze |
| Domain Controller | stellt AD DS, Authentifizierung und Verzeichnis bereit |
| Objekt | Benutzer, Gruppe, Computer und weitere Einträge |
| OU | Container für Struktur, Delegation und GPO-Verknüpfung |
| GPO | Sammlung von Richtlinieneinstellungen |
| SYSVOL | Verteilung bestimmter Policy- und Skriptdaten |

Eine OU ist nicht nur ein Ordner; ihre Struktur beeinflusst Delegation und GPO.

---

## 26. DNS und Zeit

AD DS nutzt DNS, damit Clients Dienste und Domain Controller finden.

Funktioniert IP-Ping, aber die Domäne wird nicht gefunden, prüft man zuerst:

- DNS-Server des Clients;
- Namensauflösung;
- passende Records;
- Erreichbarkeit;
- Firewall.

Kerberos reagiert auf deutliche Zeitabweichungen. Zeitsynchronisation ist daher ebenfalls Voraussetzung.

---

## 27. Domain Join

1. Computername prüfen.
2. IP, DNS und Zeit.
3. Erreichbarkeit von Domäne und DC.
4. Join-Berechtigung.
5. richtige Domäne.
6. Computerobjekt und Ziel-OU.
7. Neustart.
8. Domänenanmeldung.
9. GPO und Ressourcen.
10. Ergebnis dokumentieren.

Ein öffentlicher DNS-Server statt des vorgesehenen AD-DNS ist eine typische Fehlerursache.

---

## 28. Gruppenrichtlinien

GPO konfigurieren zentral:

- Computer- und Benutzereinstellungen;
- Sicherheitsoptionen;
- Firewall;
- Energie;
- Skripte;
- Software und Policies;
- Laufwerkszuordnungen;
- Einschränkungen.

GPO werden mit Site, Domäne oder OU verknüpft. Links, Vererbung, Security Filtering und weitere Mechanismen bestimmen den Geltungsbereich.

---

## 29. Computer- und Benutzerkonfiguration

`Computerkonfiguration` wirkt auf Gerät und System, typischerweise beim Start und bei Aktualisierung.

`Benutzerkonfiguration` wirkt auf die angemeldete Person, typischerweise bei Anmeldung und Aktualisierung.

Beispiel:

- Firewallregel → Computer;
- persönliche Ordnerumleitung → Benutzer.

Nicht jede Einstellung lässt sich beliebig zwischen beiden GPO-Teilen verschieben.

---

## 30. Richtlinien testen

Zu prüfen:

- richtige OU;
- Gruppenmitgliedschaft;
- anwendbare GPO;
- DNS und Netzwerk;
- Aktualisierung, Neustart oder Anmeldung;
- Ergebnisbericht;
- Konflikte und Filter;
- Ereignisprotokoll.

Mehrere unprotokollierte GPO-Änderungen verhindern eine klare Ursachenanalyse.

---

## 31. Sichere Konsolenarbeit

Vor einem Befehl:

1. Benutzer und Rechte;
2. System und Umgebung;
3. Arbeitsverzeichnis;
4. Quelle und Ziel;
5. Wildcards;
6. Auswirkungen;
7. Backup und Rollback.

Zuerst werden nur lesende Befehle eingesetzt.

Linux: `pwd`, `ls`, `id`, `getfacl`, `ip`, `ss`, `journalctl`.  
Windows: `whoami`, `dir`, `icacls`, `ipconfig`, `nslookup`, `gpresult`, `Get-WinEvent`.

---

## 32. Praxisfall: Projektfreigabe

Anforderungen:

- Entwickler dürfen lesen und ändern;
- Projektleitung darf lesen;
- andere haben keinen Zugriff;
- Vergabe über Rollen;
- vierteljährliche Prüfung.

Konzept:

1. Gruppen `Projekt-X-R` und `Projekt-X-RW`.
2. Fachgruppe Entwickler wird Mitglied von `RW`.
3. Projektleitung wird Mitglied von `R`.
4. Keine direkten Benutzerrechte.
5. Vererbung am Projektordner prüfen.
6. Freigabe und Dateisystem abstimmen.
7. Testkonten für beide Rollen und einen Unberechtigten.
8. Lesen, Erstellen, Ändern und Löschen testen.
9. Ergebnis dokumentieren.
10. Austritt und Rollenwechsel in den Prozess aufnehmen.

---

## 33. Prüfungsalgorithmus

1. Subjekt, Ressource und Aktion.
2. Identität und Authentifizierung.
3. Minimal benötigte Rechte.
4. Rolle und Gruppe.
5. Vererbung und ACL.
6. Freigabe- und Dateisystemebene.
7. Dateisystemfähigkeit.
8. Domäne, DNS, Zeit und GPO.
9. Positive und negative Tests.
10. Dokumentation und Review.

---

## 34. Typische Prüfungsfallen

| Falle | Korrektur |
|---|---|
| Login bedeutet Zugriff auf alles | Autorisierung getrennt prüfen |
| Rechte direkt an Benutzer | Gruppen und Rollen |
| 777 löst das Problem | Least Privilege |
| `rwx` bedeutet bei Datei und Ordner dasselbe | Bedeutung nach Objekttyp |
| Share Ändern ergibt immer Ändern | NTFS kann begrenzen |
| Journaling ist Backup | verschiedene Aufgaben |
| Datenpartition ist Backup | gleicher Ausfallbereich |
| Domain Join mit beliebigem DNS | passender interner DNS |
| OU ist normaler Ordner | Struktur für Delegation und GPO |
| Verschlüsselung ersetzt Rechte | Vertraulichkeit vs laufender Zugriff |

---

## 35. Selbsttest

1. Trenne Identifizierung, Authentifizierung und Autorisierung.
2. Warum ein separates Administratorkonto?
3. Nenne die Schritte des Kontolebenszyklus.
4. Was ist Least Privilege?
5. Was ist RBAC?
6. Woraus besteht ein ACL-Eintrag?
7. Welche Faktoren bestimmen effektive Rechte?
8. Was bewirkt Vererbung?
9. Share=Lesen, NTFS=Ändern: Was gilt über das Netz?
10. Erkläre `chmod 640`.
11. Erkläre `chmod 750`.
12. Was bedeutet `x` am Verzeichnis?
13. Warum ist 777 kein guter Standard?
14. Wozu dient `umask`?
15. Nenne drei NTFS-Rechte.
16. Was macht ein Dateisystem?
17. Nenne Grenzen von FAT32.
18. Wann eignet sich exFAT?
19. Warum ist Journaling kein Backup?
20. Wie unterscheiden sich Rechte und Verschlüsselung?
21. Vergleiche Arbeitsgruppe und Domäne.
22. Was sind OU und GPO?
23. Warum benötigt AD DNS?
24. Warum ist korrekte Zeit wichtig?
25. Nenne die Schritte des Domain Join.
26. Trenne Computer- und Benutzerkonfiguration.
27. Wie wird eine GPO getestet?
28. Was wird vor einem Konsolenbefehl geprüft?
29. Entwirf Gruppen für den Praxisfall.

<details>
<summary>Lösungen anzeigen</summary>

1. Behauptete Identität; Nachweis; Prüfung einer erlaubten Aktion.
2. Privilegien werden nur zur Administration genutzt, das Risiko sinkt.
3. Antrag, Prüfung, Anlage, Rechte, Nutzung, Review, Wechsel, Sperre, Übergabe, Löschung.
4. Minimale Rechte für Aufgabe und Zeitraum.
5. Rechte über Rollen und Gruppen statt Einzelzuweisung.
6. Subjekt, Recht, Allow/Deny, Geltung und Vererbung.
7. Gruppen, explizite/geerbte Einträge, Deny, Share, Dateisystem und Plattform.
8. Sie überträgt Rechte an untergeordnete Objekte.
9. Lesen.
10. Besitzer `rw-`, Gruppe `r--`, andere `---`.
11. Besitzer `rwx`, Gruppe `r-x`, andere `---`.
12. Betreten und Zugriff auf bekannte Objekte.
13. Es gibt allen übermäßige Rechte.
14. Sie begrenzt Standardrechte neuer Objekte.
15. Lesen, Schreiben, Ändern, Vollzugriff oder spezielle Rechte.
16. Es organisiert Dateien, Blöcke, Namen und Metadaten.
17. Keine moderne ACL, einzelne Datei <4 GiB, kein modernes Journaling.
18. Große Dateien auf breit kompatiblen Wechselmedien.
19. Das Journal stellt Strukturkonsistenz, nicht frühere Datenstände her.
20. Rechte steuern OS-Zugriff; Verschlüsselung schützt ohne Schlüssel.
21. Lokale Konten/Verwaltung gegen zentrale Identitäten/Richtlinien.
22. Struktur-/Delegationscontainer und Sammlung von Richtlinien.
23. Clients finden Domänendienste und DC über DNS.
24. Kerberos, Zertifikate und Logs hängen davon ab.
25. Name, IP/DNS/Zeit, Erreichbarkeit, Rechte, Domäne/OU, Neustart und Test.
26. Für Gerät/System beziehungsweise angemeldete Person.
27. OU, Gruppen, Links/Filter, Aktualisierung, Ergebnis und Logs prüfen.
28. Identität, Rechner, Verzeichnis, Pfade, Wildcards, Wirkung und Rollback.
29. `Projekt-X-R` und `Projekt-X-RW`, Fachgruppen als Mitglieder, keine Einzelrechte.

</details>

---

## 36. Quellen und Abgleich

- [Microsoft Learn – Group Policy Overview](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/group-policy/group-policy-overview)
- [Microsoft Learn – DNS Concepts für AD DS](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/reviewing-dns-concepts)
- [Microsoft Learn – NTFS Overview](https://learn.microsoft.com/en-us/windows-server/storage/file-server/ntfs-overview)
- [The Open Group – chmod](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/chmod.html)
- [Linux man-pages – inode permissions](https://man7.org/linux/man-pages/man7/inode.7.html)

Der konkrete Berechtigungsalgorithmus hängt von Betriebssystem, ACL-Modell und Zugriffspfad ab. Befehle sind vor praktischer Nutzung gegen die Dokumentation der eingesetzten Version zu prüfen.

---

## 37. Offene Prüfpunkte für den Unterricht

- Welche Begriffe für Identifizierung, Authentifizierung und Autorisierung nutzt die WBS?
- Wird AGDLP oder AGUDLP verlangt?
- Wie tief werden Windows-ACL berechnet?
- Gehören spezielle Linux-Rechte zum Stoff?
- Welche Dateisystemgrenzen müssen numerisch bekannt sein?
- Werden konkrete Domain-Join-Schritte verlangt?
- Ist die Verarbeitungsreihenfolge von GPO relevant?
- Welche Konsolenbefehle gehören zum Unterricht?
- Wie soll ein Berechtigungsprotokoll aussehen?
