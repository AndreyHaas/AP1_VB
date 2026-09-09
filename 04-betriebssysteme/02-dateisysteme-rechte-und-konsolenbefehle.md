---
pruefung: AP1
prioritaet: P1
status: Entwurf
stand: 2026-09-09
---

# Dateisysteme, Rechte und Konsolenbefehle

## Partition und Dateisystem

Eine `Partition` ist ein abgegrenzter Bereich eines Datenträgers. Ein `Dateisystem` organisiert Dateien, Verzeichnisse und Metadaten innerhalb eines Speichervolumens.

| Dateisystem | Typischer Einsatz | Hinweise |
|---|---|---|
| FAT32 | austauschbare Medien/Kompatibilität | keine modernen Zugriffsrechte; 4-GiB-Dateigrößenlimit |
| exFAT | große Dateien auf Wechselmedien | breite Kompatibilität, keine NTFS-Rechte |
| NTFS | Windows | Rechte, Journaling, große Volumes |
| ext4 | Linux | Rechte, Journaling |
| APFS | Apple-Systeme | modern, Snapshots/Verschlüsselungsfunktionen |

`Formatieren` legt ein Dateisystem an und kann vorhandene Strukturen überschreiben. Vorher Ziel eindeutig prüfen und Daten sichern.

## Benutzer, Gruppen und Rechte

Rechte möglichst über Gruppen vergeben (`Role Based Access Control`) und nach `Least Privilege` begrenzen.

Linux-Grundmodell:

```text
u = user, g = group, o = others
r = read, w = write, x = execute
```

`chmod 640 datei` bedeutet:

```text
Besitzer: lesen + schreiben
Gruppe:   lesen
Andere:   keine Rechte
```

Bei Freigaben wirken häufig Freigaberechte und Dateisystemrechte zusammen; effektiv gilt die restriktivere Kombination.

## Wichtige Befehle

Linux:

```text
ls, pwd, cd, mkdir, cp, mv, rm
chmod, chown
ps, grep
ip, ping, traceroute/tracepath, nslookup/dig, arp/ip neigh
mount
```

Windows:

```text
dir, cd, mkdir, copy, move, del
ipconfig, ping, tracert, nslookup, arp
whoami, net user
```

Перед destructive Dateioperationen путь и Ziel всегда проверять. В экзаменационной задаче объяснять назначение команды, а не только название.

## Diagnose-Reihenfolge

```text
physische Verbindung
IP-Konfiguration
lokales Gateway
Routing
DNS
Zielport/Dienst
Anwendung
```

## Selbsttest

1. Welches Dateisystem eignet sich für Windows-Systemlaufwerke mit Zugriffsrechten?
2. Was bedeutet `chmod 750 script.sh`?
3. Welcher Befehl prüft unter Windows die aktuelle IP-Konfiguration?

## Lösungen

```text
1. NTFS
2. Besitzer rwx, Gruppe r-x, Andere keine Rechte
3. ipconfig
```

## Offene Punkte / Korrekturen

- ACLs und Vererbung in praktischen Aufgaben vertiefen.
