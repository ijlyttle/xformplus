library("lubridate")

n_row <- 10
seq_loc <- seq(0, n_row-1)

time_seq <- ymd("2001-01-01", tz = "UTC") + dhours(seq_loc)
date_seq <- as.Date(ymd("2001-01-01", tz = "UTC") + ddays(seq_loc))
lgl_seq <- rep(TRUE, n_row)
int_seq <- as.integer(seq_loc)
dbl_seq <- as.double(seq_loc)
chr_seq <- letters[1:n_row]
fctr_seq <- factor(chr_seq)

xform_sample <-
  data_frame(
    time_chicago = with_tz(time_seq, tzone = "America/Chicago"),
    date_chicago = as.Date(format(time_chicago)),
    lgl_a = lgl_seq,
    dbl_a = dbl_seq,
    int_a = int_seq,
    chr_a = chr_seq,
    fctr_a = fctr_seq,
    time_paris = with_tz(time_seq, tzone = "Europe/Paris"),
    date_paris = as.Date(format(time_paris))
  )

devtools::use_data(xform_sample, overwrite = TRUE)
