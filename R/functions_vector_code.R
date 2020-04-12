# NOTE: ----
# The functions in this file are used to convert vectors into underlying R code that could be used to produce them
#   — i.e. using the c() function —. They are exported in the fwdSlash package but could also be part of the add-ins.

# CODE: ----
#' @title Convert vector to R code for a vector
#'
#' @description This function converts the clipboard (or indeed any character vector) into the \link[base:c]{code for an R vector}. This can be useful if there it is necessary to ``hard-code'' vectors.
#'
#'      It treats entirely numeric clipboards --- picked up by \code{\link{clipboard_is_numeric}} --- slightly differently to \emph{supposed} ``character'' clipboards.
#'
#' @param x A character vector (defaults to the \code{\link[clipr:read_clip]{clipboard}}).
#'
#' @return We show the output by way of the following examples that assume \code{x} is the clipboard.
#'
#'   \strong{Numeric:}
#'      suppose we copy the following into the clipboard...
#'
#'      \code{1}
#'
#'      \code{2}
#'
#'      \code{3}
#'
#'      Then the function will output \code{c(1,2,3)}.
#'
#'      \strong{Character:}
#'      suppose we copy the following into the clipboard...
#'
#'      \code{Apple}
#'
#'      \code{Orange}
#'
#'      \code{Banana}
#'
#'      Then the function will output \code{c("Apple","Orange","Banana")}.
#'
#' @examples \dontrun{
#'  # numeric example
#'  clipboard_to_R_vector(c("1","2","3"))
#'  # character example
#'  clipboard_to_R_vector(c("Apple","Orange","Banana")) }
#'
#' @export
to_vector_code <- function(x = clipr::read_clip()){
  if(clipboard_is_numeric(x)){
    x %>%
      stringr::str_remove_all("[:blank:]") %>% #Get rid of all blanks —spaces and tabs (\t)—
      stringr::str_replace("^$","NA") %>% # Replace all empty strings (after the removal of blanks with "NA")
      paste0(collapse = ",") %>%
      paste0("c(",.,")")
  }else{
    x %>%
      paste0(collapse = "\",\"") %>%
      paste0("c(\"",.,"\")")
  }
}
