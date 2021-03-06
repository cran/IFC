% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ExportToDAF.R
\name{ExportToDAF}
\alias{ExportToDAF}
\title{DAF File Writer}
\usage{
ExportToDAF(
  fileName,
  write_to,
  pops = list(),
  regions = list(),
  features = list(),
  graphs = list(),
  masks = list(),
  viewing_pop = "All",
  endianness = .Platform$endian,
  verbose = FALSE,
  overwrite = FALSE,
  fullname = TRUE,
  cifdir = dirname(fileName),
  ntry = +Inf,
  ...
)
}
\arguments{
\item{fileName}{path of file to read data from.}

\item{write_to}{pattern used to export file.
Placeholders, like "\%d/\%s_fromR.\%e", will be substituted:\cr
-\%d: with full path directory of 'fileName'\cr
-\%p: with first parent directory of 'fileName'\cr
-\%e: with extension of 'fileName' (without leading .)\cr
-\%s: with shortname from 'fileName' (i.e. basename without extension).\cr
Exported file extension will be deduced from this pattern. Note that has to be a .daf.}

\item{pops}{list of population(s) to export. Will be coerced to exportable format by buildPopulation.}

\item{regions}{list of region(s) to export. Will be coerced to exportable format by buildRegion.}

\item{features}{list of feature(s) to export.}

\item{graphs}{list of graph(s) to export. Not yet implemented.}

\item{masks}{list of mask(s) to export. Not yet implemented.}

\item{viewing_pop}{Character String. Allow user to change displayed population. Default is 'All'.}

\item{endianness}{The endian-ness ("big" or "little") of the target system for the file. Default is .Platform$endian.\cr
Endianness describes the bytes order of data stored within the files. This parameter may not be modified.}

\item{verbose}{whether to display information (use for debugging purpose). Default is FALSE.}

\item{overwrite}{whether to overwrite file or not. Default is FALSE.
Note that if TRUE, it will overwrite exported file if path of 'fileName' and deduced from 'write_to' arguments are different.
Otherwise, you will get an error saying that overwritting source file is not allowed.\cr
Note also that an original file, i.e. generated by IDEAS(R) or INSPIRE(R), will never be overwritten.\cr
Otherwise, you will get an error saying that overwritting original file is not allowed.}

\item{fullname}{whether to export daf file with full name of its corresponding cif, if found. Default is TRUE.
If cif can't be found, daf file will be exported with the original cif file name.}

\item{cifdir}{the path of the directory to initially look to cif file. Default is dirname(fileName). Only apply when 'fullname' is set to TRUE.}

\item{ntry}{number of times \code{\link{ExportToDAF}} will be allowed to find corresponding cif file. Default is +Inf. Only apply when 'fullname' is set to TRUE.}

\item{...}{other arguments to be passed.}
}
\value{
It invisibly returns full path of exported file.
}
\description{
Writes a new DAF file based on another one and exports new region(s), pop(s), feature(s), graph(s) and / or mask(s).
}
\examples{
if(requireNamespace("IFCdata", quietly = TRUE)) {
  ## use a daf file
  file_daf <- system.file("extdata", "example.daf", package = "IFCdata")
  tmp <- tempdir(check = TRUE)
  ## create a tagged population named test with 1st object
  pop <- buildPopulation(name = "test", type = "T", obj = 0)
  ExportToDAF(file_daf, write_to = paste0(tmp, "\\\\test.daf"),
              overwrite = TRUE, pops = list(pop))
} else {
  message(sprintf('Please run `install.packages("IFCdata", repos = "\%s", type = "source")` \%s',
                  'https://gitdemont.github.io/IFCdata/',
                  'to install extra files required to run this example.'))
}
}
