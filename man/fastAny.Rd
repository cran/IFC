% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fastAny.R
\name{fastAny}
\alias{fastAny}
\title{Any with Rcpp}
\usage{
fastAny(x)
}
\arguments{
\item{x}{either a list or an object coercible to logical matrix}
}
\value{
a logical vector
}
\description{
Helper to compute any
}
\details{
if \code{'x'} is a list it will return any across list members.
if \code{'x'} is coercible to a logical matrix, it will return any across matrix rows
}
\keyword{internal}
