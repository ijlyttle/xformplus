#' tbldf_read
#'
#' Given some text (or a file path), a delimiter, and tz attributes, returns a \code{dplyr::tbl_df()}
#'
#' @param file Passed to \code{readr::read_delim}. Either a path to a file, a connection, or literal data (either a single string or a raw vector).
#' @param delim Passed to \code{readr::read_delim}. Delimiter.
#' @param tz_file Timezone used to express the time in the file, see \code{lubridate::olson_time_zones()}
#' @param tz_location Timezone used to express the time at the location, see \code{lubridate::olson_time_zones()}
#'
#' @return \code{dplyr::tbl_df()} Dataframe-like structure
#' @export
#'
tbldf_read <- function(file, delim = ",", tz_file = "UTC", tz_location = "UTC"){

  # make a provisional parsing of the text
  df <- readr::read_delim(file = file, delim = delim)

  # determine which columns are datetimes
  names_time <- colnames_type(df, "time")
  list_time <- as.list(names_time)
  names(list_time) <- names_time

  # run this only if there are datetime columns
  if (length(names_time) > 0){

    fn_parse <- function(x) {
      readr::col_datetime(tz = tz_file)
    }

    # set datetime parsers for the datetime columns
    list_parse_datetime <- lapply(list_time, fn_parse)

    # re-parse, using these parsers
    df <- readr::read_delim(file = file, delim = delim, col_types = list_parse_datetime)

    # set the timezone
    df <- df_set_tz(df, tz_location)

  }

  df
}
