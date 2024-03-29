% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GatingML.R
\name{toXML2_graphpop_gs}
\alias{toXML2_graphpop_gs}
\title{Graphical Population GatingML Conversion to XML2}
\usage{
toXML2_graphpop_gs(pop, reg, verbose = FALSE)
}
\arguments{
\item{pop}{a member of `IFC_pops` object.}

\item{reg}{a member of `IFC_regions` object.}

\item{verbose}{whether to display message about current action. Default is FALSE.}
}
\value{
a xml_node.
}
\description{
Helper to convert pops and regions to XML nodes in GatingML files.
}
\keyword{internal}
