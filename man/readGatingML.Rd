% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GatingML.R
\name{readGatingML}
\alias{readGatingML}
\title{GatingML File Reader}
\usage{
readGatingML(fileName, ...)
}
\arguments{
\item{fileName}{path to file. It should be a .xml file.}

\item{...}{other arguments to be passed.}
}
\value{
A named list of class `IFC_gating`, whose members are:\cr
-graphs, a list of graphical elements found,\cr
-pops, a list describing populations found,\cr
-regions, a list describing how regions are defined.
}
\description{
Extracts GatingML from file.
}
\details{
reading GatingML files is in development and partly implemented.
For the moment, only files generated with IFC package can be read.
}
\keyword{internal}
