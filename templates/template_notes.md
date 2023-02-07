---
title: "Template für Werkzeuge"
subtitle: "Notizen"
author: Till Grallert
date: 2022-04-04
ORCID: orcid.org/0000-0002-5739-8094
---

# Inhalt

Zentraler Zugang über Fragen

- Was ist das?
    + Checkboxes mit Kategorien
        * Methode
        * Konzept
        * Format
            - was meinen wir damit?
        * Sprache
        * Platform
        * Software
        * Organisation
        * Standard
    - 1--2 Sätze zur Beschreibung
- Wofür brauche ich das?
    - Zweck / Einsatzgebiet
- Ist das wichtig?
    + alternative Formulierungen:
        * Wie wichtig ist das?
        * Kann das weg?
- Wie sieht das aus?
    + alternative Formulierungen:
        * Woran erkenne ich das?
    - Beispiel
- Was brauche ich dafür?
- Wo finde ich mehr dazu?
    - Links zu weiteren Werkzeugen in unserem Koffer/Regal
        - in markdown: `[[Dateiname]]`
   - externe Links
   - Literatur

## Metadaten

- Was: Metadaten zum Werkzeug
    - Wikidata
    - Ontologien
        - Tardirah
- Wie:
    - im YAML Block am Anfang der Datei
    - in einer Separaten YAML-Datei?
        - Vorteile:
            - mehrere Dateien können auf die gleichen Informationen zugreifen
            - es lässt sich eine "Datenbank" aufbauen


## Beschreibung

- Zweck/ Einsatzgebiet
- Input
- Output
- Requirements
    - Skills
    - Software
    - Hardware

## Weiterführende Links

- Ausführliche Beschreibungen
- Tutorials
- Use cases
- Literatur
    - könnte auf einer automatischen Abfrage unserer Zoterobibliothek basieren


# Form
## Technisch

- Plaintext
- YAML block für Metadaten
    - inklusive lokaler ID
- Markdown
- QR Code für URI zu dieser Resource

## Gestaltung

- Farbe als bedeutungstragend für Kategorie des Werkzeugs


## Infrastruktur

- Pandoc templates für die Konversion in verschiedene Outputformate
    - Webseite
    - physische Karten mit einer Vorder- und Rückseite
