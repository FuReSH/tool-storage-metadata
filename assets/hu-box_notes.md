---
title: "HU Box"
subtitle: ""
author:
    - Sophie Eckenstaler
    - Till Grallert
affiliation: Future e-Research Support in the Humanities, Humboldt-Universität zu Berlin
date: 2022-06-13
status: draft
lang: de
licence: https://creativecommons.org/licenses/by/4.0/
markdown: pandoc
tags:
    - FuReSH
    - collaboration
    - file sync
    - cloud services
---

# Beschreibung

HU Box ist eine [Seafile](https://www.seafile.com) Installation (v 8.0.17) für den Dateiaustausch. Seafile ist eine open-source Dokumentencloud, die lokal, in dem Fall von der HU, gehostet wird.

## Gemeinsames Berarbeiten von Dateien

Es ist wahrscheinlich keine wirklich kollaborative Arbeitsumgebung, wie Google Docs, sondern ein Pendant zu Dropbox, Google Drive etc. Solange nur ein_e einzelne_r Nutzer_in Zugriff auf einen Order, bei Seafile "library" genannt, hat, funktioniert die Synchronisation zwischen Client und Cloud gut. In anderen Fällen werden Dateien teilweise ohne Fehlermeldungen überschrieben. Beispiel: TG hat an einer `.docx` Datei auf seinem eigenen Rechner mit MS Word gearbeitet und regelmäßig gespeichert. Aber in dem mit der HU Box synchronisierten Ordner sind sämtliche Änderungen sofort wieder mit der Version aus der Cloud überschrieben worden. In den Logs von SeaFile sind keine Änderungen verzeichnet worden und auch auf TGs Client gibt es keinerlei Spuren der Bearbeitung.

## Ausschluss von Dateien von der Synchronisation

Es gibt eine ganze Reihe von Dingen, die nicht über einen inkrementellen Cloudservice synchronisiert werden sollten, wie z.B. `.git` oder Datenbanken. Seafile bietet die Möglichkeit Regeln für einen solchen Ausschluss in einer `seafile-ignore.txt` festzuhalten. Näheres findet sich [hier](https://help.seafile.com/syncing_client/excluding_files/).

# Seafile Werbung

- "so geht File Management im Gigabit-Zeitalter!" [Seafile Webseite](https://de.seafile.com)
- >Ortsunabhängig, unkompliziert und gemeinsam an Office Dokumenten arbeiten – das verlangt die heutige Arbeitswelt und Seafile liefert es! Sie bearbeiten Word, Excel, PowerPoint und andere Office Formate im Team online und in Realtime. Sie wollen Ihre Arbeit schnell mit einer anderen Person durchsprechen? Versenden Sie einen Edit-Link und arbeiten Sie unmittelbar gemeinsam an Ihrem Manuskript. [Seafile Webseite]
- >After a library is synced to the desktop, when you open a Microsoft Office file inside the library, Seafile automatically locks the file. When you close the file, Seafile automatically unlocks the file. The locking state is propagated to other computers syncing this library. It prevents concurrent editing the same Office file and is convenient for collaboration. [HU Box Dokumentation]
