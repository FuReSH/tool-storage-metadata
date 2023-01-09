---
title: "Werkzeuge: TaDiRAH"
subtitle: ""
author: Till Grallert
date: 2022-04-05 
ORCID: orcid.org/0000-0002-5739-8094
---

- webseite: <https://vocabs.dariah.eu/tadirah>

# SPARQL

- SPARQL endpoint: <https://vocabs-sparql.acdh.oeaw.ac.at>

```sparql
PREFIX skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX dc: <http://purl.org/dc/elements/1.1/> 
SELECT ?clabel ?external_concept WHERE { 
  ?concept a skos:Concept; 
           skos:prefLabel ?clabel; 
           skos:narrowMatch ?external_concept. 
  FILTER (LANG(?clabel)="de") 
}
LIMIT 10
```

