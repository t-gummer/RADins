#' Special paste add-ins
#'
#' @description Use these add-ins to paste the clipboard to the current cursor location with some adjustments to slashes (``\\'', ``\\\\'' and  ``/'').
#'
#'      Note that they do \strong{not} change the clipboard.
#'
#' @details See the table of correspondence between function names and add-in names below.
#'    \tabular{ll}{
#'    \strong{Function} \tab \strong{Add-in} \cr
#'    \code{paste_b_to_f()} \tab Special paste (\\ to /) \cr
#'    \code{paste_bb_to_f()} \tab Special paste (\\\\ to /) \cr
#'    \code{paste_b_to_bb()} \tab Special paste (\\ to \\\\) \cr
#'    }
#'
#' @note The word ``paste'' here is not to be confused with the base R \code{\link{paste}} function, which is for concatenation.
#'
#'     The usage here is the more general use meaning of ``paste'', as in placing the current copied item (i.e. in the clipboard) to the cursor position.
#'
#' @name paste_add-ins
NULL

#' @name paste_add-ins
#' @export
paste_b_to_f <- function(){
  replace_from_clipboard(pattern = "\\\\", replace = "/") %>%
    write_to_cursor()
}

#' @name paste_add-ins
#' @export
paste_bb_to_f <- function(){
  replace_from_clipboard(pattern = "\\\\\\\\", replace = "/") %>%
    write_to_cursor()
}

#' @name paste_add-ins
#' @export
paste_b_to_bb <- function(){
  replace_from_clipboard(pattern = "\\\\", replace = "\\\\\\\\") %>%
    write_to_cursor()
}
