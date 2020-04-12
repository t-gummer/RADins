# NOTE: ----
# These add-ins will create code used to produce code vectors in R. They can be thought of a way of making hard-coded
#   values

# CODE: ----

#' Vector code add-ins
#'
#' @description Use \code{paste_vector_code()} to paste the clipboard to the current cursor location with a conversion to the R code for \link[base:c]{creating a vector}. Note that it does \strong{not} change the clipboard.
#'
#' Use \code{hard_code_vector_code()} to execute the code at the current cursor location and convert the result to the R code for \link[base:c]{creating a vector}.
#'
#' Both of these add-ins can be used to ``hard-code'' vectors.
#'
#' @note The word ``paste'' here is not to be confused with the base R \code{\link{paste}} function, which is for concatenation.
#'
#'     The usage here is the more general use meaning of ``paste'', as in placing the current copied item (i.e. in the clipboard) to the cursor position.
#' @name vector_code_add-ins
NULL

#' @name vector_code_add-ins
#' @export
paste_vector_code <- function(){
# Shift+Alt+V similar to paste, also v for vector
# alternatively CTRL+H for hardcode because its much easier to use
  get_clipboard() %>%
    to_vector_code() %>%
    write_to_cursor()
}

#' @name vector_code_add-ins
#' @export
hard_code_vector_code <- function(){
# Made one that excecutes selected code and converts it to a vector
# Ctrl+Alt+H for hard code (importantly not as easy as H to do accidentally)
  get_selected_text() %>%
    parse(text = .) %>%
    eval %>%
    to_vector_code() %>%
    write_to_cursor()
}
