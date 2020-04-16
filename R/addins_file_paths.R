# NOTE: ----
# Add-ins to copy and paste file paths.

# CODE: ----

#' Special paste slash add-ins
#'
#' @description Use these add-ins to copy/paste the clipboard to the current cursor location with some adjustments to change file paths.
#'
#'      Note that they do \strong{not} change the clipboard.
#'
#' @param text Either the \link[clipr:read_clip]{clipboard}, \link[rstudioapi:getActiveDocumentContext]{current text selection} or a \link{character}.
#'
#'
#' @note The word ``paste'' here is not to be confused with the base R \code{\link{paste}} function, which is for concatenation.
#'
#'     The usage here is the more general use meaning of ``paste'', as in placing the current copied item (i.e. in the clipboard) to the cursor position.
#'
#' @name file_path_add-ins
NULL

#' @name file_path_add-ins
#' @importFrom magrittr `%<>%`
copy_file_path <- function(text = get_selected_text()){
  # Ctrl+Alt+C
  quotes <- c("^\"","\"$") %>%
    purrr::map_chr(~text %>% stringr::str_detect(.x) %>% dplyr::if_else("\"",""))
  text %<>%
    str_remove_all("\"") %>%
    str_squish()
  if(str_detect(text,"\\s")){
    quotes <- c("\"","\"")
  }
  text %>%
    R_to_sys_path %>%
    paste0(quotes[1],.,quotes[2]) %>%
    set_clipboard()
}

#' @name file_path_add-ins
paste_file_path <- function(text = get_clipboard()){
# Ctrl+Shift+V
  text %>%
    sys_path_to_R %>%
    write_to_cursor
}


