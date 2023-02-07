---
title: "Data modelling"
subtitle: "template"
author:
   - Till Grallert
   - Sophie Eckenstaler
date: 2022-04-07
licence: https://creativecommons.org/licenses/by/4.0/
bibliography: ../assets/bibliography/FuReSH.csl.json
csl: /BachUni/BachBibliothek/CSL/chicago-author-date_slides.csl
suppress-bibliography: true
URI:
status: draft
tags:
    - Werkzeug
    - {Begriffe aus Ontologien}
---

# Was ist das?

::: columns
:::: column

- [x] [[Methode]]
- [x] [[Konzept]]
- [ ] [[Format]]
- [ ] [[Sprache]]

::::
:::: column

- [ ] [[Platform]]
- [ ] [[Software]]
- [ ] Organisation
- [ ] Standard

::::
:::

<!-- kurze Beschreibung? -->
Modelle haben 3 Eigenschaften: 1) Sie sind ein Model *von* etwas (Abbildung); 2) sie sind nicht das Original und keine Kopie des Originals; 3) sie sind dafür da um von jemanden *für* etwas benutzt zu werden (zweckgebunden) [@JannidisFlanders2019GentleIntroduction, 27-28].

# Wofür brauche ich das?

Für alles: Jedes Datum folgt einem Model. Um Daten maschinell auszuwerten, müssen sie explizit und formal modelliert sein. *Formelle Modelle* haben die Funktion 1) Einschränkungen zur Verbesserung der Datenqualität einzuführen; 2) komplexe und semantisch reichhaltige Abfragen zu ermöglichen; 3) Kommunikation zwischen Menschen und Maschinen über Daten zu unterstützen [@JannidisFlanders2019GentleIntroduction, 29].

# Ist das wichtig?

Ja, denn Computer sind dumm!

# Wie sieht das aus?

<!-- modellierte Daten -->
::: columns
:::: column

```xml
<orgName xml:lang="de">Humboldt-Universität zu <placeName>Berlin</placeName></orgName>
```

::::
:::: column
::::
:::

# Was brauche ich dafür?

Eine Forschungsfrage.

# Wo finde ich mehr dazu?

   - [[docker_draft]] lokaler Link
   - [externer Link](docker_draft.md)
   - [@JannidisFlanders2019GentleIntroduction]
