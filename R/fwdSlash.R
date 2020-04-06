#' Replace slashes in the clipboard
#'
#' @description Utility functions for reading/writing to the clipboard and performing a \link[stringr:tr_replace]{regex replacement} in one step.
#'
#'
#'     These functions were designed for use in the source code for add-ins that perform \link[fwdSlash:copy_add-ins]{special copies} and \link[fwdSlash:paste_add-ins]{special pastes} with manipulations of slashes in the clipboard in the \code{fwdSlash} package.
#'
#' @param text Text to be writeen to the clipboard.
#' @param pattern A \link[base:regex]{regular expression} to be replaced in the clipboard.
#' @param replace A string to replace any instances of argument \code{pattern} with. Ignored if \code{pattern} is an empty string (i.e. \emph{""}).
#'
#' @note Note that this add-in will not manipulate the \code{\link[clipr:read_clip]{clipboard}} itself, only accesses it. This means you can use the clipboard with backlashes in it in another application if need be.
#' @return \code{replace_from_clipboard()} returns a character which is a manipulated version of the clipboard.
#'
#'     \code{replace_to_clipboard()} always returns \code{\link{NULL}} and is used for it's ``side-effect'' (i.e. writing a manipulated version of the argument, \code{text} to the clipboard).
#'
#'     In both cases, said manipulation is a \link[stringr:str_replace]{regex replacement} specified by the arguments \code{pattern} and \code{replace}.
#'
#' @importFrom magrittr `%>%`
#' @name replace_clipboard
NULL

#' @name replace_clipboard
replace_from_clipboard <- function(pattern, replace) {
  if(clipr::clipr_available()){
    if(pattern!=""){
      clipr::read_clip() %>%
        stringr::str_replace_all(pattern,replace)
    }else{
      clipr::read_clip()
    }
  }else{
    rstudioapi::showDialog(title = "Clipboard unavailable","<strong>Unable to access your system clipboard.</strong> <p>This is either due to your operating system or the fact that your system is not interactive.</p> <p>See <em>clipr</em> documentation to resolve this issue:</p>", url = "https://github.com/mdlincoln/clipr")
    stop("Unable to access clipboard.")
  }
}

#' @name replace_clipboard
replace_to_clipboard <- function(text, pattern, replace) {
  if(clipr::clipr_available()){
    if(pattern!=""){
      text %>%
        stringr::str_replace_all(pattern,replace) %>%
        clipr::write_clip()
    }else{
      text %>%
        clipr::write_clip()
    }
  }else{
    rstudioapi::showDialog(title = "Clipboard unavailable","<strong>Unable to access your system clipboard.</strong> <p>This is either due to your operating system or the fact that your system is not interactive.</p> <p>See <em>clipr</em> documentation to resolve this issue:</p>", url = "https://github.com/mdlincoln/clipr")
    stop("Unable to access clipboard.")
  }
  NULL
}

#' Write to the current cursor position
#' @description A utility function for writing to the current cursor position, by virtue of accessing the \code{\link[rstudioapi:insertText]{rstudioapi}}.
#'
#'      This function is used in the source code for the \link[fwdSlash:paste_add-ins]{special paste add-ins} in the \code{fwdSlash} package.
#'
#' @param text A character vector, each element of which is a line of output to the current cursor position.
#' @return Returns \code{\link{NULL}} as it is the ``side-effects'' (i.e. inserting text in RStudio) that this function is useful for.
write_to_cursor <- function(text){
  text %>%
    paste(collapse = "\n") %>% #Allows for vector output of length >1
    rstudioapi::insertText()
  NULL
}


#' Current selected text
#'
#' @description A utility function that returns the current selected text, by virtue of accessing the \code{\link[rstudioapi:insertText]{rstudioapi}}.
#'
#'      This function is used in the source code for the \link[fwdSlash:copy_add-ins]{special copy add-ins} in the \code{fwdSlash} package.
#'
#' @return A character containing the active selected text in the RStudio IDE
read_selected_text <- function(){
  rstudioapi::getActiveDocumentContext()$selection[[1]]$text
}

