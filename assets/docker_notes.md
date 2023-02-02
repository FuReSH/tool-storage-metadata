---
title: "Docker"
subtitle: ""
author:
    - Till Grallert
Institute: Future e-Research Support in the Humanities, Humboldt-Universität zu Berlin
date: 2022-10-19
status: draft
licence: https://creativecommons.org/licenses/by/4.0/
bibliography: ../assets/bibliography/FuReSH.csl.json
reference-section-title: "Literatur"
suppress-bibliography: false
markdown: pandoc
tags:
    - FuReSH
    - container
    - virtualisation
---

# To do

- [ ] get Pandoc to work on Apple silicon

# ARM Macs

- Es gibt ein Issue im [Pandoc Repo](https://github.com/pandoc/dockerfiles/issues/134).
    + Das verweist auf die [Möglichkeit automatisierter Builds](https://dev.to/cloudx/multi-arch-docker-images-the-easy-way-with-github-actions-4k54) von Docker Images für multiple CPU Architekturen mit GitHub Actions.
    + Pandoc baut seine Docker images bereits über [eine GitHub Action](https://github.com/pandoc/dockerfiles/blob/master/.github/workflows/build.yaml)
