% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_breast_mammogram.R
\name{get_breast_mammogram}
\alias{get_breast_mammogram}
\title{Retrieves Data for Mammograms Conducted}
\usage{
get_breast_mammogram(
  start_date,
  end_date = NULL,
  level = c("kenya", "county", "subcounty", "ward", "facility"),
  organisations = NULL,
  categories = NULL,
  elements = NULL,
  ...
)
}
\arguments{
\item{start_date}{The start date to retrieve data. It is required and in the format \code{YYYY-MM-dd}.}

\item{end_date}{The ending date for data retrieval (default is the current date).}

\item{level}{The desired data granularity: \code{"kenya"} (the default), \code{"county"}, \code{"subcounty"}, \code{"ward"}, or \code{"facility"}.}

\item{organisations}{A list of organization units in the data. If NULL, downloaded using \code{\link[=get_organisation_units_metadata]{get_organisation_units_metadata()}}.}

\item{categories}{A list of categories to include. If NULL, downloaded using \code{\link[=get_category_options_metadata]{get_category_options_metadata()}}.}

\item{elements}{A list of data elements to include. If NULL, downloaded using \code{\link[=get_data_elements_metadata]{get_data_elements_metadata()}}.}

\item{...}{Other options that can be passed onto KHIS API.}
}
\value{
A tibble containing data for mammograms conducted with the following columns:
\itemize{
\item kenya      - Optional if the level is Kenya.
\item county     - Name of the county. Optional if the level is \code{county}, \code{subcounty}, \code{ward} or \code{facility}.
\item subcounty  - Name of the subcounty. Optional if the level is \code{subcounty}, \code{ward} or \code{facility}.
\item ward       - Name of the ward. Optional if the level is \code{ward} or \code{facility}.
\item facility   - Name of the health facility. Optional if the level \code{facility}.
\item period     - The month and year of the data.
\item fiscal_year- The financial year of the report(July-June Cycle).
\item year       - The calendar year of the report.
\item month      - The month name of the report.
\item category   - The age group category of the report (25-34, 35-39, 40-55, 56-74, or 75+).
\item category2  - Additional category if available.
\item element    - The data element.
\item value      - The number reported.
}
}
\description{
\code{get_breast_mammogram()} retrieves data for mammograms conducted within a
specified period from the KHIS API server using \code{\link[=get_analytics]{get_analytics()}}.
}
\examples{
\dontshow{if (khis_has_cred()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}

# Download data from February 2023 to current date
mammogram_data <- get_breast_mammogram(start_date = '2023-02-01')
mammogram_data
\dontshow{\}) # examplesIf}
}
\seealso{
\itemize{
\item \code{\link[=get_analytics]{get_analytics()}} for retrieving data from KHIS
}
}
