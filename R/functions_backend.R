# NOTE: ----
# The functions in this file are for use in the source code for this package but are not exported.
#   That is, they can only be accessed using fwdSlash:::func.

# This is the file where the magrittr pipe operator (%>%) is imported but that it is also used heavily
#   throughout pretty much all the scripts.

# CODE: ----
#' Read and write to the system clipboard
#'
#' @description Utility functions to read and write to the system clipboard with checks.
#'
#'      These functions are used in the source code for add-ins in the \code{fwdSlash} package.
#'
#' @param text A character vector, each element of which is a line of text to be written to the clipboard.
#'
#' @return The value of \code{set_clipboard()} is a character vector, each element of which is a line of text in the system clipboard.
#'
#' The value of \code{set_clipboard()} is always \code{\link{NULL}} as it is used for its ``side-effect'' if writing to the clipboard and not for its value.
#'
#' @details These functions are essentially the \code{clipr} functions, \code{\link[clipr]{read_clip}} and \code{\link[clipr]{write_clip}} respectively with some additional checks
#'
#' These checks include:
#' \itemize{
#'  \item If the \code{clipr} package is incompatible with the system, it will provide an informative dialogue box.
#'  \item If the R session is not interactive, these functions will not execute the clipr functions as they are not meant to be used in non-interactive sessions.
#' }
#'
#' @importFrom magrittr `%>%`
#'
#' @name clipboard_utilities
NULL

#' @name clipboard_utilities
get_clipboard <- function(){
  if(interactive()){
    if(clipr::clipr_available()){
      clipr::read_clip()
    }else{
      rstudioapi::showDialog(title = "Clipboard unavailable","<strong>Unable to access your system clipboard.</strong> <p>This is either due to your operating system or the fact that your system is not interactive.</p> <p>See <em>clipr</em> documentation to resolve this issue:</p>", url = "https://github.com/mdlincoln/clipr")
      stop("Unable to access clipboard.")
    }
  }else{
    "" # gives an empty string if the session is not interactive
  }
}

#' @name clipboard_utilities
set_clipboard <- function(text){
  if(interactive()){
    if(clipr::clipr_available()){
      clipr::write_clip(text)
    }else{
      rstudioapi::showDialog(title = "Clipboard unavailable","<strong>Unable to access your system clipboard.</strong> <p>This is either due to your operating system or the fact that your system is not interactive.</p> <p>See <em>clipr</em> documentation to resolve this issue:</p>", url = "https://github.com/mdlincoln/clipr")
      stop("Unable to access clipboard.")
    }
  }
  NULL
}


#' Read from/write to the current position in RStudio
#' @description Utility functions for reading the current selected text and writing to the current cursor position respectively, by virtue of the \code{\link[rstudioapi:insertText]{rstudioapi}}.
#'
#'      These functions are used in the source code for add-ins in the \code{fwdSlash} package.
#'
#' @param text A character vector, each element of which is a line of text to be written to the current cursor position.
#'
#' @return The \link{read_selected_text()} function returns a character containing the active selected text in the RStudio IDE.
#'
#'     \link{write_cursor} returns \code{\link{NULL}} as it is the ``side-effects'' (i.e. inserting text in RStudio) that this function is useful for.
#'
#' @name Rstudio_position_utilities
NULL

#' @name Rstudio_position_utilities
get_selected_text <- function(){
  rstudioapi::getActiveDocumentContext()$selection[[1]]$text
}

#' @name Rstudio_position_utilities
write_to_cursor <- function(text){
  text %>%
    paste(collapse = "\n") %>% #Allows for vector output of length >1
    rstudioapi::insertText()
  NULL
}

#' Is the clipboard numeric?
#'
#' @description A utility function that performs a logical operation to check if the clipboard contains only numbers.
#'
#' @param clipboard A character vector (defaults to the clipboard)
#'
#' @return A \link{logical} vector (\code{TRUE} or \code{FALSE}) of length 1.
#'
clipboard_is_numeric <- function(clipboard = get_clipboard()){
  clipboard %>%
    # This regex is designed to pickup if each line of the clipboard can be coherced as a numeric vector
    # It also picks up blank string which will be converted into NA
    stringr::str_detect("^[:blank:]*\\d*((?<=\\d)\\.|\\.(?=\\d))?[\\d]*[:blank:]*$") %>%
    all
}
