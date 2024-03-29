#' Get Data Elements Metadata
#'
#' `get_data_elements_metadata()` fetches data elements metadata from the KHIS API
#'   server, including their IDs and names.
#'
#' @param element_ids A vector of specific data element IDs to retrieve. If NULL, all data elements will be retrieved.
#' @param ... Other options that can be passed onto KHIS API.
#'
#' @return A tibble containing the following columns:
#'
#' * element_id - The unique identifier for the data element.
#' * element    - The name of the data element.
#'
#' @export
#'
#' @examplesIf khis_has_cred()
#' # Fetch the data element metadata for particular element id
#' elements <- get_data_elements_metadata(element_ids = c('htFuvGJRW1X'))
#' elements
#'
#' # Fetch all the data elements
#' elements <- get_data_elements_metadata()
#' elements

get_data_elements_metadata <-function(element_ids = NULL, ...) {

  x = name = filter = NULL # due to NSE notes in R CMD check

  if (!is.null(element_ids) && length(element_ids) > 0) {
    filter <- str_c(element_ids, collapse = ',')
    filter <- str_c('id:in:[', filter, ']')
  }

  data <- .api_get('dataElements',
                   fields='id,name',
                   filter=filter,
                   ...)

  if (is_empty(data$dataElements)) {
    cancerscreening_bullets(
      c(
        "!" = "Empty data elements returned",
        "!" = "The KHIS server did not return any data elements."
      )
    )

    return(tibble(
      element_id = character(),
      element = character()
    ))
  }

  data <- tibble(x = data$dataElements) %>%
    unnest_wider(x) %>%
    rename(
      element_id = id,
      element = name
    )

  return(data)
}
