#' colnames_type
#'
#' Given a dataframe and a character-vector of types, return the column names of that type
#'
#' Following \code{dplyr::type_sum}, the most-common types are:
#'
#' \describe{
#'   \item{lgl}{logical}
#'   \item{int}{integer}
#'   \item{dbl}{double (numeric)}
#'   \item{chr}{character}
#'   \item{fctr}{factor}
#'   \item{date}{date}
#'   \item{time}{time, such as \code{POSIXct}}
#' }
#'
#' @param df dataframe
#' @param type character, vector of types of columns to return
#'
#' @return character, vector column names corresponding to type
#' @examples
#' colnames_type(xform_sample, c("int", "dbl"))
#'
#' @export
#'
colnames_type <- function(df, type = ""){

  coltypes <- dplyr::type_sum(df)

  colnames(df)[coltypes %in% type]
}
