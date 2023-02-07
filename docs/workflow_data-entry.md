---
title: "Workflow: data entry"
author:
    - Sophie Eckenstaler
    - Till Grallert
    - Samantha Tirtohusodo
affiliation: Scholarly Makerspace, Humboldt-Universität zu Berlin
date: 2023-01-23
status: draft
lang: de
bibliography: https://furesh.github.io/slides/assets/bibliography/FuReSH.csl.json
reference-section-title: "Literatur"
suppress-bibliography: false
licence: https://creativecommons.org/licenses/by/4.0/
markdown: pandoc
tags:
    - FuReSH
---

# 1. Adding new tools

The user creates a new `YAML` file in the `tools/` folder by creating a copy of [`templates/template.tool.yml`](templates/template.tool.yml). If the user has set up her IDE to validate YAML files, this file will be automatically validated with the help of a linked JSON schema during the editing process. This is highly recommended.

## Link to Wikidata

## Create new Wikidata Item

All Wikidata items need at least a label and a short prose description

### Software

The minimal required statements for software are

- [instance of](): [Software](https://www.wikidata.org/wiki/Q7397)
- [programmed in]():
- [software version identifier]()
    + [publication date]()
    + reference
- [source code repository]
    + [version control system]()
    + [web interface software]()
