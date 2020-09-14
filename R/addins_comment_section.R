# CODE: ----

#' Fill comment section with equals signs
#'
#' @description This add-in will fill the rest of the line with equals signs in order to break R scripts into sections.
#'
#'
#' @name fill_equals
fill_equals <- function(){
  n <- rstudioapi::getActiveDocumentContext()$selection[[1]]$range$end[[2]]
  nmax <- 80
  sec_string <- "="
  if(n < nmax) {
    fill <- strrep(x = sec_string,times = nmax - n)
    rstudioapi::insertText(text = fill)
  } else {
    return(invisible(NULL))
  }
}

