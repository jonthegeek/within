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

#' @export
celsify_temp <- function(dat) {
  dplyr::mutate(
    dat,
    temp = dplyr::if_else(
      english == "US",
      .f_to_c(temp),
      temp
    )
  )
}

.f_to_c <- function(temp) {
  (temp - 32) * 5/9
}

#' @export
clean_swim_data <- function(dat) {
  dat %>%
    localize_beach() %>%
    celsify_temp()
}
