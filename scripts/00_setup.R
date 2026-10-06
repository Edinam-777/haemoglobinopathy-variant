# Source from the repository root. No workspace restoration or package installation.
if (!file.exists("haemoglobinopathy-variant.Rproj")) {
  stop("Run from the repository root containing haemoglobinopathy-variant.Rproj.")
}
required_packages <- c("readxl", "dplyr", "stringr", "readr")
missing_packages <- required_packages[
  !vapply(required_packages, requireNamespace, logical(1), quietly = TRUE)
]
if (length(missing_packages)) {
  stop("Install required packages first: ", paste(missing_packages, collapse = ", "))
}
project_root <- normalizePath(".", winslash = "/", mustWork = TRUE)
raw_data_directory <- file.path(project_root, "data", "raw")
processed_data_directory <- file.path(project_root, "data", "processed")
output_directory <- file.path(project_root, "results")
tables_directory <- file.path(output_directory, "tables")
plot_directory <- file.path(output_directory, "plots")
# Migration outputs cannot overwrite existing thesis tables.
migration_tables_directory <- file.path(tables_directory, "pipeline_migration")
for (directory in c(processed_data_directory, migration_tables_directory, plot_directory)) {
  dir.create(directory, recursive = TRUE, showWarnings = FALSE)
}
