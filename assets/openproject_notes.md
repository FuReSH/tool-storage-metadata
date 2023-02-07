---
title: "Werkzeuge: OpenProject"
subtitle: ""
author: Till Grallert
date: 2022-04-05
ORCID: orcid.org/0000-0002-5739-8094
---

[OpenProject](https://www.openproject.org/) ist eine offene Projektmanagementsoftware, die sowohl traditionelles (?) als auch agiles Projektmanagement unterstützt. Die HU betreibt eine [OpenProject Instanz](https://hu-berlin.openproject.com/)

# Themen
## Arbeitspakete und Boards

- Wie hängen Arbeitspakete und Karten auf Boards zusammen?

## Arbeitspakete

Arbeitspakete sind die Grundeinheit von OpenProject. Es gibt verschiedene [Typen](https://www.openproject.org/docs/user-guide/projects/project-settings/work-package-types/) mit unterschiedlichen Attributen, die alle in den Einstellungen für jedes einzelne Projekt ausgewählt werden können. Allerdings scheint es so, dass wir keine neuen Typen kreieren oder bestehende Typen verändern können.

Die HU stellt die folgenden Typen bereit, die aber zunächst nichts weiter sind als arbiträre Namen!

- Phase
- Feature
- Task
- Milestone
- Thema
- Termin

Zusätzlich können Typen unabhängig vom Namen als Meilensteine definiert werden

### Einschränkungen

- Milestones können keine Kinder haben
- Tasks können keine Tasks beinhalten

## Benutzerdefinierte Felder

Es gibt benutzerdefinierte Felder, allerdings scheinen diese von der HU definiert zu sein. Eines der wenigen dieser Felder ergänzt eine vorhandene Funktionalität: `Zugewiesen an Personen` erweitert das Feld `Zugewiesen an` dahingehend, dass mehrere Personen ausgewählt werden können.

# Interface

- die hierarchische Baumstruktur ist verwirrend, da nicht immer alle Kinder angezeigt werden
