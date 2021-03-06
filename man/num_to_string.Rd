% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/strings_utils.R
\name{num_to_string}
\alias{num_to_string}
\title{Numeric to String Formatting}
\usage{
num_to_string(x, precision = 16)
}
\arguments{
\item{x}{a numeric vector.}

\item{precision}{number of significant decimal digits to keep when abs(x) < 1. Default is 15.}
}
\value{
a string vector.
}
\description{
Formats numeric to string used for features, images, ... values conversion when exporting to xml.
}
\keyword{internal}
