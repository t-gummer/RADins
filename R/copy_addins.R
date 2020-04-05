#' Special copy add-ins
#'
#' Use these functions to copy the current selected text to the cliboard with some adjustments to slashes (`\`, `\\` and `/`).
#'
#' @details See the table of correspondence between function names and clipboard patterns below.
#'    \tabular{rr}{
#'    \strong{Function} \tab \strong{Clipboard} \cr
#'    \code{b} \tab \\ \cr
#'    \code{bb} \tab \\\\ \cr
#'    \code{f} \tab / \cr
#'    }
#'
#' @name copy_add-ins
NULL

#' @name copy_add-ins
#' @export
copy_f_to_b <- function(){
  read_selected_text() %>%
    replace_to_clipboard(pattern = "/",replace = "\\\\")
}

#' @name copy_add-ins
#' @export
copy_f_to_bb <- function(){
  read_selected_text() %>%
    replace_to_clipboard(pattern = "/",replace = "\\\\\\\\")
}

#' @name copy_add-ins
#' @export
copy_bb_to_b <- function(x){
  x
  read_selected_text() %>%
    replace_to_clipboard(pattern = "\\\\\\\\",replace = "\\\\")
}
