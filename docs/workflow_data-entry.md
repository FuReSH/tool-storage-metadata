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

### Reconciliation with Wikidata

- Use OpenRefine for a large set of tools, such as TaPOR
    + open local JSON file
    + enrich this file based on API calls
        * [GREL](https://openrefine.org/docs/manual/grelfunctions) sample for building a URL from a nummeric value:
            - `value.replace(/(\d+)/, 'https://tapor.ca/api/tools/$1')`
            - the same but cheching for null values first `if(not(value == null), value.replace(/(\d+)/, 'https://tapor.ca/api/tools/$1'), '')`
        - GREL for joining strings:
            + `join(['https://tapor.ca/', value], '')` will prefix a partial URL
        - GREL for parsing JSON
            + `parseJson(value).get('key')` will return a value for the selected key
            + `parseJson(value).key` will return the value of the selected key
- Select a column for reconciliation, most likely the tool name, and choose `Reconcile -> Start reconciling`. This will open additional options from Wikidata.
-

# 2. Create new Wikidata Item

All Wikidata items need at least a label and a short prose description

### Software

The minimal required statements for software are

- [instance of](): [Software](https://www.wikidata.org/wiki/Q7397)
- [programmed in](https://www.wikidata.org/wiki/Property:P277):
- [depends on software](https://www.wikidata.org/wiki/Property:P1547):
- [software version identifier]()
    + [publication date]()
    + reference
- [source code repository]
    + [version control system](): e.g. "Git"
    + [web interface software](): e.g. "GitHub"
- [official website]():
- [reads file format](https://www.wikidata.org/wiki/Property:P1072): e.g. "JSON"
- [writes file format](https://www.wikidata.org/wiki/Property:P1073): e.g. "RDA"
