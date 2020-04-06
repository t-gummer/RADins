#' Special copy add-ins
#'
#' Use these add-ins to copy the current selected text to the cliboard with some adjustments to slashes (`\\`, `\\\\` and `/`).
#'
#' @details See the table of correspondence between function names and add-in names below.
#'    \tabular{ll}{
#'    \strong{Function} \tab \strong{Add-in} \cr
#'    \code{copy_f_to_b()} \tab Special copy (/ to \\) \cr
#'    \code{copy_f_to_bb()} \tab Special copy (/ to \\\\) \cr
#'    \code{copy_bb_to_b()} \tab Special copy (\\\\ to \\) \cr
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
