# Assessment of In Silico Tools for Variant-Effect Prediction in Haemoglobinopathies

## Overview

This repository contains the data-processing and statistical analysis workflow for my MSc research project, **“Assessment of In Silico Tools for Variant-Effect Prediction in Haemoglobinopathies.”**

The study evaluates computational tools used to predict the functional and clinical effects of variants in the haemoglobin genes **HBA1, HBA2, and HBB**.

The project focuses on the availability, agreement, and performance of established and newer computational prediction tools and considers how their outputs may contribute to the application of the ACMG/AMP computational evidence criteria **PP3** and **BP4** in haemoglobinopathy variant interpretation.

## Background

Haemoglobinopathies are inherited disorders caused by pathogenic variants affecting haemoglobin production or structure. Accurate variant interpretation is important for diagnosis, genetic counselling, carrier screening, and clinical management.

Computational prediction tools are frequently used as supporting evidence when interpreting sequence variants. However, these tools differ in their algorithms, training datasets, score thresholds, applicable variant types, and overall performance.

Their predictions should therefore not be treated as independent clinical classifications. Instead, their performance must be evaluated against variants with established clinical classifications and interpreted alongside other forms of evidence.

## Study aims

The overall aim of this project is to assess the performance and clinical relevance of computational variant-effect prediction tools in haemoglobinopathies.

The specific objectives are to:

1. curate variants in **HBA1, HBA2, and HBB** with established clinical classifications;
2. standardise variant descriptions and genomic coordinates;
3. obtain computational annotations using Ensembl Variant Effect Predictor and associated resources;
4. evaluate prediction-tool coverage across genes, variant classes, and functional consequences;
5. compare computational predictions with observed clinical classifications;
6. calculate performance measures including sensitivity, specificity, accuracy, concordance, and Matthews correlation coefficient;
7. examine variants of uncertain significance separately;
8. calculate likelihood ratios for eligible tools where sufficient data are available;
9. investigate agreement and disagreement between prediction tools; and
10. assess the implications of computational predictions for the ACMG/AMP PP3 and BP4 criteria.

## Genes included

The analysis focuses on variants affecting:

* **HBA1**, encoding haemoglobin subunit alpha 1;
* **HBA2**, encoding haemoglobin subunit alpha 2; and
* **HBB**, encoding haemoglobin subunit beta.

## Variant classifications

The reference dataset includes variants classified as:

* pathogenic or likely pathogenic;
* benign or likely benign; and
* variants of uncertain significance.

For binary performance analyses, pathogenic and likely pathogenic variants are compared with benign and likely benign variants.

Variants of uncertain significance are analysed separately and are not automatically assigned to either binary class.

## Study workflow

The main stages of the project are:

1. import and inspect the original haemoglobinopathy variant dataset;
2. clean and standardise variant identifiers;
3. convert genomic coordinates from GRCh37 to GRCh38;
4. validate and normalise variant descriptions;
5. prepare variants for Ensembl Variant Effect Predictor;
6. import and clean the VEP output;
7. identify and retain appropriate MANE Select transcript annotations;
8. merge VEP annotations with the original clinical dataset;
9. check duplicate, missing, and unmatched variants;
10. assess computational-tool coverage;
11. perform descriptive analyses;
12. conduct binary pathogenic-versus-benign performance analyses;
13. examine variants of uncertain significance;
14. calculate likelihood ratios where appropriate; and
15. generate tables and figures.

## Genome-build and transcript processing

The original dataset contained variants represented using the **GRCh37** reference genome.

Variant coordinates were converted to **GRCh38** before annotation. Variant descriptions were subsequently checked and standardised before being submitted to Ensembl Variant Effect Predictor.

Where multiple transcript annotations were returned for the same variant, transcript selection was guided by the availability of **MANE Select** annotations for HBA1, HBA2, and HBB.

The analysis includes quality-control checks for:

* variants with multiple VEP rows;
* duplicate variant identifiers;
* missing MANE Select annotations;
* unmatched variants after merging;
* inconsistent genomic or transcript descriptions; and
* missing prediction scores.

## Computational annotations

The project evaluates annotations from several categories of computational tools.

### Individual missense prediction tools

Examples include:

* SIFT;
* PolyPhen-2;
* MutationTaster;
* PROVEAN;
* FATHMM;
* MutationAssessor; and
* LIST-S2.

### Meta-predictors and ensemble tools

Examples include:

* REVEL;
* MetaSVM;
* MetaLR;
* ClinPred;
* BayesDel;
* Condel;
* VEST4;
* DANN;
* CADD; and
* Eigen.

### Modern protein-language and deep-learning approaches

The analysis also considers newer tools where scores are available, including:

* AlphaMissense;
* EVE; and
* ESM1b.

### Splicing and conservation annotations

Additional analyses may include:

* SpliceAI;
* GERP++;
* phyloP;
* phastCons; and
* other conservation-related annotations.

Not all prediction tools are applicable to every variant type. Tool coverage is therefore evaluated before performance comparisons are made.

## Performance analysis

For tools with sufficient predictions and clearly defined pathogenic and benign thresholds, performance may be assessed using:

* true positives;
* true negatives;
* false positives;
* false negatives;
* sensitivity;
* specificity;
* accuracy;
* positive predictive value;
* negative predictive value;
* balanced accuracy;
* Matthews correlation coefficient;
* concordance; and
* likelihood ratios.

Performance estimates are interpreted together with:

* the number of variants evaluated;
* missing prediction scores;
* class imbalance;
* gene-specific performance;
* variant consequence;
* tool applicability; and
* the thresholds recommended for each predictor.

## Repository structure

```text
haemoglobinopathy-variant/
├── data/          # Raw and processed datasets
├── docs/          # Workflow, protocol, and data documentation
├── environment/   # Software and package information
├── results/       # Generated tables and figures
├── scripts/       # Numbered R analysis scripts
├── README.md      # Project overview
├── LICENSE        # Repository licence
└── haemoglobinopathy-variant.Rproj
```

The repository is being reorganised so that raw data, processed data, analysis scripts, tables, figures, and documentation are stored separately.

## Reproducibility

The analysis is conducted primarily in **R** and **RStudio**.

Core packages used in the workflow include:

```r
library(tidyverse)
library(readxl)
library(readr)
library(dplyr)
library(stringr)
library(janitor)
library(ggplot2)
library(pheatmap)
```

Additional packages may be used for performance analysis, Excel export, reporting, and reproducible project paths.

The final workflow will use project-relative paths rather than computer-specific absolute file paths.

## Important interpretation note

Computational predictions are evaluated as supporting evidence only.

A prediction of pathogenicity or benignity from an in silico tool does not independently establish the clinical significance of a variant. Results should be interpreted alongside population evidence, functional evidence, segregation data, phenotype information, allelic evidence, disease mechanism, and haemoglobinopathy-specific ACMG/AMP recommendations.

## Data availability

The repository contains research data and derived computational annotations used for this MSc project.

Some source data, clinical classifications, database annotations, or third-party scores may be subject to separate usage, citation, or redistribution requirements. Files that cannot be redistributed publicly will be replaced with appropriate documentation or instructions for obtaining the original data.

## Project status

This repository is under active development.

Current and planned work includes:

* repository restructuring;
* data and variable documentation;
* prediction-tool coverage analysis;
* binary pathogenic-versus-benign evaluation;
* comparison with previously published predictor scores;
* VUS-focused analysis;
* likelihood-ratio analysis;
* generation of final tables and figures; and
* preparation of a reproducible analysis report.

## Author

**Jessica Edinam Ackuaku**

MSc Molecular Medicine
Cyprus Institute of Neurology and Genetics

## Supervision

This research is being conducted under the supervision of:

* Dr Petros Kountouris
* Dr Stella Tamana

## Licence

The analysis code in this repository is made available under the MIT Licence.

The MIT Licence applies to the original code contained in this repository. It does not automatically apply to third-party datasets, clinical classifications, software, database annotations, or predictor scores.
