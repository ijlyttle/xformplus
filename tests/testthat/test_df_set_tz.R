context("df_set_tz")

# get a vector of unique timezones from a dataframe
unique_tz <- function(df){

  colnames_time <- colnames_type(df, "time")

  # subset only those columns that are times
  df <- df[colnames_time]

  # make a charager vector of the timezones
  tz <- vapply(df, lubridate::tz, character(1))

  # get the unique values
  tz_unique <- unique(tz)

  tz_unique
}

test_that("can set timezones for dataframes", {
  expect_identical(
    unique_tz(df_set_tz(xform_sample, "UTC")),
    "UTC"
  )
  expect_identical(
    unique_tz(df_set_tz(xform_sample, "America/Los_Angeles")),
    "America/Los_Angeles"
  )
})
