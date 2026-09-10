---
pruefung: AP1
thema: Virtualisierung, Container und Cloud-Grundlagen
prioritaet: Abgleich
status: Entwurf
stand: 2026-09-10
sprache: Russisch mit deutschen Fachbegriffen
gegenstueck: ../de/05-virtualisierung-container-und-cloud-grundlagen-de.md
---

# AP1: Virtualisierung, Container und Cloud-Grundlagen

Virtualisierung отделяет логические IT-Ressourcen от физической Hardware. Cloud использует стандартизированные, сетевые и измеряемые Dienste, но не снимает с клиента ответственность за конфигурацию, Identitäten, Daten и контроль поставщика.

---

## 1. Lernziele

После изучения главы нужно уметь:

- объяснять Host, Hypervisor, VM и Gastbetriebssystem;
- различать Typ-1- и Typ-2-Hypervisor;
- сравнивать VM, Container, VDI и DaaS;
- рассчитывать ориентировочный Ressourcenbedarf;
- объяснять Overcommit, Isolation и Single Point of Failure;
- отличать Snapshot от Backup;
- называть пять Cloud-Merkmale по NIST;
- сравнивать IaaS, PaaS, SaaS и DaaS;
- различать Public, Private, Community и Hybrid Cloud;
- распределять ответственность между Anbieter и Kunde;
- оценивать Kosten, Datenschutz, Verfügbarkeit, Portabilität и Exit;
- обосновывать подходящее Betriebsmodell.

---

## 2. Prüfungsminimum — 15 минут

1. `VM` имеет виртуальную Hardware и собственное Gast-OS.
2. `Container` делят Kernel Hostsystem и изолируют процессы.
3. Typ 1 работает непосредственно на Hardware; Typ 2 — поверх Host-OS.
4. Snapshot фиксирует Zustand, но обычно зависит от Plattform и не заменяет Backup.
5. IaaS = Infrastruktur, PaaS = Plattform, SaaS = fertige Anwendung, DaaS = virtueller Desktop.
6. Чем выше Serviceebene, тем больше Betrieb übernimmt Anbieter — но Kunde остаётся ответственным за свои Daten, Identitäten, Konfiguration и Nutzung.
7. Cloud не автоматически дешевле, безопаснее или доступнее.
8. Перед выбором: Bedarf, Daten, Netzwerk, SLA, Kostenmodell, Integration, Backup, Export и Exit.

Musterantwort:

> SaaS eignet sich, weil der Kunde die fertige CRM-Anwendung nutzen möchte, ohne Betriebssystem und Anwendung selbst zu betreiben. Zu prüfen bleiben insbesondere Rollen, Auftragsverarbeitung, Verfügbarkeit, Schnittstellen, Datenexport und Exit-Kosten.

---

## 3. Grundidee der Virtualisierung

Один физический ресурс представляется как несколько логических или объединяется в абстрактный Pool.

Цели:

- Konsolidierung;
- Isolation;
- разные Betriebssysteme;
- быстрое Bereitstellen;
- тестовые Umgebungen;
- Portabilität;
- bessere Auslastung.

Virtualisierung не создаёт вычислительную мощность. CPU, RAM, Speicher и Netzwerk Host остаются физическими Grenzen.

---

## 4. Begriffe

| Begriff | Bedeutung |
|---|---|
| Host | физическая или базовая система |
| Hypervisor/VMM | управляет виртуальными Maschinen и Ressourcen |
| VM | логический компьютер с virtueller Hardware |
| Guest/Gast | Betriebssystem внутри VM |
| vCPU | виртуально назначенный CPU-Ressource |
| Image | файл/шаблон Systemzustand |
| Snapshot | точка состояния в цепочке виртуального диска |
| Template | подготовленный неизменяемый Ausgang для новых VM |

VM ведёт себя как отдельный Rechner, но зависит от Host и Hypervisor.

---

## 5. Typ-1 и Typ-2-Hypervisor

| Merkmal | Typ 1 | Typ 2 |
|---|---|---|
| Ausführung | непосредственно на Hardware | как Anwendung на Host-OS |
| Einsatz | Server, Rechenzentrum | Desktop, Labor, Entwicklung |
| Abhängigkeit | Hypervisor и Hardware | дополнительно Host-OS |
| Verwaltung | специализированная | удобная локальная |

Это типичное различие, а не оценка качества. Typ 2 может быть правильным для разработки, Typ 1 — для централизованного Betriebs.

---

## 6. VM-Aufbau

VM получает:

- vCPU;
- virtuellen RAM;
- virtuelle Datenträger;
- virtuelle Netzwerkadapter;
- virtuelle Firmware;
- virtuelle или durchgereichte Geräte.

Gastbetriebssystem требует Updates, Härtung, Monitoring и Lizenzierung как отдельная система, если условия не говорят иначе.

---

## 7. Ressourcenplanung

Учебный Arbeitsplatz:

- Host-OS и Werkzeuge: 8 GB RAM;
- VM 1: 6 GB;
- VM 2: 6 GB;
- VM 3: 6 GB;
- резерв: 20 %.

```text
Basis = 8 + 6 + 6 + 6 = 26 GB
Mit Reserve = 26 × 1,20 = 31,2 GB
```

Следующая поддерживаемая конфигурация — минимум 32 GB. Если другие Anwendungen или Lastspitzen значительны, нужен дополнительный резерв.

CPU-, Speicher- и I/O-Bedarf рассчитываются отдельно.

---

## 8. Overcommit

`Overcommit` означает, что логически назначено больше Ressourcen, чем физически доступно, исходя из предположения, что не все Gäste одновременно используют максимум.

Преимущество:

- выше Auslastung.

Риски:

- Leistungsabfall при одновременной Last;
- Swapping/Ballooning;
- непредсказуемая Latenz;
- нарушение SLA.

Overcommit требует Messung, Grenzwerte, Monitoring и Kapazitätsplanung.

---

## 9. Isolation и Grenzen

VM улучшают разделение, но не дают абсолютной Isolation.

Риски:

- Hypervisor-Schwachstelle;
- неправильная Netzwerksegmentierung;
- gemeinsame Storage-/Managementebene;
- чрезмерные Adminrechte;
- заражённый Template;
- Side-Channel или gemeinsame Hardware;
- неконтролируемый Datenaustausch.

Managementschnittstelle особенно защищается: MFA, минимальные Rechte, eigenes Netz, Updates и Logging.

---

## 10. Snapshot не Backup

Snapshot удобен перед коротким изменением, потому что фиксирует состояние диска/VM и позволяет быстро вернуться.

Но обычно:

- зависит от исходной VM и платформы;
- хранится на том же Storage;
- цепочка может расти и влиять на Performance;
- не обеспечивает независимую Aufbewahrung;
- не заменяет Restore-Test.

> Snapshot unterstützt einen kurzfristigen Rollback; Backup schützt als unabhängige, wiederherstellbare Kopie gegen weitere Ausfallszenarien.

---

## 11. Clone и Template

`Clone` — копия существующей VM.  
`Template` — подготовленная Basis для воспроизводимого развёртывания.

Перед клонированием:

- уникализировать Computername/ID;
- новые Schlüssel и Zertifikate;
- актуальные Updates;
- keine Testdaten/Secrets;
- Netzwerk и Domänenprozess;
- Lizenzierung;
- Dokumentation.

Копирование VM с одинаковыми Identitäten может вызвать конфликты и Sicherheitsprobleme.

---

## 12. Virtuelle Netzwerke и Speicher

Сетевые элементы:

- virtueller Switch;
- Portgruppe/Netzsegment;
- VLAN-Zuordnung;
- NAT или Bridging;
- Firewall/Filter;
- virtuelle NIC.

Speicher:

- локальный Hostspeicher;
- gemeinsamer Storage;
- thin/thick Provisioning;
- virtuelle Diskdatei;
- Storage-Netzwerk.

Thin Provisioning экономит заранее выделенное место, но требует Monitoring, иначе физический Pool может неожиданно заполниться.

---

## 13. Container

Container:

- изолирует Prozesse;
- использует Kernel Host;
- поставляется как Image;
- запускается как Containerinstanz;
- обычно имеет меньший Overhead и быстрый Start.

Image содержит Anwendung и Abhängigkeiten, но не полный отдельный Gast-Kernel.

Следствие:

> Container sind keine „kleinen VMs“, obwohl beide Isolation und reproduzierbare Umgebungen unterstützen.

---

## 14. VM против Container

| Kriterium | VM | Container |
|---|---|---|
| OS | eigenes Gast-OS | geteilter Host-Kernel |
| Isolation | сильнее между OS-Instanzen | Prozess-/Namespace-Modell |
| Start | медленнее | обычно быстрее |
| Ressourcen | выше | обычно ниже |
| OS-Vielfalt | разные Guest-OS | зависит от Kernel |
| Einsatz | vollständige Systeme, Legacy, starke Trennung | Anwendungen, Dienste, CI/CD |

Container часто запускаются внутри VM. Выбор не является «или-или» для всей Infrastruktur.

---

## 15. Container-Sicherheit

Проверяются:

- vertrauenswürdige Registry;
- Signatur/Integrität;
- минимальное Base Image;
- bekannte Schwachstellen;
- keine Secrets im Image;
- nicht als root, если возможно;
- read-only Bereiche;
- Ressourcenlimits;
- Netzwerkregeln;
- regelmäßiges Rebuild;
- Logging.

Остановленный и заново созданный Container не должен терять необходимые Daten: persistente Daten выносятся в подходящий Speicher.

---

## 16. Desktopvirtualisierung

При VDI Desktop работает централизованно, Endgerät передаёт в основном Ein-/Ausgabe.

Преимущества:

- централизованное Management;
- быстрый Austausch Endgerät;
- контроль Daten;
- доступ с разных устройств.

Риски:

- Netzwerk- и Backendabhängigkeit;
- Latenz для Audio/Video/Grafik;
- zentrale Störung затрагивает многих;
- Lizenzierung;
- Kapazitätsplanung;
- Datenschutz.

---

## 17. DaaS

`Desktop as a Service` предоставляет виртуальные Desktops как облачный Dienst.

Anbieter может управлять Infrastruktur и частями Plattform, Kunde обычно остаётся ответственным за:

- Benutzer и Rollen;
- freigegebene Anwendungen;
- Daten;
- Endgeräte;
- правила Nutzung;
- часть Security-Konfiguration;
- Vertrag, Datenschutz и Exit.

Точная граница зависит от договора.

---

## 18. Cloud: пять NIST-Merkmale

| Merkmal | Bedeutung |
|---|---|
| On-demand self-service | ресурсы предоставляются по запросу без ручной операции Anbieter |
| Broad network access | доступ по сети через стандартные механизмы |
| Resource pooling | ресурсы объединены для нескольких Kunden |
| Rapid elasticity | ресурсы быстро масштабируются |
| Measured service | использование измеряется и контролируется |

Не каждый внешний Server автоматически Cloud.

---

## 19. Servicemodelle

| Modell | Kunde nutzt | Anbieter betreibt typischerweise |
|---|---|---|
| IaaS | virtuelle Rechen-, Netz- и Speicherressourcen | физическую Infrastruktur/Virtualisierung |
| PaaS | Plattform/Laufzeit для eigenen Anwendungen | Infrastruktur, OS, Runtime |
| SaaS | готовую Anwendung | почти весь technischen Stack |
| DaaS | виртуальный Arbeitsplatz/Desktop | Desktop-Infrastruktur по договору |

Чем выше Abstraktion, тем меньше технического Betrieb у клиента, но меньше прямого контроля.

---

## 20. Shared Responsibility

Упрощённая логика:

| Bereich | IaaS | PaaS | SaaS |
|---|---|---|---|
| physische Infrastruktur | Anbieter | Anbieter | Anbieter |
| Virtualisierung | Anbieter | Anbieter | Anbieter |
| Gast-OS | Kunde | Anbieter | Anbieter |
| eigene Anwendung | Kunde | Kunde | Anbieter |
| Konfiguration/Rollen | Kunde | geteilt | geteilt/Kunde |
| Kundendaten | Kunde | Kunde | Kunde |

Матрица не заменяет Vertrag. Особенно нужно проверять Backup, Logs, Verschlüsselung, Incident Response и Löschung.

---

## 21. Deploymentmodelle

| Modell | Beschreibung |
|---|---|
| Public Cloud | ресурсы Anbieter доступны многим Kunden |
| Private Cloud | эксклюзивно для одной Organisation |
| Community Cloud | для Gemeinschaft с общими Anforderungen |
| Hybrid Cloud | комбинация самостоятельных Cloud-Infrastrukturen с Verbindung/Portabilität |

Private Cloud не означает автоматически Betrieb im eigenen Gebäude. Public Cloud не означает, что Daten публичны.

---

## 22. Vorteile

- schnelle Bereitstellung;
- elastische Kapazität;
- измеряемая Nutzung;
- меньше собственных Hardwarezyklen;
- глобальный Zugang;
- managed Dienste;
- автоматизация.

Преимущество реализуется только при подходящей Architektur, Governance и Qualifikation.

---

## 23. Risiken

- Anbieter- и Netzwerkabhängigkeit;
- Fehlkonfiguration;
- ungeplante variable Kosten;
- Vendor Lock-in;
- ограниченная Einsicht;
- Datenschutz/Drittland;
- Ausfall региона или Dienst;
- Datenexport и Löschung;
- изменение Leistung или Preis.

Риск формулируется как Ursache + Ereignis + Auswirkung, затем добавляется Maßnahme.

---

## 24. Kosten und Skalierung

Cloudkosten могут включать:

- laufende Instanzen;
- Speicher;
- Transaktionen;
- Datenübertragung/Egress;
- Support;
- Lizenzen;
- Monitoring/Logs;
- резерв и Backup;
- Migration;
- Exit.

Пример:

```text
Monatskosten =
Nutzungsmenge × Preis je Einheit
+ feste Grundkosten
+ Datenübertragung
+ Support
```

Pay per Use выгоден при переменной Last, но без Budgets, Tags, Alerts и Abschaltung возможны неожиданные Kosten.

---

## 25. Verfügbarkeit и SLA

Проверяются:

- гарантированная Verfügbarkeit;
- Messpunkt и Zeitraum;
- Wartungsfenster;
- исключения;
- Service Credits;
- RTO/RPO;
- собственная Redundanz;
- Abhängigkeiten от Internet, DNS и Identitätsdienst.

SLA-Kompensation возмещает часть платы, но не обязательно Geschäftsverlust.

---

## 26. Datenschutz и Sicherheit

Вопросы:

- какие Daten и Schutzbedarf;
- Rollen Verantwortlicher/Auftragsverarbeiter;
- Vertrag/AVV;
- Regionen и Drittlandtransfers;
- Verschlüsselung и Schlüsselkontrolle;
- Identitäten, MFA, Least Privilege;
- Logging и Alarmierung;
- Mandantentrennung;
- Löschung;
- Subunternehmer;
- Incidentprozess.

Облачный Dienst может иметь сильные Sicherheitsfunktionen, но Fehlkonfiguration клиента остаётся риском.

---

## 27. Backup, Export и Exit

До внедрения проверяются:

- Datenexportformat;
- Vollständigkeit;
- API и Geschwindigkeit;
- Egresskosten;
- Konfigurations-/Metadatenexport;
- unabhängiges Backup;
- Löschbestätigung;
- Kündigungsfristen;
- Übergangszeit;
- Ersatzverfahren.

`Данные можно экспортировать` недостаточно: нужно тестировать восстановимость и Weiterverwendbarkeit.

---

## 28. Vollständiger Praxisfall

Требование: CRM для 40 Beschäftigte без собственного Serverbetriebs.

Решение:

- SaaS соответствует желанию использовать готовую Anwendung;
- SSO/MFA и Rollen тестируются;
- AVV, Regionen, Unterauftragnehmer и Löschung проверяются;
- ERP-Schnittstelle испытывается с Testdaten;
- SLA сопоставляется с Geschäftsprozess;
- Lizenz- и Egresskosten входят в TCO;
- регулярный Export выполняется в документированном Format;
- Exit-Test проверяет импорт у альтернативы.

> SaaS ist geeignet, sofern die Fachfunktionen und Muss-Kriterien erfüllt sind. Die Freigabe setzt einen geprüften AVV, funktionierende Rollen und Schnittstellen, ein akzeptiertes SLA sowie einen getesteten Datenexport voraus.

---

## 29. Prüfungsalgorithmus

1. Workload и Ziel определить.
2. VM, Container, VDI или Cloud-Service классифицировать.
3. CPU, RAM, Speicher, Netzwerk оценить.
4. Isolation и Abhängigkeiten проверить.
5. Verantwortung по слоям распределить.
6. Datenschutz, Security и SLA проверить.
7. TCO, Skalierung и Egress рассчитать.
8. Backup, Export и Exit тестировать.
9. решение с Bedingungen сформулировать.

---

## 30. Typische Prüfungsfallen

| Falle | Korrektur |
|---|---|
| VM создаёт ресурсы | физические Grenzen Host остаются |
| Container = kleine VM | общий Kernel и другое Isolationsmodell |
| Snapshot = Backup | зависимость и отсутствие независимой копии |
| Cloud = внешний Server | проверить пять Merkmale |
| SaaS снимает всю ответственность | Daten, Rollen, Konfiguration остаются |
| Private Cloud = обязательно on-premises | эксклюзивность, не Standort |
| Public Cloud = публичные Daten | Betriebsmodell не Datenfreigabe |
| Pay per Use всегда дешевле | профиль, Egress, Support и Dauer |
| SLA гарантирует отсутствие Ausfall | оно задаёт уровень и Rechtsfolge |
| Export существует = Exit готов | восстановить и использовать тестово |

---

## 31. Selbsttest

1. Что virtualisiert Hypervisor?
2. Различи Typ 1 и Typ 2.
3. Из чего состоит VM?
4. Рассчитай RAM из раздела 7.
5. Что такое Overcommit?
6. Почему VM-Isolation не абсолютна?
7. Почему Snapshot не Backup?
8. Что проверить перед Klonen?
9. Что делает virtueller Switch?
10. Что означает Thin Provisioning?
11. Чем Container отличается от VM?
12. Назови пять Container-Sicherheitsmaßnahmen.
13. Назови два преимущества и два риска VDI.
14. Что такое DaaS?
15. Назови пять Cloud-Merkmale.
16. Различи IaaS, PaaS и SaaS.
17. Кто отвечает за Gast-OS в IaaS?
18. Кто отвечает за Kundendaten в SaaS?
19. Различи Public и Private Cloud.
20. Почему Private Cloud не обязательно on-premises?
21. Назови пять Cloud-Kosten.
22. Что проверяется в SLA?
23. Назови пять Datenschutz-/Securityfragen.
24. Что входит в Exit-Plan?
25. Обоснуй SaaS для Praxisfall.

<details>
<summary>Показать решения</summary>

1. Доступ к физическим Ressourcen для нескольких логических VM.
2. Typ 1 работает на Hardware, Typ 2 поверх Host-OS.
3. vCPU, RAM, Disk, NIC, Firmware и Gast-OS.
4. `31,2 GB`; выбрать минимум поддерживаемые 32 GB, при необходимости больше.
5. Логически назначено больше, чем физически доступно.
6. Общие Hypervisor, Hardware, Netzwerk, Storage и Management.
7. Он зависит от Plattform/исходной VM и обычно того же Storage.
8. Identitäten, Schlüssel, Updates, Secrets, Netzwerk, Lizenz и Doku.
9. Соединяет виртуальные NIC и Netzsegmente.
10. Speicher логически выделяется до физического расходования; Pool нужно контролировать.
11. Container делит Host-Kernel, VM имеет Gast-OS.
12. Registry, Signatur, kleines Image, Scan, non-root, Limits, keine Secrets, Updates.
13. Централизованность/контроль; Netzwerk-/Backendabhängigkeit и zentrale Ausfälle.
14. Виртуальный Desktop как Dienst.
15. On-demand, broad access, pooling, elasticity, measured service.
16. Infrastruktur; Plattform; готовая Anwendung.
17. Kunde.
18. Kunde остаётся ответственным за свои данные.
19. Для многих Kunden; эксклюзивно для одной Organisation.
20. Private описывает эксклюзивное использование, не место.
21. Compute, Storage, Transaktionen, Egress, Support, Backup, Logs, Lizenzen.
22. Messung, Zeitraum, Wartung, Ausschlüsse, Credits, RTO/RPO и Abhängigkeiten.
23. AVV, Region, Verschlüsselung, IAM, Logging, Löschung, Unterauftragnehmer.
24. Export, Format, Kosten, срок, Backup, Löschung и альтернативный Betrieb.
25. Использовать Musterantwort из раздела 28 с Bedingungen.

</details>

---

## 32. Quellen und Abgleich

- [NIST SP 800-145 – Definition of Cloud Computing](https://csrc.nist.gov/pubs/sp/800/145/final)
- [NIST SP 800-125 – Full Virtualization Security](https://csrc.nist.gov/pubs/sp/800/125/final)
- [BSI – Cloud Computing Grundlagen](https://www.bsi.bund.de/DE/Themen/Unternehmen-und-Organisationen/Informationen-und-Empfehlungen/Cloud-Computing/cloud-computing_node.html)
- [BSI C5 – Cloud Computing Compliance Criteria Catalogue](https://www.bsi.bund.de/c5)
- [Art. 28 DSGVO – Auftragsverarbeiter](https://eur-lex.europa.eu/eli/reg/2016/679/art_28/oj)

NIST SP 800-145 служит стабильной понятийной основой. Конкретные ответственности и гарантии определяются выбранным Dienst и Vertrag.

---

## 33. Offene Prüfpunkte für den Unterricht

- Какие Virtualisierungsbegriffe входят в актуальный WBS-Stoff?
- Требуется ли различать Typ 1 и Typ 2?
- Рассчитывается ли Ressourcenreserve/Overcommit?
- Насколько подробно рассматриваются Container?
- Ожидаются ли пять NIST-Merkmale?
- Какие Servicemodelle обязательны кроме SaaS/DaaS?
- Нужны ли четыре Deploymentmodelle?
- Как подробно рассматривается Shared Responsibility?
- Требуется ли SLA-/Cloudkostenrechnung?
- Какие Datenschutzformulierungen ожидает WBS?
