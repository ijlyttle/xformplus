context("colnames_type")

test_that("single values work", {
  expect_identical(
    colnames_type(xform_sample, "time"),
    c("time_chicago", "time_paris")
  )
  expect_identical(
    colnames_type(xform_sample, "date"),
    c("date_chicago", "date_paris")
  )
  expect_identical(colnames_type(xform_sample, "lgl"), "lgl_a")
  expect_identical(colnames_type(xform_sample, "dbl"), "dbl_a")
  expect_identical(colnames_type(xform_sample, "int"), "int_a")
  expect_identical(colnames_type(xform_sample, "chr"), "chr_a")
  expect_identical(colnames_type(xform_sample, "fctr"), "fctr_a")
})

test_that("multiple values work", {
  expect_identical(
    colnames_type(xform_sample, c("time", "date")),
    c("time_chicago", "date_chicago", "time_paris", "date_paris")
  )
  expect_identical(
    colnames_type(xform_sample, c("dbl", "int")),
    c("dbl_a", "int_a")
  )

})

