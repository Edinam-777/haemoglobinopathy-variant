# Import only: preserve original columns, values and rows.
if (!exists("raw_data_directory", inherits = TRUE)) {
  stop("Source scripts/00_setup.R first.")
}
workbook_path <- file.path(raw_data_directory, "DATASET FOR PROJECT.xlsx")
if (!file.exists(workbook_path)) stop("Missing raw workbook: ", workbook_path)
sheet_name <- "Input-Full dataset"
if (!sheet_name %in% readxl::excel_sheets(workbook_path)) {
  stop("Missing workbook sheet: ", sheet_name)
}
DATASET_FOR_PROJECT <- readxl::read_excel(
  workbook_path, sheet = sheet_name, .name_repair = "minimal"
)
required_columns <- c("ithaID", "HGVS", "HGVS_transcript",
                      "GRCh38 Vep_input", "Observed_pathogenicity", "Effect_function")
if (anyDuplicated(names(DATASET_FOR_PROJECT))) stop("Duplicate workbook column names.")
missing_columns <- setdiff(required_columns, names(DATASET_FOR_PROJECT))
if (length(missing_columns)) {
  stop("Missing columns: ", paste(missing_columns, collapse = ", "))
}
added_columns <- c("observed_classification", "observed_binary")
if (any(added_columns %in% names(DATASET_FOR_PROJECT))) {
  stop("Derived classification columns already exist in the workbook.")
}
# Exact mapping retained from the notebook's final classification chunk.
pathogenic_labels <- c("P", "LP", "P/LP", "Pathogenic", "Likely pathogenic",
  "Pathogenic/Likely pathogenic", "Pathogenic or likely pathogenic")
benign_labels <- c("B", "LB", "B/LB", "Benign", "Likely benign",
  "Benign/Likely benign", "Benign or likely benign")
vus_labels <- c("VUS", "Uncertain significance", "Variant of uncertain significance")
IMPORTED_ANALYSIS_DATASET <- dplyr::mutate(
  DATASET_FOR_PROJECT,
  observed_classification = stringr::str_squish(as.character(Observed_pathogenicity)),
  observed_binary = dplyr::case_when(
    observed_classification %in% pathogenic_labels ~ "Pathogenic",
    observed_classification %in% benign_labels ~ "Benign",
    observed_classification %in% vus_labels ~ "VUS",
    TRUE ~ NA_character_
  )
)
classification_summary <- dplyr::count(
  IMPORTED_ANALYSIS_DATASET, observed_classification, observed_binary, name = "n"
)
readr::write_csv(classification_summary,
  file.path(migration_tables_directory, "import_classification_summary.csv"))
unknown_classifications <- dplyr::filter(classification_summary, is.na(observed_binary))
readr::write_csv(unknown_classifications,
  file.path(migration_tables_directory, "unmapped_classifications.csv"))
if (nrow(unknown_classifications)) {
  warning("Unmapped or missing clinical labels; see unmapped_classifications.csv.")
}
# RDS retains inferred column types and original column names.
saveRDS(IMPORTED_ANALYSIS_DATASET,
  file.path(processed_data_directory, "imported_analysis_dataset.rds"))
readr::write_csv(IMPORTED_ANALYSIS_DATASET,
  file.path(processed_data_directory, "imported_analysis_dataset.csv"))
import_provenance <- data.frame(
  source = "data/raw/DATASET FOR PROJECT.xlsx", sheet = sheet_name,
  md5 = unname(tools::md5sum(workbook_path)),
  rows = nrow(DATASET_FOR_PROJECT), source_columns = ncol(DATASET_FOR_PROJECT)
)
readr::write_csv(import_provenance,
  file.path(migration_tables_directory, "import_provenance.csv"))
message("Imported ", nrow(DATASET_FOR_PROJECT),
  " rows; no variant filtering or deduplication performed.")
