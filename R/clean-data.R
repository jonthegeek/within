#' @export
localize_beach <- function(original_dat) {
  lookup_table <- dplyr::tribble(
    ~where,     ~english,
    "beach",    "US",
    "coast",    "US",
    "seashore", "UK",
    "seaside",  "UK"
  )

  return(dplyr::left_join(original_dat, lookup_table, by = "where"))
}
