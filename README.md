# Assessment of In Silico Tools for Variant-Effect Prediction in Haemoglobinopathies

## Project overview

This repository contains the reproducible data-processing and statistical-analysis workflow developed for my MSc research project:

**“Assessment of In Silico Tools for Variant-Effect Prediction in Haemoglobinopathies.”**

The project evaluates computational tools used to predict the effects of sequence variants in the haemoglobin genes **HBA1, HBA2, and HBB**.

The analysis examines:

- prediction availability and coverage;
- agreement and disagreement between tools;
- performance against established clinical classifications;
- differences across genes and variant consequences;
- variants of uncertain significance;
- likelihood ratios for eligible tools; and
- the potential contribution of computational predictions to the ACMG/AMP evidence criteria **PP3** and **BP4**.

This repository demonstrates a genomic-data analysis workflow involving variant standardisation, genome-build conversion, Ensembl Variant Effect Predictor annotation, transcript selection, data integration, quality control, statistical evaluation, and reproducible reporting in R.

## Research context

Haemoglobinopathies are inherited disorders caused by variants that affect haemoglobin structure or production. Accurate interpretation of variants in haemoglobin genes is important for diagnosis, carrier screening, genetic counselling, and clinical management.

Computational prediction tools are commonly used as supporting evidence during variant interpretation. However, these tools differ in their algorithms, training datasets, score thresholds, applicable variant types, and performance characteristics.

Their predictions should therefore not be treated as independent clinical classifications. This study evaluates their performance against variants with established clinical classifications and considers their appropriate use within the ACMG/AMP framework.

## Study objectives

The objectives of the project are to:

1. curate variants in **HBA1, HBA2, and HBB** with established clinical classifications;
2. standardise variant descriptions and genomic coordinates;
3. convert genomic coordinates from GRCh37 to GRCh38;
4. obtain computational annotations using Ensembl Variant Effect Predictor and associated resources;
5. retain appropriate MANE Select transcript annotations;
6. evaluate prediction-tool coverage across genes and variant consequences;
7. compare computational predictions with observed clinical classifications;
8. calculate performance measures including sensitivity, specificity, accuracy, balanced accuracy, concordance, and Matthews correlation coefficient;
9. examine variants of uncertain significance separately;
10. calculate likelihood ratios for eligible tools;
11. investigate agreement and disagreement between prediction tools; and
12. assess the implications of computational predictions for ACMG/AMP PP3 and BP4 evidence.

## Genes and clinical classifications

The analysis includes variants affecting:

- **HBA1** — haemoglobin subunit alpha 1;
- **HBA2** — haemoglobin subunit alpha 2; and
- **HBB** — haemoglobin subunit beta.

The reference dataset contains variants classified as:

- pathogenic or likely pathogenic;
- benign or likely benign; and
- variants of uncertain significance.

For binary performance analyses, pathogenic and likely pathogenic variants are compared with benign and likely benign variants.

Variants of uncertain significance are analysed separately and are not automatically assigned to either binary class.

## Analysis workflow

The main workflow consists of:

1. importing and inspecting the original variant dataset;
2. cleaning and standardising variant identifiers;
3. converting coordinates from GRCh37 to GRCh38;
4. validating and normalising variant descriptions;
5. preparing variants for Ensembl Variant Effect Predictor;
6. importing and cleaning VEP annotations;
7. selecting appropriate MANE Select transcript records;
8. merging VEP annotations with the clinical dataset;
9. identifying duplicate, missing, and unmatched records;
10. assessing tool coverage;
11. performing descriptive analyses;
12. conducting pathogenic-versus-benign performance analyses;
13. evaluating missense variants separately;
14. examining variants of uncertain significance;
15. calculating likelihood ratios where appropriate; and
16. generating reproducible tables and figures.

## Variant annotation and quality control

The original dataset used the **GRCh37** reference genome. Variant coordinates were converted to **GRCh38** before annotation.

Variant descriptions were checked and standardised before submission to Ensembl Variant Effect Predictor.

Where VEP returned multiple transcript annotations for the same variant, transcript selection was guided by **MANE Select** annotations for HBA1, HBA2, and HBB.

Quality-control checks include:

- duplicate variant identifiers;
- variants with multiple VEP annotation rows;
- missing MANE Select annotations;
- unmatched variants after dataset merging;
- inconsistent genomic or transcript descriptions; and
- missing computational prediction scores.

## Computational prediction tools

The project evaluates established and newer computational predictors where annotations are available.

### Individual prediction tools

Examples include:

- SIFT;
- PolyPhen-2;
- MutationTaster;
- PROVEAN;
- FATHMM;
- MutationAssessor; and
- LIST-S2.

### Meta-predictors and ensemble methods

Examples include:

- REVEL;
- MetaSVM;
- MetaLR;
- ClinPred;
- BayesDel;
- Condel;
- VEST4;
- DANN;
- CADD; and
- Eigen.

### Deep-learning and protein-language approaches

The analysis also considers newer tools where scores are available, including:

- AlphaMissense;
- EVE; and
- ESM1b.

### Splicing and conservation annotations

Additional annotations include tools and scores such as:

- SpliceAI;
- GERP++;
- phyloP; and
- phastCons.

Not every tool is applicable to every variant type. Prediction coverage is therefore evaluated before performance comparisons are interpreted.

## Performance evaluation

For tools with sufficient predictions and defined pathogenic and benign thresholds, the analysis evaluates:

- true positives;
- true negatives;
- false positives;
- false negatives;
- sensitivity;
- specificity;
- accuracy;
- balanced accuracy;
- positive predictive value;
- negative predictive value;
- Matthews correlation coefficient;
- concordance; and
- likelihood ratios.

Performance estimates are interpreted alongside:

- the number of evaluated variants;
- missing prediction scores;
- class imbalance;
- gene-specific performance;
- variant consequence;
- tool applicability; and
- predictor-specific score thresholds.

## Repository structure

```text
haemoglobinopathy-variant/
├── data/
│   ├── raw/              # Original input files
│   └── processed/        # Cleaned and merged analysis datasets
├── docs/                 # Workflow and protocol documentation
├── environment/          # Software and package information
├── notebooks/            # R Markdown notebook and rendered HTML report
├── results/
│   ├── final/
│   │   ├── tables/       # Curated final tables for reviewers
│   │   └── plots/        # Curated final plots for reviewers
│   ├── tables/           # Complete analysis and quality-control tables
│   └── plots/            # Complete analysis figures
├── scripts/              # Numbered R analysis scripts
├── .gitignore
├── LICENSE
├── README.md
└── haemoglobinopathy-variant.Rproj
```

## Main analysis and key outputs

The complete reproducible analysis is available in:

- [R Markdown analysis notebook](notebooks/haemoglobinopathy_variant_analysis.Rmd)
- [Rendered HTML analysis report](notebooks/haemoglobinopathy_variant_analysis.html)

Additional analysis outputs are available in:

- [Complete result tables](results/tables/)
- [Complete result plots](results/plots/)

## Final results for reviewers

A curated set of the main thesis outputs is available in:

- [Final result tables](results/final/tables/)
- [Final result plots](results/final/plots/)

### Final tables

- [Whole binary tool performance](results/final/tables/binary_performance_summary_with_coverage.csv)
- [Corrected missense-only tool performance](results/final/tables/corrected_missense_binary_performance_summary_with_coverage_after_polyphen_fix.csv)
- [Common missense subset performance](results/final/tables/common_missense_subset_performance_selected_tools.csv)
- [Default versus optimised threshold comparison](results/final/tables/default_vs_corrected_optimised_threshold_comparison_after_polyphen_fix.csv)
- [Main analysis comparison summary](results/final/tables/main_analysis_comparison_summary.csv)

### Final plots

- [Whole-dataset MCC by tool](results/final/plots/whole_dataset_mcc_by_tool.png)
- [Missense-only MCC by tool](results/final/plots/missense_only_mcc_by_tool.png)
- [Common missense subset MCC by tool](results/final/plots/common_missense_subset_mcc_by_tool.png)
- [Missense coverage versus MCC](results/final/plots/missense_coverage_vs_mcc.png)
- [Default versus optimised MCC change](results/final/plots/default_vs_optimised_mcc_change.png)

## Reproducibility

The analysis was conducted primarily in **R** and **RStudio**.

Core packages used include:

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

The workflow uses project-relative paths so that it can be run from the RStudio project rather than relying on computer-specific absolute file paths.

To reproduce the analysis:

1. clone or download the repository;
2. open `haemoglobinopathy-variant.Rproj` in RStudio;
3. install the required R packages;
4. confirm that the required source data are available in `data/raw/`;
5. open `notebooks/haemoglobinopathy_variant_analysis.Rmd`; and
6. run or knit the notebook from the beginning.

## Large input file

The full `ENSEMBL_VEP_OUTPUT.csv` file is not included in the public repository because it exceeds GitHub’s individual file-size limit.

The notebook expects this file at:

```text
data/raw/ENSEMBL_VEP_OUTPUT.csv
```

The file contains the Ensembl Variant Effect Predictor output used for annotation integration and downstream analyses.

It can be regenerated by submitting the project variants to Ensembl VEP using the documented annotation settings, or supplied separately where appropriate.

Large raw VEP text outputs are also excluded from the public repository but are retained locally as part of the research record.

## Interpretation and clinical-use statement

Computational predictions are evaluated as supporting evidence only.

A pathogenic or benign prediction from an in silico tool does not independently establish the clinical significance of a variant.

Results must be interpreted alongside other evidence, including:

- population frequency;
- functional studies;
- segregation evidence;
- phenotype information;
- allelic evidence;
- disease mechanism; and
- haemoglobinopathy-specific ACMG/AMP recommendations.

The outputs in this repository are intended for research and academic evaluation and should not be used independently for clinical diagnosis or medical decision-making.

## Data availability and reuse

This repository contains research data, processed datasets, computational annotations, analysis code, tables, and figures used in the MSc project.

Some source data, clinical classifications, database annotations, or third-party prediction scores may be subject to separate citation, licensing, or redistribution requirements.

The MIT Licence applies only to the original analysis code in this repository. It does not automatically apply to:

- third-party datasets;
- clinical classifications;
- database content;
- external software;
- computational prediction scores; or
- annotations obtained from external resources.

Any files that cannot legally or ethically be redistributed are excluded from the public repository and replaced with documentation describing their source and expected location.

## Project status

The core data-processing, annotation-integration, quality-control, coverage, and binary performance-analysis workflows have been implemented.

The repository is maintained as the reproducible computational record of the MSc thesis project. Interpretation of the results and preparation of thesis-related outputs remain subject to academic review.

## Author

**Jessica Edinam Ackuaku**  
MSc Molecular Medicine  
Cyprus Institute of Neurology and Genetics

## Supervision

This research was conducted under the supervision of:

- Dr Petros Kountouris
- Dr Stella Tamana

## Licence

Original analysis code is available under the **MIT Licence**.

Third-party data and annotations remain subject to their respective terms of use and citation requirements.