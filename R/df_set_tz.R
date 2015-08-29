#' df_set_tz
#'
#' Sets the timezone of all time-based columns in a dataframe
#'
#' @param df  dataframe
#' @param tz  timezone, an Olson timezone or "UTC" (default)
#'
#' @return \code{dplyr::tbl_df()}
#'
#' @examples
#' df_set_tz(xform_sample, tz = "America/Chicago")
#'
#' @export
#'
df_set_tz <- function(df, tz = "UTC"){

  fn_set_tz <- function(x){

    if (!identical(dplyr::type_sum(x), "time"))
      return(x) # do nothing

    lubridate::with_tz(x, tz)
  }

  dplyr::as_data_frame(lapply(df, fn_set_tz))
}
