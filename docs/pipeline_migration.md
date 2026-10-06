# Pipeline migration: setup and import

This stage extracts setup and the final clinical-classification mapping from
the research notebook. The notebook and existing thesis outputs are retained.

From the repository root, install readxl, dplyr, stringr and readr, then run:

```r
source("scripts/run_import.R")
```

A clean-session check is available:

```sh
Rscript --vanilla scripts/qc/check_data_import.R
```

Input: data/raw/DATASET FOR PROJECT.xlsx, sheet Input-Full dataset.
All 1,627 rows and 45 source columns are retained, including original column
names and GRCh38 annotations. Import produces 832 Pathogenic, 194 Benign and
601 VUS classifications. These are workbook-level counts, not evidence that
the downstream merge, eligibility filtering or predictor analyses reproduce.

Derived columns: observed_classification (whitespace-normalised label) and
observed_binary (Pathogenic, Benign, VUS or missing). Unrecognised labels are
reported and remain missing; they are never silently classified as benign.

Generated datasets: data/processed/imported_analysis_dataset.rds and .csv.
Import summaries and workbook MD5: results/tables/pipeline_migration/.
RDS preserves imported column types. No raw file is edited and no variant is
deduplicated, filtered, converted or assigned a new genomic identifier here.

The QC counts describe the current committed workbook; review them when the
curation changes. Package versions are not yet frozen. The full pipeline,
canonical missense rules and external VEP provenance remain migration work.
