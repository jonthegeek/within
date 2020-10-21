#' @export
make_outfile_path <- function(infile) {
  outfile <- paste0(
    .pretty_timestamp(),
    "_",
    .clean_path(infile)
  )
}

.pretty_timestamp <- function() {
  now <- Sys.time()
  timestamp <- format(now, "%Y-%m-%d_%H-%M-%S")
}

.clean_path <- function(infile) {
  sub("(.*)([.]csv$)", "\\1_clean\\2", infile)
}
