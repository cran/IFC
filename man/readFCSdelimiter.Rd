% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fcs.R
\name{readFCSdelimiter}
\alias{readFCSdelimiter}
\title{FCS Delimiter Reader}
\usage{
readFCSdelimiter(fileName, at = 58, version = 3, encoding = "UTF-8", ...)
}
\arguments{
\item{fileName}{path to file.}

\item{at}{offset of delimiter. Default is 58.}

\item{version}{version to check keywords compliance against. Default is 3.0.}

\item{encoding}{name of the encoding for raw to character conversion. Default is "UTF-8".}

\item{...}{other arguments to be passed.}
}
\description{
Helper to extract delimiter from Flow Cytometry Standard (FCS) compliant files.
}
\keyword{internal}
