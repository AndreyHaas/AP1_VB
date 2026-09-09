# Zuordnung der ursprünglichen TXT-Dateien

Alle Originaldateien bleiben unverändert in `99-originale-txt/`. Die bereinigten Inhalte wurden thematisch verteilt:

| Original | Bereinigte Zieldatei(en) |
|---|---|
| Angriffsarten | `09-it-sicherheit-datenschutz/05-angriffsarten-und-schadsoftware.md` |
| AntwortCodeUndDns | `05-netzwerktechnik/03-tcp-udp-ports-und-http-statuscodes.md`, `04-dns.md`, `09-it-sicherheit-datenschutz/11-tls-und-https.md` |
| ArtenVonSchutzmaßnahmen | `09-it-sicherheit-datenschutz/03-arten-von-schutzmassnahmen.md` |
| Backup und RAID | `10-backup/01-backup-arten-und-wiederherstellung.md`, `02-sicherungskonzept-gvs-und-medien.md`, `90-ap2-zusatzwissen/raid.md` |
| BedrohungSchwachstelleUndRisiko | `09-it-sicherheit-datenschutz/02-bedrohung-schwachstelle-risiko.md` |
| Berechnung einer unkomprimierten und komprimierten Bilder | `03-hardware-software/bilddateien-und-kompression.md` |
| Betroffenenrechte nach der DSGVO | `09-it-sicherheit-datenschutz/15-betroffenenrechte.md` |
| Datenmenge и Übertragungszeit | `02-kundenbedarf-wirtschaftlichkeit/datenmengen-und-uebertragungszeiten.md` |
| Datenschutz | `09-it-sicherheit-datenschutz/12-datenschutz-grundlagen.md` |
| Datenschutzverletzung | `09-it-sicherheit-datenschutz/17-datenschutzverletzungen.md` |
| DHCP, DNS, Gateway und NAT | `05-netzwerktechnik/03-tcp-udp-ports-und-http-statuscodes.md`, `04-dns.md`, `05-ipv4-dhcp-und-default-gateway.md`, `08-routing-nat-und-pat.md` |
| Digitale Signatur | `09-it-sicherheit-datenschutz/09-digitale-signatur.md` |
| Digitales Zertifikat und PKI | `09-it-sicherheit-datenschutz/10-zertifikate-und-pki.md` |
| DMZ — Demilitarisierte Zone | `05-netzwerktechnik/11-dmz.md` |
| Firewall | `05-netzwerktechnik/10-firewall.md` |
| GateWay's | `05-netzwerktechnik/08-routing-nat-und-pat.md` |
| Grundsätze der DSGVO | `09-it-sicherheit-datenschutz/13-dsgvo-grundsaetze.md` |
| IdentifizierungAuthentisierungAutorisierung | `09-it-sicherheit-datenschutz/06-identifizierung-authentisierung-autorisierung.md` |
| IDS und IPS | `05-netzwerktechnik/12-ids-und-ips.md` |
| IPv6 | `05-netzwerktechnik/07-ipv6.md` |
| IT-Sicherheit | `09-it-sicherheit-datenschutz/01-schutzziele.md` |
| NAT und PAT | `05-netzwerktechnik/08-routing-nat-und-pat.md` |
| OSI_Model | `05-netzwerktechnik/01-osi-und-tcp-ip-modell.md`, `03-tcp-udp-ports-und-http-statuscodes.md` |
| PasswoerterUndHashing | `09-it-sicherheit-datenschutz/07-passwortspeicherung-und-hashing.md` |
| PCComponenten | `03-hardware-software/hardwareauswahl.md` |
| Privacy by Design und Privacy by Default | `09-it-sicherheit-datenschutz/20-privacy-by-design-und-default.md` |
| Pseudonymisierung und Anonymisierung | `09-it-sicherheit-datenschutz/19-pseudonymisierung-und-anonymisierung.md` |
| RAID | `90-ap2-zusatzwissen/raid.md` |
| Rechtsgrundlagen nach Art. 6 DSGVO | `09-it-sicherheit-datenschutz/14-rechtsgrundlagen-art-6-dsgvo.md` |
| Rollen im Datenschutz | `09-it-sicherheit-datenschutz/16-rollen-im-datenschutz.md` |
| SLA и допустимая Ausfallzeit | `11-service-vertraege-uebergabe/01-verfuegbarkeit-und-sla.md` |
| Stromkostenberechnung | `02-kundenbedarf-wirtschaftlichkeit/stromkosten.md` |
| SubNetting | `05-netzwerktechnik/06-ipv4-subnetting.md` |
| Symmetrische und asymmetrische Verschlüsselung | `09-it-sicherheit-datenschutz/08-symmetrische-asymmetrische-hybride-verschluesselung.md` |
| TLS und HTTPS | `09-it-sicherheit-datenschutz/11-tls-und-https.md` |
| TOM — Technische und organisatorische Maßnahmen | `09-it-sicherheit-datenschutz/18-tom.md` |
| TransportPaketenSenden | `05-netzwerktechnik/02-datenweg-beim-https-aufruf.md` |
| Verfügbarkeit | `11-service-vertraege-uebergabe/01-verfuegbarkeit-und-sla.md` |
| VLAN | `05-netzwerktechnik/09-vlan.md` |
| VPN — Virtual Private Network | `05-netzwerktechnik/13-vpn.md` |

## Wesentliche Korrekturen

- Digitale Signatur: `Private Key des Absenders` zum Signieren; `Public Key des Absenders` zum Prüfen.
- Vertrauliche Übertragung: `Public Key des Empfängers` zum Verschlüsseln; `Private Key des Empfängers` zum Entschlüsseln.
- Digitale Signatur gewährleistet nicht Vertraulichkeit.
- HTTPS schützt die Verbindung, beweist aber nicht die Ehrlichkeit einer Website.
- Salt muss nicht geheim sein; Algorithmuskenntnis ermöglicht keine direkte Rückrechnung eines sicheren Hashes.
- GVS bestimmt Zeitpunkt und Aufbewahrung, nicht die Datenmenge einer Sicherung.
- IPv4 `/28`: Bei Netz `10.0.0.160/28` ist `.175` Broadcast und `.176` das nächste Netz.
- Datenschutzverletzungen werden risikobasiert bewertet; der Auftragsverarbeiter informiert zuerst den Verantwortlichen.
- RAID wurde aus dem AP1-Pfad in `90-ap2-zusatzwissen/` verschoben.
