# Run with Rscript --vanilla scripts/qc/check_data_import.R from project root.
source("scripts/run_import.R")
stopifnot(
  nrow(DATASET_FOR_PROJECT) == 1627L,
  ncol(DATASET_FOR_PROJECT) == 45L,
  identical(IMPORTED_ANALYSIS_DATASET[names(DATASET_FOR_PROJECT)], DATASET_FOR_PROJECT)
)
counts <- table(IMPORTED_ANALYSIS_DATASET$observed_binary, useNA = "always")
stopifnot(counts[["Pathogenic"]] == 832L,
          counts[["Benign"]] == 194L, counts[["VUS"]] == 601L,
          !anyNA(IMPORTED_ANALYSIS_DATASET$observed_binary))
# Preserve the raw workbook on disk.
stopifnot(identical(unname(tools::md5sum(workbook_path)), import_provenance$md5))
message("Import checks passed: 1,627 rows; 1,026 binary-classified rows; 601 VUS.")
