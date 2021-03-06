% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/strings_utils.R
\name{formatn}
\alias{formatn}
\title{File Path Placeholders Formatting}
\usage{
formatn(splitp_obj, splitf_obj, channel = "", object = "")
}
\arguments{
\item{splitp_obj}{object returned by \code{\link{splitp}}.}

\item{splitf_obj}{object returned by \code{\link{splitf}}. It will be used to substitute \%d, \%p, \%s and \%e.}

\item{channel}{string to be used to substitute \%c}

\item{object}{string to be used to substitute \%o}
}
\description{
Helper to format splitp_obj using splitf_obj, channel and object information.
}
\keyword{internal}
