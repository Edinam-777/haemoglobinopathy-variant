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
├── notebooks/            # Reproducible R Markdown analysis
├── results/
│   ├── tables/           # Generated summary and performance tables
│   └── plots/            # Generated figures
├── .gitignore
├── LICENSE
├── README.md
└── haemoglobinopathy-variant.Rproj

## Main analysis and key outputs

The complete reproducible analysis is available in:

- [R Markdown analysis notebook](notebooks/haemoglobinopathy_variant_analysis.Rmd)
- [Rendered HTML analysis report](notebooks/haemoglobinopathy_variant_analysis.html)

Key performance summaries include:

- [Overall binary tool-performance summary](results/tables/binary_tool_performance_summary_with_coverage.csv)
- [Missense-specific binary tool-performance summary](results/tables/missense_binary_tool_performance_summary_with_coverage.csv)

Additional tables and figures are available in:

- [`results/tables/`](results/tables/)
- [`results/plots/`](results/plots/)

### Large input file

The full `ENSEMBL_VEP_OUTPUT.csv` file is not included in the repository because it exceeds GitHub’s individual file-size limit.

The notebook expects this file at:

```text
data/raw/ENSEMBL_VEP_OUTPUT.csv


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