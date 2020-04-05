#' Replace `\` with `/` in the clipboard
#'
#' @description Add-in that will replace all forwardslashes with backslashes. It is intended to be used to copy file paths from the Windows File Explorer.
#'
#' @param pattern Regular expression to be replaced in the clipboard.
#' @param replace What to replace Ignored if \link{pattern} is an empty string (i.e. \code{""}).
#'
#' @note Note that this add-in will not manipulate the \code{\link[clipr:read_clip]{clipboard}} itself, only accesses it. This means you can use the clipboard with backlashes in it in another application if need be.
#'
#' @importFrom magrittr `%>%`
#'
#' @export
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

#' Write to the current cursor position.
#' @description A utility function for writing to the current cursor position, by virtue of accessing the \code{\link[rstudioapi:insertText]{rstudioapi}}.
#' @param text A character vector, each element of which is a line of output to the current cursor position.
#'
#' @return
write_to_cursor <- function(text){
  text %>%
    paste(collapse = "\n") %>%
    rstudioapi::insertText()
}


#' Current selected text
#'
#' @return
#' @export
#'
read_selected_text <- function(){
  rstudioapi::getActiveDocumentContext()$selection[[1]]$text
}

#' Replace `\` with `/` in the clipboard
#'
#' @description Add-in that will replace all forwardslashes with backslashes. It is intended to be used to copy file paths from the Windows File Explorer.
#'
#' @param pattern Regular expression to be replaced in the clipboard.
#' @param replace What to replace Ignored if \link{pattern} is an empty string (i.e. \code{""}).
#'
#' @note Note that this add-in will not manipulate the \code{\link[clipr:read_clip]{clipboard}} itself, only accesses it. This means you can use the clipboard with backlashes in it in another application if need be.
#'
#'
#' @export
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
}
