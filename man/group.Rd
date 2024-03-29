% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/group.R
\name{group}
\alias{group}
\title{Groups Combination}
\usage{
group(df, collapse = ".", keepNAlevels = FALSE, ...)
}
\arguments{
\item{df}{a data.frame whose columns represent grouping factor.}

\item{collapse}{a string used to collapse groups levels.}

\item{keepNAlevels}{whether to keep NA levels resulting from groups merging}

\item{...}{other arguments to be passed.}
}
\value{
a named list containing row indices of grouping combinations.
}
\description{
Combines data.frame groups into a unique one
}
\keyword{internal}
