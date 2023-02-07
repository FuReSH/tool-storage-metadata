---
title: "Werkzeuge: TaDiRAH"
subtitle: ""
author:
  - Till Grallert
  - Sophie Eckenstaler
date: 2023-01-18
ORCID: orcid.org/0000-0002-5739-8094
---

- webseite: <https://vocabs.dariah.eu/tadirah>
- Wir haben das komplette Vokabular über die API/Endpoint als Turtle heruntergeladen und dann zu JSON-LD convertiert. Beide Dateien finden sich unter <https://github.com/FuReSH/tool-usage_digital-humanities/tree/main/data>.

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

# API

Es gibt eine API, die unter <https://vocabs-api.acdh.oeaw.ac.at> documentiert ist.

## Gesamter Datensatz

Über die API lässt sich nicht die gesamte Taxonomie als ein einziger Datensatz in JSON-LD herunterladen, aber es ist in mehreren Schritten möglich.

### 1. Top-level Konzepte

```bash
curl -X 'GET' \
  'https://vocabs.acdh.oeaw.ac.at/rest/v1/tadirah/topConcepts?lang=en' \
  -H 'accept: application/ld+json'
```

Request URL: `https://vocabs.acdh.oeaw.ac.at/rest/v1/tadirah/topConcepts?lang=en`

Response

```json
{
  "@context": {
    "skos": "http://www.w3.org/2004/02/skos/core#",
    "uri": "@id",
    "type": "@type",
    "onki": "http://schema.onki.fi/onki#",
    "topconcepts": "skos:hasTopConcept",
    "notation": "skos:notation",
    "label": "skos:prefLabel",
    "@language": "en"
  },
  "uri": "https://vocabs.dariah.eu/tadirah/",
  "topconcepts": [
    {
      "uri": "https://vocabs.dariah.eu/tadirah/analyzing",
      "topConceptOf": "https://vocabs.dariah.eu/tadirah/",
      "label": "Analyzing",
      "hasChildren": true
    },
    {
      "uri": "https://vocabs.dariah.eu/tadirah/capturing",
      "topConceptOf": "https://vocabs.dariah.eu/tadirah/",
      "label": "Capturing",
      "hasChildren": true
    },
    {
      "uri": "https://vocabs.dariah.eu/tadirah/creating",
      "topConceptOf": "https://vocabs.dariah.eu/tadirah/",
      "label": "Creating",
      "hasChildren": true
    },
    {
      "uri": "https://vocabs.dariah.eu/tadirah/disseminating",
      "topConceptOf": "https://vocabs.dariah.eu/tadirah/",
      "label": "Disseminating",
      "hasChildren": true
    },
    {
      "uri": "https://vocabs.dariah.eu/tadirah/enriching",
      "topConceptOf": "https://vocabs.dariah.eu/tadirah/",
      "label": "Enriching",
      "hasChildren": true
    },
    {
      "uri": "https://vocabs.dariah.eu/tadirah/interpreting",
      "topConceptOf": "https://vocabs.dariah.eu/tadirah/",
      "label": "Interpreting",
      "hasChildren": true
    },
    {
      "uri": "https://vocabs.dariah.eu/tadirah/storing",
      "topConceptOf": "https://vocabs.dariah.eu/tadirah/",
      "label": "Storing",
      "hasChildren": true
    }
  ]
}
```

### 2. Children

Folgenden Codesnippets benutzen jeweils ein Beispielkonzept ("https://vocabs.dariah.eu/tadirah/capturing")

```bash
curl -X 'GET' \
  'https://vocabs.acdh.oeaw.ac.at/rest/v1/tadirah/children?uri=https%3A%2F%2Fvocabs.dariah.eu%2Ftadirah%2Fcapturing&lang=en' \
  -H 'accept: application/ld+json'
```

Request URL: `https://vocabs.acdh.oeaw.ac.at/rest/v1/tadirah/children?uri=https%3A%2F%2Fvocabs.dariah.eu%2Ftadirah%2Fcapturing&lang=en`

Response

```json
{
  "@context": {
    "skos": "http://www.w3.org/2004/02/skos/core#",
    "uri": "@id",
    "type": "@type",
    "prefLabel": "skos:prefLabel",
    "narrower": "skos:narrower",
    "notation": "skos:notation",
    "hasChildren": "onki:hasChildren",
    "@language": "en"
  },
  "uri": "https://vocabs.dariah.eu/tadirah/capturing",
  "narrower": [
    {
      "uri": "https://vocabs.dariah.eu/tadirah/gathering",
      "prefLabel": "Gathering",
      "hasChildren": true
    },
    {
      "uri": "https://vocabs.dariah.eu/tadirah/recording",
      "prefLabel": "Recording",
      "hasChildren": true
    },
    {
      "uri": "https://vocabs.dariah.eu/tadirah/discovering",
      "prefLabel": "Discovering",
      "hasChildren": true
    },
    {
      "uri": "https://vocabs.dariah.eu/tadirah/converting",
      "prefLabel": "Converting",
      "hasChildren": true
    },
    {
      "uri": "https://vocabs.dariah.eu/tadirah/dataRecognition",
      "prefLabel": "Data Recognition",
      "hasChildren": true
    },
    {
      "uri": "https://vocabs.dariah.eu/tadirah/extracting",
      "prefLabel": "Extracting",
      "hasChildren": true
    },
    {
      "uri": "https://vocabs.dariah.eu/tadirah/imaging",
      "prefLabel": "Imaging",
      "hasChildren": true
    },
    {
      "uri": "https://vocabs.dariah.eu/tadirah/transcribing",
      "prefLabel": "Transcribing",
      "hasChildren": true
    }
  ]
}
```

### 3. Labels in verschiedenen Sprachen

```bash
curl -X 'GET' \
  'https://vocabs.acdh.oeaw.ac.at/rest/v1/tadirah/label?uri=https%3A%2F%2Fvocabs.dariah.eu%2Ftadirah%2Fcapturing&lang=de' \
  -H 'accept: application/ld+json'
```

Request URL: `https://vocabs.acdh.oeaw.ac.at/rest/v1/tadirah/label?uri=https%3A%2F%2Fvocabs.dariah.eu%2Ftadirah%2Fcapturing&lang=de`

Response

```json
{
  "@context": {
    "skos": "http://www.w3.org/2004/02/skos/core#",
    "uri": "@id",
    "type": "@type",
    "prefLabel": "skos:prefLabel",
    "altLabel": "skos:altLabel",
    "hiddenLabel": "skos:hiddenLabel",
    "@language": "de"
  },
  "uri": "https://vocabs.dariah.eu/tadirah/capturing",
  "prefLabel": "Erfassen"
}
```

### 4. Sämtlichen Daten zu einem Konzept

Diese werden nur als Turtle ausgegeben

```bash
curl -X 'GET' \
  'http://vocabs.acdh.oeaw.ac.at/rest/v1/tadirah/data?format=text%2Fturtle&uri=https%3A%2F%2Fvocabs.dariah.eu%2Ftadirah%2Fcapturing' \
  -H 'accept: text/turtle'
```

Request URL: `http://vocabs.acdh.oeaw.ac.at/rest/v1/tadirah/data?format=text%2Fturtle&uri=https%3A%2F%2Fvocabs.dariah.eu%2Ftadirah%2Fcapturing`

Response

```turtle
@prefix skos: <http://www.w3.org/2004/02/skos/core#> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix tadirah: <https://vocabs.dariah.eu/tadirah/> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

skos:Concept a owl:Class .
tadirah:gathering
  skos:prefLabel "Sammeln"@de, "Raccolta"@it, "Прикупљање"@sr, "Recolección"@pt, "Recolección"@es, "Collecte"@fr, "Gathering"@en ;
  a owl:NamedIndividual, skos:Concept ;
  skos:broader tadirah:capturing .

tadirah:transcribing
  skos:prefLabel "Transcribing"@en, "Transcripción"@es, "Транскрипција"@sr, "Transcription"@fr, "Transcrição"@pt, "Trascrizione"@it, "Transkription"@de ;
  a owl:NamedIndividual, skos:Concept ;
  skos:broader tadirah:capturing .

tadirah:imaging
  skos:broader tadirah:capturing ;
  skos:prefLabel "Captura em formato de imagem"@pt, "Gestione delle Immagini"@it, "Усликавање"@sr, "Imagerie"@fr, "Bilderfassung"@de, "Captura en formato imagen"@es, "Imaging"@en ;
  a skos:Concept, owl:NamedIndividual .

tadirah:discovering
  skos:prefLabel "Localização"@pt, "Entdecken"@de, "Discovering"@en, "Découverte"@fr, "Localización"@es, "Scoperta"@it, "Проналажење"@sr ;
  a skos:Concept, owl:NamedIndividual ;
  skos:broader tadirah:capturing .

tadirah:dataRecognition
  skos:prefLabel "Data Recognition"@en, "Reconhecimento de dados"@pt, "Препознавање података"@sr, "Reconocimiento de datos"@es, "Reconnaissance de données"@fr, "Riconoscimento dei Dati"@it, "Datenerkennung"@de ;
  skos:broader tadirah:capturing ;
  a owl:NamedIndividual, skos:Concept .

tadirah:recording
  skos:prefLabel "Grabación"@es, "Aufzeichnen"@de, "Enregistrement"@fr, "Recording"@en, "Снимање"@sr, "Registrazione"@it, "Gravação"@pt ;
  skos:broader tadirah:capturing ;
  a skos:Concept, owl:NamedIndividual .

tadirah:capturing
  skos:closeMatch <http://tadirah.dariah.eu/vocab/index.php?tema=7> ;
  skos:narrower tadirah:extracting, tadirah:dataRecognition, tadirah:imaging, tadirah:recording, tadirah:converting, tadirah:gathering, tadirah:transcribing, tadirah:discovering ;
  skos:prefLabel "Acquisition"@fr, "Capturing"@en, "Captura"@pt, "Captura"@es, "Acquisizione"@it, "Захватање"@sr, "Erfassen"@de ;
  a owl:NamedIndividual, skos:Concept ;
  skos:note "capturing generally refers to the activity of creating digital surrogates of real world objects, or expressing existing artifacts in a digital representation. This refers basically to learning and noticing something (as in discovering) and could be enhanced by a manual process (as in transcribing) or an automated procedure (as in imaging, data recognition or recording). This also includes aggregating resources, information and data (as in gathering)."@en ;
  skos:inScheme tadirah: ;
  skos:topConceptOf tadirah: .

tadirah:converting
  skos:prefLabel "Converting"@en, "Conversion"@fr, "Conversione"@it, "Conversão"@pt, "Conversión"@es, "Конвертовање"@sr, "Konvertieren"@de ;
  skos:broader tadirah:capturing ;
  a owl:NamedIndividual, skos:Concept .

tadirah:
  rdfs:label "TaDiRAH"@en ;
  a owl:NamedIndividual, owl:Ontology, skos:ConceptScheme ;
  skos:hasTopConcept tadirah:capturing .

tadirah:extracting
  skos:prefLabel "Extracting"@en ;
  a owl:NamedIndividual, skos:Concept ;
  skos:broader tadirah:capturing .
```
